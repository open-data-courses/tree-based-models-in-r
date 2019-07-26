---
type: slides
---

# OOB error vs. test set error

Notes: Erin LeDell - Instructor

We've talked a bit about out-of-bag error and it's use in Random Forests as a quick built-in snapshot of model performance.

You might be wondering how OOB error compares to test set error and which one you should use to evaluate the generalization error of your model.

---

# Advantages & Disadvantages of OOB estimates

✔ Can evaluate your model without a separate test set

✔ Computed automatically by the `randomForest()` function

✖ OOB Error only estimates error (not AUC, log-loss, etc.)

✖ Can't compare Random Forest performace to other types of models


Notes: One of the nicest things about the Random Forest algorithm is that you're provided with a built-in validation set without any extra work on your part, and you don't need to sacrifice any of your training data to use for validation.

Another nice advantage of the randomForest package, in particular, is that it already has OOB error computation built-in, so you don't need to write any extra code to evaluate your model's perforamnce.

Now, let's move on to the disadvantages.

Although techically it's possible to compute other metrics such as AUC and logloss on the out-of-bag sample, it's not built in to the randomForest package, so it makes it impossible to do so.  The randomForest package does not keep track of which observations were part of the out-of-bag sample in each tree, so there's no way to calculate these metrics after-the-fact.

If you're comparing the perforamnce of your Random Forest to another type model such as a GLM or Support Vector Machine, then you'd want to score each of these models on the same validation set to compare perforamnce.  So although the out-of-bag error rate can be used to compare several Random Forests, you won't be able to perform a model comparison to any other type of model using the out-of-bag estiamte.


---

# Let's practice!

Notes: Ok, now let's review what we've learned.

