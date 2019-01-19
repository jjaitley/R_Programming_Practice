getwd()
setwd("C:/Users/Jatin/Documents/R Workspace")
stats<-read.csv("DemographicData.csv")

#-------Exploring Data------
stats
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
head(stats,n=10)
str(stats)
summary(stats)
#---------------------------

#------Using the $ Sign-----
head(stats)
stats[3,3]
stats[3,"Birth.rate"]
stats$Internet.users
stats$Internet.users[2]
stats[,"Internet.users"]
levels(stats$Income.Group)
#----------------------------

#------Basic Operations with Dataframes----#
stats[1:10,]
stats[c(4,100),]
stats[1,]
is.data.frame(stats[1,])
stats[,1]
is.data.frame(stats[,1])
stats[,1,drop=F]
is.data.frame(stats[,2,drop=F])

#------Multiply Columns in DS-----
stats$Birth.rate * stats$Internet.users
#---------------------------------

#------Add a Column in DS------
stats$mycol<-stats$Birth.rate * stats$Internet.users
head(stats)
#------Test Knowledge------
stats$xyz<-1:5# Will work it gets recycled coz it is multopile of stats(195rec)
head(stats)
stats$xyz<-1:4
#--------------------------

#-----Remove a Column from Dataframe
stats$mycol<-NULL
head(stats)
stats$xyz<- NULL
head(stats)
myDf <- stats[is.na(stats$Assault) | is.na(stats$Intentional.homicide) | is.na(stats$Robbery)
              |is.na(stats$Theft)| is.na(stats$Sex.crime), ]
# Check output
myDf
#-----Filtering Datafames-----
head(stats)
filter<-stats$Internet.users < 2
stats[filter,]

stats[stats$Internet.users < 2,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group =="High income",]
stats[stats$Country.Name =="Malta",]

crime_IRL<-stats[stats$X =="Ireland",]

stats[,2,drop=F]
max_crime_IRL<-stats[stats$X =="Ireland",2:6]
colnames(max_crime_IRL)[apply(max_crime_IRL,1,which.max)]
max_crime_IRL[order(max_crime_IRL),]

max_crime_IRL[order(max_crime_IRL),]

colnames(max_crime_IRL)[order(max_crime_IRL[,1:3])]

stats$Total.crime<-stats$Assault+stats$Intentional.homicide+stats$Robbery+stats$Theft+stats$Sex.crime

max(stats$Total.crime)

ranks<-order(stats$Total.crime, decreasing = TRUE)

colnames(max_crime_IRL)[apply(max_crime_IRL,1,which.max)]

?order()

countryname<-stats[ranks,]


stats[ranks,]


head(jj)

print(jj[1,1])

countryname[1,1]

dim(countryname)

jj[1,"X"]


colnames(stats)[which.max(q),]


?max
?lapply()

apply(stats$Total.crime,2,which.max)
lapply(stats$Total.crime,max)

which(stats$Total.crime=max(colname2))

#------Introduction To qplot()-----
library(ggplot2)
?qplot
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3),
      colour=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom = "boxplot")

#------Visualizing what we need---
qplot(data=stats, x=Internet.users, y=Birth.rate, colour=Income.Group
      ,size=I(3))
qplot(data=stats, x=X, y=Assault,colour=Assault
      ,size=I(3),shape=I(17),alpha=I(0.7),main ="Assault Vs Countries")
qplot(data=stats, x=Total.crime, y=Sex.crime,colour=X
      ,size=I(3),shape=I(17),alpha=I(0.7),main ="Total crime Vs Sex.crimes")
#----------------------------------------

#-----Creating Dataframes-------
mydf<-data.frame(Countries_2012_Dataset,Codes_2012_Dataset,
                 Regions_2012_Dataset)
head(mydf)
colnames(mydf)<-c("Country","Code","Region")
rm(mydf)

mydf<-data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,
                 Region=Regions_2012_Dataset)
#-----------------------------------------
#-------Merging Dataframes------
head(stats)
head(mydf)

merged<-merge(stats,mydf,by.x="Country.Code",by.y="Code")
head(merged)
merged$Country<-NULL
str(merged)
tail(merged)

#------Visualizing the merge---
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region
      ,size=I(3))
#1--Shapes
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region
      ,size=I(3),shape=I(17))
#2--Trasperency
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region
      ,size=I(3),shape=I(17),alpha=I(0.7))
#3--Title
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region
      ,size=I(3),shape=I(17),alpha=I(0.7),main ="Birth Rate Vs Internet Users")
#----------------------------------------

#---Class Work--------
#Creating DF---

kids <- c('Jack', 'Jill')
ages <- c(12, 10)

d<-data.frame(kids,ages)
#R treats data frames as lists
mode(d)
#Accessing Dataframes
d[[2]]
d$kids[1]
str(d)
#Extracting Information from DF
data(women)
str(women)
head(women)
women[1:2,]
women[women$height>70,]
subset(women,height>70) #automatically removes NA values

women[1,1] <- women[13,2] <- NA
women
#complete.cases remove anyrows which have NAs in them
women[complete.cases(women),] 
#---cbind & rbind
women2 <- cbind(women, letters[1:15])
women3 <- rbind(women, c(73, 166))
women4 <- cbind(women, women$height * 2.54, women$weight * 0.45)
names(women4) <- c('heightin', 'weightlbs', 'heightcm', 'weightkg')

#----A neat way
women$heightcm <- women$height * 2.54

#----Linear Regression----
library(MASS)
help(birthwt)
str(birthwt)
birthwt2 <- birthwt[,-c(4, 10)]
str(iris)

by(birthwt$age, birthwt$smoke,mean)
tapply(birthwt$age, birthwt$smoke,mean)
mean(birthwt$age[birthwt$smoke])
sapply(split(birthwt$age, birthwt$smoke), mean)
?mean
?complete.cases
?tapply

library(height)
tapply(height,sex,max)

f=factor(sample(1:5,100,replace=T))

mean(as.numeric(levels(f)[f]))
mean(f)
mean(as.numeric(f))


apply(f,1,mean)
?file.access()
nrow(x)
x=list(letters=c('a','b','c'),numbers=c(1,2))
x[[2]]
x$letters[2:3]
x[1]
x@numbers

