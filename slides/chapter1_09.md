---
type: slides
---

# Evaluate Model Performance

Notes: At this point, you have a classification tree model ready. The next steps would be to make a prediction and evaluate your predictions. Let's learn now how to create a prediction in R.

---

# Predicting  class labels for test data

```r out
> predict(model, test_dataset)
```

```r out
> predict(model, test_dataset, type = ___)
```

```r out
class_prediction <- predict(object = restaurant_model, # model object 
                            newdata = restaurant_test, # test dataset
                            type = "class")  # return classification labels
```

Notes: Most machine learning packages in R have a predict function where the first argument is the trained model and the second argument is the test dataset.  

The rpart package has an extra argument, the type argument, which controls whether the function returns predicted labels or the raw predicted values.  

In classification problems, the model generates a raw predicted value for each class.  In most cases, you can think of these predicted values as the probability that the example belongs to each class.  

When type equals "class", the function will return a predicted class label and when type equals "prob", a matrix of raw predicted values is returned instead, with one column for each class.  

In this chapter, we will look only at predicted class labels and evaluate the performance of the model based on classifiation error on a test set.

---

# Evaluation Metrics for Binary Classification

- Accuracy
- Confusion Matrix
- Log-loss
- AUC

Notes: There are many ways of evaluate classification performance. Accuracy, confusion matrix, log-loss, and Area under the ROC Curve (or AUC) are some of the most popular metrics for binary classfication problems. 
For now, we will discuss accuracy and introduce the confusion matrix.

---

# Accuracy

$$ accuracy = \frac{\text{n of correct predictions}}{\text{n of total data points}}$$ {{1}}

Notes: Accuracy measures how often the classifier predicts the class correctly. 

It is defined as the ratio between the number of correct predictions and the total number rows in the data. Even though it is easy to calculate, it makes no distinction between classes; correct answers for both classes are treated equally and sometimes this is not enough.

Rather than looking at the overall accuracy, you might want to look at how many examples were incorrectly in each class.  

For example, when a doctor makes a medical diagnosis that a patient has cancer when he doesn’t this has very different consequences than making the call that a patient doesn’t have a cancer when in fact, he does.

A confusion matrix (or a confusion table) shows a more detailed breakdown of correct and incorrect classifications for each class.

---

# Confusion Matrix

![](https://github.com/open-data-courses/tree-based-models-in-r/blob/master/images/confusion_matrix_blank.png?raw=TRUE)

Notes: The columns of a confusion matrix correspond to the truth labels, and the rows represent the predictions.

In a binary classification problem, the confusion matrix will be a 2 by 2 table.  The main diagonal contains the counts of correctly classfied examples. 

A good model will contain most of the examples in the main diagonal (in this diagram, those are the white rectangles) and it will have a small number of examples, ideally zero, in the off-diagonal (represented by the red rectangles). 

---

# Confusion Matrix

![](https://github.com/open-data-courses/tree-based-models-in-r/blob/master/images/confusion_matrix.png?raw=TRUE)

Notes: In the 2-class case, a single prediction has four different possible outcomes:  

The true positives and true negatives are correct classifications. 

A false positive is when the outcome is incorrectly predicted as positive when it is actually negative. 

A false negative is when the outcome is incorrectly predicted as negative when it is actually positive. 

Although these examples have used a 2 by 2 confusion matrix, the same concept can be extended to any number of classes.  So we can have a 3 by 3 confusion matrix for a three-class model, a 4 by 4 confusion matrix for a 4-class model and so on.

Let's create a confusion matrix in R using the restaurant dataset.

---

# Confusion Matrix

```r
library(caret)

# calculate the confusion matrix for the test set
confusionMatrix(data = class_prediction,                # predicted classes
                reference = restaurant_test$will_wait)  # actual classes

```

Notes: To create a confusion matrix in R, we will use the confusionMatrix function from the caret package. 

The arguments you need to specify are: the data and the reference. 

The data argument is a vector of predicted class labels on a test set and the reference is a vector of the true class labels. 

---

# Let's practice!

Notes: Now, that you learned some techniques for evaluating classification models, it's your turn to practice.
