---
type: slides
---

# Introduction to bagged trees

Notes: Gabriela de Queiroz - Instructor

In the first two chapters, we introduced decision trees.

As we've learned, one of the main drawbacks of decision trees is their high variance. Often a small change in the data can result in a very different series of splits, which can also make model interpretation somewhat precarious.

Bagging, and in particular, bagged trees, averages many trees to reduce this variance.  Combining several models into one is what's called an ensemble model and averaging is one of the easiest ways to create an ensemble from a collection of models.  

Although bagging is often applied to decision trees, it can be used with any type of method.  In addition to reducing variance, it can also help avoid overfitting.  


---

# Bagging

**B**ootstrap **AGG**regat**ING**{{1}}

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/bootstrap.png) {{2}}


Notes: Bagging is a ensemble method and the term "bagging" is shorthand for bootstrap aggregation.  Bagging uses bootstrap sampling and aggregates the individual models by averaging.  

Bootstrap sampling, or "bootstrapping", simply means sampling rows at random from the training dataset, with replacement.  When you draw samples with replacement, that means that it's possible -- likely even, that you'll draw a single training example more than once. This results in a modified version of the training set where some rows are represented multiple times and some rows are absent. This let's you generate new data that's similar to the data you started with. By doing this, you can fit many different, but similar, models.

---

# Let's practice!

Notes: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tristique
libero at est congue, sed vestibulum tortor laoreet. Aenean egestas massa non
commodo consequat. Curabitur faucibus, sapien vitae euismod imperdiet, arcu erat
semper urna, in accumsan sapien dui ac mi. Pellentesque felis lorem, semper nec
velit nec, consectetur placerat enim.
