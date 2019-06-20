---
title: 'Chapter 2: Regression Trees'
description:
  'In this chapter you will learn how to use a single tree for regression, instead of classification.'
prev: /chapter1
next: /chapter3
type: chapter
id: 2
---

<exercise id="1" title="Introduction to regression trees" type="slides">

<slides source="chapter1_01_introduction">
</slides>

</exercise>

<exercise id="2" title="Classification vs. regression">

What is the difference between classification and regression?

Hint: Either both are true or neither are true.

<choice>
<opt text="In classification, the response represents a category (e.g. "apples", "oranges", "bananas").">

Incorrect.  This is true, but the other statement is also true.

</opt>

<opt text="In regression, the response represents a numeric value (e.g. price of a house)." >

Incorrect.  This is true, but the other statement is also true.

</opt>

<opt text="All of the above." correct="true">

Correct!

</opt>

<opt text="None of the above.">

Incorrect.  All the above are true.

</opt>
</choice>

</exercise>

<exercise id="3" title="Train a classification tree model">

In this exercise, we will use the `grade_train` dataset to fit a regression tree using `rpart()` and visualize it using `rpart.plot()`.  A regression tree plot looks identical to a classification tree plot, with the exception that there will be numeric values in the leaf nodes instead of predicted classes.

This is very similar to what we did previously in Chapter 1. When fitting a classification tree, we use `method = "class"`, however, when fitting a regression tree, we need to set  `method = "anova"`.  By default, the `rpart()` function will make an intelligent guess as to what the method value should be based on the data type of your response column, but it's recommened that you explictly set the method for reproducibility reasons (since the auto-guesser may change in the future).

The `grade_train` training set is loaded into the workspace.

**Instructions**

- Using the `grade_train` dataframe and the given formula, train a regresion tree.
- Look at the model output by printing the model object.
- Plot the decision tree using `rpart.plot()`.

<codeblock id="02_03">

The `grade_model` object should be the `x` input to `rpart.plot()`.

</codeblock>

</exercise>

<exercise id="4" title="Introduction to regression trees" type="slides">

<slides source="chapter1_04">
</slides>

</exercise>

<exercise id="5" title="Train a classification tree model">

Predict the final grade for all students in the test set.  The grade is on a 0-20 scale.  Evaluate the model based on test set [RMSE (Root Mean Squared Error)](https://en.wikipedia.org/wiki/Root-mean-square_deviation). RMSE tells us approximately how far away our predictions are from the true values. 

**Instructions**

- First generate predictions on the `grade_test` data frame using the `grade_model` object.  
- After generating test set predictions, use the `rmse()` function from the **Metrics** package to compute test set RMSE.  
 
<codeblock id="02_05">

Pass the `grade_model` and `grade_test` objects to the `predict()` function.  Once you have those predictions, use them in the `rmse()` function, in combination with `grade_test$final_grade`.

</codeblock>

</exercise>

<exercise id="6" title="What are the hyperparameters for a decision tree" type="slides">

<slides source="chapter1_06">
</slides>

</exercise>

<exercise id="7" title="Tuning the model">

Tune (or "trim") the model using the `prune()` function by finding the best "CP" value (CP stands for "Complexity Parameter").

**Instructions**

- Print the CP Table, a matrix of information on the optimal prunings (based on CP).
- Retrieve the optimal CP value; the value for CP which minimizes cross-validated error of the model.
- Use the `prune()` function trim the tree, snipping off the least important splits, based on CP.

<codeblock id="02_07">

Once you define `cp_opt`, pass it to the `prune()` function to create a new model.
Then plot the new model.

</codeblock>

</exercise>

<exercise id="8" title="Generate a grid of models" type="slides">

<slides source="chapter1_08">
</slides>

</exercise>

<exercise id="9" title="Tuning the model">

Use `expand.grid()` to generate a grid of `maxdepth` and `minsplit` values.

**Instructions**
- Establish a list of possible values for `minsplit` and `maxdepth`
- Use the `expand.grid()` function to generate a data frame containing all combinations 
- Take a look at the resulting grid object

<codeblock id="02_09">

The `expand.grid()` function takes as input the vectors that you want to grid over.  Here we want to grid over the pre-defined vectors, `minsplit` and `maxdepth`.

</codeblock>

</exercise>

<exercise id="10" title="Evaluate the grid">

Earlier in the chapter we split the dataset into three parts: training, validation and test.  

A dataset that is not used in training is sometimes referred to as a "holdout" set.  A holdout set is used to estimate model performance and although both validation and test sets are considered to be holdout data, there is a key difference:  

- Just like a test set, a validation set is used to evaluate the performance of a model.  The difference is that a validation set is specifically used to compare the performance of a group of models with the goal of choosing a "best model" from the group.  All the models in a group are evaluated on the same validation set and the model with the best performance is considered to be the winner.
- Once you have the best model, a final estimate of performance is computed on the test set.  
- A test set should only ever be used to estimate model performance and should not be used in model selection.  Typically if you use a test set more than once, you are probably doing something wrong.

**Instructions**

- Write a loop that evaluates each model in the `grade_models` list and stores the validation RMSE in a vector called `rmse_values`.
- The `which.min()` function can be applied to the `rmse_values` vector to identify the index containing the smallest RMSE value.
- The model with the smallest validation set RMSE will be designated as the "best model".  
- Inspect the model parameters of the best model.
- Generate predictions on the test set using the best model to compute test set RMSE.

<codeblock id="02_10>

- You should use `i` to grab the $i^{th}$ model from the `grade_models` list inside the loop.
- Generate predictions on the `model` object and pass them to the `rmse()` function to generate validation RMSE.
- To generate test set RMSE on the best model, pass the `best_model` and `grade_test` objects to `predict()` and use `rmse()` to get the final error estimate.

</codeblock>

</exercise>








