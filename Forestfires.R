setwd("F://R//Rfiles")
forestdata <- read.csv("forestfires.csv")
View(forestdata)

#normalize the data set

forestdata[,c(3:11)] <- scale(forestdata[,c(3:11)])
View(forestdata)
install.packages("caret")
library(caret)

#splitting data
data <- createDataPartition(forestdata$size_category, p = 0.75, list = FALSE)

Train <- forestdata[data,]
Test <- forestdata[-data,]
View(Test)
#modelbuilding
install.packages("neuralnet")
library(neuralnet)
Train <- Train[,-c(1,2)]
View(Train)
Test <- Test[,-c(1,2)]
model1 <- neuralnet(Train$size_category~. ,data = Train)
summary(model1)
attributes(model1)

plot(model1)

#evaluation

View(Test)
m_results <- compute(model1, Test[,-31])

length(m_results)
cor(m_results$net.result, Test$size_category)
length(Test$size_category)
