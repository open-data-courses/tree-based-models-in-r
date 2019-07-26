library(ROCR)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_all_preds.RData"))
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch5_train_test.RData"))

# List of predictions
preds_list <- list(dt_preds, bag_preds, rf_preds, gbm_preds)

# List of actual values (same for all)
m <- length(preds_list)
actuals_list <- rep(list(credit_test$default), m)

# Plot the ROC curves
pred <- prediction(preds_list, ___)
rocs <- performance(pred, "tpr", "fpr")
plot(rocs, col = as.list(1:m), main = "Test Set ROC Curves")
legend(x = "bottomright", 
       legend = c("Decision Tree", "Bagged Trees", "Random Forest", "GBM"),
       fill = 1:m)
