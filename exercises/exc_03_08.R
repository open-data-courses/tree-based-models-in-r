library(ipred)
library(caret)

load("data/credit_ch1_train_test.RData")

# Specify the training configuration
ctrl <- trainControl(method = "cv",     # Cross-validation
                     number = ___,      # 5 folds
                     classProbs = TRUE,                  # For AUC
                     summaryFunction = twoClassSummary)  # For AUC

# Cross validate the credit model using "treebag" method; 
# Track AUC (Area under the ROC curve)
set.seed(1)  # for reproducibility
credit_caret_model <- train(default ~ .,
                            data = ___, 
                            method = "treebag",
                            metric = "ROC",
                            trControl = ___)

# Look at the model object
print(___)

# Inspect the contents of the model list 
names(credit_caret_model)

# Print the CV AUC
credit_caret_model$results[,"ROC"]
