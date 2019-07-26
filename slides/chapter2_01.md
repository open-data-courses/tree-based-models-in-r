---
type: slides
---

# Introduction to regression trees

Notes: Erin LeDell - Instructor. 

In the last section, you learned about classification trees. In this section, we'll talk about another type of decision tree, the regression tree, but first, let's talk about what a regression model is.  In regression, the goal is to predict a numeric outcome from a set of inputs.  The dependent variable, or "response", can be either continuous or integer-valued.  

An example of a continuous numeric outcome is someone's weight -- although weight is sometimes measured in discrete units like pounds or kilos -- the underlying value is continuous and is usually recorded with some amount of precision, for example, 152 point 3 pounds.  A numeric response can also be integer-valued, possibly representing the count of discrete units, for example -- the number of times per month an app gets downloaded from an appstore.

Regression trees are built in much the same way as they are for classification. Beginning at the root node, the data is partitioned using a divide-and-conquer strategy according to the feature that will result in the greatest increase in homogeneity in the outcome after a split is performed. In classification trees, you recall that homogeneity is measured by entropy, which is undefined for numeric data. Instead, for numeric decision trees, homogeneity is measured by statistics such as variance, standard deviation, or absolute deviation from the mean.


---

# Train a Regresion Tree in R

```out
> rpart(formula = ___, 
        data = ___,
        method = ___)

```

![](https://github.com/open-data-courses/tree-based-models-in-r/blob/master/images/rpart_args.png?raw=TRUE)


Notes: The way we train a regression tree in R is the same as for a classification tree.  The rpart function is used for both methods. 

You need to specify the formula, the training dataset, the method to be used (since you will be working with a regression the method should be "anova" instead of "class") and an optional argument called control, which is a list of various parameters that control aspects of the tree fitting process.  We'll talk more about this in a later section.


---

# Train/Validation/Test Split

- training set
- validation set
- test set

Notes: In the first chapter, we partioned our original data frame into two pieces -- a training set and test set.  In this chapter, we will take a slightly different approach to splitting the data.  The code to split the data will look a little different as well -- we will modify the data splitting code so that we can easily split the dataset into an arbitrary number of pieces.  We will split the data into three parts: a training set, a validation set, and a test set. 

The validation set is a new concept which was not discussed in chapter 1.  Like a test set, a validation set is also used to evaluate a model's performance on unseen data.  The difference is that the purpose of the validation set is to tune the hyperparamters of a model, or to select a best model from a set of candidate models.  The test will be used to evaluate the generalizability of the model and is only meant to be used once -- at the very end of your modeling pipeline. 

We still use the sample() function from R, but instead of sampling the indices themselves, we use the sample() function to assign each row to either the training, validation or test sets according to a probability distribution.

---

# Let's practice!

Notes: Time to put this into practice.
