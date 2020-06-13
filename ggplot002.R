getwd()
setwd("/home/swapan/rscripts")
movies <- read.csv("Movie-Ratings.csv")
movies
head(movies)
colnames(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
str(movies)
summary(movies) #shows Year as numeric but it must be a factor
factor(movies$Year)
movies$Year <- factor(movies$Year)

#-------------------------------------
library(ggplot2)

#add aesthetic and geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) +
    geom_point()
#add colour
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre)) +
  geom_point()

#add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
            colour=Genre, size=BudgetMillions)) +
  geom_point()

#---------------------------------------------
#point
p + geom_point()
#line
p + geom_line()
#multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()

# oevrride aesthetics
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre, size=BudgetMillions))
q + geom_point()
#overriding aesthetics
q + geom_point(aes(size=CriticRating))
q + geom_point(aes(colour=BudgetMillions))
q + geom_point()
#override x and y 
q + geom_point(aes(x=BudgetMillions))

q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")    #override and rename the x axis

p + geom_line() + geom_point()

#reduce line size without aes
p + geom_line(size=1) + geom_point()

#-----------------------------------------

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#add colour
  #1. adding colour using mapping Mapping
r + geom_point(aes(colour=Genre))

  #2. adding colour using setting
r + geom_point(colour="DarkGreen")

#error like below
# this is wrong way:  r + geom_point(aes(colour="DarkGreen"))
#mapping: for size
r + geom_point(aes(size=BudgetMillions))
#setting
r + geom_point(size=10)
#error like below
# this is wrong : r + geom_point(aes(size=10)

#---Histogram chart
library(ggplot2)
s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10)

#add colour to histogram
#this setting is not recommended s + geom_histogram(binwidth=10,aes(fill="Green"))
#rather below mapping is recommended
s + geom_histogram(binwidth=10,aes(fill=Genre))
#add border by setting
s + geom_histogram(binwidth=10,aes(fill=Genre),colour="Black") #colour means outline here

#density chart
s+geom_density(aes(fill=Genre))
s+geom_density(aes(fill=Genre),position="stack")

#-------------starting layer ---------------------

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10,
                   fill="White", colour="Blue")

#another way 
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10,aes(x=AudienceRating),
                   fill="White", colour="Blue")

t + geom_histogram(binwidth=10,aes(x=CriticRating),
                 fill="White", colour="Blue")

#below is also possible
t <- ggplot()
t + geom_histogram(data=movies,binwidth=10,aes(x=AudienceRating),
                   fill="White", colour="Blue")

#-----------------statistical transformation---------------
# ?geom_smooth
u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots

u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
# using jitter
u + geom_boxplot(size=1.2) + geom_jitter() 
#alpha =1 is opaque . 0 is transparent
u + geom_jitter()+ geom_boxplot(size=1.2, alpha=.5)

#---------Using Facets----------------------------
v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre),
             colour="Black")

#facets
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   colour="Black") +
facet_grid(Genre~., scales="free")

#facets to scatterplot
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
w + geom_point(size=3)
#facets
w + geom_point(size=3) +
  facet_grid(Genre~.)
w + geom_point(size=3) +
  facet_grid(.~Year)

w + geom_point(size=3) +
  geom_smooth() +
  facet_grid(Genre~Year) 

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) 

#-------------  Co-ordinates ----------------#
# ---limits and zoom---------
#an example how to zoom 
m <-ggplot(data=movies, aes(CriticRating, y=AudienceRating,
                            size=BudgetMillions,
                            colour=Genre))
m + geom_point()
# to visualize  only the top quadrant from x=50 to 100, and y=50 to 100
m + geom_point() +
   xlim(50,100) +
  ylim(50,100)
#it wont work well always like below , eg
n <-ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10,
                   aes(fill=Genre),colour="black" )

n + geom_histogram(binwidth = 10,
                   aes(fill=Genre),colour="black" ) +
      ylim(0,50)

#insteads using cooridnates not to truncate the data
n + geom_histogram(binwidth = 10,
                   aes(fill=Genre),colour="black" ) +
  coord_cartesian(ylim=c(0,50))

# use the above corodinate to the facet graph we have done before

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))

#---------adding theme -----------------------#

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black" )

#add axes label
h +
  xlab("Money Axis") +
  ylab("Number of movies")

#label formatting
h +
  xlab("Money Axis") +
  ylab("Number of movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="DarkRed", size=30 ))
#tick mark formatting
h +
  xlab("Money Axis") +
  ylab("Number of movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="DarkRed", size=30 ) ,
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20))

?theme
#legend formatting and legend position
h +
  xlab("Money Axis") +
  ylab("Number of movies") +
ggtitle("Movie Budget Distribution") +  #title of the plot
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="DarkRed", size=30 ) ,
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20),
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(colour="DarkBlue",
                                  size=40,
                                  family="Courier"))




































