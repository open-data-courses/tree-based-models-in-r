library(rpart)
library(rpart.plot)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/grade_ex4_model.RData"))

# Plot the "CP Table"
plotcp(grade_model)

# Print the "CP Table"
print(grade_model$cptable)

# Retrieve optimal cp value based on cross-validated error
opt_index <- which.min(grade_model$cptable[, "xerror"])
cp_opt <- grade_model$cptable[___, "CP"]

# Prune the model (to optimized cp value)
grade_model_opt <- prune(tree = ___, 
                         cp = ___)
                          
# Plot the optimized model
rpart.plot(x = ___, yesno = 2, type = 0, extra = 0)
