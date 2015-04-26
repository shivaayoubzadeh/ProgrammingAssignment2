##Generally we want to create matrix and calculate inverse for it, but because calculate inverse
##for a matrix is so time consuming specially when the matrix has many rows and columns,
## we use cache facility which check to see if inverse of the matrix has been calculated before, don't calculate it again 
##and return the cache value, else we should calculate it for the first time and use the result in the other next times.
##So  from two below functions the first one (makeCacheMatrix) creates the matrix and all 4 main functions needed, and the second one (cacheSolve) calculate inverse value for the matrix by solve() function in R  or return the inverse value of that matrix which is calculated before and stored in the cache.


## makeChacheMatrix creates the special matrix and a list which contains functions for:
## set the value to matrix
## get the matrix
## set the inverse  of the matrix
## get the inverse  of the matrix
makeCacheMatrix <- function(x = matrix()) {
		inv <- NULL
		set <- function(y) {
			x <<- y
			inv <<- NULL
		}
		get <- function() x
		setinverse <- function(findinverse)inv <<- findinverse
		getinverse <- function()inv
		list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}




##cacheSolve function calculate the inverse of matrix 
#but first check if inverse of matrix calculated before and 
#in this case it will return the cache data as inverse 
#and if not it will calculate the inverse of matrix by solve() function and return the value. 

cacheSolve <- function(x, ...) {
        
		inv <- x$getinverse() ## first we check if the inverse of the matrix was calculated before
		if(!is.null(inv)) {
					message("getting cached data")
					inv
		} else {
		inv <- solve(x$get()) ## we get the matrix by get() function and pass it to solve() function of R to calculate the inverse of it
		x$setinverse(inv) ## we set the calculated inverse matrix in this line to don't calculate it in the next time.
		inv
		}
}
