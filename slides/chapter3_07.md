---
type: slides
---

# Using caret for cross-validating models

Notes: 

Although using a single training and test set is a quick way to get an estimate of your model's performance, it's susceptible to variations in the data.  Variability in your data can stem both from the size of your training set -- smaller datsets have more variabilty -- and also from natural variabilty in the true population that you're sampling from.  

In these cases, the model performance as evaluated on a test set might vary quite a bit depending on how you split your data.  For example, with one particular random spilt of your data, you might get a test set AUC of zero point seven five.  If you had split the data differently, you might have gotten a test set AUC of 0.71.  So which is a better estimate of the true AUC?  Well, since the validation strategy is identical, they are equally valid estimates.

As we've discussed in earlier sections, one way to reduce the variance of an estimate is to average multiple estimates together.  This is exactly what cross-validation does.

---

# K-fold Cross-validation

- dataset size = 200 rows
- k = 10 (number of cross validation folds)

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_5622/datasets/k_fold.png?raw=TRUE)

Notes: There are several strategies that all fall under the name, "cross-validation", but here we will focus on the most popular version, which is called k-fold cross-validation.

The first step is to partition the rows of the dataset into K subset of equal sizes. So, if you have 200 data points and you have 10 folds, then there will be 20 data points in each of the folds.  If you can't divide your exammples into folds of equal sizes, then approximately-equal sizes is good enough.

---

# K-fold Cross-validation

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_5622/datasets/k_fold_selected.png?raw=TRUE)

- 10 estimates of test set AUC
- the average is the cross-validated estimate of AUC

Notes: In k-fold cross-validation, you run k separate learning experiments. In each iteration, you pick one of the k subsets as your test set and the remaining k minus 1 subsets are aggregated and used as the training set. Then you train your machine learning algorithm on that training set, and evaluate the model's performance on the test set.  You can use any metric to evaluate the performance, so as an example, let's say you compute the test set AUC.

If we have k equals 10, then you'll repeat this process 9 more times.  When you are finished you will have 10 estimates of test set AUC.  We average those 10 estimates together to get what's called the cross-validated estimate of AUC.  

Since we end up training k models instead of one, it's obvious that cross-validation takes k times as long to evaluate your models this way.  It's a trade-off, so for small datasets, you might always want to use cross-validation and for big datasets, you might consider doing a simple train/test split.  It depends on what's more valuable to your use-case: time or accuracy of your model performance estimates.

---

# Using caret for cross-validating models


```r
library(caret)
```

- `train()`
- `trainControl()`

Notes: Now that you have a working knowledge of cross-validation, let's try it in R.  The caret package, which offers a unified interface to a large number of machine learning packages in R, also offers a simple way to perform cross-validation, so we'll make use of that here.  

The relevant functions in the caret package are called train() and trainControl().

---

# Training configuration


```r
# Specify the training configuration
ctrl <- trainControl(method = "cv",                      # Cross-validation
                     number = 5,                         # 5 folds
                     classProbs = TRUE,                  # For AUC
                     summaryFunction = twoClassSummary)  # For AUC
```

Notes: For the trainControl function, we will need to specify: 

the method, in our case the cross-validation.
the number of k (the folds), in this example this will be 5
should the class probabilities be computed along with predicted values in each resample? If so we need to set the classProbs to TRUE
and what is the summary function. Caret contains a built-in function called twoClassSummary that calculates the ROC curve for AUC

---


# Let's practice!

Notes: Now, it is your time to practice what you learned.

