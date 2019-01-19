# Lab 8 answers

# Familiarise yourself with the Old Faithful geyser data
?faithful
head(faithful)

# 1 Produce a density plot of the eruptions lengths with the function density (see lecture 5 for instructions)
# What command did you use?
plot(density(faithful$eruptions))

# Create an object z which stores the output of the density function. What class is it?
z <- density(faithful$eruptions)
class(z) # class density

# 2 Use the methods function to find which methods are available for class density (hint: use the second argument of methods only)
methods(class = 'density')
# Which methods are available for objects of class density?
# [1] plot.density  print.density YES
# summary.density predict.density NO

# 3 Use unclass on your object z. How many tags are there in the resulting list?
length(unclass(z)) # 7

# 4 Included in the object z are elements are a grid x containing the eruption lengths and a vector y of the same length containing the estimated probability density. Write a summary method which outputs the x and y parts of the list in a 2-column matrix, as well as outputting the modal value. What is the modal eruption time (to 3 d.p.) for the old faithful data?
summary.density <- function(obj) {
  cat('The first column are the x values and the second the y values: \n')
  print(cbind(obj$x, obj$y))
  cat('The modal x value is: \n')
  print(obj$x[which.max(obj$y)])
}
summary(z) # 4.369

# 5 In the boot package there is a data set called motor which details the head acceleration of a motorcyclist after an accident. The first two columns of motor are the time and acceleration. You can ignore the third and fourth column. Create a plot of time (x-axis) against acceleration (y-axis). Use the lm function to fit a cubic regression model (hint: use lm(y ~ x + I(x^2) + I(x^3))) and plot the fitted line
library(boot)
data(motor)
plot(motor$times,motor$accel)
mod <- lm(motor$accel ~ motor$times + I(motor$times^2) + I(motor$times^3))
lines(motor$times,mod$fitted.values,col='red')
# How would you describe the fit? 
# Good or Poor? POOR!

# 6 Use the polyfit functions created in lecture 8 on the motorcycle acceleration data. Which degree fits best? Create a plot of the fitted line for this final model
lv_one_out <- function(y, xmat) { # xmat matrix containing x, x^2,..., x^p
  n <- length(y) # number of observations
  predy <- vector(length = n) # initilise the vector of the predicted y
  for(i in 1:n) {
    lmo <- lm(y[-i] ~ xmat[-i,,drop = FALSE]) # apply the regression to all the observation but i
    betahat <- as.vector(lmo$coef) # store the coefficients in the vector beta
    predy[i] <- betahat %*% c(1, xmat[i,]) # predict y_i
}
  return(predy)
}

polyfit <- function(y, x, maxdeg) {
  n <- length(y)
  # create Xmat matrix containing x, x^2,..., x^maxdeg
  Xmat <- sweep(matrix(rep(x, maxdeg), nrow = n, ncol = maxdeg), 2, 1:maxdeg, '^')
  # create a list of class polyreg that will contain the output
  lmout <- list()
  class(lmout) <- 'polyreg'
  # fit different polynomial regressions, from degree 1 (linear regression) to degree maxdegree
  for(i in 1:maxdeg) { 
    lmo <- lm(y ~ Xmat[, 1:i, drop = FALSE])
    # add the results of the cross validation in a new tab of lmo
    lmo$cv.fitted.values <- lv_one_out(y, Xmat[, 1:i, drop = FALSE])
    lmout[[i]] <- lmo # store the results of this regression in a tab of lmout
  }
  # store also the data in the output
  lmout$x <- x
  lmout$y <- y
  return(lmout)
}

summary.polyreg <- function(lmo.obj) {
    maxdeg <- length(lmo.obj) - 2 # lmo.obj contains the outputs and x and y 
    n <- length(lmo.obj$y) 
    tbl <- matrix(nrow = maxdeg, ncol = 1) # table for the summary
    colnames(tbl) <- 'MSPE'
    for(i in 1:maxdeg) {
      curr.obj <- lmo.obj[[i]]
      errs <- lmo.obj$y - curr.obj$cv.fitted.values # absolute error in predicting y
      spe <- crossprod(errs, errs) # sum of squares of the vector errs
      tbl[i, 1] <- spe / n
    }
    cat('Mean squared predictions errors, by degree \n')
    print(tbl)
}

x <- motor$times
y <- motor$accel
maxdeg <- 10
lmo <- polyfit(y, x, maxdeg)
summary(lmo) # Degree 8 seems best for me
plot(x, y)
lines(x, lmo[[8]]$fitted.values, col = 'red') # Much better, but still not great at the start




