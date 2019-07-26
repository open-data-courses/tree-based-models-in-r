library(randomForest)

load(url("https://github.com/open-data-courses/tree-based-models-in-r/blob/master/images/credit_ch1_train_test.RData"))

# Establish a list of possible values for mtry, nodesize and sampsize
mtry <- seq(4, ncol(credit_train) * 0.8, 2)
nodesize <- seq(3, 8, 2)
sampsize <- nrow(credit_train) * c(0.7, 0.8)

# Create a data frame containing all combinations 
hyper_grid <- expand.grid(mtry = ___, nodesize = ___, sampsize = ___)

# Create an empty vector to store OOB error values
oob_err <- c()

# Write a loop over the rows of hyper_grid to train the grid of models
for (i in 1:nrow(___)) {

    # Train a Random Forest model
    model <- randomForest(formula = default ~ ., 
                          data = ___,
                          mtry = hyper_grid$mtry[i],
                          nodesize = hyper_grid$___,
                          sampsize = hyper_grid$___)
                          
    # Store OOB error for the model                      
    oob_err[i] <- model$err.rate[nrow(model$err.rate), "OOB"]
}

# Identify optimal set of hyperparmeters based on OOB error
opt_i <- which.min(oob_err)
print(hyper_grid[opt_i,])
