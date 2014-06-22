## rm(list = ls())

## cache a matrix ...
makeCacheMatrix <- function(x = matrix()) {
    x_inv <- NULL
    set <- function(y) {
        x <<- y
        x_inv <<- NULL
    }
    get <- function() x
    setinv <- function(z) x_inv <<- z
    getinv <- function() x_inv
    list(set = set, get = get, getinv = getinv, setinv = setinv)    
}


## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x) {
    # If inverse exists, get inverse ...
    x_inv <- x$getinv()
    if(!is.null(x_inv)) {
        message("getting cached inverse")
        return(x_inv)
    }
    
    # If inverse not exists, compute and return the inverse
    data <- x$get()
    x_inv <- solve(data)
    x$setinv(x_inv)
    x_inv
}