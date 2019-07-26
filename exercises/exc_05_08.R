library(gbm)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch5_ex3_model.RData"))
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch5_train_test.RData"))

# Save credit_ch5_ex8_ntrees.RData
#save(ntree_opt_oob, ntree_opt_cv, file = "credit_ch5_ex8_ntrees.RData")

# Optimal ntree estimate based on OOB
ntree_opt_oob <- gbm.perf(object = ___, 
                          method = ___, 
                          oobag.curve = TRUE)

# Train a CV GBM model
set.seed(1)
credit_model_cv <- gbm(formula = default ~ ., 
                       distribution = "bernoulli", 
                       data = credit_train,
                       n.trees = 10000,
                       cv.folds = 2)

# Optimal ntree estimate based on CV
ntree_opt_cv <- gbm.perf(object = ___, 
                         method = ___)
 
# Compare the estimates                         
print(paste0("Optimal n.trees (OOB Estimate): ", ntree_opt_oob))                         
print(paste0("Optimal n.trees (CV Estimate): ", ntree_opt_cv))
