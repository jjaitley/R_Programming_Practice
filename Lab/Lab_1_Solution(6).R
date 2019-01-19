# Lab 1 answers

# Here's the old oddcount function
oddcount <- function(x) {
  # Set k to be 0
  k <- 0 
  for(n in x) {
    # %% finds remainder on division
    if(n %% 2 == 1) k <- k + 1 
  }
  return(k)
}
oddcount(c(1, 3, 5))
oddcount(c(1, 2, 3, 7, 9))

# Let's change it to even count
evencount <- function(x) {
  # Set k to be 0
  k <- 0 
  for(n in x) {
    # %% finds remainder on division
    if(n %% 2 == 0) k <- k + 1 
  }
  return(k)
}
evencount(c(1, 3, 5))
evencount(c(1, 2, 3, 7, 9))

# Now let's write it to find the number of prime numbers
primecount <- function(x) {
  # Set k to be 0
  k <- 0
  for(n in x) {
    if(n > 1) {
      curr_seq <- 2:(n - 1)
      # %% finds remainder on division
      # the symbol | is the logical `or' operator in R
      if(n == 2 | all(n %% curr_seq != 0)) k <- k + 1
    }
  }
  return(k)
}
primecount(c(3, 5))
primecount(c(2, 3, 4, 7, 9))

# Does it work for this???
primecount(2^13 - 1)

# Here's a cheats way of doing it
# check the R file to see what isprime does.
install.packages('gmp')
library(gmp)
isprime(c(3:10))
isprime
