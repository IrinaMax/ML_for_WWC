library(dplyr)
library(ggplot2)

# Linear Regression
bike <- read.csv('bike.csv')
bike %>% head

# Exploratory data analysis (EDA)
ggplot(bike, aes(temp, count)) + geom_point()
# we better add alpha to see how many point set on the top of each other
ggplot(bike, aes(temp, count)) + geom_point(alpha = 0.3, aes(color=temp))
# and add theme
ggplot(bike, aes(temp, count)) + geom_point(alpha = 0.3, aes(color=temp)) + theme_bw()

bike$datetime <- as.POSIXct(bike$datetime)
pl <- ggplot(bike,aes(datetime, count)) + geom_point(alpha= 0.4, aes(color=temp)) + theme_bw()
pl
pl + scale_color_continuous(low= '#55D8CE', high = '#FF6E2E') + theme_bw()
pl1 <-pl
# Boxplot
cor(bike[,c('temp', 'count')])

ggplot(bike,aes(factor(season), count)) + geom_boxplot(aes(color=factor(season))) +theme_bw()

# feathure engineering

time.stamp <- bike$datetime[4]
format(time.stamp, '%H')

# Let's make colomn wiht hours using sapply
bike$hour <- sapply(bike$datetime, function(x){format(x, "%H") })
bike %>% head
pl <- ggplot(filter(bike, workingday==1), aes(hour, count))
pl + geom_point(aes(color=temp)) 
pl



## help('scale_color_gradientn')
pl <- ggplot(filter(bike, workingday==0), aes(hour, count))  # when it is not working day  as 0

pl <- pl + geom_point(position=position_jitter(w=1, h=0), aes(color=temp), alpha=0.5)
pl <- pl + scale_color_gradientn(colours = heat.colors(7))
 pl <- pl + theme_bw()
pl
# scatterplot
pl1 <- ggplot(filter(bike, workingday==1), aes(hour, count))
#pl1 <- pl1 + geom_point(aes(color=temp)) 
pl1
## help('scale_color_gradientn')
pl1 <- pl1 + geom_point(position = position_jitter(w=1, h=0),aes(color=temp), alpha=0.3)
pl1 <- pl1 + scale_color_gradientn(colours = c('dark blue','blue','light blue','light green','yellow','orange','red'))

pl1 + theme_bw()

# bilding lm() model to predict count based solely on the temp pitchur
temp.model <- lm(count~ temp, bike)
summary(temp.model)
