#Matrix Practice

M <- matrix(1:6, nrow = 3, ncol = 2)
M

m <- matrix(1:6, nrow = 3, ncol = 2, byrow = TRUE)
m

#Entries can be accessed in a similar way to vectors, e.g
M[1,]

M[c(1, 3), 2]

#Matrix operations
#R handles matrix multiplication via a special operator: %*%

t(M) %*% M
M %*% t(M)

#apply
#apply(m, dimcode, f, fargs)
M
apply(M, 2, mean)   # finds the mean of the of all coloum

f <- function(x) x / max(x)
apply(M, 1, f)
apply(M, 2, f)

#Differences between vectors and matrices
length(M)

#Common problems with matrices
#We can extract a column (or a row) from a matrix via
r2 <- M[2,]  
r2  #r2 is a vector
#The str function (short for structure of matrix) gives:
str(M)
str(r2)

#Naming rows and columns
colnames(M) <- c('a', 'b')
rownames(M) = c('c', 'd', 'e')
M

