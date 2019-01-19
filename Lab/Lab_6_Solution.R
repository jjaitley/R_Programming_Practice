
# Lab 6 answers
rm(list=ls())

# 1. Use the function isprime in the package gmp to print out the first 50 
# prime numbers using a for loop, a while loop and a repeat loop
library(gmp)

# for loop version
large <- 1000
num <- 0
for(i in 1:large) {
  if(isprime(i) == 2) {
    print(i)
    num <- num + 1
  }
  if(num == 50) break
}

# Now using a while loop
num <- 1
i <- 1
while(num <= 50) {
   if(isprime(i) == 2) {
      print(i)
      num <- num + 1
   }
   i <- i + 1
}

# Now using a repeat loop
num <- 1 
i <- 1
repeat{
  if(isprime(i) == 2) {
    print(i)
    num <- num + 1
  }
  i <- i + 1
  if(num == 51) break
}
  

# 2. Have a look at the painters data in the MASS library. 
# Use appropriate boolean/if/ifelse statements to answer the following questions: 
library(MASS)

head(painters)
# What's the difference between these two?
painters$Colour>15 | painters$Expression>15
painters$Colour>15 || painters$Expression>15 # This is only the first one

# How many painters have a Colour or Expression score bigger than 15?
sum(painters$Colour>15 | painters$Expression>15) # 18

# How many painters have all scores bigger than 10?
sum(painters$Colour>10 & painters$Expression>10 & painters$Composition>10 & painters$Drawing>10) # 5


# 3. Define an elite painter as one who has a total score greater than 30. 
# Create a new variable using an ifelse statement to discover the number of elite or non-elite painters
totalscore <- apply(painters[,1:4], 1, sum)
elite <- ifelse(totalscore > 30, "elite", "non-elite")
# How many elite painters are there in this data set
sum(elite == "elite") # 46

# 4. Write a recursive function that calculates the double factorial of an odd number 
# see mathworld.wolfram.com/DoubleFactorial for the formula for this.  Include an 
# if statement to turn the argument into an odd number if an even number is mistakenly 
# given as the argument. 
dfact <- function(x) {
  if(x%%2 == 0) x <- x - 1
  if(x == 1) return(x)
  return(x * dfact(x - 2)) 
}
dfact(5)

# 5. Write a recursive function to create the first n Fibonacci numbers
fib <- function(n) {
  if(n == 0) {
    return(0)
  } else if(n == 1) {
    return(1)
  } else {
    return(fib(n - 1) + fib(n - 2))
  }
}
fib(5)
sapply(1:10, fib)

# 6. Change the logistic regression likelihood example to run on mother's weight 
# rather than age. Change it again to see if you can predict painters from 
# school A from their composition, drawing, colour or expression scores.
# This is the model we fitted back in lecture 3 (with very slight changes)
library(MASS)
y <- birthwt$low
x <- birthwt$lwt
# Function to calculate the negative log likelihood
neglikfun <- function(parameters) {
  beta0 <- parameters[1]
  beta1 <- parameters[2]  
  daty0 <- y == 0
  daty1 <- y == 1
  loglikelihood <- sum(log(1 / (1 + exp(-beta0 - beta1 * x[daty1])))) + sum(log(1 - (1 / (1 + exp(-beta0 - beta1 * x[daty0])) ) ) )
  return(-loglikelihood)
}
optim(c(0,0),neglikfun)
# Check with the usual version
mod <- glm(low ~ lwt, family = binomial, data = birthwt)
mod$coefficients

# For painters...
y <- painters$School == "A"
x <- painters$Comp
rbind(optim(c(0, 0), neglikfun)$par, glm(y ~ x, family = binomial)$coef)

x <- painters$Draw
rbind(optim(c(0, 0), neglikfun)$par, glm(y ~ x, family = binomial)$coef)

x <- painters$Colour
rbind(optim(c(0, 0), neglikfun)$par, glm(y ~ x, family = binomial)$coef)

x<- painters$Expression
rbind(optim(c(0, 0), neglikfun)$par, glm(y ~ x, family = binomial)$coef)







