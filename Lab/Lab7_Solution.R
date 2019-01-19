# Lab 7 answers


# Use R to calculate the differentiate the following functions by x:
# x^2 sin(x)
D(expression(sin(x) * x^2), 'x')
# a^x
D(expression(a^x), 'x')
# x + sin(x) - log(x)*exp(x) + 7
D(expression(x + sin(x) - log(x) * exp(x) + 7), 'x')

# Create some plots of the curves and their derivatives over the range x = 0 to 10
par(mfrow = c(2, 1))
curve(sin(x) * x^2, from = 0, to = 10)
curve(eval(D(expression(sin(x) * x^2), 'x')), from = 0, to = 10)

a <- 0.5
curve(a^x, from = 0, to = 10)
curve(eval(D(expression(a^x), 'x'), list(a = 0.5)), from = 0, to = 10)

curve(x + sin(x) - log(x)*exp(x) + 7, from = 0, to = 10)
curve(eval(D(expression(x + sin(x) - log(x) * exp(x) + 7), 'x')), from = 0, to = 10)
par(mfrow=c(1,1))

# Use the integrate function to check the values of qnorm, qt, etc

# Integrate dnorm to find P(X<=2) when X ~ N(0,1)
integrate(function(x) dnorm(x, 0, 1), -Inf, 2) # 0.977

# Integrate dt to find P(X>-1) when X ~ t_5
1 - integrate(function(x) dt(x, df = 5), -Inf, -1)$value # 0.818

# Take the birth weight example and sort by age
library(MASS)
head(birthwt)

# What were the mother's weights (variable lwt) for the youngest 3 mothers
o <- order(birthwt$age)
head(birthwt[o,]) # 135, 101 and 100 pounds

# What age was the mother of the heaviest child?
o2 <- order(birthwt$bwt)
tail(birthwt[o2,]) # 45

# Solve the following set of simultaneous equations using solve
# 2x1 + x2 - x3 = 7
# x2 - 2x3 = -9
# x1 + 3x2 + 2x3 = 11
A <- matrix(c(2, 0, 1, 1, 1, 3, -1, -2, 2), ncol = 3, nrow = 3)
B <- matrix(c(7, -9, 11), ncol = 1)
solve(A,B) # 6, -1, 4


# Use sweep to subtract the median and divide by the IQR for the variables age, lwt and bwt in birthwt
vars <- cbind(birthwt$age,birthwt$lwt,birthwt$bwt)
median.vars <- apply(vars, 2, 'median')
median.IQR <- apply(vars, 2, 'IQR')
ans <- sweep(sweep(vars, 2, median.vars, '-'), 2, median.IQR, '/')

# Should get
#> apply(ans, 2, 'median')
#[1] 0 0 0
#> apply(ans, 2, 'IQR')
#[1] 1 1 1

# Compute a linear regression of birthwt (bwt) on age, smoke, and lwt. Which variables are important?
mod <- lm(bwt ~ age + smoke + lwt, data = birthwt)
summary(mod) # smoke and lwt important
