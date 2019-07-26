library(randomForest)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/credit_ch4_ex3_model.RData"))

# Grab OOB error matrix & take a look
err <- credit_model$err.rate
head(err)

# Look at final OOB error rate (last row in err matrix)
oob_err <- err[___, "OOB"]
print(oob_err)

# Plot the model trained in the previous exercise
plot(___)
