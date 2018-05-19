## Caching the inverse of matrix

## This function creates a special matrix  object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y){
                x <<-  y
                inv  <<-  NULL
        }
        get <- function() x
        
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## This function computes the inverse of the special matrix returned by the above function

cacheSolve  <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)){
                message("Getting cached data")
                return(inv)
        }
         Data <-  x$get()
         inv <-  solve(data, ...)              ## This generic function solves the equation
         x$setinverse(inv)
         inv
   }

