library(gbm)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch1_train_test.RData"))
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch5_ex3_model.RData"))

# Save credit_ch5_ex5_preds.RData
# save(preds1, preds2, file = "credit_ch5_ex5_preds.RData")

# Since we converted the training response col, let's also convert the test response col
credit_test$default <- ifelse(credit_test$default == "yes", 1, 0)

# Generate predictions on the test set
preds1 <- predict(object = ___, 
                  newdata = ___,
                  n.trees = ___)

# Generate predictions on the test set (scale to response)
preds2 <- predict(object = ___, 
                  newdata = ___,
                  n.trees = ___,
                  type = "response")

# Compare the range of the two sets of predictions
range(preds1)
range(preds2)
