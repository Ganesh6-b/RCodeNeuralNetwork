setwd("F://R//Rfiles")
startup <- read.csv("50_Startups.csv")
View(startup)

library(dummies)
a <- dummy(startup$State)
startup <- cbind(startup, a)
View(startup)
startup <- startup[,-4]
#partitioning data set
library(caret)
data <- createDataPartition(startup$Profit, p = 0.75, list = FALSE)
train <- startup[data,]
test <- startup[-data,]
#building model
library(neuralnet)
View(train)
model1 <- neuralnet(train$Profit~., data = train)
