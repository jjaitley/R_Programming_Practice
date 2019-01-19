library(ggplot2)

mydata <- read.csv(file.choose())


#install.packages("ggplot2", type = "source")

ggplot(data=mydata[mydata$carat<2.5,],
        aes(x=carat, y=price, colour=clarity)) +
      geom_point(alpha=0.1) + 
      geom_smooth()