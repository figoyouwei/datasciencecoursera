add2 <- function(x,y) {
    x+y
}

above10 <- function(x) {
    use <- x > 10
    x[use]
}

above <- function(x,n) {
    use <- x > n
    x[use]
}

column_mean <- function(x) {
    nc <- ncol(x)
    means <- numeric(nc)
    for(i in 1:nc) {
        means[i] = mean(x[, i], na.rm=TRUE)
    }
    means
}

f <- function(x) {
    g <- function(y) {
        y + z
    }3
    z <- 4
    x + g(x)
}