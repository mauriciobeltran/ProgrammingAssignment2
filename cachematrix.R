makeCacheMatrix <- function(datamatrix = matrix(numeric())) {

  #The makeCacheMatrix function receives a Matrix as a parameter and returns a
  #list of functions used to read and set the internal matrix and the inversed 
  #matrix.
  
  invMatrix <- NULL

  #Code used to set the values of the internal matrix.
  setmatrix <- function(orgMatrix) {
    invMatrix <<- NULL
    datamatrix <<- orgMatrix
  }
  
  #Return the internal matrix used by the cachesolve function to return the inverse
  #Matrix.
  getmatrix <- function() datamatrix
  
  #Return the cached inverted matrix.
  getinvMatrix <- function() invMatrix
  
  #Set the values of the cached inverted matrix.
  setinvMatrix <- function(orgMatrix) invMatrix <<- orgMatrix
  
  #Return the list of functions used to manipulate both matrices.
  list(
    setmatrix = setmatrix, getmatrix = getmatrix,
    getinvMatrix = getinvMatrix, setinvMatrix = setinvMatrix
  )
  
}

cacheSolve <- function(cachedmatrix, ...) {
  
  #The cacheSolve function receives a makeCacheMatrix object as a parameter
  #and calculates the inverse matrix. If the inverse of the matrix was previously 
  #computed and the cached data matrix has not changed (every time the cached matrix
  #changes, the inverse matrix is set to Null), it returns the cached result. 
  
  tmpmat <- NULL
  tmpinv <- NULL
  
  tmpmat <- cachedmatrix$getinvMatrix()
  
  #Evaluate if the chached inverse matrix is valid.
  if(is.null(tmpmat)) {
    
    #calculate the inverse matrix.
    tmpinv <- solve(cachedmatrix$getmatrix())
    cachedmatrix$setinvMatrix(tmpinv)
    
  } else {
    
    #Return the cached result.
    print("Reading cached inverted matrix:")
    tmpinv <- cachedmatrix$getinvMatrix()
    
  }
  
  tmpinv
    
}
