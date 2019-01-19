# Lab 5 answers
library(MASS)
# Load in the `quine' data set and see what it contains.
attach(quine)
?quine

# Use a suitable command to look at it
str(quine)

# Use the colnames function to give it some more helpful column names
colnames(quine) <- c('Ethnicity', 'Sex', 'Age', 'LearnerStatus', "DaysAbsent")
# ...and check it's worked
head(quine)

# Use table on the ethnic background variable. 
# What ethnicity is most prevalent in the data set?
table(quine$Ethnicity) # Most are not Aboriginal

# Change the age and the learner variable to be ordered factors. 
# Have a look at the structure then.
quine$Age <- factor(quine$Age,ordered=TRUE)
quine$LearnerStatus <- factor(quine$LearnerStatus, levels = c('SL', "AL"), ordered = TRUE)
str(quine)

# Use table to tabulate the learner ability and the ethnicity
table(quine$Learn, quine$Ethnicity, deparse.level = 2)
# How many children in the study are slow learners? 63
addmargins(table(quine$Learn, quine$Ethnicity, deparse.level = 2))

# Use tapply to calculate the mean and sd of number of days off by ethnicity
tapply(quine$DaysAbsent, quine$Ethnicity, mean) 
tapply(quine$DaysAbsent, quine$Ethnicity, sd)

# Calculate mean and standard deviation of days absent by learner status and sex using aggregate
aggregate(quine$DaysAbsent, list(quine$Learn, quine$Sex), mean)
aggregate(quine$DaysAbsent, list(quine$Learn, quine$Sex), sd)

# Cut days absent into 3 categories and produce a new table - how many scarily absent students?
cut.days <- cut(quine$Days, c(0, 20, 60, 100), labels = c('few', 'medium', 'many'), ordered_result = TRUE, include.lowest = TRUE)
table(cut.days)



rosen <- function(xx)
{
  ##########################################################################
  #
  # INPUT:
  #
  # xx = c(x1, x2, ..., xd)
  #
  ##########################################################################
  
  d <- length(xx)
  xi <- xx[1:(d-1)]
  xnext <- xx[2:d]
  
  sum <- sum(100*(xnext-xi^2)^2 + (xi-1)^2)
  
  y <- sum
  return(y)
}
