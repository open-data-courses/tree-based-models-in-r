---
type: slides
---

# Overview of the modeling process

Notes: Now that you've had a brief introduction to classification trees, let's move on to the modeling. In this section, we'll keep talking about the restaurant dataset and we will work on how to create a classification tree to make decisions.

---

# Train/Test Split

![](https://github.com/open-data-courses/tree-based-models-in-r/blob/master/images/train_test_split.png?raw=TRUE)

Notes: So far you used the whole dataset to train your model. But this will most likely lead to a result that it is too optimistic. 
One alternative is to split the data into 2 pieces. The first part of the data, the so-called training set, can be used for building the model and the second part of the data, the test set, can be used to test the results. 
One commom way of doing this is to use 80% of the data for a training set and 20% of the data for the test set. 
Of course, there can be a lot of variation depending which 80% of the data you select for the training set. One way to reduce this variation is by using cross-validation. We will talk about that later in the course.

But right now, let's learn how to do a train/test split in R using the restaurant dataset.

---

# Train/test split in R


```yaml
type: FullSlide
key: 676ed2ecaf
```


`@part1`


```r
# total number of rows in the restaurant data frame
n <- nrow(restaurant)
```
```r
# number of rows for the training set (80% of the dataset)
n_train <- round(0.80 * n) 
```
```r
# create a vector of indices which is an 80% random sample
set.seed(123) # set a random seed for reproducibility
train_indices <- sample(1:n, n_train)
```

```r
# subset the data frame to training indices only
restaurant_train <- restaurant[train_indices, ]  

# exclude the training indices to create the test set
restaurant_test <- restaurant[-train_indices, ]  
```
Notes: The first thing you will need to do is to get the number of rows in the whole dataset. You can do this by using the nrow function.

Next, you will define how many rows you will be using for the training set. In this case you will be using 80%.

Then, you will create a vector of indices which is an 80% random sample. Since we are using a random sample, to ensure you will have reproducible results, it is important to set a seed. 

Finally, you will subset the data to training indices only and you will exclude the training indices to create the test set.

Now that you have the training and testing set, let's train a classification tree.

---

# Train a Classification Tree

```r
# train the model to predict the binary response, "will_wait"

restaurant_model <- rpart(formula = will_wait ~.,  
                          data = restaurant_train, 
                          method = "class")
```

**formula**: `response variable` ~ `predictor variables`

Notes: To train a classification tree in R, you'll must specify: the formula, the data and the method. 

The basic format of formulas in R is: response variable tilde predictor variables. The tilde (~) is read as “is modeled as a function of." The dot symbol means "all other variables in the data." 

So here you can read: "will wait is modeled as a function of all the other variables in the data". 

The data will be our training set and method will be "class" since we are dealing with a binary response.

---

# Let's practice!

Notes: Now it's your turn to practice but this time you'll use the German Credit Dataset to train a classification tree model to predict loan default.

