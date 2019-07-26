library(gbm)
library(Metrics)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch5_ex3_model.RData"))
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch5_train_test.RData"))
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch5_ex8_ntrees.RData"))
 
# Generate predictions on the test set using ntree_opt_oob number of trees
preds1 <- predict(object = credit_model, 
                  newdata = credit_test,
                  n.trees = ntree_opt_oob)
                  
# Generate predictions on the test set using ntree_opt_cv number of trees
preds2 <- predict(object = credit_model, 
                  newdata = credit_test,
                  n.trees = ntree_opt_cv)   

# Generate the test set AUCs using the two sets of preditions & compare
auc1 <- auc(actual = credit_test$default, predicted = preds1)  #OOB
auc2 <- auc(actual = credit_test$default, predicted = preds2)  #CV 

# Compare AUC 
print(paste0("Test set AUC (OOB): ", auc1))                         
print(paste0("Test set AUC (CV): ", auc2))