# Establish a list of possible values for minsplit and maxdepth
minsplit <- seq(1, 4, 1)
maxdepth <- seq(1, 6, 1)

# Create a data frame containing all combinations 
hyper_grid <- expand.grid(minsplit = ___, maxdepth = ___)

# Check out the grid
head(___)

# Print the number of grid combinations
nrow(___)

