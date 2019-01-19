j <- list(name = 'Joe', salary = 55000, union = T)
j

j[[2]]
j$salary

j$sales<-c(100,200,300)

j[[5]]<- 'Manager'

length(j$sales)

names(j)
str(j)

unlist(j, use.names = FALSE)
j

?lapply()

lapply(list(1:3,25:29),mean)

sapply(list(1:3,25:29), mean)

a<-list(a = 1, b = 2, c = list(d = 3, e = 4))

list(a = 1, b = matrix(c(1, 2, 3, 4), ncol = 2, nrow = 2))

firstpar <- "It was a bright cold day in April and the clocks were striking thirteen
Winston Smith his chin nuzzled into his breast in an effort to escape the vile wind
slipped quickly through the glass doors of Victory Mansions though not quickly enough
to prevent a swirl of gritty dust from entering along with him"

firstpar

findwords <- function(tf) {
  txt <- unlist(strsplit(tf, ' ')) # Read in the words from the text and separate into a vector
  wl <- list() # Create a list to store the words and their positions
  for(i in 1:length(txt)) { # Loop through each word
    wrd <- txt[i] # Get the current word
    wl[[wrd]] <- c(wl[[wrd]], i) # Add its position to the list with the appropriate tag
  }
  return(wl) # Return the answer as a list
}

head(findwords(firstpar), 4)

kids <- c('Jack', 'Jill')
ages <- c(12, 10)
d <- data.frame(kids, ages)
d

d$kids[2]

str(d)
mode(d)


data(women)
str(women)

head(women)
women[1:2,]

women[women$height>70,]

subset(women, weight < 130)

subset(women, height >70)

women[1,1] <- women[13,2] <- NA
head(women)


women<-women[complete.cases(women),]

str(women)


?cbind
#women5<-(women, letters[1:15])
women2 <- cbind(women, letters[1:13])
rbind(women, c(73, 166))

women4 <- cbind(women, women$height * 2.54, women$weight * 0.45)
women4

#colnames(women4)[which(names(women4) == "women$height * 2.54")] <- "Jatin"

names(women4) <- c('heightin', 'weightlbs', 'heightcm', 'weightkg')

head(women4)

d1 <- data.frame(kids = c('Jack', 'Jill', 'Jillian', 'John'),
                 county = c('Dublin', 'Cork', 'Donegal', 'Kerry'))
d2 <- data.frame(ages = c(10, 7, 12),
                 kids = c('Jill', 'Lillian', 'Jack'))

merge(d1,d2)

?lapply

lapply(d1,sort)

data.frame(lapply(d1, sort))

library(MASS)
help(birthwt)
str(birthwt)

birthwt2 <- birthwt[,-c(4, 10)]

str(birthwt2)

logfun <- function(x) {
  glm(birthwt2$low ~ x, family=binomial)$coef
}

sapply(birthwt2[,-1], logfun)


mod <- glm(birthwt2$low ~ birthwt2$age, family = binomial)$coef
plot(jitter(birthwt2$age), birthwt2$low, col = "red")
points(birthwt2$age, 1 / (1 + exp(-(mod[1] + mod[2] * birthwt2$age))),
       pch = 2, col = "green")

data(esoph)
str(esoph)
help(esoph)

esoph$ncases[15]

esoph$Total<-esoph$ncases + esoph$ncontrols

Total<-esoph[,4:5]

sapply(Total,'mean')
sapply(Total,'sd')
sapply(Total,'IQR')

?sapply

?"|"
str(esoph)
test<-subset(esoph, alcgp=='0-39g/day')

sapply(test,'mean')

mean(test$ncases)

Only_X_Role <- subset(Data,id %in% rownames(xtab)[xtab[,"X"]==0])


#Week4 Graphs
x <- c(1, 2, 3); y <- c(1, 2, 4)
plot(x,y)

plot(x, y,
     xlab = "x", ylab = "y", # specify the x and y-axis labels
     type = "l", # specify the plot type to be a line
     main = "My graph") # specify the main title


plot(c(1, 2, 3), c(1, 2, 3))
plot(c(3, 2, 1), c(1, 2, 3))

plot(x, y, type = "n") # create blank graph
lines(x, y, col = "red", lty = 2, lwd = 3) # add the red line
points(x, y, col = "blue", pch = 17, cex = 2) # add the blue points

#lty-linetype
#lwd- line width

plot(x, y, type = "b", pch = 17)
text(1.5, 2.5, "Text here")
mtext("Margin text", side = 3, line = 1)

colours()

par(bg = "yellow") # yellow background
plot(x, y, type = "n")
lines(x, y, col = "blue") # blue lines
points(x, y, pch = 4, col = "red") # red points


