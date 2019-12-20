library(Metrics)

load("data/credit_ch5_ex5_preds.RData")
load("data/credit_ch5_train_test.RData")

# Generate the test set AUCs using the two sets of preditions & compare
auc(actual = credit_test$default, predicted = preds1)  #default
auc(actual = credit_test$default, predicted = preds2)  #rescaled