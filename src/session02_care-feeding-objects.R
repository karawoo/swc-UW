#########################################
####  Care and feeding of R objects  ####
#########################################

# gdURL <- "http://tiny.cc/gapminder" # link to gapminder data
# gDat <- read.delim(gdURL)

# Basic functions for looking at your data
gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)
head(gDat)
tail(gDat)
names(gDat)
dim(gDat)
nrow(gDat)
ncol(gDat)
head(rownames(gDat))
length(gDat)
summary(gDat)
summary(gDat$lifeExp)
hist(gDat$lifeExp)
levels(gDat$country)
nlevels(gDat$country)
table(gDat$country)

subset(gDat, subset = country %in% c("Cambodia", "Afghanistan"))
subset(gDat, subset = year == 1952, select = c(year, country))


####  Exercise  ####

## Get data for which life expectancy is less than 32 years; assign it to
## an object. How many observations? How many observations per continent?

lowLifeExp <- subset(gDat, subset = lifeExp < 32)
nrow(lowLifeExp) # 12
summary(lowLifeExp$continent)
table(lowLifeExp$continent) # either summary() or table() works

## dplyr version just for fun

library(dplyr)
lowLifeExp_dplyr <- gDat %.% filter(lifeExp < 32)
nrow(lowLifeExp_dplyr)
summary(lowLifeExp_dplyr$continent)

## plot

plot(lifeExp ~ year, gDat)
plot(lifeExp ~ year, gDat, subset = country =="Rwanda")
lm(lifeExp ~ year, gDat, subset = country =="Rwanda")

## numerical summaries

mean(gDat$lifeExp)
with(gDat, mean(lifeExp))
with(subset(gDat, country == "Cambodia"), 
     cor(lifeExp, gdpPercap))

###################
####  Vectors  ####
###################

x  <- 3 * 4
is.vector(x)
length(x)
x[1] # 12
x[2] # NA
x[0] # numeric(0)
x[5] <- 10
x <- 1:4
x ^ 2
round(rnorm(3, mean = c(0, 100, 10000)), 2)


(y <- 1:3)
(z <- 3:7)
y + z
(y  <- 1:5)
(z <- 1:10)
y + z # recycling happens silently



x <- c(1, 4, 9)
x <- c("cabbage", pi, 0.3, TRUE)
str(x) # character vector

x <- list("cabbage", pi, 0.3, TRUE)
str(x)

x <- -3:3
x < 0

####################
####  Indexing  ####
####################

set.seed(1)
(x <- round(rnorm(8), 2))
names(x) <- letters[seq_along(x)]

x[4]
x[c(3, 5, 8)]
x[-7]
x < 0
x[x < 0]
which(x < 0)

####  Exercise  ####

## Get every other element of x
x[which(seq(x) %% 2 == 0)]
x[seq(length(x)) %% 2 == 0]
x[seq(2, length(x), by = 2)]
x[c(FALSE, TRUE)]


# Indexing by name
x[c("a", "e", "g")]


####################
####  Matrices  ####
####################

month.abb
month.name

(x <- cbind(month.abb, month.name))
(x <- rbind(month.abb, month.name))
(x <- matrix(1:10, nrow = 5))

################################
####  Construct data frame  ####
################################

(x <- data.frame(month.num = 1:12, 
                 month.abb, 
                 month.name))

str(x) # our character data has been converted to factors

(x <- data.frame(month.num = 1:12, 
                 I(month.abb),  # I() inhibits coercion to factor
                 I(month.name)))

str(x)

# Square brackets work for indexing multidimensional objects too
x[2, 2]

