library(Metrics)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/grade_train_valid_test.RData"))
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/grade_ex4_model.RData"))

# Generate predictions on a test set
pred <- predict(object = ___,   # model object 
                newdata = ___)  # test dataset

# Compute the RMSE
rmse(actual = ___, 
     predicted = ___)
