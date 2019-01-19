# Task 1 - create a vector of even numbers three different ways
x <- c(2, 4, 6, 8, 10)
x <- vector(length = 5)
x[1] <- 2
x[2] <- 4
x[3] <- 6
x[4] <- 8
x[5] <- 10
x <- seq(2, 10, by = 2)

# Task 2 - add two further elements 12 and 14
x <- c(x, 12, 14)
x <- x[-c(2, 4, 6)]
# Multiply your vector by 2, then add the vector y = 4:3
y <- 4:3
z <- 2 * x + y
# y is recycled so no error here

# Task 3 - write some code to determine if any values are less than 25
any(z < 25)
# TRUE!
# Write some code (using subset) to determine all the values in z that are divisible by 4
subset(z, z %% 4 == 0)
# Find which elements of z are less than 20
t<-which(z < 20)
t<-z[which(z < 20)]
t
# Task 4 - create a matrix from the following command:
M <- matrix(1:16, 4, 4)
# Access the first row
M[1,]
# Access the second column
M[,2]
# Take the second and third row and 4th column
M[2:3, 4]

# Task 5 - What does the following command do?
apply(M, 1, sd) 
# Gives row standard deviations - should be all equal
# What happens when you run again but after setting the bottom right value to be NA
M[4,4] <- NA
M
apply(M, 1, sd) 
# You get an NA in your answer
# Add an extra argument to the apply command to 
apply(M, 1, sd, na.rm=TRUE) 
# Now it works!

# Task 6 - Take the find runs function and change it to look for runs of 0s instead
findruns2 <- function(x, k) {
  n <- length(x)
  runs <- NULL
  for(i in 1:(n - k + 1)) {
    if(all(x[i:(i + k - 1)] != 0)) runs <- c(runs, i)
  }
  return(runs)
}
findruns <- function(x, k) {
  n <- length(x)
  runs <- NULL
  for(i in 1:(n - k + 1)) {
    if(all(x[i:(i + k - 1)] == 1)) runs <- c(runs, i)
  }
  return(runs)
}

y <- c(1, 0, 0, 1, 1, 1, 0, 1, 1)
findruns2(y, 3)
findruns2(y, 2)
findruns2(y, 6)

# Change it again to find runs of any non-zero number
findruns3 <- function(x, k) {
  n <- length(x)
  runs <- NULL
  for(i in 1:(n - k + 1)) {
    if(all(x[i:(i + k - 1)] > 0)) runs <- c(runs, i)
  }
  return(runs)
}
z <- sample(0:2, 100, replace = TRUE) # Creates a random run of 0s 1s and 2s
findruns3(z, 3)
findruns3(z, 2)
findruns3(z, 6)

# Task 7 - Load in the pixmap package and have some more fun manipulating the picture
install.packages('pixmap')
library(pixmap)
x <- read.pnm(system.file("pictures/logo.ppm", package="pixmap"))
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
y4@grey[y4@grey < 0.8] <- 0 # Makes dark areas black
plot(y4)