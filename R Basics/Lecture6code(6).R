# Simple for loops
for(i in 1:2) print(i)

# Slightly smarter for loop
x <- c(2, 4, 6, 8)
for(i in x) { # for loop over the elements of x
  print(i) # print the current value of i
  print(i^2) # print the current value of i^2
}

# A while and repeat loop to do the same as above

i <- 2 # initialise i = 2
while(i < 10){ # stop if i >= 10
  print(i)
  print(i^2)
  i <- i + 2
}

i <- 2 # initialise i = 2
repeat{ # repeat the code in curly brackets
  print(i)
  print(i^2)
  i <- i + 2
  if(i > 8) break # exit the loop if i > 8
}

# A for loop over matrix objects
u <- matrix(1:6, 3, 2)
v <- matrix(7:12, 3, 2)
for(i in c('u', 'v')) {
  print(i) # print the value of i
  z <- get(i) # get the object with the name given by the current value of i
  print(colMeans(z)) # print the values of the column means
}


# if-else
r <- 3
if(r == 4) {
  x <- 2
  } else { # if( r != 4)
    x <- 3
    y <- 4
  }

# Same if-else statement on a single line - not advised
r <- 4
if(r == 4) x <- 2 else x <- 3; y <- 4

# Arithmetic and boolean operators
x <- 13
y <- 5

# Obvious ones
x + y
x - y
x * y
x / y

# Exponentiation and modular arithmetic
x^y
x %% y

# Integer division
x %/% y

# Boolean variables work fine on scalars
x <- TRUE
y <- FALSE
x & y 
x | y
x && y
x || y

# Now on vectors
a <- c(3, 2, 1)
b <- c(1, 2, 3)
a > 1 & b < 2 # check if: (a[1] > 1 AND b[1] < 2); (a[2] > 1 AND b[2] < 2); (a[3] > 1 AND b[3] < 2)
a > 1 && b < 2 # check only if: a[1] > 1 AND b[1] < 2
a > 1 | b < 2 # check if: (a[1] > 1 OR b[1] < 2); (a[2] > 1 OR b[2] < 2); (a[3] > 1 OR b[3] < 2)
a > 1 || b < 2 # check only if: a[1] > 1 OR b[1] < 2

# TRUE = 1 and FALSE = 0
TRUE + 2
TRUE * 5
(1 < 2) == 1 # same as: TRUE == 1
FALSE * 5

#############################

## Writing and understanding functions

fun1 <- function(x, printx = TRUE, printy = TRUE) {
  y <- x^2
  if(printx) print(x) # if(printx) is the same as if(printx == TRUE) 
  if(printy) print(y) # if(printy) is the same as if(printy == TRUE)
  return(y)
}

# Default run
fun1(5) # by default it prints x and y
answer <- fun1(5) # To store the answer as a value 
answer # show the value returned by fun1

# Change the default
answer <- fun1(5, printx = FALSE, printy = FALSE) # does not print x and y
answer # show the value returned by fun1

# Give the arguments in another order
answer <- fun1(printy = FALSE, x = 7) # does not print y, and the value of x is 7
answer

# No need to give the named arguments if they're in order
answer <- fun1(5, FALSE) # this is the same as fun1(x = 5, printx = FALSE, printy = TRUE)
answer

# Without return - exactly the same

fun1b <- function(x, printx = TRUE, printy = TRUE) {
  y <- x^2
  if(printx) print(x) # if(printx) is the same as if(printx == TRUE) 
  if(printy) print(y) # if(printy) is the same as if(printy == TRUE)
 y
}

answer <- fun1b(5)

fun2 <- function(x, printx = TRUE, printy = TRUE) {
  y <- x^2
  if(printx) print(x)
  if(printy) print(y)
  return(list(input = x, output = y))
}

fun3 <- function(x, printy = TRUE) {
  y <- x^2
  if(printy) print(y)
  invisible(y) # do not print the value returned by the function if that's not assigned to an object
}

fun1(5, FALSE, FALSE) # Prints the answer
fun3(5, FALSE) # No printing
answer <- fun3(5, FALSE) #Still stores it in answer
answer # the value is returned since is saved in 'answer'

# The function function
fun4 <- function(x = 7){
  return(x^2)
}
formals(fun4) # get the arguments of the function fun4
body(fun4) # get the body of the function fun4

# Renaming functions before editing them
abline2 <- abline
page(abline2) # show the function in a "R page"
edit(abline2) # get access to the text editor to edit the function 'abline'

# Giving extra arguments to functions
fun5 <- function(x,...) {
  return(mean(x,...))
}

# If you look at ?mean it has extra arguments trim and na.rm

fun5(c(1:10))
fun5(c(1:10, NA))
fun5(c(1:10, NA), na.rm = TRUE)

