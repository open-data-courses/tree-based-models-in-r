library(randomForest)

load("data/credit_ch1_train_test.RData")

# Train a Random Forest
set.seed(1)  # for reproducibility
credit_model <- randomForest(formula = default ~ ., 
                             data = ___)
                             
# Print the model output                             
print(___)

