# ----------------------------------------------------- #
# Ubiqum - Intro to R
# Hands on Programming with R - url of the book here
# Project 1 - Rolling a dice
# ----------------------------------------------------- #

# just run this line once:
# install.packages("ggplot2")

# loading libraries
library(ggplot2)


# here we define the fuction Roll
Roll1 <- function(){
  die <- 1:6 # we store a vector called "die" with numbers 1 to 6
  dice <- sample(die, size = 2, replace = TRUE) # Sampling with replacement is an easy way to create independent random samples. 
  sum(dice)
}

# Now we call the fuction
Roll1()
Roll1()


Roll2 <- function(bones = 1:4) {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice) }
  Roll2()
  
 
  Roll3 <- function(bones = 1:6) {
    dice <- sample(bones, size = 2, replace = TRUE)
    sum(dice)
  }

  x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
  x  
  x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
  y <- x^3
  y
  library(ggplot2)
?qplot 
qplot(x,y)  
