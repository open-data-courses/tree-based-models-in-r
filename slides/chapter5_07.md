---
type: slides
---

# Tuning a GBM model

Notes: Erin LeDell - Instructor

Hyperparamter tuning is especially important in GBM models since they are prone to overfitting.  Like Random Forests, GBMs can also be tuned by performing a grid search across some subset of the GBM model hyperparamters.  

The word "tuning" can also be used to describe a model optimization process that's unique to iterative algorithms such as the GBM.  When you "tune" the number of iterations in an iterative algorithm, there's a special name for that, which is "early stopping".    

First we will discuss some of GBM's important hyperparamters and then we will move on to the topic of early stopping and demonstrate how to perform early stopping on models using the gbm package.


---

# GBM Hyperparameters

- n.trees: number of trees
- bag.fraction: proportion of observations to be sampled in each tree
- n.minobsinnode: minimum number of observations in the trees terminal nodes 
- interaction.depth: maximum nodes per tree
- shrinkage: learning rate

Notes: There is some overlap between the gbm and random forest hyperparameters since they are both tree-based methods, so some of the gbm hyperparamters should already feel familiar.  The obvious example of this is the "number of trees" in the ensemble.  

The second shared parameter is the proportion of observations to be sampled for each tree.  In random forest, this is called sampsize and in gbm it's called bag dot fraction.

We also have the minimum number of observations in the terminal node which is called n dot minobsinnode in gbm and nodesize in Random Forest.

interaction dot depth is the maximum nodes per tree, or number of splits it has to perform on a tree (starting from the root node).

In the context of GBMs, shrinkage, which is also called the "learning rate" is used for reducing, or shrinking, the impact of each additional tree added to the ensemble. It reduces the size of incremental steps and therefore penalizes the importance of each consecutive iteration. 

Since boosting is sensitive to making mistakes, it's better to take many small steps rather than a few large ones.  A small step in the wrong direction is easier to correct in subsequent iterations than a big one.  Slowing the learning rate down does increase training time, however. 


---

# Early Stopping

![](https://github.com/open-data-courses/tree-based-models-in-r/blob/master/images/early_stopping.png?raw=TRUE)


Notes: The term, "early stopping" is used to describe the process of  stopping the training process in an iterative algorithm by means of evaluating the model performance on a holdout set.  In the case of GBM, this could be based on the performance of an out-of-bag sample, a separate validation set, or by using cross-validation.

The ideal time to stop training an iterative model is after the validation error has decreased and started to stabilize, and before the validation error starts to increase due to overfitting.  In theory, the performance can be measured by any model evaluation metric, not just error. The gbm package exclusively uses error for early stopping purposes, but other GBM implementations such as the ones in the h2o or xgboost packages, will allow you to specify a variety of metrics such as AUC or log-loss to control early stopping.

---

# Early Stopping in GBMs

```r
# train a GBM model

model <- gbm(formula = response ~ ., 
             distribution = "bernoulli", 
             data = train,
             n.trees = 5000,
             cv.folds = 3)
                
```

```r
# get optimal ntree based on CV error
                       
ntree_opt_cv <- gbm.perf(model, method = "cv")
```

```r
# get optimal ntree based on OOB error

ntree_opt_oob <- gbm.perf(model, method = "OOB")
```

Notes: The gbm package comes with a built-in function for estimating the optimal nunber of boosting iterations (aka n trees) called  
gbm dot perf().  

The method argument specifies the method used to estimate the optimal number of boosting iterations. 

method="OOB" computes the out-of-bag estimate and method="cv" extracts the optimal number of iterations using cross-validation if gbm was called with cv dot folds > 1.

---

# Let's practice!

Notes: Now it's your turn.