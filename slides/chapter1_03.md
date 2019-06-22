---
type: slides
---

# Introduction to classification trees

Notes: Gabriela de Queiroz - Instructor

Trees have advantages and disadvantages like any other algorithm. There are several advantages that make decision trees a useful machine learning algorithm.


---

# Advantages

✔ Simple to understand, interpret, visualize{{1}}

✔ Can handle both numerical and categorical features (inputs) natively{{2}}    

✔ Can handle missing data elegantly{{3}}

✔ Robust to outliers{{4}}

✔ Requires little data preparation{{4}}

✔ Can model non-linearity in the data{{5}}

✔ Can be trained quickly on large datasets{{6}}



Notes:  One of the biggest advantages of decision trees is that both the training and prediction process is easy to explain.  
They are even easier to explain than a linear model!  
Understanding why a particular prediction was made is as simple as following a path down a tree. Trees can be displayed visually, and are easily interpreted even by a non-expert (especially if they are small).

Decision trees require no normalization or standardization for numeric features. Trees can also handle categorical features without the need to create dummy binary indicator variables (or to use other types of categorical encodings).  
Some tree software implementations make use of a technique called  "group splitting" to handle categorical features within the partitioning algorithm itself.   

Decision trees also handle missing data in a elegant form, though not all decision tree software supports native handling of missing data.  
One popular method for dealing with missing values in trees is when you arrive at a split point and the feature value is not available, you can choose to go right or left at random, and then proceed as normal.  
Another method involves going down both branches at the split with missing data, and then when you finally reach a leaf node in each path, you average the leaves together for the final prediction. 

Since no numeric transformations or categorical encodings are required, missing values can often be handled automatically and since they are robust to outliers, trees require little to no data preparation.

Decision trees recursively partition the feature space into subsets which allows the decision boundaries to be more complex than a simple linear method.

It's relatively fast to train a decision tree, so tree methods can handle big datasets. 

---

# Disadvantages 


✖ Large trees can be hard to interpret

✖ Trees have high variance, which causes model performance to be poor

✖ Trees overfit easily


Notes: Unfortunately, large, deep, trees are hard to interpret.

One of the major problems with trees is that they have high variance.  A small change in the data can result in a very different series of splits (also making interpretation somewhat precarious).  High variance leads to poor model performance.

If not tuned properly, it's easy to create overly-complex trees that do not generalize well to new data.  This is also known as "overfitting".


Next, we will go through an example.

---

# Will you wait for a table or go elsewhere?

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_5597/datasets/restaurante_example_table.png)

Notes: Let's say your friend is thinking of having dinner tonight at a restaurant near your house. We have some data from past customers, with some attributes and the outcome (if they waited for a table or not).

The 5 variables in the data are:
Is it Friday or Saturday? 
Is it raining?
Did the person make a reservation?
What is the wait estimate?
Will the person wait for a table?

In this example, the goal is to build a classification tree that predicts whether a customer will wait for a table at a restaurant (or go elsewhere).

---

# Restaurant Example

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_5597/datasets/restaurante_example_table_highlight.png)

Notes: Let's take a look at one data point in the training set.  Customer 4 went to the restaurant on a Friday or Saturday, it was not raining, they didn't have a reservation, and the wait estimate time was somewhere between 10 to 30 minutes.  In this case, they decided to stay at the restaurant and wait for the table rather than go elsewhere.

---

# Decision Tree in R

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_5597/datasets/dt_restaurant_example.png)

Notes: It doesn't take much to create a decision tree in R. The output is very elegant and clear to understand. We'll talk about how to create this decision tree in R later, but for now, let's understand how you interpret this output.

---

# Prediction example 

- The wait estimate is 20 minutes, no reservation was made, and it is Wednesday

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_5597/datasets/dt_restaurant_example.png)


Notes: Let's suppose you want to predict whether your friend will wait for a table at a particular restaurant, or go elsewhere.  		
  		  
Here is the scenario: 

The wait estimate is 20 minutes, your friend doesn't have a reservation, and it is a Wednesday. 

---

# Example

![](http://s3.amazonaws.com/assets.datacamp.com/production/course_5597/datasets/dt_restaurant_example_explained_new.png)

Notes: Starting with the top node of the tree, you must evaluate a query about a particular attribute of your friend's data (in this example, we ask whether the wait_estimate is greater or equal to 60). If the answer is yes, then you go to the left at the split, and if the answer is no, then you will go right. 		
  		  
At the next node, you repeat the process until you end up in a leaf node, at which point you'll have the predicted outcome (to wait or not to wait) for your friend.		
  		  
So, according to the model, will your friend wait for a table?  YES!

---

# Let's practice!

