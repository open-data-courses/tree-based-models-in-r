---
title: 'Chapter 1: Classification Trees'
description:
  'This chapter covers supervised machine learning with classification trees.'
prev: null
next: /chapter2
type: chapter
id: 1
---

<exercise id="1" title="Welcome to the course!" type="slides">

<slides source="chapter1_01">
</slides>

</exercise>

<exercise id="2" title="Build a classification tree">

Let's get started and build our first classification tree. A _classification tree_ is a decision tree that performs a classification (vs regression) task.  

You will train a decision tree model to understand which loan applications are at higher risk of default using a subset of the [German Credit Dataset](https://archive.ics.uci.edu/ml/datasets/Statlog+%28German+Credit+Data%29). The response variable, called "default", indicates _whether the loan went into a default or not_, which means this is a binary classification problem (there are just two classes).

You will use the **rpart** package to fit the decision tree and the **rpart.plot** package to visualize the tree. 

**Instructions**

The data frame `creditsub` is in the workspace.  This data frame is a subset of the original German Credit Dataset, which we will use to train our first classification tree model.

- Take a look at the data using the `str()` function.
- In R, formulas are used to model the response as a function of some set of predictors, so the formula here is `default ~ .`, which means use all columns (except the response column) as predictors.
- Fit the classification decision tree using the `rpart()` function from the **rpart** package.  In the `rpart()` function, note that you'll also have to provide the training data frame.
- Using the model object that you create, plot the decision tree model using the `rpart.plot()` function from the **rpart.plot** package.

<codeblock id="01_02">

The `rpart.plot()` function takes the trained decision tree model as input.

</codeblock>

</exercise>

<exercise id="3" title="Introduction to classification trees" type="slides">

<slides source="chapter1_03">
</slides>

</exercise>

<exercise id="4" title="Advantages of tree-based methods">

What are some advantages of using tree-based methods over other supervised learning methods?

<choice>
<opt text="Model interpretability (easy to understand why a prediction is made).">

This is true, but there's another true statement here as well.

</opt>

<opt text="Model performance (trees have superior performance compared to other machine learning algorithms)." >

No. Decision trees have worse performance as compared to more sophisticated algorithms such as Random Forests or GBMs.

</opt>

<opt text="No pre-processing (e.g. normalization) of the data is required.">

This is true, but there's another true statement here as well.

</opt>

<opt text="1 and 2 are true.">

#1 is true, but #2 is not true.

</opt>

<opt text="1 and 3 are true." correct="true">

Well done. Proceed to the next exercise

</opt>
</choice>

</exercise>

<exercise id="5" title="Advantages of tree-based methods">

Let's use the decision tree that you trained in the first exercise. The tree predicts whether a loan applicant will default on their loan (or not).

Assume we have a loan applicant who:

- is applying for a 20-month loan
- is requesting a loan amount that is 2% of their income
- is 25 years old

After following the correct path down the tree for this individual's set of data, you will end up in a "Yes" or "No" bucket (in tree terminology, we'd call this a "leaf") which represents the predicted class. Ending up in a "Yes" leaf means that the model predicts that this individual *will default* on their loan, where as a "No" prediction means that they *will not default* on their loan. 

Starting with the top node of the tree, you must evaluate a query about a particular attribute of your data point (e.g. is `months_loan_duration < 44`?).  If the answer is yes, then you go to the left at the split; if the answer is no, then you will go right.  At the next node you repeat the process until you end up in a leaf node, at which point you'll have a predicted class for your data point.    

![alt text](https://github.com/open-data-courses/tree-based-models-in-r/blob/master/images/prediction_with_a_classification_tree_yes_no2.png?raw=TRUE?raw=TRUE)

According to the model, will this person default on their loan?

<choice>
<opt text="Yes" correct="true">

</opt>

<opt text="No">

The decision tree predicts Yes (they will default on their loan).  The path, from the top of the tree downwards is Left, Right, Left, Right.

</opt>

</exercise>

<exercise id="6" title="Overview of the modeling process" type="slides">

<slides source="chapter1_06">
</slides>

</exercise>

<exercise id="7" title="Train/test split">

For this exercise, you'll randomly split the [German Credit Dataset](https://archive.ics.uci.edu/ml/datasets/Statlog+%28German+Credit+Data%29) into two pieces: a training set (80%) called `credit_train` and a test set (20%) that we will call `credit_test`. We'll use these two sets throughout the chapter.

** Instructions **

The `credit` data frame is loaded into the workspace.

- Define `n`, the number of rows in the `credit` data frame.
- Define `n_train` to be ~80% of `n`.
- Set a seed (for reproducibility) and then sample `n_train` rows to define the set of training set indices.
- Using row indices, subset the `credit` data frame to create two new datasets: `credit_train` and `credit_test`

<codeblock id="01_07">

Use the `sample()` function to randomly sample 80% of the indices to create the training set.
The remaining 20% can be used to create the test set. 

</codeblock>

</exercise>

<exercise id="8" title="Train a classification tree model">

In this exercise, you will train a model on the newly created training set and print the model object to get a sense of the results.

**Instructions**

- Train a classification tree using the `credit_train` data frame.
- Look at the model output by printing the model object.

<codeblock id="01_08">

- Train the model using `formula = default ~ .` and the `credit_train` data frame.  
- Print the model object using `print()`.

</codeblock>

</exercise>

<exercise id="9" title="Evaluating classification model performance" type="slides">

<slides source="chapter1_09">
</slides>

</exercise>

<exercise id="10" title="Compute confusion matrix">

As discussed in the previous video, there are a number of different metrics by which you can measure the performance of a classification model.  In this exercise, we will evaluate the performance of the model using test set classification error.  A confusion matrix is a convenient way to examine the per-class error rates for all classes at once.  

The `confusionMatrix()` function from the `caret` package prints both the confusion matrix and a number of other useful classification metrics such as "Accuracy" (fraction of correctly classified instances).

The `caret` package has been loaded for you.

**Instructions**

- Generate class predictions for the `credit_test` data frame using the `credit_model` object.
- Using the `caret::confusionMatrix()` function, compute the confusion matrix for the test set.

<codeblock id="01_10">

- To generate the class predictions, use the `predict()` function to create the `class_prediction` object, which will then contain the predicted class for each test set example.
- The `confusionMatrix()` function computes a confusion matrix using `class_prediction` and `credit_test$default` (the test set labels). It does not require a `type` argument.

</codeblock>

</exercise>

<exercise id="11" title="Splitting criterion in trees" type="slides">

<slides source="chapter1_11">
</slides>

</exercise>

<exercise id="12" title="Compare models with a different splitting criterion">

Train two models that use a different splitting criterion and use the validation set to choose a "best" model from this group. To do this you'll use the `parms` argument of the `rpart()` function. This argument takes a named list that contains values of different parameters you can use to change how the model is trained. Set the parameter `split` to control the splitting criterion.

** Instructions **

The datasets `credit_test` and `credit_train` have already been loaded for you.

- Train a model, splitting the tree based on gini index.
- Train a model, splitting the tree based on information index.
- Generate predictions on the validation set using both models.
- Classification error is the fraction of incorrectly classified instances.  Compute and compare the test set classification error of the two models by using the `ce()` function.

<codeblock id="01_12">

- The `split` option in `rpart()` can be set to either `"gini"` or `"information"` for classification trees.
- The `predict()` function is identical to previous exercises, but you need to use `credit_model1` and `credit_model2`.
- The `Metrics::ce()` function uses the predictions generated by `predict()` (when `type = "class"`).

</codeblock>

</exercise>

