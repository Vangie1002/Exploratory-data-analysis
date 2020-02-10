# Road package
library(caret)
library(ranger)
library(tidyverse)
library(e1071)
library(skimr)

# read file 
survey<-read.csv2("surveyBelkinElago.csv",na.strings =" " )
survey<- survey %>% drop_na()
survey
table(survey$brand)

survey[2:5] <- lapply(survey[2:5], as.numeric)
str(survey)
survey
# ----- create data partition 
write.csv(survey, 'fulldata.csv') # saving the new df as a csv file
CompleteReponses <- read.csv("fulldata.csv")
str(CompleteReponses)
CompleteReponses <- CompleteReponses[2:8]
str(CompleteReponses)
set.seed(123)
inTrain <-createDataPartition(
  y = CompleteReponses$brand,
  ## the outcome data are needed, the indices of those rows that have been chosen
  p = .75,
  ## The percentage of data in the
  ## training set
  list = FALSE
)
## The format of the results
str(inTrain)
training <- CompleteReponses [inTrain,] # only chosen those rows shown in the inTrain
nrow(training)
testing  <- CompleteReponses[-inTrain,]
nrow(testing)

# Store X and Y for later use.
x = training[, 1:6]
y = training$brand


skimmed <- skim(training)
skimmed[, 1:6]

# tune the model
plsFit <- train(
  brand ~ .,
  data = training,
  method = "pls",
  preProc = c("center", "scale"),
  ## added:
  tuneLength = 15
)
ctrl <- trainControl(method = "repeatedcv", repeats = 3) # optional: "allowParallel = TRUE" means allow multiple computer processors to process this computing task
plsFit <- train(
  testbrand ~ ., #testbrand = tragetVariableName
  data = training,# data = yourdataframe
  method = "pls", # c50 can be used here as another model, more than 230 models in the Caret package
  preProc = c("center", "scale"),
  tuneLength = 15,
  ## added:
  trControl = ctrl
)
plsFit
ctrl <- trainControl(
  method = "repeatedcv",
  repeats = 10,
  classProbs = TRUE,
  summaryFunction = twoClassSummary
)
set.seed(123)
plsFit <- train(
  brand ~ .,
  data = training,
  method = "pls",
  preProc = c("center", "scale"),
  tuneLength = 15,
  trControl = ctrl,
  metric = "ROC"
)
plsFit
ggplot(plsFit)

#> ROC was used to select the optimal model using
#>  the largest value.
#> The final value used for the model was ncomp = 2.
# apply on testing set


plsbrand <- predict(plsFit, newdata = testing) # pls+predictfatorname
str(plsbrand)
plsProbs <- predict(plsFit, newdata = testing, type = "prob")
head(plsProbs)
confusionMatrix(data = plsbrand, testing$brand)

# Train a "RF" model using caret

set.seed(123)

# Train the model using rf
# Define the training control
fitControl <- trainControl(
  method = 'cv',                   # k-fold cross validation
  number = 5,                      # number of folds
  savePredictions = 'final',       # saves predictions for optimal tuning parameter
  classProbs = T,                  # should class probabilities be returned
  summaryFunction=twoClassSummary  # results summary function
)  
model_rf = train(brand ~ ., data=training, method='rf', tuneLength=5, trControl = fitControl)
model_rf
# The final value used for the model was mtry = 3. 
ggplot(model_rf)

# Train C5.0 
c50Grid <- expand.grid(.trials = c(1:9, (1:10)*10),
                       .model = c("tree", "rules"),
                       .winnow = c(TRUE, FALSE))

c5Fitvac <- train(brand ~ .,
                  data = training,
                  method = "C5.0",
                  tuneGrid = c50Grid,
                  trControl = ctrl,
                  metric = "Accuracy", 
                  importance=TRUE, 
                  preProc = c("center", "scale")) 
c5Fitvac

