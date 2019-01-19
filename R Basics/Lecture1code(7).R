## Code for lecture 1

# Some simple commands - add 2 and 2
2 + 2

# Create 7 random numbers between 0 and 1
runif(7)

# Use of concatenate
x <- c(1, 2, 4)

# Display the content of x
x

# Show that both <- and = are valid to assign a value to a name
z <- 2 + 2
z = 2 + 2

# Access parts of x with square brackets
x[3]
x[2:3]

# Find the sum of x and store it
sum(x)

y <- sum(x)
y

# Add multiple functions together
z <- log(sum(x))
z

# Look at some data sets
data()

Nile
help(Nile)
mean(Nile)
plot(Nile)
hist(Nile)

# Get help
help(sum)
help(mean)
help.search('standard deviation')
?mean
??"standard deviation"

# More useful help-like functions
example(mean)
demo(graphics)

demo()

# Oddcount function
oddcount <- function(x) {
  # Set k to be 0
  k <- 0 
  for(n in x) {
    # %% finds remainder on division
    if(n %% 2 == 1) k <- k + 1 
    }
  return(k)
  }

oddcount(c(1,3,5))
oddcount(c(1,2,3,7,9))

