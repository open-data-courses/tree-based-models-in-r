library(Metrics)

load("data/grade_train_valid_test.RData")
load("data/grade_ex11_models.RData")

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

# Identify the model with smallest validation set RMSE
best_model <- grade_models[[which.min(rmse_values)]]

# Print the model paramters of the best model
best_model$control

# Compute test set RMSE on best_model
pred <- predict(object = ___,
                newdata = ___)
rmse(actual = grade_test$final_grade, 
     predicted = ___)
}
