---
type: slides
---

# What are the hyperparameters for a decision tree?

Notes: Erin LeDell - Instructor

Notes: In previous exercises, you've seen the basic usage of the rpart function, but so far we've trained decision trees using the default values for all the model parameters.  The default settings are chosen to provide a decent starting point on most datasets.  However, this leaves us with some room for improvement.  

There are several "knobs" that we can turn that affect how the tree is grown and in many cases, turning these knobs -- or model hyperparameters -- will results in a better performing model.  

---

# Decision tree hyperparameters

```r
?rpart.control
```

![](https://github.com/open-data-courses/tree-based-models-in-r/blob/master/images/rpart.control_args.png?raw=TRUE) 

Notes: The rpart() function has a special control parameter, called "control", by which we can provide an object containing the values of any hyperparameters parameters we wish specify manually.  If you don't use the control parameter, then all the default values will be used. 

To build this object, we must use the special rpart dot control() function. There are a number of different parameters that we could tweak.

---

# Decision tree hyperparameters

- minsplit: minimum number of data points required to attempt a split
- cp: complexity parameter
- maxdepth: depth of a decision tree

Notes: There are three important parameters that affect the size and complexity of our tree: 

The minsplit parameter defines the minimum number of data points that are needed in order for the algorithm to attempt a split before it is forced to create a leaf node. The default value is 20. 

The cp parameter is the complexity parameter and the default value of this is point zero one.

The maxdepth parameter limits the maximum number of nodes between a leaf node and the root node. The default value of 30 is quite liberal here, allowing for fairly large trees to be built. 

---

# Cost-Complexity Parameter (CP)

```r
> print(model$cptable)
          CP nsplit rel error    xerror       xstd
1 0.06839852      0 1.0000000 1.0080595 0.09215642
2 0.06726713      1 0.9316015 1.0920667 0.09543723
3 0.03462630      2 0.8643344 0.9969520 0.08632297
4 0.02508343      3 0.8297080 0.9291298 0.08571411
5 0.01995676      4 0.8046246 0.9357838 0.08560120
6 0.01817661      5 0.7846679 0.9337462 0.08087153
7 0.01203879      6 0.7664912 0.9092646 0.07982862
8 0.01000000      7 0.7544525 0.9407895 0.08399125
```

```r
# Prune the model (to optimized cp value)
# Returns the optimal model

model_opt <- prune(tree = model, cp = cp_opt)
```

Notes: To retreive the optimal value of CP, we simply find the row for which "xerror" is minmized and grab the corresponding CP value.  

Once you have the optimal value, you can tune (or "trim") the model using the prune() function. The prune() function returns the optmized model.  

---

# Let's practice!

Notes: Time to put this into practice.
