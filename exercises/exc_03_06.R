library(ipred)
library(Metrics)

load("data/credit_ch1_train_test.RData")
load("data/credit_ch3_ex3_model.RData")

# save auc to use in ex10:
# save(credit_ipred_model_test_auc, file = "credit_ch3_ex6_auc.RData")

# Generate predictions on the test set
pred <- predict(object = ___,
                newdata = ___,
                type = "prob")

# `pred` is a matrix
class(pred)
                
# Look at the pred format
head(pred)
                
# Compute the AUC (`actual` must be a binary (or 1/0 numeric) vector)
auc(actual = ifelse(credit_test$default == "yes", 1, 0), 
    predicted = pred[,"yes"])                    

