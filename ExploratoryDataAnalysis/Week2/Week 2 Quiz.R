## clear workspace and console
rm(list=ls())
cat("\014")

## Question 2
library(nlme)
library("lattice")
g <- xyplot(weight ~ Time | Diet, BodyWeight)

## Question 4
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data=airquality)
print(p)

## Question 7
library(ggplot2)
# qplot(Wind, Ozone, data=airquality, facets = .~factor(Month))
airquality <- transform(airquality, Month=factor(Month))
qplot(Wind, Ozone, data=airquality) + geom_smooth()

## Question 10
