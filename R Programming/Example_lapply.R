## create a list with indicator a & b
x <- list(a=1:5,b=rnorm(10))

## and "lapply" always returns a list ...
lapply(x,mean)

## use lapply to generate datasets ...
x <- 1:4
lapply(x, runif)

## apply a you-written function ...
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2)) 
lapply(x, function(elt){elt[,1]})