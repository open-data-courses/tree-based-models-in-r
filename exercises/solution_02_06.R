library(Metrics)

load("data/grade_train_valid_test.RData")
load("data/grade_ex4_model.RData")

# Generate predictions on a test set
pred <- predict(object = grade_model,  # model object 
                newdata = grade_test)  # test dataset

# Compute the RMSE
rmse(actual = grade_test$final_grade, 
     predicted = pred)