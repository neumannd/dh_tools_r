#' Parallel mean for two 1D or 2D numeric arrays
#' 
#' Calculates parallel mean of two 1D or 2D numeric arrays. Other classes or sizes are probably not possible. Wrong inputs are not caught due to reasons of performance.
#'
#' @param a1 numeric array; 1D or 2D array with same number of rows as a2; if 1D, the length is considered as number of rows
#' @param a2 numeric array; 1D or 2D array with same number of rows as a1; if 1D, the length is considered as number of rows
#' @param na.rm a logical indicating whether missing values should be removed.
#'
#' @return numeric array; length==nrow of a1 and a2 if one of them was 2D array; length=length of a1 and a2 if both were 1D arrays
#' @export
#'
#' @examples
#' 
#' # ex 1
#' b1 <- array(1:12, dim = c(4,3))
#' b2 <- 1:4
#' pmean.two(b1, b2)
#' > 4 5 6 7
#' 
#' # ex 2
#' b1 <- array(1:12, dim = c(4,3))
#' b2 <- array(1:12, dim = c(4,3))
#' pmean.two(b1, b2)
#' > 5 6 7 8
#' 
pmean.two = function(a1, a2, na.rm=FALSE) {
  return(rowMeans(cbind(a1, a2), na.rm=na.rm))
}