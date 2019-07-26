---
title: 'Chapter 5: Boosted Trees'
description:
  'In this chapter, you will see the boosting methodology with a focus on the Gradient Boosting Machine (GBM) algorithm, another popular tree-based ensemble method. Here you will learn how to train, tune and evaluate GBM models in R.'
prev: /chapter4
next: /chapter1
type: chapter
id: 5
---

<exercise id="1" title="Introduction to boosting" type="slides">

<slides source="chapter5_01">
</slides>

</exercise>

<exercise id="2" title="Bagged trees vs. boosted trees">

What is the main difference between bagged trees and boosted trees?

Hint: Boosting is an iterative algorithm and bagging is not.

<choice>
<opt text="Boosted trees don't perform as well as bagged trees.">

Typically boosted trees perform better than bagged trees.

</opt>

<opt text="Boosted trees have fewer hyperparameters to tune than bagged trees." >

There are a few more hyperparameters in boosted trees.

</opt>

<opt text="Boosted trees improve the model fit by considering past fits and bagged trees do not." correct="true">

Boosting is an iterative algorithm that considers past fits to improve performance.

</opt>

</choice>
</exercise>

<exercise id="3" title="Bagged trees vs. boosted tree">

Here you will use the `gbm()` function to train a GBM classifier to predict loan default. You will train a 10,000-tree GBM on the `credit_train` dataset, which is pre-loaded into your workspace.  

Using such a large number of trees (10,000) is probably not optimal for a GBM model, but we will build more trees than we need and then select the optimal number of trees based on early performance-based stopping.  The best GBM model will likely contain fewer trees than we started with.

For binary classification, `gbm()` requires the response to be encoded as 0/1 (numeric), so we will have to convert from a "no/yes" factor to a 0/1 numeric response column. 

