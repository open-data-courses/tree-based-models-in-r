library(gbm)

load("data/credit_ch1_train_test.RData")

# Save credit_ch5_ex3_model.RData file:
#save(credit_model, file = "credit_ch5_ex3_model.RData")

# Convert "yes" to 1, "no" to 0
credit_train$default <- ifelse(credit_train$default == "yes", 1, 0)

# Train a 10000-tree GBM model
set.seed(1)
credit_model <- gbm(formula = default ~ ., 
                    distribution = "bernoulli", 
                    data = credit_train,
                    n.trees = 10000)
                    
# Print the model object                    
print(credit_model) 

# summary() prints variable importance
summary(credit_model) 