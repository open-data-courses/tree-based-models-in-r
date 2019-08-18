library(rpart)

# load credit_train, credit_test
load("data/credit_ch1_train_test.RData")

# Train the model (to predict 'default')
credit_model <- rpart(formula = ___, 
                      data = ___, 
                      method = "class")

# Look at the model output                      
print(___)
