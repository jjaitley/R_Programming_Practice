## Code lecture 4

# Simple factor example 

x <- c(5, 12, 13, 12) 
xf <- factor(x)
xf

str(xf)

# Adding in extra levels

xf2 <- factor(x, levels = c(5, 12, 13, 88))
xf2

xf[2] <- 100
xf

# Use of tapply

weight <- c(205, 331, 175, 117, 272, 251)
diet <- c('Diet_A', 'Diet_B', 'Diet_B', 'Diet_A', 'Diet_C', 'Diet_B')

tapply(weight, diet, mean)

# Use of split

split(weight, diet)

# SC1 

tapply # type the name of the function to see the code


# Use of by with the birthweight data of lecture 3

library(MASS)
by(birthwt, birthwt$race, function(m) glm(m[,1] ~ m[,2], family = binomial)) 
# tapply here would give an error as it works on a vector rather than a data frame.

#########

# Using tables with birthwt

birthwt2 <- data.frame(birthwt$low, birthwt$race)
head(birthwt2)
table(birthwt2)

table(birthwt$low)


# A multi-dimensional table
birthwt3 <- data.frame(birthwt$low, birthwt$race, birthwt$smoke)
table(birthwt3)

# Operations on tables
tab1 <- table(birthwt2)
tab1[1, 2]
tab1 / sum(tab1)
apply(tab1, 1, sum)
addmargins(tab1,FUN = max)
addmargins(tab1,margin=c(1,3))
addmargin(apply(tab1,c(1,2),max))

?table


# Aggregate and cut
aggregate(birthwt$age, list(birthwt$race), mean)
cut(birthwt$bwt, c(0, 2000, 4000, 6000), labels = c('Low', 'Medium', 'High'))

# Working directory
getwd()
setwd('path/to/somewhere')

cut(x,c(-2,0,2),labels=c('low','medium'))
