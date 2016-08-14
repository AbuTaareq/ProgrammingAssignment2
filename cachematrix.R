## Put comments here that give an overall description of what your
## functions do

## Objective 
## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than computing it repeatedly.
## The following pair of functions that cache the inverse of a matrix.

## Following function cache the matrix.
## 1. Initiate a null variable m
## 2. Create set function to assign new value
## 3. Get the matrix argument
makeCacheMatrix <- function(x = matrix()) {

        ## Initiate variable with null.
        m <- NULL
        
        # Create set function 
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        
        ## Get matrix argument
        get <- function() x
    
        ## Set the inverse
        setinverse <- function(inverse) m <<- inverse
        
        ## Get the inverse
        getinverse <- function() m 
        
        ## List inverse
        list (  set = set, 
                get = get,          
                setinverse = setinverse,
                getinverse = setinverse)
}


## The following function inverse the special "vector" created with the above function. 
cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        
        ## Check to see if the inverse has already done.
        if(!is.null(m)) {
                ## If so, Get the inverse from the cache
                message("getting inversed data")
                return(m)
        }
        data <- x$get()
        m <- inverse(data, ...)
        x$setinverse(m)
        m
}
