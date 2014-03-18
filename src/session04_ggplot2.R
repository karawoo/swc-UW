###########################################
####  Data visualization with ggplot2  ####
###########################################

# Two main goals for statistical graphics:
# * to facilitate comparisons
# * to identify trends

library(ggplot2)
gDat  <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

#### Plot life expectancy by per capita GDP  ####
p <- ggplot(gDat, aes(x = gdpPercap, y = lifeExp))
p + geom_point() # looks like this needs a log transformation
p + geom_point() + scale_x_log10()
p <- p + scale_x_log10() # include the log transformation in p

# some various options for viewing this plot
p + geom_point()
p + geom_point(aes(color = continent)) # color points according to continent
p + geom_point(alpha = 1/2, size = 3) # change transparency, size of dots
p + geom_point(alpha = 1/2, size = 3) + 
  geom_smooth(lwd = 3, se = FALSE) # loess smoothing
p + geom_point(alpha = 1/2, size = 3) + 
  geom_smooth(lwd = 3, se = FALSE, method = "lm") # linear regression


####  Plot life expectancy by continent  ####
ggplot(gDat, aes(x = continent, y = lifeExp)) + geom_point()
ggplot(gDat, aes(x = continent, y = lifeExp)) + geom_jitter()
ggplot(gDat, aes(x = continent, y = lifeExp)) + 
  geom_jitter(position = position_jitter(width = 0.1), alpha = 1/4)
ggplot(gDat, aes(x = continent, y = lifeExp)) + geom_boxplot()
ggplot(gDat, aes(x = continent, y = lifeExp)) + 
  geom_boxplot() +
  geom_jitter(position = position_jitter(width = 0.1), alpha = 1/4)


####  Plotting a single quantitative variable  ####
ggplot(gDat, aes(x = lifeExp)) + geom_histogram()
ggplot(gDat, aes(x = lifeExp)) + geom_density()

ggplot(gDat, aes(x = lifeExp, fill = continent)) + geom_histogram()

ggplot(gDat, aes(x = lifeExp, fill = continent)) + geom_density(alpha = 0.2)


####  Factor  ####
table(gDat$continent)
ggplot(gDat, aes(x = continent)) + geom_bar()
ggplot(gDat, aes(x = continent)) + geom_bar() + coord_flip()


####  Facetting  ####
summary(p)
p + geom_point()
p + geom_point() + facet_wrap(~ continent)
p + geom_point() + facet_wrap(~ continent) +
  geom_smooth(lwd = 2, se = FALSE)