Also, the the `gbm()` function requires the user to specify a `distribution` argument. For a binary classification problem, you should set `distribution = "bernoulli"`.  The [Bernoulli distribution](https://en.wikipedia.org/wiki/Bernoulli_distribution) models a binary response.  

**Instructions**

- Convert from a "no/yes" factor to a 0/1 numeric response column using the `ifelse()` function.
- Train a 10,000-tree GBM model. 

<codeblock id="05_03">

The first argument of the `ifelse()` function is a logical test -- it's asking which rows of the "default" column are set to "yes".  The second argument specifies what to return for the "yes" rows (in this case we want 1).  For all other rows (the "no" rows), we will set to 0.  So the second and third arguments should be 1 and 0, respectively.

For the GBM model, we want `distribution = "bernoulli"` and `n.trees = 10000`.

</codeblock>

</exercise>

<exercise id="4" title="Understanding GBM model output" type="slides">

<slides source="chapter5_04">
</slides>

</exercise>

<exercise id="5" title="Prediction using a GBM model">

The **gbm** package uses a `predict()` function to generate predictions from a model, similar to many other machine learning packages in R.  When you see a function like `predict()` that works on many different types of input (a GBM model, a RF model, a GLM model, etc), that indicates that `predict()` is an "alias" for a GBM-specific version of that function.  The GBM specific version of that function is `predict.gbm()`, but for convenience sake, we can just use `predict()` (either works).

One thing that's particular to the `predict.gbm()` however, is that you need to specify the number of trees used in the prediction.  There is no default, so you have to specify this manually.  For now, we can use the same number of trees that we specified when training the model, which is 10,000 (though this may not be the optimal number to use). 

Another argument that you can specify is `type`, which is only relevant to Bernoulli and Poisson distributed outcomes.  When using Bernoulli loss, the returned value is on the log odds scale by default and for Poisson, it's on the log scale.  If instead you specify `type = "response"`, then `gbm` converts the predicted values back to the same scale as the outcome. This will convert the predicted values into probabilities for Bernoulli and expected counts for Poisson.

** Instructions **

- Generate predictions on the test set, using 10,000 trees.
- Generate predictions on the test set using `type = "response"` and 10,000 trees.
- Compare the ranges of the two sets of predictions.

<codeblock id="05_05">

The `predict()` function should be familiar by now -- you need to pass the model object, the test data and in GBMs, you also need to pass an integer that represents the number of trees in the ensemble.

</codeblock>

</exercise>

<exercise id="6" title="Evaluate test set AUC">

Compute test set AUC of the GBM model for the two sets of predictions.  We will notice that they are the same value.  That's because AUC is a rank-based metric, so changing the actual values does not change the value of the AUC.  

However, if we were to use a scale-aware metric like RMSE to evaluate performance, we would want to make sure we converted the predictions back to the original scale of the response.

**Instructions**

The `preds1` and `preds2` prediction vectors from the previous exercise are pre-loaded into the workspace.

- Compute AUC of the predictions.
- Compute AUC of the predictions (scaled to response).
- Notice that the AUC is the same!

<codeblock id="05_06">

The `auc()` function requires passing the prediction vectors to the `predicted` argument.

</codeblock>

</exercise>

<exercise id="7" title="GBM hyperparameters" type="slides">

<slides source="chapter5_07">
</slides>

</exercise>

<exercise id="8" title="Early stopping in GBMs">

Use the `gbm.perf()` function to estimate the optimal number of boosting iterations (aka `n.trees`) for a GBM model object using both OOB and CV error.  When you set out to train a large number of trees in a GBM (such as 10,000) and you use a validation method to determine an earlier (smaller) number of trees, then that's called "early stopping".  The term "early stopping" is not unique to GBMs, but can describe auto-tuning the number of iterations in an iterative learning algorithm.

**Instructions**

- The `credit_model` object is loaded in the workspace.
- Use the `gbm.perf()` function with the "OOB" method to get the optimal number of trees based on the OOB error and store that number as `ntree_opt_oob`.
- Train a new GBM model, this time with cross-validation, so we can get a cross-validated estimate of the optimal number of trees.
- Lastly, use the `gbm.perf()` function with the "cv" method to get the optimal number of trees based on the CV error and store that number as `ntree_opt_cv`.
- Compare the two numbers.

<codeblock id="05_08">

The `gbm.perf()` function takes the GBM model object as input.  You will also need to specify the method, which will be `"OOB"` or `"cv"`.

</codeblock>

</exercise>

<exercise id="9" title="OOB vs CV-based early stopping">

In the previous exercise, we used OOB error and cross-validated error to estimate the optimal number of trees in the GBM.  These are two different ways to estimate the optimal number of trees, so in this exercise we will compare the performance of the models on a test set.  We can use the same model object to make both of these estimates since the `predict.gbm()` function allows you to use any subset of the total number of trees (in our case, the total number is 10,000).

**Instructions**

The `ntree_opt_oob` and `ntree_opt_cv` objects from the previous exercise (each storing an "optimal" value for `n.trees`) are loaded in the workspace.

Using the `credit_model` loaded in the workspace, generate two sets of predictions:
- One using the OOB estimate of `n.trees`: 3,233 (stored in `ntree_opt_oob`)
- And the other using the CV estimate of `n.trees`: 7,889 (stored in `ntree_opt_cv`)

<codeblock id="05_09">

The first set looks like this: `preds1 <- predict(credit_model, credit_test, n.trees = ntree_opt_oob)`.

</codeblock>

</exercise>

<exercise id="10" title="Model comparison via ROC Curve & AUC" type="slides">

<slides source="chapter5_10">
</slides>

</exercise>

<exercise id="11" title="Compare all models based on AUC">

In this final exercise, we will perform a model comparison across all types of models that we've learned about so far: Decision Trees, Bagged Trees, Random Forest and Gradient Boosting Machine (GBM).  The models were all trained on the same training set, `credit_train`, and predictions were made for the `credit_test` dataset.

We have pre-loaded four sets of test set predictions, generated using the models we trained in previous chapters (one for each model type).  The numbers stored in the prediction vectors are the raw predicted values themselves -- not the predicted class labels.  Using the raw predicted values, we can calculate test set AUC for each model and compare the results.  

**Instructions**

Loaded in your workspace are four numeric vectors:

- `dt_preds`
- `bag_preds`
- `rf_preds`
- `gbm_preds`

These predictions were made on `credit_test`, which is also loaded into the workspace. 

- Apply the `Metrics::auc()` function to each of these vectors to calculate test set AUC.  Recall that the higher the AUC, the better the model.

<codeblock id="05_11">

The prediction vectors pre-loaded into the workspace need to be passed to the `predicted` argument of the `auc()` function.

</codeblock>

</exercise>

<exercise id="12" title="Plot & compare ROC curves">

We conclude this course by plotting the ROC curves for all the models (one from each chapter) on the same graph.  The **ROCR** package provides the `prediction()` and `performance()` functions which generate the data required for plotting the ROC curve, given a set of predictions and actual (true) values.  

The more "up and to the left" the ROC curve of a model is, the better the model.  The AUC performance metric is literally the "Area Under the ROC Curve", so the greater the area under this curve, the higher the AUC, and the better-performing the model is.

**Instructions**

The **ROCR** package can plot multiple ROC curves on the same plot if you plot several sets of predictions as a list.  

- The `prediction()` function takes as input a list of prediction vectors (one per model) and a corresponding list of true values (one per model, though in our case the models were all evaluated on the same test set so they all have the same set of true values).  The `prediction()` function returns a "prediction" object which is then passed to the `performance()` function.
- The `performance()` function generates the data necessary to plot the curve from the "prediction" object.  For the ROC curve, you will also pass along two measures, `"tpr"` and `"fpr"`.  
- Once you have the "performance" object, you can plot the ROC curves using the `plot()` method.  We will add some color to the curves and a legend so we can tell which curves belong to which algorithm.

<codeblock id="05_12">

The `prediction()` function requires two lists, the `preds_list` and `actuals_list`.

</codeblock>

</exercise>