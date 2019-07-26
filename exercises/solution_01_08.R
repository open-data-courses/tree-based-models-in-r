library(rpart)

# load credit_train, credit_test
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch1_train_test.RData"))

# Train the model (to predict 'default')
credit_model <- rpart(formula = default ~ ., 
                      data = credit_train, 
                      method = "class")

# Look at the model output                      
print(credit_model)