plot(x, y, type = "p", pch = 4, col = "red")
lines(x, y, lty = 2, col = "red" )
legend(1, 4, legend = c("My points", "My lines"), # vector containing the text to appear in the legend
       pch = c(4, -1), lty = c(-1, 2), col = "red")


plot(x, y, type = "b", pch = 4) # same plot of slide 8
text(1.5, 2.5, "Text here", cex = 4)

plot(x, y, type = "b", pch = 4, col = "red", lty = 2, xlim = c(0, 10), ylim = c(-2, 5))

plot(x, y, type = "b", pch = 4, col = "red", lty = 2, xlim = c(10, 0), ylim = c(-2, 5))


plot(x, y, type = "b", pch = 4, col = "red", xaxt = "n")
axis(side = 1, at = seq(1, 3, by = 0.1), labels = TRUE)

par(mar = c(3, 3, 2, 1), mgp = c(2, 0.7, 0), las = 1)

stores <- factor(rep(c("Tesco", "Supervalu", "M&S", "Dunnes Stores"), c(100, 30, 25, 85)))
par(mar = c(3, 7, 1, 1)) # Adjust the margins on the four sides of the plot
barplot(height = table(stores), main = "Stores in Ireland", xlab = "Number of stores",
        col = 1:4, horiz = TRUE, las = 1)


?mgp

x <- birthwt$lwt
y <- birthwt$low
plot(x, y)

par(mar = c(3, 3, 2, 1),mgp = c(2, 0.7, 0),  las = 1)
plot(x, y, type = "n", xaxt = "n", yaxt = "n",
     xlab = "Mother's weight (lbs)", ylab = "Low birth weight (probability)")
title("Risk factors associated with low infant birth weight")
axis(1, at = pretty(x, n = 10))
axis(2, at = pretty(y, n = 10))
grid()
points(jitter(x, amount = 0.5), y, col = "blue", pch = 20)

mod <- glm(y ~ x, family = binomial)
xgrid <- seq(min(x), max(x), by = 1)
ypred <- predict(mod, data.frame(x = xgrid), se.fit = TRUE, type = "response")
lines(xgrid, ypred$fit, col = "red", lwd = 2)

ypred.lower <- ypred$fit - 1.96 * ypred$se.fit
ypred.upper <- ypred$fit + 1.96 * ypred$se.fit
polygon(c(xgrid, rev(xgrid)), c(ypred.lower, rev(ypred.upper)),
        col = newcol, border = NA)

legend("topright", legend = c("Data", "Fitted line", "95% CI"),
       pch = c(20, -1, 15), lty = c(-1, 1, -1), lwd = c(-1, 2, -1),
       col = c("blue", "red", newcol))


demo(graphics)

data(survey)
?survey
str(survey)

plot(survey$Wr.Hnd,survey$NW.Hnd,type = 'n', xlab = "Span of writing hand", ylab = "Span of non-writing hand")
points(survey$Wr.Hnd[survey$Sex=='Male'],survey$NW.Hnd[survey$Sex=='Male'], col='blue',pch = 16)
points(survey$Wr.Hnd[survey$Sex=='Female'],survey$NW.Hnd[survey$Sex=='Female'],col='red' ,pch = 17)


barplot(height = table(stores), main = "Stores in Ireland", xlab = "Number of stores",
        col = 1:4, horiz = FALSE, las = 1)

par(mfrow = c(2, 1)) 
title("Student smoking frequency")
barplot(table(survey$Smoke[survey$Sex=='Male']),col = 1:4, ylab = "Frequency")
barplot(table(survey$Smoke[survey$Sex=='Female']),col = 1:4, ylab = "Frequency")
par(mfrow = c(1,1))

# Use par(mfrow=c(2,1)) to create two bar charts of smoking frequency by sex
par(mfrow = c(2,1))
barplot(table(survey$Smoke[survey$Sex == 'Male']), col = 'blue', main = 'Smoking frquency by sex: Male', ylab = "Frequency")
barplot(table(survey$Smoke[survey$Sex == 'Female']), col = 'red', main = 'Smoking frquency by sex: Female', ylab = "Frequency")
par(mfrow = c(1,1))

# Create a boxplot of height by sex, include a title, gridlines, axis labels,colours and make sure the y-axis is set correctly (using las=1)
boxplot(survey$Pulse ~ survey$Exer, las = 1, main = 'Pulse rate by exercise status', col = c('red', 'blue', 'green'), ylab = 'Pulse (beats per min)', names = c("Frequently", "Some", "None"), xlab = "Exercise status")
grid()


#Week 5
x <- c(5, 12, 13, 12)
xf2 <- factor(x, levels = c(5, 12, 13, 88))
xf2

xf2[2] <- 100
?tapply

weight <- c(205, 331, 175, 117, 272, 251)
diet <- c('Diet_A', 'Diet_B', 'Diet_B', 'Diet_A', 'Diet_C', 'Diet_B')
tapply(weight, diet, mean)

