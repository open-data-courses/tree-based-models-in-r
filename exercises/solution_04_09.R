library(randomForest)
library(Metrics)

load("https://github.com/open-data-courses/tree-based-models-in-r/blob/master/images/credit_ch1_train_test.RData")
load("https://github.com/open-data-courses/tree-based-models-in-r/blob/master/images/credit_ch4_ex3_model.RData")

# Generate predictions on the test set
pred <- predict(object = credit_model, 
                newdata = credit_test,
                type = "prob")

# `pred` is a matrix
class(pred)
                
# Look at the pred format
head(pred)                
                
# Compute the AUC (`actual` must be a binary 1/0 numeric vector)
auc(actual = ifelse(credit_test$default == "yes", 1, 0), 
    predicted = pred[,"yes"])                
