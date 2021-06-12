---
title: 'Chapter 4: Random Forests'
description:
  'In this chapter, you will learn about the Random Forest algorithm, another tree-based ensemble method.  Random Forest is a modified version of bagged trees with better performance. Here you will learn how to train, tune and evaluate Random Forest models in R.'
prev: /chapter3
next: /chapter5
type: chapter
id: 4
---

<exercise id="1" title="Introduction to Random Forest" type="slides">

<slides source="chapter4_01">
</slides>

</exercise>

<exercise id="2" title="Advantages of tree-based methods">

What is the main difference between bagged trees and the Random Forest algorithm?

<choice>
<opt text="In Random Forest, the decision trees are trained on a random subset of the rows, but in bagging, they use all the rows.">

Random Forest and bagged trees are both trained on random subsets of the rows.

</opt>

<opt text="In Random Forest, only a subset of features are selected at random at each split in a decision tree.  In bagging, all features are used." correect="true">

This is the key difference between the two algorithms.

</opt>

<opt text="In Random Forest, there is randomness.  In bagging, there is no randomness.">

Random Forest and bagged trees are both trained on random subsets of the rows, so both algorithms include randomness.

</opt>
</choice>

</exercise>

<exercise id="3" title="Train a Random Forest model">

Here you will use the `randomForest()` function from the **randomForest** package to train a Random Forest classifier to predict loan default.

**Instructions**

The `credit_train` and `credit_test` datasets (from Chapter 1 & 3) are already loaded in the workspace.
- Use the `randomForest::randomForest()` function to train a Random Forest model on the `credit_train` dataset.
- The formula used to define the model is the same as in previous chapters -- we want to predict `"default"` as a function of all the other columns in the training set.
- Inspect the model output.

<codeblock id="04_03">

The function `randomForest` takes the same arguments as the other modeling functions you've used, a `formula` and the `data`.

</codeblock>

</exercise>

<exercise id="4" title="Understanding Random Forest model output" type="slides">

<slides source="chapter4_04">
</slides>

</exercise>

<exercise id="5" title="Evaluate out-of-bag error">

Here you will plot the OOB error as a function of the number of trees trained, and extract the final OOB error of the Random Forest model from the trained model object.

**Instructions**

- The `credit_model` trained in the previous exercise is loaded in the workspace.
- Get the OOB error rate for the Random Forest model.
- Plot the OOB error rate against the number of trees in the forest.

<codeblock id="04_05">

- Use `nrow()` to find the index of the last row of the error matrix.
- Call `plot()` on `credit_model` to plot the trained Random Forest model. 

</codeblock>

</exercise>

<exercise id="6" title="Evaluate model performance on a test set">

Use the `caret::confusionMatrix()` function to compute test set accuracy and generate a confusion matrix.  Compare the test set accuracy to the OOB accuracy.

**Instructions**

- Generate class predictions for the `credit_test` data frame using the `credit_model` object.
- Using the `caret::confusionMatrix()` function, compute the confusion matrix for the test set.
- Compare the test set accuracy reported from the confusion matrix to the OOB accuracy.  The OOB error is stored in `oob_err`, which is already in your workspace, and so OOB accuracy is just `1 - oob_err`.  

<codeblock id="04_06">

The `class_prediction` object contains the predict class for each test set example.
The `confusionMatrix()` computes a confusion matrix using `class_prediction` and `credit_test$default` (test set labels).

</codeblock>

</exercise>

<exercise id="7" title="OOB error vs. test set error" type="slides">

<slides source="chapter4_07">
</slides>

</exercise>

<exercise id="8" title="Advantage of OOB error">

What is the main advantage of using OOB error instead of validation or test error?

<choice>
<opt text="Tuning the model hyperparameters using OOB error will lead to a better model.">

</opt>

<opt text="If you evaluate your model using OOB error, then you don't need to create a separate test set." correect="true">

This allows you to use all of rows in your original dataset for training.

</opt>

<opt text="OOB error is more accurate than test set error.">

OOB error would only be a better estimate if your OOB sample was bigger than the test set, so this is not universally true.

</opt>
</choice>

</exercise>

<exercise id="9" title="Evaluate test set AUC">

In Chapter 3, we learned about the [AUC](https://en.wikipedia.org/wiki/Receiver_operating_characteristic#Area_under_the_curve) metric for evaluating binary classification models.  In this exercise, you will compute test set AUC for the Random Forest model.

**Instructions**

- Use the `predict()` function with `type = "prob"` to generate numeric predictions on the `credit_test` dataset. 
- Compute the AUC using the `auc()` function from the **Metrics** package.

<codeblock id="04_09">

Apply the `predict()` function to `credit_model` object and `credit_test` dataset.

</codeblock>

</exercise>

<exercise id="10" title="Tuning a Random Forest model" type="slides">

<slides source="chapter4_10">
</slides>

</exercise>

<exercise id="11" title="Tuning a Random Forest via  mtry">

In this exercise, you will use the `randomForest::tuneRF()` to tune `mtry` (by training several models). This function is a specific utility to tune the `mtry` parameter based on OOB error, which is helpful when you want a quick & easy way to tune your model.  A more generic way of tuning Random Forest parameters will be presented in the following exercise.

**Instructions**

- Use the `tuneRF()` function in place of the `randomForest()` function to train a series of models with different `mtry` values and examine the the results.
- Note that (unfortunately) the `tuneRF()` interface does not support the typical formula input that we've been using, but instead uses two arguments, `x` (matrix or data frame of predictor variables) and `y` (response vector; must be a factor for classification).  
- The `tuneRF()` function has an argument, `ntreeTry` that defaults to 50 trees. Set `nTreeTry = 500` to train a random forest model of the same size as you previously did.
- After tuning the forest, this function will also plot model performance (OOB error) as a function of the `mtry` values that were evaluated. 
- Keep in mind that if we want to evaluate the model based on AUC instead of error (accuracy), then this is not the best way to tune a model, as the selection only considers (OOB) error.

<codeblock id="04_11">

The only thing you need to do here is specify the response vector for the training set for `y` and 500 for `ntreeTry`.

</codeblock>

</exercise>

<exercise id="12" title="Tuning a Random Forest via tree depth">

In Chapter 2, we created a manual grid of hyperparameters using the `expand.grid()` function and wrote code that trained and evaluated the models of the grid in a loop.  In this exercise, you will create a grid of `mtry`, `nodesize` and `sampsize` values.  In this example, we will identify the "best model" based on OOB error.  The best model is defined as the model from our grid which minimizes OOB error.  

Keep in mind that there are other ways to select a best model from a grid, such as choosing the best model based on validation AUC.  However, for this exercise, we will use the built-in OOB error calculations instead of using a separate validation set.

**Instructions**

- Create a grid of `mtry`, `nodesize` and `sampsize` values.  
- Write a simple loop to train all the models and choose the best one based on OOB error.
- Print the set of hyperparameters which produced the best model.

<codeblock id="04_12">

- The `hyper_grid` is created by passing the `mtry`, `nodesize` and `sampsize` vectors.
- The loop should loop over `hyper_grid`. 
- The `nodesize` and `sampsize` arguments should be specified in the same exact manner as the `mtry` argument, by indexing into the `hyper_grid` object.

</codeblock>

</exercise>