split(weight, diet)

library(MASS)
by(birthwt, birthwt$race, function(m) glm(m[,1] ~ m[,2], family = binomial))

birthwt2 <- data.frame(birthwt$low, birthwt$race)
head(birthwt2)

table(birthwt2)

tab1 <- table(birthwt2)
tab1[1, 2]

tab1 / sum(tab1)

apply(tab1, 1, sum)

?apply

?aggregate

aggregate(birthwt$age, list(birthwt$race), mean)

cut(birthwt$bwt, c(0, 2000, 4000, 6000), labels = c('Low', 'Medium', 'High'),
    ordered_result = TRUE)


library(MASS)
attach(quine)
?quine
str(quine)

colnames(quine)<-c('Ethinicity','SEX','Age','Learnerstatus','Days')
head(quine)

table(quine$Ethinicity)

  
?factor

quine$Age <- factor(quine$Age,ordered=TRUE)

quine$Learnerstatus<-factor(quine$Learnerstatus,levels = c('SL', "AL"), ordered = TRUE)

#Use the table function to compare learner ability and ethnicity in a 2-way table.
#How many children in the study are slow learners? What other tables of interest
#can you create from this data set?

addmargins(table(quine$Ethinicity,quine$Learnerstatus,deparse.level = 2))

# How many children in the study are slow learners? 63
addmargins(table(quine$Learn, quine$Ethinicity, deparse.level = 2))

head(quine)
tapply(quine$Days,quine$Ethinicity,mean)
tapply(quine$Days,quine$Ethinicity,sd)

?aggregate

aggregate(quine$Days,list(quine$Age,quine$SEX),mean)

aggregate(quine$Days,list(quine$Age,quine$SEX),sd)

kk<-cut(quine$Days, c(0, 20, 60, 100), labels = c('few', 'Medium', 'many'),
    ordered_result = TRUE)

addmargins(table(kk))

for(i in 1:2) print(i)

x <- c(2, 4, 6)

i <- 2 # initialise i = 2
repeat{ # repeat the code in curly brackets
  print(i)
  print(i^2)
  i <- i + 2
  if(i > 8) break # exit the loop if i > 8
}

u <- matrix(1:6, 3, 2)
v <- matrix(7:12, 3, 2)

for(i in c('u', 'v')) {
  print(i) # print the value of i
  z <- get(i) # get the object with the name given by the current value of i
  print(colMeans(z)) # print the values of the column means
}


r <- 3
if(r == 4) {
  x <- 2
} else { # if( r != 4)
  x <- 3
  y <- 4
}

a <- c(3, 2, 1)
b <- c(1, 2, 3)
# check if: (a[1] > 1 AND b[1] < 2); (a[2] > 1 AND b[2] < 2); (a[3] > 1 AND b[3] < 2)
a > 1 & b < 2


fun1 <- function(x, printx = TRUE, printy = TRUE) {
  y <- x^2
  if(printx) print(x) # if(printx) is the same as if(printx == TRUE)
  if(printy) print(y) # if(printy) is the same as if(printy == TRUE)
  return(y)
}

answer <- fun1(5)

fun3 <- function(x, printy = TRUE) {
  y <- x^2
  if(printy) print(y)
  invisible(y) # do not print the value returned by the function if that's
  # not assigned to an object
}
fun3(5, FALSE)
answer <- fun3(5, FALSE)
answer


fun4 <- function(x = 7){
  return(x^2)
}
formals(fun4)

abline2 <- abline
page(abline2) # show the function in a "R page"
edit(abline2)


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

"%a2b%" <- function(a, b) return(a + 2 * b)

3 %a2b% 5

M <- matrix(1:6, nrow = 3, ncol = 2)
f <- function(x) x / max(x)
apply(M, 1, f)

z <- matrix(c(1, 5, 6, 2, 3, 2), nrow = 3, ncol = 2)
z

z1 <- z[, 1]
z2 <- z[, 2]
min(z1, z2)

pmin(z1, z2)

D(expression(exp(x^2)), 'x')
exp(x^2) * (2 * x)

x <- seq(-4, 4, length = 100)
plot(x, dnorm(x), type = 'l')


x <- c(5, 13, 12, 5)
sort(x)

order(x)

rank(x)

d <- data.frame(kids = c('Jack', 'Jill', 'Billy'), ages = c(12, 10, 13))

d[order(d$kids),]
d[sort(d$kids),]

x <- 1:5
y <- 4:8

setequal(x, y)

4 %in% y

j <- list(name = 'Joe', salary = 55000, union = TRUE)
class(j) <- 'employee'
j 

print.employee <- function(wkr) {
  cat(wkr$name, '\n')
  cat('salary', wkr$salary, '\n')
  cat('union member', wkr$union, '\n')
}

j
