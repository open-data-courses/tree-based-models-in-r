---
type: slides
---

# Tuning a Random Forest  model

Notes: 

Like any machine learning algorithm, the key to getting a good performance is to tune the model hyperparamters.  Random forest is one of the easier algorithms to tune because there are only a handful of hyperparameters that have a big impact on the performance of the model.

If you contrast tuning a random forest model to a support vector machine or deep neural network, it's a walk in the park.  This makes Random Forest a great machine learning algorithm for beginners to use -- you'll get great peformance out of the box, with little tuning and no expert knowledge required.

---

# Random Forest Hyperparameters

- ntree: number of trees{{1}}
- mtry: number of variables randomly sampled as candidates at each split{{2}}
- sampsize: number of samples to train on{{2}}
- nodesize: minimum size (number of samples) of the terminal nodes{{3}}
- maxnodes: maximum number of terminal nodes{{3}}

Notes: Next, we'll review some of the most important hyperparamters for the Random Forest algorithm.

- ntree is the number of trees in the forest.  we recommend starting with the default value of 500 trees.

- mtry and sampsize are both parameters that control how much variability or randomness goes into the random forest model.  

sampsize defaults to 63.2% of the number of training examples.  The reason for using this strangely precise number is that 63.2% is the expected number of unique observations in a bootstrapped sample. mtry is an important parameter that we will discuss in further detail in the next slide.

- nodesize and maxnodes are both parameters that control the complexity of the tree.  

when nodesize is small, it allows deeper, more complex trees to be grown. Maxnodes is just another way to limit tree growth and avoid overfitting.

Keep in mind that each random forest implementation can use different names for these same parameters.  These are just the names that the randomForest R package uses.  

---

# Tuning mtry with tuneRF()

```r
# Execute the tuning process

set.seed(1)              
res <- tuneRF(x = train_predictor_df,
              y = train_response_vector,
              ntreeTry = 500)
```

```r
# Look at results
print(res)
```

Results table:
```out
      mtry OOBError
2.OOB    2   0.2475
4.OOB    4   0.2475
8.OOB    8   0.2425
```

Notes: One of the most important model hyperparameters in the Random Forest algorithm is called "mtry".  At each split in a tree, we consider some number of predictior variables -- from this group, we choose the varible that splits the data in teh most pure manner.  Mtry is the number of predictor variables that we sample at each split.

The randomForest package has a built-in function for tuning the mtry parameter called tuneRF(), which tunes the model based on OOB error.
Rather than iterating over a set list of mtry values, the tuneRF function will start with default value of mtry and increase the value by an amount specified in the StepFactor argument.  The search will be stopped when the OOB error stops decreasing by a specified amount.  

Keep in mind that the specialized tuneRF() function is just one way to tune a Random Forest.  After learning how to tune our Random Forest using the tuneRF() fucntion, we will revisit what we learned in Chapter 2 about constructing a grid search from scratch. 

A manual grid search gives us more control over the search space, allows us to evaluate the Random Forest using metrics other than OOB Error and allows us to include other model hyperparamters in the grid search, such as nodesize and sampsize.


---

# Let's practice!

Notes: Time to put this into practice.
