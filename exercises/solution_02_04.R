library(rpart)
library(rpart.plot)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/grade_train_valid_test.RData"))

# Train the model
grade_model <- rpart(formula = final_grade ~ ., 
                     data = grade_train, 
                     method = "anova")

# Look at the model output                      
print(grade_model)

# Plot the tree model
rpart.plot(x = grade_model, yesno = 2, type = 0, extra = 0)