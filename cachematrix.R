## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#Based on makeVector function example provided in assignment, and list description of function 
#instead of use vector, and because it provide "matrix" word as parameter
# I just change the "mean" function to "solve", for "setsolve" and "m" variable
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL   #initialize var m
  set <- function(y) {    #1. set the value of the matrix, (original description: vector).
    x <<- y
    m <<- NULL
  }
  get <- function() x  #2. get the value of the matrix, (original description: vector)
  #Because of the following text in assignment:
  #"Computing the inverse of a square matrix can be done with the solve function in R. 
  #For example, if X is a square invertible matrix, then solve(X) returns its inverse."
  # Changes I made:
  #I changed the "mean" function for "solve" function, change de variable names also.
  setsolve <- function(solve) m <<- solve   #3. set the value of the solve, (original description: mean)
  getsolve <- function() m          #4. get the value of the solve, (original description: mean)
  #list results
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function

#Based on Cachemean function 
# Validate if there is computed value saved, if not it computed and save
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()        #Instead of call getmean, I use getsolve value.
  if(!is.null(m)) {        #validating if exists computed value.    
    message("getting cached data")    #Message and return computed value.
    return(m)
  }
  data <- x$get()         
  m <- solve(data, ...)   #Instead of call mean function, I use solve function. 
  x$setsolve(m)     #use the set for new computed value.
  m  
}
