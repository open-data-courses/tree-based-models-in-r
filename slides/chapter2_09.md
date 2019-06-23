---
type: slides
---

# Grid Search for model selection

Notes: Erin LeDell - Instructor

In the last video, we discussed some useful hyperparamters for decision trees.  

Training a default model is good, but training a sequence of models with various hyperparameter settings with the goal of finding the best one is a typical task in any machine learning pipeline.

This process is called "model selection" or "hyperparameter selection" because the end goal is to select the best model from the set to use in some machine learning application.

One of the most common techniques for performing model selection is called grid search.  In this section, we will review some terminology, construct a grid of possible hyperparamter settings and train a sequence of models.  After evaluating our models, we'll declare a winner.

Let's talk about some important definitions first.

---

# Grid Search

- What is a model hyperparameter?

- What is a "grid"?

- What is the purpose of a grid search?

- How is the best model chosen?


Notes: Grid Search, also called Hyperparameter Search, is an exhaustive searching through a manually specified set of model hyperparameters. But ...  

What is a model hyperparameter?

Model hyperparamters are the "knobs" that you tweak to get slightly different models.  For example, max_depth is the maximum depth allowed in a decision tree.

What is a grid?

The "grid" refers to the set of hyperparamter combinations that you'll iterate over during the Grid Search.

What is the goal of a grid search?

The goal of a grid search is to evaluate a large number of parameter settings, by training models on each combination of hyperparameter values, to find the combination that produces the best model.

How is the best model chosen?

The first step is to choose an appropriate performance metric for your task -- examples are classification error, AUC or Root Mean Squared Error.  The performance of each model in the grid is computed, typically by cross-validation or evaluation on a held-out validation set.  The model with the best performance, as evaluted by this metric, is selected as the "winner".

---

# Set up the grid

```r
# Establish a list of possible values for minsplit and maxdepth

minsplit <- seq(1, 30, 5)
maxdepth <- seq(5, 40, 10)

```

```r
# Create a data frame containing all combinations

 hyper_grid <- expand.grid(minsplit = minsplit, 
                            maxdepth = maxdepth)

```
```out
> hyper_grid[1:10,]
   minsplit maxdepth
1         1        5
2         6        5
3        11        5
4        16        5
5        21        5
6        26        5
7         1       15
8         6       15
9        11       15
10       16       15
```

Notes: For example, if the hyperparameter of a decision tree is the minimum number of observations that must exist in a node in order for a split to be attempted, then the grid could be 5, 10, 20, 30, etc.

Some guesswork is necessary to specify the minimum and maximum values. So sometimes people run a small grid, see if the optimum lies at either endpoint, and then expand the grid in that direction. This is called manual grid search. Let's see how it works in R.

First, let's define a list of possible values for minsplit and maxdepth. 

Then, let's create a data frame containing all combinations using the expand.grid() function from R.

The third step is to define the number of potential models in the grid, followed by an empty list to store the models. 

---

# Grid Search in R: Train models

```r
# create an empty list to store models

models <- list()
```

```out
# execute the grid search

> for (i in 1:nrow(hyper_grid)) {

    # get minsplit, maxdepth values at row i
    minsplit <- hyper_grid$minsplit[i]
    maxdepth <- hyper_grid$maxdepth[i]
    
    # train a model and store in the list
    models[[i]] <- rpart(formula = response ~ ., 
                         data = train, 
                         method = "anova",
                         minsplit = minsplit)
}
```

Notes: Although the caret package provides utilites for performing a grid search, for teaching purposes, we will implement the grid search in R as a loop.  It's a very easy thing to do and it's a good learning exercise to write your first grid search from scratch. 

We will loop over rows of the hyper_grid data frame, grab the values for minsplit and maxdepth and train a regression tree using those parameter values.  The models will be stored in a list so we can easily retreive them later.

---

# Grid Search in R: Evaluate models

```r
# create an empty vector to store RMSE values
rmse_values <- c()
```

```r
# compute validation RMSE fr 

for (i in 1:length(models)) {

    # retreive the i^th model from the list
    model <- models[[i]]
    
    # generate predictions on grade_valid 
    pred <- predict(object = model,
                    newdata = valid)
    
    # compute validation RMSE and add to the 
    rmse_values[i] <- rmse(actual = valid$response, 
                           predicted = pred)
}
```

Notes: Using the same loop structure, let's evaluate each of these models on the validation set using the rmse() function.

For each model, generate predictions on the validation set and then compute the RMSE of these predictions.  Once you have all the RMSE values stored in a vector, you can easily find which model had the minimumn RMSE.  This is our grid winner.

---

# Let's practice!

Notes: Now, let's try this out on the Student Performance Dataset.
