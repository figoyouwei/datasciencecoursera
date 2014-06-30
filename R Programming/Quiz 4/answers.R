## clear workspace and console ...
rm(list=ls())
cat("\014")

## Question 1: 
set.seed(1)
rpois(5, 2)

## Question 8:
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
