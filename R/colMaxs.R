#' Form Column Maxima
#' 
#' Calculates the maximum of each column of a matrix, a data.frame, or any 
#' other 2-dimensional structure.
#' 
#' @param x data.frame or array of two dimensions, containing numeric, complex, integer or logical values. 
#' @param na.rm  logical: a logical indicating whether missing values should be removed.
#' @return A numeric or complex data.frame/vector. For min and max if there are only numeric inputs and all are empty (after possible removal of NAs), the result is double (Inf or -Inf), consistent with min and max.
#' @author Daniel Neumann, daniel.neumann@io-warnemuende.de
#' @seealso rowMaxs, colMins, rowMins, colMeans, rowMeans, colSums, rowSums
#' @export 
#' @examples
#'  abc = array(1:30, dim = c(6,5))
#'  colMaxs(abc)
#'  # returns: 6 12 18 24 30
#'  
#'  def = as.data.frame(abc)
#'  colMaxs(def)
#'  # returns
#'  #   V1 V2 V3 V4 V5 
#'  #    6 12 18 24 30 
colMaxs = function(x, na.rm = FALSE) {
  
  # apply 'max' function to each column
  maxs = apply(x, 2, max, na.rm=na.rm)
  
  # return the results
  return(maxs)
  
}