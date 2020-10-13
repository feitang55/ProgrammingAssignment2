##The two function below are used to create a special object that stores a matrix and cache's the inverse of the matrix

##The 1st function, makeCacheMatrix creates a list containing a function to
#1. set value of the matrix
#2. get the value of the matrix
#3. set the inverse value of the matrix
#4. get the inverse value of the matrix

makeCacheMatrix <- function(x = matrix()) {
  a <- NULL
  set <- function(y) {
    x <<- y
    a <<- NULL
}
  get <- function() x
  setinversematrix <- function(inverse) a <<- inverse
  getinversematrix <- function() a
  list(set = set, get = get,
   setinversematrix = setinversematrix,
   getinversematrix = getinversematrix)
}

b<-matrix(c(-7,4,9,6),2,2)
c<-makeCacheMatrix(b)

## the 2nd function calculates the inverse value of the matrix created by the 
## 1st function.This function first checks if the inverse value of the matrix has 
## already been calculated. If so, it gets the inverse value ans skips the computation.
## If the inverse value has not been calculated, it will calculate the inverse value of 
## the data and sets the inverse value in the cache via the setinversematrix function


cacheSolve <- function(x, ...) {
  a <- x$getinversematrix()
  if(!is.null(a)) {
    message("getting cached data")
    return(a)
  }
  data <- x$get()
  a <- solve(data, ...)
  x$setinversematrix(a)
  a
}
cacheSolve(c)
