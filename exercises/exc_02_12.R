library(Metrics)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/grade_train_valid_test.RData"))
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/grade_ex11_models.RData"))

# Number of potential models in the grid
num_models <- length(grade_models)

# Create an empty vector to store RMSE values
rmse_values <- c()

# Write a loop over the models to compute validation RMSE
for (i in 1:num_models) {

    # Retrieve the i^th model from the list
    model <- grade_models[[___]]
    
    # Generate predictions on grade_valid 
    pred <- predict(object = ___,
                    newdata = grade_valid)
    
    # Compute validation RMSE and add to the 
    rmse_values[i] <- rmse(actual = grade_valid$final_grade, 
                           predicted = ___)
}
