---
type: slides
---

# Understanding the Random Forest model output

Notes: 

In this video, you'll learn exactly what each part of the output from a Random Forest model object means. 

---

# This is a slide

Random Forest output

```out
# Print the credit_model output

> print(credit_model)


Call:
 randomForest(formula = default ~ ., data = credit_train) 
               Type of random forest: classification
                     Number of trees: 500
No. of variables tried at each split: 4

        OOB estimate of  error rate: 24.12%
Confusion matrix:
     no yes class.error
no  516  46  0.08185053
yes 147  91  0.61764706
```

Notes: Now that we've just trained a model on the German Credit Dataset, let's take a look at the output of the model.

If you print a random forest model object you'll see the following: 
the type of random forest (either classification or regression)

the number of trees used 

the number of variables tried at each split, which in random forest parlance, is called "mtry".  the default value of mtry is determined dynamically, based on the number of input variables in the training set. The credit dataset has 16 features and in  classification forests the default mtry value is the square root of the number of features.

you'll also see what's called the "out-of-bag" or "OOB" estimate of the error rate for the model. This is the error rate computed across the samples that were not selected into the bootstrapped training sets.  We will explain this in further detail on the next slide.

And lastly, since this is a classification problem, we also see a confusion matrix based on the out-of-bag samples.

---

# Out-of-bag error matrix

```out
# Grab OOB error matrix & take a look

> err <- credit_model$err.rate

> head(err)
           OOB        no       yes
[1,] 0.3414634 0.2657005 0.5375000
[2,] 0.3311966 0.2462908 0.5496183
[3,] 0.3232831 0.2476636 0.5147929
[4,] 0.3164933 0.2180294 0.5561224
[5,] 0.3197756 0.2095808 0.5801887
[6,] 0.3176944 0.2115385 0.5619469
```


Notes: Since each tree in the Random Forest is trained on a bootstrapped sample of the original training set, this means that some of the samples will be duplicated in the training set and some will be absent.  The "absent" examples are what's called "out of bag" samples.  

One of the nice things about the Random Forest algorithm is that you're provided a built-in validation set without any extra work!  Since the out of bag samples were not used to train the trees, they can be used to evaluate the tree's performance on unseen data.  

The classification error across all the out of bag samples is called the Out of Bag Error.  

The Out-of-bag error matrix is stored in the Random Forest model, and the rows of this matrix represent the number of trees in the forest.  

The i-th row reports the OOB error rate for all trees up to and including the the i-th tree.

The first column shows the error across all the classes and then there are additional columns for per-class OOB error.

---

# Out-of-bag error estimate

```out
# Look at final OOB error rate (last row in err matrix)

> oob_err <- err[nrow(err), "OOB"]
> print(oob_err)
   OOB 
0.24125
```

```out
> print(credit_model)


Call:
 randomForest(formula = default ~ ., data = credit_train) 
               Type of random forest: classification
                     Number of trees: 500
No. of variables tried at each split: 4

        OOB estimate of  error rate: 24.12%
Confusion matrix:
     no yes class.error
no  516  46  0.08185053
yes 147  91  0.61764706
```

Notes: If you get the last row, you'll have the final out-of-bag error.  This is the same value that's printed in the model output. 

---

# Plot the OOB error rates 

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_5590/datasets/rf_model_plot.png)

Notes: When you plot a Random Forest model object, it shows a plot of the OOB error rates as a function of the number of trees in the forest. This plots helps you decide how many trees are neccessary to include in the ensemble. 

As you can see, when using less than 50 trees the OOB error remains quite high, but drops and starts to flattens out between 300 and 400 trees.

After a certain point, including more trees in your model will not get you any additional performance.  There is nothing wrong with using "too many" trees, however, computing the predictions for each tree does take time, so you don't want to include more trees than you actually need. 

---

# Let's practice!

Notes: Now it's your turn.

