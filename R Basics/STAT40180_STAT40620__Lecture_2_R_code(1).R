# Code for lecture 2 on vectors, matrices and arrays

# Numeric and character vectors
x <- c(1, 2, 4)
y <- c('cat', 'dog', 'rabbit')

# Use mode to find out what type they are
mode(x)
mode(y)

# Create a matrix and access bits of it
m <- matrix(1:6, nrow = 3, ncol = 2)
m
# First row
m[1,]
# Second and third rows and first column
m[2:3,1]

# Add to a vector using c
x <- c(88, 5, 12, 13)
x
x <- c(x[1:3], 168, x[4])
x

# Delete an element
x <- x[-4]
x

# Declare a vector
y <- vector(length = 2)
y[1] <- 5
y[2] <- 12
y

# Vectorised addition
x <- c(1, 2, 4)
y <- x + c(5,0,-1)

# Some more clever indexing
y <- c(1.2, 3.9, 0.4, 0.12)
y[c(1, 3)]
v <- 3:4
y[v]

# Generating sequences
2:7
seq(from = 12, to = 30, by = 3)
rep(7, 4)

# Using all and any
x <- 1:10
any(x < 8)
all(x < 8)
x < 8

# NA and NULL values
x <- c(88, NA, 12, 168, 13)
x
mean(x)

mean(x, na.rm = TRUE)
x <- c(88, NULL, 12, 168, 13)
mean(x)

# More on NULL
z <- NULL
for(i in 1:5) z <- c(z, i)
z

z <- NA
for(i in 1:5) z <- c(z, i)
z

##################################
# Examples

# Function to find the number of repeated ones of length k
findruns <- function(x, k) {
  n <- length(x)
  runs <- NULL
  for(i in 1:(n - k + 1)) {
    if(all(x[i:(i + k - 1)] == 1)) runs <- c(runs, i)
  }
  return(runs)
}

# Using the function
y <- c(1, 0, 0, 1, 1, 1, 0, 1, 1)
findruns(y,3)
findruns(y,2)
findruns(y,6)

# Predicting discrete valued time series version used in lecture
pred <- function(x,k) {
  n <- length(x)
  k2 <- k/2
  pred <- vector(length = n - k)
  for(i in 1:(n - k)) {
    if(sum(x[i:(i + (k - 1))]) >= k2) pred[i] <- 1 else pred[i] <- 0
  }
  return(mean(abs(pred - x[(k + 1):n])))
}

# Run it
pred(y, 1)
pred(y, 2)
pred(y, 3)

# predb - better way of updating the sum
predb <- function(x,k) {
  n <- length(x)
  k2 <- k/2
  pred <- vector(length = n - k)
  sm <- sum(x[1:k])
  if(sm >= k2) pred[1] <- 1 else pred[1] <- 0
  if(n - k >= 2) {
    for(i in 2:(n - k)) {
      sm <- sm + x[i + k - 1] - x[i-1]
      if(sm >= k2) pred[i] <- 1 else pred[i] <- 0
    }
  }
  return(mean(abs(pred - x[(k + 1):n])))
}

# Run it
predb(y, 1)
predb(y, 2)
predb(y, 3)

# Third version predc - use cumulative sum - cumsum
predc <- function(x,k) {
  n <- length(x)
  k2 <- k/2
  pred <- vector(length = n - k)
  csx <- c(0, cumsum(x))
  for(i in 1:(n - k)) {
    if(csx[i + k] - csx[i] >= k2) pred[i] <- 1 else pred[i] <- 0
  }
  return(mean(abs(pred - x[(k + 1):n])))
}

# Run it
predc(y, 1)
predc(y, 2)
predc(y, 3)

##################################
# Vectorised operations

# Some simple vectorised operations
u <- 1:5
w <- function(x) return(x + 1)
w(u)
sqrt(1:4)

# Vectorisation and recycling
y <- c(12, 5, 13)
y + 3

# Watch out for the warning
c(1, 2, 4) + c(6, 0, 9, 20, 22)

# Filtering
z <- c(5, 2, -3, 8)
w <- z[z^2 > 8]
w
z^2 > 8

# Subset
x <- c(6, 1:3, NA, 12)
x[x > 5]
subset(x, x > 5)

# which
z <- c(5, 2, -3, 8)
which(z^2 > 8)

# Filtering a matrix - using arr.ind 
M <- matrix(1:6, nrow = 3, ncol = 2)
which(M > 4)
which(M > 4,arr.ind=TRUE)

# Using ifelse
x <- 1:10
y <- ifelse(x %% 2 == 0,5,12)
y

##################################
# Matrices

# Creating and indexing
M <- matrix(1:6, nrow = 3, ncol = 2)
M[c(1, 3), 1]

# Use of byrow
M2 <- matrix(1:6, nrow = 3, ncol = 2, byrow = TRUE)

# Matrix addition 
M3 <- matrix(7:12, 3, 2)
M2 + M3

# Matrix operations - matrix multiplication
t(M) %*% M

# Other useful matrix functions
I <- diag(2)
M <- matrix(1:4,2,2)
det(M)
solve(M)
solve(M) %*% M
eigen(M)
# See also chol, svd, qr

# Use of apply
apply(M, 2, mean)
f <- function(x) x / max(x)
apply(M, 1, f)

# Finding shape
length(M)
dim(M)

# Common problems
r <- M[2,]
r
str(M)
str(r)

# Column and row names
M <- matrix(1:6, nrow = 3, ncol = 2)
colnames(M) <- c('a', 'b')
rownames(M) = c('c', 'd', 'e')
M

# Arrays
resting <- matrix(c(36.1, 36.0, 36.3, 68, 65, 85), nrow = 3, ncol = 2)
active <-  matrix(c(36.3, 36.5, 37.3, 98, 112, 135), nrow = 3, ncol = 2)
data <- array(data = c(resting, active), dim = c(3, 2, 2))

# Indexing and finding shape
data[3, 1, 2]
dim(data)

##################################
# Example - image manipulation

# Install the pixmap package
install.packages('pixmap')

# Load the pixmap package
library(pixmap)

# Run it
x <- read.pnm(system.file("pictures/logo.ppm", package = "pixmap"))
y <- as(x, "pixmapGrey")
plot(y)
str(y)

# Manipulate it
y2 <- y
y2@grey <- 1 - y2@grey # Creates a negative
plot(y2)

y3 <- y
y3@grey <- 0.8 * y3@grey # Makes it darker
plot(y3)

y4 <- y
y4@grey[y4@grey<0.8] <- 0 # Makes dark areas black
plot(y4)

# combine all plots in a matrix with 2 rows and 3 columns
par(mfrow = c(2, 3))

plot(x, main = "x: Original")
plot(y, main = "y: Original, black and white")
plot(y2, main = "y2: Negative")
plot(y3, main = "y3: Darker")
plot(y4, main = "y4: Dark areas black")

par(mfrow = c(1, 1)) # reset to default
