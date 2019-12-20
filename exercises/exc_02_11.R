library(rpart)

load("data/grade_train_valid_test.RData")
load("data/ch2_hyper_grid.RData")

# Number of potential models in the grid
num_models <- nrow(hyper_grid)

# Create an empty list to store models
grade_models <- list()

# Write a loop over the rows of hyper_grid to train the grid of models
for (i in 1:num_models) {

    # Get minsplit, maxdepth values at row i
    minsplit <- hyper_grid$minsplit[___]
    maxdepth <- hyper_grid$maxdepth[___]

    # Train a model and store in the list
    grade_models[[i]] <- rpart(formula = final_grade ~ ., 
                               data = ___, 
                               method = "anova",
                               minsplit = ___,
                               maxdepth = ___)
}
