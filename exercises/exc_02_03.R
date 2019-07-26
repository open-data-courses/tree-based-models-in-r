grade <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3022/datasets/grade.csv")

# Look at the data
str(___)

# Set seed and create assignment
set.seed(1)
assignment <- sample(1:3, size = nrow(grade), prob = ___, replace = TRUE)

# Create a train, validation and tests from the original data frame 
grade_train <- grade[assignment == 1, ]    # subset grade to training indices only
grade_valid <- grade[assignment == ___, ]  # subset grade to validation indices only
grade_test <- grade[assignment == ___, ]   # subset grade to test indices only
