## clear workspace and console ...
rm(list=ls())
cat("\014")

## Question 1: summary statistics of one particular group ...
library(datasets)
data(iris)
?iris
# not an optimal solution ...
mean(iris$Sepal.Length[101:150]) 
# tapply solution, the 3rd group ...
f <- gl(3,50)
tapply(iris$Sepal.Length, f, mean)

## Question 2
apply(iris[, 1:4], 2, mean)

## Question 3
library(datasets)
data(mtcars)
dummy <- dimnames(mtcars);remove(dummy)
tapply(mtcars$mpg, mtcars$cyl, mean)

## Question 4, it is a good question ... 
aver_hp <- tapply(mtcars$hp, mtcars$cyl, mean)
aver_hp["4"]-aver_hp["8"]