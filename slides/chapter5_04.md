---
type: slides
---

# Understanding GBM model output

Notes: Erin LeDell - Instructor

In the last exercise, you trained a gbm model and looked at the output. You also looked at the summary of the model. In this video, we are going to explain the GBM model output you trained in more detail.

---

# Examine model output

```out
> print(credit_model)

gbm(formula = default ~ ., distribution = "bernoulli", data = credit_train, 
    n.trees = 20000)
A gradient boosted model with bernoulli loss function.
20000 iterations were performed.
There were 16 predictors of which 16 had non-zero influence.
```

Notes: When you print a GBM model object, it will remind you how many trees, or iterations, were trained in it's execution.  Using it's internal calculations of variable importance, it will also let us know if any of our predictor variables had no influence in the model.  If you have noise variables or variables with no correlation with the outcome in your training data, they should show up here.   

---

# Variable Importance

```out
> summary(credit_model)
                                      var    rel.inf
checking_balance         checking_balance 25.4977193
amount                             amount 15.5225137
credit_history             credit_history 10.6469955
months_loan_duration months_loan_duration  9.8735594
age                                   age  7.1846706
employment_duration   employment_duration  6.6215395
savings_balance           savings_balance  5.8411174
purpose                           purpose  5.1014051
other_credit                 other_credit  3.6893492
percent_of_income       percent_of_income  3.6852710
years_at_residence     years_at_residence  2.7010336
housing                           housing  1.7772694
job                                   job  1.0878588
existing_loans_count existing_loans_count  0.4069210
phone                               phone  0.2527371
dependents                     dependents  0.1100395
```


Notes: Another nice feature of tree-based models is that they have a built-in mechanism for evaluating variable importance.  We skipped over this topic in the Random Forest chapter, but Random Forest models also return a variable importance table as part of the output.

Applying the summary() function to a GBM model object produces a variable importance table and plot for the model.  This table ranks the variables by their relative influence, which is a measure that quantifies how useful certain variable were in training the model. 

In the credit model, we see that "checking balance" and "amount" are by far the most important variables. 

---

# Prediction using GBM

```out
> ?predict.gbm
> predict(model, type = "response", n.trees = 10000)

```

Notes: The gbm package uses the predict() function to generate predictions from a model, similar to many other machine learning packages in R. When you see a function like predict() that works on many different types of input (a GBM model, a RF model, a GLM model, etc), that indicates that predict() is an "alias" for a GBM-specific version of that function. The full name for the GBM specific version of that function is predict.gbm(), but for convenience sake, we can just use predict() (although either works).

One thing that's particular to GBM's predict function is that you need to specify the number of trees to use in the prediction. There is no default value, so you have to specify this manually. For now, we can use the same number of trees that we specified when training the model, though that may not be the optimal number to use.

Another argument that you can specify is called type, which controls the type of output that's returned from the predict function. 

---

# Let's practice!

Notes: Time to put this into practice.