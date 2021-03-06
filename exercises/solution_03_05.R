library(ipred)
library(caret)

load("data/credit_ch1_train_test.RData")
load("data/credit_ch3_ex3_model.RData")

# Generate predicted classes using the model object
class_prediction <- predict(object = credit_model, 
                            newdata = credit_test,  
                            type = "class")         # return classification labels
# Print the predicted classes
print(class_prediction)
                            
# Calculate the confusion matrix for the test set
confusionMatrix(data = class_prediction,         
                reference = credit_test$default)  