# Sample examination question solution.

# The data set iris is loaded by default when you start R. 
# The data set contains the sepal and petal lengths and widths of different species of Iris flowers. 
# Answer the questions below in bold in the answer booklet and create an R script which contains the code used to create each answer.

# (a) Calculate the mean and standard deviation of the petal length for each different species. Which species has the biggest mean? Which has the smallest standard deviation?
aggregate(iris$Petal.Length,by=list(iris$Species),mean)
#Group.1     x
#1     setosa 1.462
#2 versicolor 4.260
#3  virginica 5.552 - biggest mean
aggregate(iris$Petal.Length,by=list(iris$Species),sd)
# Group.1         x
# 1     setosa 0.1736640 - smallest sd
# 2 versicolor 0.4699110
# 3  virginica 0.5518947

# (b) Which observation has the biggest sepal width?
which.max(iris$Sepal.Width) 
# The 16th observation

# (c) Calculate the correlation between the four quantitative variables. Which pair have the weakest correlation? Which pair have the strongest?
cor(iris[,1:4])
# Sepal length and width is weakest at -0.118
# Petal length and width is strongest at 0.963

# (d) Looking in particular at the correlation between sepal length and width, calculate the correlation between these two variables for each species. How does this pattern conflict with the analysis you ran in part (c)?
by(iris[,1:2],iris$Species,cor)
# iris$Species: setosa
# Sepal.Length Sepal.Width
# Sepal.Length    1.0000000   0.7425467
# Sepal.Width     0.7425467   1.0000000
# ------------------------------------------------------------------------------------------------------------------------------- 
#   iris$Species: versicolor
# Sepal.Length Sepal.Width
# Sepal.Length    1.0000000   0.5259107
# Sepal.Width     0.5259107   1.0000000
# ------------------------------------------------------------------------------------------------------------------------------- 
#   iris$Species: virginica
# Sepal.Length Sepal.Width
# Sepal.Length    1.0000000   0.4572278
# Sepal.Width     0.4572278   1.0000000
# All the correlations within species are positive but the overall correlation is negative?!

# (e) Create a plot of sepal length versus sepal width. Make sure to include axis labels and a title. Describe the pattern of the relationship.
plot(iris[,1],iris[,2],xlab='Sepal length',ylab='Sepal Width',main='Scatter plot of sepal length versus sepal width',las=1)
# Seems to be a slight decreasing relationship

# (f) Expand your plot so that each species is a different colour and include a legend. Include suitable command so that repeated points at the same location do not overlap . How does this plot help explain the answers you obtained in parts (c) and (d)?
plot(iris[,1],iris[,2],xlab='Sepal length',ylab='Sepal Width',main='Scatter plot of sepal length versus sepal width',las=1,type='n')
sep.setosa = as.matrix(subset(iris[,1:2],iris$Species=='setosa'))
sep.versicolor = as.matrix(subset(iris[,1:2],iris$Species=='versicolor'))
sep.virginica = as.matrix(subset(iris[,1:2],iris$Species=='virginica'))
points(jitter(sep.setosa),col='red')
points(jitter(sep.versicolor),col='blue')
points(jitter(sep.virginica),col='green')
legend('topright',legend=c('Setosa','Versicolor','Virginica'),col=c('red','blue','green'),pch=1)
# For each species each sepal petal/width pair has positive correlation but when combined together they have negative correlations
# This is Simpson's paradox!



