---
type: slides
---

# Performance metrics for regression

Notes: Now that we've trained a regression tree, it's time to evaluate the performance of the model.  With classification trees, it makes sense to evalute using a metric like accuracy or classification error.  However, there is no such thing as accuracy in regression problems, so we need to evaluate our regression trees using a different metric.

Since the response is some real-valued number, and our prediction is the same, it makes sense to measure how far our predictions are away from the true values.   

---

# Common metrics for regression

- Mean Absolute Error (MAE)

$$MAE = \frac{1}{n}\sum{ \mid actual - predicted \mid } $$ 

- Root Mean Square Error (RMSE)

$$RMSE = \sqrt{\frac{1}{n}\sum{(actual - predicted)^2 }} $$ 

Notes: There are several metrics for regression but the two popular ones are the the Mean Absolute Error -- or MAE -- and the Root Mean Square Error -- also known as RMSE. 

MAE is the average absolute distance between the actual (or observed values) and predicted values.  The RMSE is similar, but instead of taking the absolute difference between errors, you square the differences of the errors.  Then you'll average those values across your test set and take the square root of the whole thing.  Taking the square root brings the metric back to the original scale of the response.  

The RMSE is the sample standard deviation of the differences between predicted values and observed values and so it's also sometimes referred to as the root mean square deviation or (RMSD). 

Both MAE and RMSE express average model prediction error in units of the variable of interest. Both metrics are indifferent to the direction of errors and lower values are better.

They key difference between the two is that RMSE punishes large errors more harshly than MAE.  Since the errors are squared before they are averaged, the RMSE gives a relatively high weight to large errors. This means the RMSE should be more useful when large errors are particularly undesirable. 

While both can be used to assess model performance, each one one has its own advantages and disavantages.  Which one is more appropriate is usually dependent on your use-case.

Throughout the exercises in this chapter, we will use RMSE to evaluate the performance of our regression trees.

---

# Evaluate a regression tree model

```out
> pred <- predict(object = model,  # model object 
                  newdata = test)  # test dataset
```

```out
> library(Metrics)

# Compute the RMSE
> rmse(actual = test$response, # the actual values 
       predicted = pred)       # the predicted values     
[1] 2.278249
```

Notes: Let's calculate the regression tree predictions and then evaluate the model based on the test set RMSE.

There is an R package called "Metrics" which implements a wide variety of machine learning model performance metrics.  We will use this package at various times throughout the course.  All the metrics functions take two arguments -- a vector of the actual values and vector of the predicted values.

After generating test set predictions, you can use the rmse() function from the Metrics package to compute RMSE. 

---

# Let's practice!

Notes: Time to put this into practice.
