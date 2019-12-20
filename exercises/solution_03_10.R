library(ipred)
library(caret)
library(Metrics)

load("data/credit_ch3_ex8_caret_model.RData")
load("data/credit_ch3_ex9_auc.RData")
load("data/credit_ch3_ex6_auc.RData")

# Print ipred::bagging test set AUC estimate
print(credit_ipred_model_test_auc)

# Print caret "treebag" test set AUC estimate
print(credit_caret_model_test_auc)
                
# Compare to caret 5-fold cross-validated AUC
credit_caret_model$results[,"ROC"]