library(Metrics)

load("data/grade_train_valid_test.RData")
load("data/grade_ex4_model.RData")

# Generate predictions on a test set
pred <- predict(object = ___,   # model object 
                newdata = ___)  # test dataset

# Compute the RMSE
rmse(actual = ___, 
     predicted = ___)
