library(ipred)
library(caret)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch1_train_test.RData"))
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch3_ex3_model.RData"))

# Generate predicted classes using the model object
class_prediction <- predict(object = ___,    
                            newdata = ___,  
                            type = "class")  # return classification labels

# Print the predicted classes
print(___)

# Calculate the confusion matrix for the test set
confusionMatrix(data = ___,       
                reference = ___)  
