#Matrix
my.data<-1:20
my.data
A<-matrix(my.data,4,5)
A
B<-matrix(my.data,4,5,byrow = T)
B
B[2,5]

#rbind
r1<-  1:5
r2<- -1:-5
r3<- rbind(r1,r2)
r3

#cbind
c1<- 1:5
c2<- -1:-5
c3<- cbind(c1,c2)
c3

#colnames and rownames in vector
Charlie<-1:5
Charlie
names(Charlie)=c("a","b","c","d","e")
names(Charlie)=NULL

#colnames and rownames in Marix
temp.vec<- rep(c("a","b","zZ"),each=3)
temp.vec

bravo<-matrix(temp.vec,3,3)
bravo
rownames(bravo)<-c("Ram","Shyam","Gyan")
colnames(bravo)<-c("Hi","Hello","Bye")

Games
Games["LeBronJames","2012"]
rownames(Games)
colnames(Games)

FieldGoals

round(FieldGoals/Games)
round(FieldGoalAttempts/FieldGoals)
Points

#Matplot
?matplot
matplot(t(FieldGoals/FieldGoalAttempts),type="b",pch=15:18,col = c(1:4,6))
legend("bottomleft",inset=0.01,legend = Players,col = c(1:4,6),pch=15:18,horiz = F)

matplot(t(FieldGoals/Games),type="b",pch=15:18,col = c(1:4,6))
legend("bottomleft",inset=0.01,legend = Players,col = c(1:4,6),pch=15:18,horiz = F)

matplot(t(Salary/Points),type="b",pch=15:18,col = c(1:4,6))
legend("bottomleft",inset=0.01,legend = Players,col = c(1:4,6),pch=15:18,horiz = F)

matplot(t(Points/Games),type="b",pch=15:18,col = c(1:4,6))
legend("bottomleft",inset=0.01,legend = Players,col = c(1:4,6),pch=15:18,horiz = F)

matplot(t(Points/MinutesPlayed),type="b",pch=15:18,col = c(1:4,6))
legend("bottomleft",inset=0.01,legend = Players,col = c(1:4,6),pch=15:18,horiz = F)

#Subseting
x<-c("a","b","c","d","e")
x[c(1,5)]# to get 1st and last element in vector
x[1]

Games
Games[1:3,6:10] # Top 3 players in last 5 yrs
Games[c(1,10),] # Compare 1st and last rows based on rows
Games[,c("2008","2009")]
Games[1,,drop=0] # Keeping the matrix property while calling
Games[1,5,drop=0]# 1st row 5th element select in terms of matrix

#Subsetting Visualization
Data<-MinutesPlayed[1:3,]
matplot(t(Data),type="b",pch=15:18,col = c(1:4,6))
legend("bottomleft",inset=0.01,legend = Players[1:3],col = c(1:4,6),pch=15:18,horiz = F)

Data<-MinutesPlayed[1,,drop=0] # Details of only 1 player
matplot(t(Data),type="b",pch=15:18,col = c(1:4,6))
legend("bottomleft",inset=0.01,legend = Players[1],col = c(1:4,6),pch=15:18,horiz = F)

#Creating Functions
myplot<-function(){
   Data<-MinutesPlayed[2,,drop=0] # Details of only 1 player
   matplot(t(Data),type="b",pch=15:18,col = c(1:4,6))
   legend("bottomleft",inset=0.01,legend = Players[2],col = c(1:4,6),pch=15:18,horiz = F)
 }
myplot()

#Creating Functions
myplot<-function(rows){
  Data<-MinutesPlayed[rows,,drop=0] # Details of only 1 player
  matplot(t(Data),type="b",pch=15:18,col = c(1:4,6))
  legend("bottomleft",inset=0.01,legend = Players[rows],col = c(1:4,6),pch=15:18,horiz = F)
}
myplot(1:5)

#Creating Functions
myplot<-function(data,rows){
  Data<-data[rows,,drop=0] # Details of only 1 player
  matplot(t(Data),type="b",pch=15:18,col = c(1:4,6))
  legend("bottomleft",inset=0.01,legend = Players[rows],col = c(1:4,6),pch=15:18,horiz = F)
}
myplot(Salary,1:5)

#Creating Functions with default parameter
myplot<-function(data,rows=1:10){
  Data<-data[rows,,drop=0] # Details of only 1 player
  matplot(t(Data),type="b",pch=15:18,col = c(1:4,6))
  legend("bottomleft",inset=0.01,legend = Players[rows],col = c(1:4,6),pch=15:18,horiz = F)
}
myplot(Salary)
