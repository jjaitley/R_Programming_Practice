demo(graphics)

x<-c(1,2,3); y<-c(1,2,4)
plot(x,y)
plot(x,y,xlab = "X", ylab = "Y",type="l", main="MY Graph")
#both points and lines
plot(x,y,xlab = "X", ylab = "Y",type="b", main="MY Graph")
#for no plotting point 
plot(x,y,xlab = "X", ylab = "Y",type="n", main="MY Graph")
#points
plot(x,y,xlab = "X", ylab = "Y",type="p", main="MY Graph")

plot(x,y,type="n", main="MY Graph")
lines(x,y, col="red", lty = 2, lwd=3)
points(x,y,col="blue", pch=17, cex=2)


plot(x, y, type = "b", pch = 4)
text(1.5, 2.5, "Text here", pos = 4)

par(bg="yellow")
plot(x,y,type="n", main="MY Graph")
lines(x,y, col="red", lty = 2, lwd=3)
points(x,y,col="blue", pch=17, cex=2)


plot(x, y, type = "p", pch = 4, col = "blue")
lines(x, y, lty = 2, col = "red" )
legend(1, 4, # x, y coordinates for the legend 4
legend = c("My points", "My lines"), # vector containing the text to appear in the legend
pch = c(4, -1), lty = c(-1, 2), col = "red") # graphical param: point type, line type and color

#A useful default command to run at the start of a function to produce plots is:
par(mar = c(3, 3, 2, 1), mgp = c(2, 0.7, 0), las = 1)

#Saving graphs to files
pdf("myfilename.pdf", width = 10, height = 8)
# Plotting commands go here
dev.off()

?rep
?factor
#Bar charts can be used to graph factor-type data
stores <- factor(rep(c("Tesco", "Supervalu", "M&S", "Dunnes Stores"), c(100, 30, 25, 85)))
par(mar = c(3, 3, 3, 3)) # Adjust the margins on the four sides of the plot
barplot(height = table(stores), main = "Stores in Ireland", xlab = "Number of stores",
        col = 1:4, horiz = FALSE, las = 1)

#Histogram are like bar charts but for numeric data.
#They are created by putting the observations into bins 
#(or breaks as R calls them) and then counting
#the number of observations in each bin.
library(MASS)
hist(birthwt$bwt)

hist(birthwt$bwt, breaks = 30, xlab = "Birth weight (grams)",
     main = "Histogram of birth weight", col = "lightblue")

#Density plots
plot(density(birthwt$bwt))

#Improved version:
plot(density(birthwt$bwt), xlab = "Birth weight (grams)",
     main = "Histogram of birth weight", col = "green", lwd = 2)

#Boxplot
#Useful for comparing numeric measurements across different categories
boxplot(birthwt$bwt ~ birthwt$race, ylab = "Birth weight (grams)", xlab = "Race")

boxplot(birthwt$bwt ~ birthwt$race, xaxt = "n", # xaxt = "n" removes the x axis
        main = "Birth weight by race", col = 2:4, ylab = "Birth weight (grams)")
# Add the x axis with new labels:
axis(1, at = 1:3, labels = c("White", "Black", "Other"))

#Multiple panels
par(mfrow = c(2, 2)) # creates a 2 by 2 plotting matrix which is then filled in by row
hist(birthwt$bwt, breaks = 30, xlab = "Birth weight (grams)",
     main = "Histogram of birth weight", col = "lightblue")
plot(density(birthwt$bwt), xlab = "Birth weight (grams)",
     main = "Histogram of birth weight", col = "green", lwd = 2)
boxplot(birthwt$bwt ~ birthwt$race, xaxt = "n", main = "Birth weight by race", col = 2:4)
pie(table(stores))

#3D plots
#Where data are available in three dimensions, we can create contour plots, 
#image plots, or perspective plots,amongst others. 
#Usually these functions require in put as a matrix or as 3 vectors in 
#the form x, y, z

par(mfrow = c(1, 3))
contour(volcano, main = "contour plot")
image(volcano, main = "image plot")
persp(volcano, main = "perspective plot")

filled.contour(volcano,main = "Maunga Whau volcano heights",xlab = "x",ylab = "y")

persp(volcano, theta = 20, phi = 30,
      col = "green3", main = "Maunga Whau",
      expand = 0.25, ltheta = 150, shade = 0.75,
      border = NA, box = FALSE)               
               
               
