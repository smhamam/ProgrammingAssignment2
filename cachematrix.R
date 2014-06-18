## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## A function that takes a matrix x and returns a list of functions to 
## cache and retrive the matrix and cache and retrive its inverse.
makeCacheMatrix <- function(x = matrix()) {

        v <- NULL  							# initalize the inverse object
        set <- function(y) { 				# Define set method
                x <<- y						# Assigne value to object 
                v <<- NULL					# Initialize inverse object
        }
        get <- function() x					# Retrive matrix
        setinv <- function(inv) v <<- inv	# Set inverse object to inverse value
        getinv <- function() v				# Retrive inverse value
        list(set = set, get = get,			# Return list of functions  and set & get vl
             setinv = setinv,				# to set & get valus of the matrix
             getinv = getinv)				# and set & get value of the inverse


}


## Write a short comment describing this function
## A function that takes a list of functions to set & get an object and 
## set & get its inverse and return the cached matrix inverse value 
## if available, otherwise comute it and cache it for future calls
## for the same matrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        v <- x$getinv()						# Attempt retriving the inverse of the matrix 
        if(!is.null(v)) {					# if it exists
                message("getting cached data")
                return(v)					# return the inverse value (and exit the function)
        }
        data <- x$get()						# otherwise get the matrix value
        v <- solve(data, ...)				# calculate inverse
        x$setinv(v)							# cahe the inverse
        v									# return the calculated inverse
        
        
        
}
