# code to generate the preds objects
#library(rpart)
#library(ipred)
#library(randomForest)
#library(gbm)

#load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch1_ex8_model.RData"))
#dt_model <- credit_model
#load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch3_ex3_model.RData"))
#bag_model <- credit_model
#load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch4_ex3_model.RData"))
#rf_model <- credit_model
#load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch5_ex3_model.RData"))
#gbm_model <- credit_model
#load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch5_ex8_ntrees.RData"))
#load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch5_train_test.RData"))

## Moved this to pre-exercise code and saved preds in RData file
#dt_preds <- predict(dt_model, credit_test)[,"yes"]
#bag_preds <- predict(bag_model, credit_test, type = "prob")[,"yes"]
#rf_preds <- predict(rf_model, credit_test, type = "prob")[,"yes"]
#gbm_preds <- predict(gbm_model, credit_test, n.trees = ntree_opt_cv)
#save(dt_preds, bag_preds, rf_preds, gbm_preds, file = "credit_all_preds.RData")

library(Metrics)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_all_preds.RData"))
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch5_train_test.RData"))

# Generate the test set AUCs using the two sets of predictions & compare
actual <- credit_test$default
dt_auc <- auc(actual = actual, predicted = dt_preds)
bag_auc <- auc(actual = actual, predicted = ___)
rf_auc <- auc(actual = actual, predicted = ___)
gbm_auc <- auc(actual = actual, predicted = ___)

# Print results
sprintf("Decision Tree Test AUC: %.3f", dt_auc)
sprintf("Bagged Trees Test AUC: %.3f", bag_auc)
sprintf("Random Forest Test AUC: %.3f", rf_auc)
sprintf("GBM Test AUC: %.3f", gbm_auc)

