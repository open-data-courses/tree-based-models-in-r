library(rpart)
library(Metrics)

load("data/credit_ch1_train_test.RData")

# Train a gini-based model
credit_model1 <- rpart(formula = default ~ ., 
                       data = ___, 
                       method = "class",
                       parms = list(split = ___))

# Train an information-based model
credit_model2 <- rpart(formula = default ~ ., 
                       data = ___, 
                       method = "class",
                       parms = list(split = ___))

# Generate predictions on the validation set using the gini model
pred1 <- ___(object = ___, 
             newdata = ___,
             type = ___)    

# Generate predictions on the validation set using the information model
pred2 <- ___(object = ___, 
             newdata = ___,
             type = ___)

# Compare classification error
ce(actual = credit_test$default, 
   predicted = ___)
ce(actual = credit_test$default, 
   predicted = ___)  