#############################
# Environments
# It's a good idea to restart R at this stage using Session menu in Rstudio

# Simple example
w <- 12
f <- function(y) { # create the function f
  d <- 8
  h <- function(){ # create the function h inside the function f
    return(d * (w + y)) # d is passed by the environment of f
                        # w is passed by the global environment
                        # y is passed as an argument of f
  }
  return(h()) # function f returns the value of h()
}
f(2)

# The environment function
environment() # show the current environment
ls() # give the list the objects in the current environment
ls.str() # give the list the objects in the current environment and their structure

# New version with printed environments
f2 <- function(y) {
  d <- 8
  h <- function(){
    return(d * (w + y))
    }
  print(environment())
    print(ls.str())
  return(h())
}

f2(2)

# A (wrong) version where functions are given separately
f <- function(y) {
  d <- 8
  return(h())
}

h <- function() {
  return(d * (w + y))
}

f(2)

# Another wrong version where functions are given separately
f <- function(y) {
  d <- 8
  return(h())
}
# change the order in the multiplication in h
h <- function() {
  return((w + y) * d)
}

f(2)

# A corrected version
f <- function(y) {
  d <- 8
  return(h(d, y))
}
h <- function(dd, yy) {
  return(dd * (w + yy))
}

# Calling ls with an argument
f <- function(y) {
  d <- 8
  return(h(d, y))
}
h <- function(dd, yy) {
  print(ls()) # list the arguments in the current environment
  print(ls(envir = parent.frame(n = 1))) # list the arguments in the environment above
  return(dd * (w + yy))
}

# When h is called from f ls(envir = parent.frame(n = 1)) show the arguments in f
f(2)
# When h is used directly ls(envir = parent.frame(n = 1)) show the arguments in the global environment
h(8, 2)

# Objects can only exist inside functions
d <- 5
f <- function() {
  d <- 8
  return(d)
}
f()
d

# The "<<-" operator
d <- 5
f <- function() {
  d <<- 8
  return(d)
}
f()
d

# The assign function
d <- 5
f <- function() {
  d <- 8
  assign('d', d, pos = .GlobalEnv)
  return(d)
}
f()
d

#############################
# Clever coding

# Function to find factorials
fact <- function(x) {
  if(x == 1) return(x)
  return(x * fact(x - 1))
}
fact(5)

# Quick sort
quicksort <- function(x) {
  if(length(x) <= 1) return(x)
  pivot <- x[1] # take the first value as pivot
  therest <- x[-1] # create a new vector with all values but the pivot
  sv1 <- therest[therest < pivot] # subset of values smaller than the pivot
  sv2 <- therest[therest >= pivot] # subset of values greater than or = the pivot
  sv1 <- quicksort(sv1) # quicksort the values smaller than the pivot
  sv2 <- quicksort(sv2) # quicksort the values greater than or equal the pivot
  return(c(sv1, pivot, sv2))
}
quicksort(c(5, 4, 12, 13, 3, 8, 88))

# Replacement functions
x <- numeric(3)
names(x)
names(x) <- c('a', 'b', 'ab')
names(x)

x <- 'names<-'(x, c('a', 'b', 'ab'))

# Write your own function operator
"%a2b%" <- function(a, b) return(a + 2 * b) 
3 %a2b% 5

# Anonymous functions - from lecture 3
M <- matrix(1:6, nrow = 3, ncol = 2)
f <- function(x) x / max(x)
apply(M, 1, f)

# Alternative with an anonymous function
apply(M, 1, function(x) x / max(x))

#############################
# Extended example - fitting logistic regression models

# This is the model we fitted back in lecture 3 (with very slight changes)
library(MASS)
data(birthwt)

# For a given value of beta0 and beta1, calculate the likelihood
x <- birthwt$age
y <- birthwt$low

# Function to calculate the negative log likelihood

neglikfun <- function(parameters) {
  beta0 <- parameters[1]
  beta1 <- parameters[2]
  # separate data in 0s and 1s
  daty0 <- y == 0
  daty1 <- y == 1
  # calculate the log-likelihood
  loglikelihood <- sum(log(1 / (1 + exp(- beta0 - beta1 * x[daty1])))) + 
    sum(log(1 - (1 / (1 + exp(- beta0 - beta1 * x[daty0])))))
  # return the negative of the log-likelihood
  return(-loglikelihood)
}

# Call the function with example values
neglikfun(c(1, -0.1))

# Now run optim
res <- optim(c(0, 0), neglikfun)
res 

# Check with the usual version
mod <- glm(low ~ age, family = binomial, data = birthwt)
mod$coefficients
logLik(mod) # Function to extract the Log-Likelihood from a "glm" object

# Our results:
res$par
- res$value

