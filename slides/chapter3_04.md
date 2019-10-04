---
type: slides
---

# Evaluating the performance of bagged tree models

Notes: 

You have already created a bagged tree model using the training set. Now it is time for to use the predict function to generate predicted labels on the test set. This will not be new for you since the predict function for bagged tree works exactly the same as the predict() function for a single tree.

---

# Generate Predictions 

```r
> class_predictions <- predict(object = rest_model_bag,   # model object 
                              newdata = restaurant_test,  # test dataset
                              type = "class")  # return classification labels
```
  

```r
> print(class_predictions)
[1] Yes Yes Yes Yes No  No  Yes No  Yes Yes Yes Yes No  No  No  Yes No  Yes Yes No  No 
Levels: No Yes
```

Notes: You have to pass the model object, the test dataset and what type you want your predictions to be. In this example we set the argument type  to be class since we want the function to returns a vector of class predictions. 

If you want to take a peak in the preditions, you can print the class predictions and you will see that indeed classification labels were returned.

---

# Confusion Matrix

```r
> confusionMatrix(data = class_predictions,              # predicted classes
                  reference = restaurant_test$will_wait) # actual classes
```

```
Confusion Matrix and Statistics

          Reference
Prediction No Yes
       No   5   3
       Yes  1  12
                                          
               Accuracy : 0.8095          
                 95% CI : (0.5809, 0.9455)
    No Information Rate : 0.7143          
    P-Value [Acc > NIR] : 0.2402          
                                          
                  Kappa : 0.5758          
 Mcnemar's Test P-Value : 0.6171          
                                          
            Sensitivity : 0.8333          
            Specificity : 0.8000          
         Pos Pred Value : 0.6250          
         Neg Pred Value : 0.9231          
         ...
                  
```

Notes: After making predictions, it is time to evaluate the model performance. You can again use the function confusionMatrix() from the caret package to create a confusion matrix just like you did for a single tree. 

You probably have noticed that the confusionMatrix gives you a bunch of outputs. So, besides the confusion matrix, it gives you several summary statistics. It gives you the accuracy, a 95 percent confidence interval for the accuracy, sensitivity, specificity, etc. 
So the confusion matrix function wraps a bunch of different accuracy measures that you might want to get out when you're evalutating the model fit. 

---

# ROC Curve


![](https://github.com/open-data-courses/tree-based-models-in-r/blob/master/images/roc_curve.png?raw=TRUE) 

Notes: The ROC curve, an acronym for receiver operating characteristic, is a popular graphic and an useful tool for selecting models for classification based on their performance with respect to the false positive and true positive rates, which are computed by shifting the decision threshold of the classifier. 


The overall performance of a classifier, summarized over all possible thresholds, is given by the area under this curve (AUC). An ideal ROC curve would fall into the top-left corner of the graph, with a true positive rate of 1 and a false positive rate of 0.  So the larger the AUC the better the classifier. 

It important to note that the AUC is a number between zero and one that measures model performance. An AUC of zero point five corresponds to a model that performs no better than random chance. An AUC of one corresponds to a model that perfectly classifies every example, while an AUC of zero means that your model is classifying every observation wrongly.

So, ROC curves are useful for comparing different classifiers, since they take into account all possible thresholds.

Let's now learn how to calculate the AUC in R.

---

# AUC


```r
> library(Metrics)
> auc(actual, predicted)
[1] .76765
```

Notes: You can compute the AUC in R using the function auc() from the Metrics package. This function takes two arguments. The first is the actual observations, and the second is the predicted classes. The function returns a single value that captures the error of your model.

---

# Let's practice!

Notes: Let's now put this all together in R! 

