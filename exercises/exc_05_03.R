library(gbm)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch1_train_test.RData"))

# Save credit_ch5_ex3_model.RData file:
# save(credit_model, file = "credit_ch5_ex3_model.RData")

# Convert "yes" to 1, "no" to 0
credit_train$default <- ifelse(credit_train$default == "yes", ___, ___)

# Train a 10000-tree GBM model
set.seed(1)
credit_model <- gbm(formula = default ~ ., 
                    distribution = ___, 
                    data = ___,
                    n.trees = ___)
                    
# Print the model object                    
print(___)

# summary() prints variable importance
summary(___)
