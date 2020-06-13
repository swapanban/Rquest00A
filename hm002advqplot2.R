getwd()
setwd("/home/swapan/rscripts")
mov <- read.csv("Section6-Homework-Data.csv")

head(mov)
str(mov)
summary(mov)
#-------bar plot ----------------$
library(ggplot2)
ggplot(data=mov, aes(x= Day.of.Week )) + geom_bar()

#data exploration 

#filter data frame
filt1 <- mov$Genre == "action" | mov$Genre == "adventure" | mov$Genre == "animation" | mov$Genre == "comedy" | mov$Genre == "drama" 
filt1
# mov1 <- mov[filt,]

# filter 2
filt2 <- mov$Studio %in% c("Buena Vista Studios","WB", "Fox", "Universal", "Sony", "Paramount Pictures" )
filt2
mov2 <-mov[filt1 & filt2,]
mov2

#---------------data filtering done -------------------------------------#

# plot and aesthetics
p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))
# add geom
# p + geom_boxplot() +
#     geom_jitter()

q <- p + geom_jitter(aes(size=Budget...mill., colour=Studio)) +
  geom_boxplot(alpha=0.7, outlier.colour = NA)  
#since jitter added to boxplot , so only applicable to boxplot area
#get rid of outlier by setting to NA

# non data link
q <- q + 
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")
q

#theme
q <- q +
  theme(
    axis.title.x = element_text(colour="Blue",size=30),
    axis.title.y = element_text(size=30),
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),
    plot.title = element_text(size=40),
    legend.title = element_text(size=20),
    legend.text= element_text(size=20) ,
    text = element_text(family= "Comic Sans MS")
  )
q

#to change the label from Budget...mill.  to Budget $M

q$labels$size <- "Budget $M"
q

#-----------------      end   -------------------------------------#
