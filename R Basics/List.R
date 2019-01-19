
j <- list(name = 'Joe', salary = 55000, union = T)
j$name

j[2]=5

j[['salary']]
j['salary']
j[1:2]

i <- list('Joe', 55000)

i[2]= 6
i
#adding elements
j$sales <- c(10400, 12300, 13700)
# Via Vector Index
j[[5]] <- 'Manager'
j[6]<- 'Jatin'
j[[6]]<- NULL

length(j)
length(j$sales)

# List with functions
lapply(list(1:3, 25:29), median)   # gives output in form of list
sapply(list(1:3, 25:29), median)   # Gives output in form of vector

#Flexible lists
f<-list(a = 1, b = 2, c = list(d = 3, e = 4))
f
f["c"]
f<-list(a = 1, b = matrix(c(1, 2, 3, 4), ncol = 2, nrow = 2))
f[[2]]

typeof(lapply(list(a=1:5,b=6:10),'mean')) 
typeof(apply(simplify2array(list(a=1:5,b=6:10)),2,'mean'))
typeof(as.vector(lapply(list(a=1:5,b=6:10),'mean'),mode='numeric'))



sapply(split(birthwt$age, birthwt$smoke), mean)

