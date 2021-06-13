credit <- read.csv("data/credit.csv")

# Total number of rows in the credit data frame
n <- ___

# Number of rows for the training set (80% of the dataset)
n_train <- round(___ * n) 

# Create a vector of indices which is an 80% random sample
set.seed(123)
train_indices <- sample(1:n, ___)

# Subset the credit data frame to training indices only
credit_train <- credit[___, ]  
  
# Exclude the training indices to create the test set
credit_test <- ___[-train_indices, ]  

credit_test