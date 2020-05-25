f <- function(vector=1:3){
  
  vector * 5
}
f()
f() + f(c(1,1,1))

##################### Data frame ###############
# select file manually
?read.csv()
stats <- read.csv(file.choose())
stats

# set WD and read data from there
getwd()
#setwd()
setwd("/home/swapan/rscripts")
rm(stats)
stats <-read.csv("P2-Demographic-Data.csv")
stats

nrow(stats)
ncol(stats)
head(stats)
head(stats,n=10)
tail(stats)
tail(stats,n=8)
str(stats)
summary(stats)

stats$Internet.users[2]
levels(stats$Income.Group)

#*************operations in DF**********
stats[1:10,]  #subsetting
stats[c(4),]
stats[c(4,100),]  #4th row and 100th row 
stats[1,]
is.data.frame(stats[1,])

stats[,1]
is.data.frame(stats[,1])
stats[,1,drop=F]
is.data.frame(stats[,1,drop=F])

stats$Birth.rate * stats$Internet.users  #multiplication of columns

#add remove a column to the data frame
head(stats)
stats$mycalc <- stats$Birth.rate * stats$Internet.users #new column mycalc added
stats$xyz <- 1:5 #new column xyz added

stats$mycalc <- NULL #removing column mycalc
stats$xyz <-NULL  # removing column xyz

#*************  filtering data frames **************
head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40, ]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2, ]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)

stats[stats$Country.Name == "Malta",]


#-------------qplot() -----------------
#?qplot
#install.packages("ggplot2")
library(ggplot2)
?qplot
qplot(data=stats,x=Internet.users)
qplot(data=stats,x=Income.Group, y=Birth.rate, size=I(3))
qplot(data=stats,x=Income.Group, y=Birth.rate, size=I(3),colour=I("blue"))
qplot(data=stats,x=Income.Group, y=Birth.rate, geom="boxplot")

#----------------------visualizing data -----------------
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate,
      color=I("red"),size=I(4))

qplot(data=stats, x=Internet.users, y=Birth.rate,
      color=Income.Group,size=I(5))

#*********************************









