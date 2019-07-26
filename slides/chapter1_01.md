---
type: slides
---

# Welcome to the course!

Notes: Erin LeDell & Gabriela de Queiroz - Machine Learning Scientist & Data Scientist.

Welcome to Machine Learning with Tree-Based Models in R! 

I am Erin LeDell and I'm a Machine Learning Scientist and co-author of several R packages including the h2o package for machine learning.

I'm Gabriela de Queiroz and I'm a Data Scientist and the founder of R-Ladies, a world-wide organization for promoting diversity in the R community.


Supervised learning is the subfield of machine learning in which you train a model using input data and corresponding labels.  The converse is called unsupervised learning, where you learn from the input data alone.    

In supervised learning, each example is a pair consisting of the input data and an output value which represents a category or label in the case of classification, or a numeric value in the case of regression. 

A supervised learning algorithm analyzes the training data and produces an inferred function, or a "model", which can be used for mapping new examples to predicted labels or values. 

As an analogy, you can compare supervised learning to a student learning a subject by studying a set of questions and their corresponding answers. After mastering the mapping between questions and answers, the student can then provide answers to new (never-before-seen) questions on the same topic. 

---

# Tree-based models

- Interpretability + Ease-of-Use + Accuracy

- Make Decisions + Numeric Predictions

Notes: In this course we'll talk about decision tree-based models, including tree-based ensemble models such as Random Forests and Gradient Boosting Machines (or GBMs). Tree-based models stand out from other types of machine learning models due to their unique combination of model interpretability, ease-of-use, and, when used in ensembles, excellent accuracy. 

Tree-based methods are simple and useful for model interpretation. They are used to make decisions, explore the data and make predictions.

Decision trees are naturally easy to interpret.  Anyone who is comfortable reading a flow chart already has the skillset to understand a decision tree.  Trees are used not only by Data Scientists but also used by managers and decision makers, for example, to help them make decisions.

---

# What you'll learn:

- Interpret and explain decisions
- Explore different use cases
- Build and evaluate classification and regression models
- Tune model parameters for optimal performance

Notes: In this course we will learn the principles of tree-based machine learning models and how to use them. 

You will learn how to:
Interpret and explain decisions made from a tree-based model
Explore different use cases
Build and evaluate classification and regression models
Tune model parameters for optimal performance

---

# We will cover:

- Classification & Regression Trees 
- Bagged Trees 
- Random Forests 
- Boosted Trees (GBM) 

Notes: We will cover several tree based models. We'll talk and explain what are and how to use:
Classification & Regression Trees 
Bagged Trees
Random Forests
And lastly you will learn about Boosted Trees (in particular, the Gradient Boosting Machine (or GBM), one of the most widely used and powerful algorithms that's available today)

---

# Decision tree terminology: nodes


![](https://github.com/open-data-courses/tree-based-models-in-r/blob/master/images/node_decision_tree.png?raw=TRUE)

Notes: A decision tree is a hierarchical structure with nodes and directed edges. 

The node at the top is called the root node. 

The nodes at the bottom are called the leaf nodes or terminal nodes.  

Nodes that are neither the root node or the leaf nodes are called internal nodes. 

The root and internal nodes have binary test conditions associated with them and each leaf node has an associated class label. 

---

# Training Decision Trees in R

```out
> library("rpart")
```

```out
> help(package = "rpart") 
```

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_5616/datasets/r_help_rpart_package.png?raw=TRUE){{2}}

Notes: One of the most popular packages for decision trees in R is the rpart package.  In the first two chapters of this course, you will use this package for training both classification and regression trees.  rpart is short for "recursive partitioning" which is a process used in the training of a decision tree model.

If you want to get familiarized with what is inside the rpart package, you can take a look at the help page in R.

---

# Training Decision Trees in R

```out
> rpart(response ~ ., data = dataset)
```

Notes: You can use the function rpart from the rpart package to train a decision tree model. We'll go into more detail about what each of these arguments means later in the course, but for now you can see the basic syntax here.

---

# Let's practice!

Notes: This course is very hands-on so let's start right away with an example.
