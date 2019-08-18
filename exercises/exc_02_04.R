library(rpart)
library(rpart.plot)

load("data/grade_train_valid_test.RData")

# Train the model
grade_model <- rpart(formula = final_grade ~ ., 
                     data = ___, 
                     method = "anova")

# Look at the model output                      
print(___)

# Plot the tree model
rpart.plot(x = ___, yesno = 2, type = 0, extra = 0)
