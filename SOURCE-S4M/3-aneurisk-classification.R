## Aneurisk classification analysis - Thu 06/15/17 09:10:06
## library(caret) required


## create data partition
inTrain <- createDataPartition(y = a$ESTADO_RUPTURA_B, p = .75, list = FALSE) 

## separate in training and testing datasets
training <- a[inTrain,]
testing  <- a[-inTrain,] 

## Set trainControl function. Argument used are:
## method = "repeatedcv" (repeated K–fold cross-validation method, K=10 by default)
## repeats = 3 (number of repeats of the K-fold method)
## summaryFunction = twoClassSummary (measure area under the ROC curve, sensitivity and specificity)
## classProbs = TRUE (compute predicted class probabilities to be able to use ROC in train function)
ctrl <- trainControl(method = "repeatedcv", repeats = 3, classProbs = TRUE, summaryFunction = twoClassSummary)

## Call train function.
plsFit <- train(ESTADO_RUPTURA_B ~ ., data = training, method = "pls", tuneLength = 15, trControl = ctrl, metric = "ROC")
plsFit

## predict new samples
plsClasses <- predict(plsFit, newdata = testing)
plsProbs <- predict(plsFit, newdata = testing, type = "prob")

## confusion matrix
confusionMatrix(data = plsClasses, testing$ESTADO_RUPTURA_B)

