#' Form Row Minima
#' 
#' Calculates the minimum of each row of a matrix, a data.frame, or any 
#' other 2-dimensional structure.
#' 
#' @param x data.frame or array of two dimensions, containing numeric, complex, integer or logical values. 
#' @param na.rm  logical: a logical indicating whether missing values should be removed.
#' @return A numeric or complex data.frame/vector. For min and max if there are only numeric inputs and all are empty (after possible removal of NAs), the result is double (Inf or -Inf), consistent with min and max.
#' @author Daniel Neumann, daniel.neumann@io-warnemuende.de
#' @seealso colMaxs, rowMaxs, colMins, colMeans, rowMeans, colSums, rowSums
#' @export 
#' @examples
#'  abc = array(1:30, dim = c(6,5))
#'  rowMins(abc)
#'  # returns:  1  2  3  4  5  6
#'  
#'  def = as.data.frame(abc)
#'  rowMins(def)
#'  # returns
#'  #    1  2  3  4  5  6
rowMins = function(x, na.rm = FALSE) {
  
  # apply 'min' function to each row
  mins = apply(x, 1, min, na.rm=na.rm)
  
  # return the results
  return(mins)
  
}