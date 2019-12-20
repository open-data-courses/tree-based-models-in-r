# Bagging is a randomized model, so let's set a seed (123) for reproducibility
set.seed(___)

# Train a bagged model
credit_model <- bagging(formula = default ~ ., 
                        data = ___,
                        coob = TRUE)

# Print the model
print(credit_model)
