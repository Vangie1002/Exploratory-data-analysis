# Linear model about predicting distance according to variable speed.


# setwd("C:\\Users\\49157\\Desktop\\Exploratory Data Analysis\\Exploratory Data Analysis")

# read data
dataset <- read.csv("cars.csv")
#List your attributes within your data set.
attributes(dataset)
head(dataset)
#Prints the min, max, mean, median, and quartiles of each attribute.
summary(dataset)
#Displays the structure of your data set.
str(dataset)
#Names your attributes within your data set.
names(dataset)
#Will print out the instances within that particular column in your data set.
dataset$name.of.car
dataset$speed.of.car
dataset$distance.of.car
# Your columns must be in numeric form to perform these plots.
hist(dataset$distance.of.car)
plot(dataset$distance.of.car,dataset$speed.of.car)
qqnorm(dataset$speed.of.car)
# Data Types
#Numeric- Numbers with decimals. (Ex: 1.0, 10.5, 4.5, etc.)
#Integer Data- Whole numbers (Ex: 11, 45, 78, etc.)
#Factor Data- Categorical data (Ex: Red, Blue, Green, Purple, etc.)
#Ordinal Data- Ordered data (Ex: educational levels, temperature, etc.)
#Character Data- String values, which are characters (words) with quotes around them. (Ex: "Red", "Blue", "Green", "Purple", etc.)
#Logical- TRUE or TRUE (Always capitalize TRUE or FALSE)

dataset$name.of.car<-as.typeofdata(dataset$speed.of.car)
names(dataset)<-c("Brand","Speed","Distance") 
summary(dataset)
#Will show your NA’s through logical data. (TRUE if it’s missing, FALSE if it’s not.)
is.na(dataset) 

# from here not understand 

set.seed(10)
trainSize<- round(nrow(dataset) * 0.7)
testSize <- nrow(dataset) - trainSize

training_indices <- sample(seq_len(nrow(dataset)), size = trainSize)
trainSet <- dataset[training_indices,]
testSet <- dataset[-training_indices,] 
ModelA <- lm(dataset$Speed~dataset$Distance, trainSet)
summary(ModelA)
# Multiple R-squared- How well the regression line fits the data (1 means it’s a perfect fit).
# A p-value of more than 0.05 means the Independent Variable has no effect on the Dependent Variable; less than 0.05 means the relationship is statistically significant.
Predictiondistance <- predict(ModelA,trainSet)
Predictiondistance

