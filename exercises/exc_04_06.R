library(randomForest)
library(Metrics)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch1_train_test.RData"))
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch4_ex3_model.RData"))

# Generate predictions on the test set
pred <- ___(object = ___,
            newdata = ___,
            type = "prob")

# `pred` is a matrix
class(pred)
                
# Look at the pred format
head(pred)
                
# Compute the AUC (`actual` must be a binary 1/0 numeric vector)
auc(actual = ifelse(credit_test$___ == "yes", 1, 0), 
    predicted = ___[,"yes"])                    
