---
type: slides
---

# Introduction to Random Forest

Notes: 

In Chapter 3, we introduced bagged trees, which are a big improvement over a single decision tree.  In this chapter, we'll introduce the Random Forest algorithm, which is an improvement upon bagged trees.

In general, the performance of Random Forests is similar to boosting (which you'll learn about in the next section), and they are simpler to train and tune. As a result of their ease-of-use and out-of-the-box performance, Random Forests are a very popular machine learning algorithm, and are implemented in a variety of packages, including a widely used package called "randomForest", which we will use throughout this chapter.  

---

# Random Forest

- better performance
- sample subset of the features
- improved version of bagging
- reduced correlation between the sampled trees

Notes: The basic idea behind random forests is identical to bagging -- both are ensembles of trees trained on bootstrapped samples of the training data.  However, in the Random Forest algorithm, there is slight tweak to the way the decision trees are built that leads to better performance. 

The key difference is that when training the trees that make up the ensemble, we add a bit of extra randomness to the model -- hence the name, Random Forests.  

At each split in the tree, rather than considering all features, or input variables, for the split, we sample a subset of these features and consider only these few variables as a candidates for the split. The technique of sampling variables from the input or feature space is also feature bagging, or the random subspace method.

At first glance -- this may sound counter intuitive.  We have fewer variables to choose from, which means there's less information available to the model -- so how can that lead to better performance?

Well, adding this extra bit of randomness leads to a collection of trees that are further decorrelated (or more different) from one another. So, Random Forests improve upon bagging by reducing the correlation between the sampled trees.

---

# Random Forest in R

```out
> library(randomForest)
```

```out
> ?randomForest
```

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_5590/datasets/rf_rhelp.png?raw=TRUE)


Notes: To run the Random Forest algorithm you will use the randomForest function from the randomForest package. Let's take a look at the randomForest function in R. 

---

# randomForest Example

```r
library(randomForest)

# Train a default RF model (500 trees)

model <- randomForest(formula = response ~ ., data = train)
```

Notes: The syntax for training a Random Forest model using the randomForest package follows standard conventions for modeling in R.  The user can specify a the input variables and dependent variables using the familar formula interface. 

The training data is passed to the "data" argument.  The number of trees is specified through the "ntrees" argument and defaults to 500, which is usually a good place to start.  You can always add more trees to improve the performance of the ensemble -- more trees almost always means better performance in a Random Forest.   

There are a handful of other model hyperparamters that are useful to know about in a Random Forest and we will go into greater detail about those later in the chapter.

---

# Let's practice!

Notes: Now let's train our first Random Forest!
