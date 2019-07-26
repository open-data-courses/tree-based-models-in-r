---
type: slides
---

# Introduction to boosting

Notes: Erin LeDell - Instructor

So far in this course, you've learned about decision trees, bagged trees, and random forests.  In this last chapter, you'll learn about boosted trees, another type of tree-based ensemble method.  

The focus of this chapter will be the extremely popular and ultra-powerful boosting algorithm called the Gradient Boosting Machine, or "GBM".  We will also learn how to use the gbm package to train and tune GBM models in R.

---

# Boosting Algorithms

- Adaboost
- Gradient Boosting Machine ("GBM")

Notes: The two most popular boosting algorithms are Adaboost and the Gradient Boosting Machine (or "GBM").  Adaboost has been around longer and is still widely used, though GBM has become incredibly popular in the past decade and has come to dominate the recent conversation around boosting.
The GBM algorithm can be most easily explained by first introducing the Adaboost algorithm because it's a bit easier to understand and GBM is just a small tweak on the original Adaboost algorithm. 

---

# Adaboost Algorithm

- Train decision tree where with equal weight 
- Increase/Lower the weights of the observations 
- Second tree is grown on weighted data 

- New model: Tree 1 + Tree 2

- Classification error from this new 2-tree ensemble model 
- Grow 3rd tree to predict the revised residuals 
- Repeat this process for a specified number of iterations 

Notes: The Adaboost Algorithm is as follows: 

Start by training a decsion tree where each observation is assigned an equal weight.

After evaluating the first tree, we increase the weight of the observations that are difficult to classify and lower weights of the observations that are easy to classify. 

The second tree is grown on weighted data. The idea here is to improve the predictions of first tree.

The new model is now Tree 1 + Tree 2

You compute the classification error from this new 2-tree ensemble model and grow 3rd tree to predict the revised residuals.

Repeat this process for a specified number of iterations.  

Subsequent trees help in classifying observations that are not well classified by preceding trees.

The prediction for the final GBM ensemble model is a weighted sum of the predictions made by previous tree models.