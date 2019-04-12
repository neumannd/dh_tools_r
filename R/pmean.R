#' Parallel mean
#' 
#'  Returns the parallel mean of the input values.
#'  
#'  pmean takes one or more vectors as arguments, recycles them to common length and returns a single vector giving the ‘parallel’ mean of the argument vectors. 
#'
#' @param ... numeric arguments (see Note).
#' @param na.rm a logical indicating whether missing values should be removed.
#'
#' @return A vector of length the longest of the input vectors, or length zero if one of the inputs had zero length. The arithmetic mean of the values in '...' is computed, as a numeric vector. If '...' are not logical (coerced to numeric) or numeric (including integer), NA_real_ is returned, with a warning. 
#' @export
#' @author Daniel Neumann, daniel.neumann@io-warnemuende.de
#' @seealso pmax, pmin
#'
#' @examples
#'   abc = 1:5
#'   def = 5:1
#'   pmean(abc, def)
#'   # returns: 3 3 3 3 3
#'   
#'   ghi = c(6, 6, 6, NA, 6)
#'   pmean(abc, def, ghi)
#'   # returns: 4 4 4 NA 4
#'   
#'   pmean(abc, def, ghi, na.rm = TRUE)
#'   # returns: 4 4 4 3 4
#'   
pmean = function(..., na.rm=FALSE) {
  
  # logical, which prevents calculation of mean if something is not right
  no_calc = FALSE
  
  # get all arguments
  elts <- list(...)
  n_elts = length(elts)

  # initialize empty output value
  pm = vector(typeof(elts[[1L]]))
  
  # get maximum length of the '...' input arrays
  #  and test for some speciesl cases
  maxLen = 0
  for(i in 1:n_elts) {
    maxLen = max(maxLen, length(elts[[i]]))
    
    # one parameter is of length zero
    if (length(elts[[i]]) == 0) {
      no_calc = TRUE
    }
    # the input is neither logical nor numeric
    if (!(is.logical(elts[[i]]) || is.numeric(elts[[i]]))) {
      no_calc = TRUE
      pm = NA_real_
      warning('argument is not numeric or logical: returning NA')
    }
  }
  
  # extend input arrays that are shorter than the longest of them
  for(i in 1:n_elts) {
    if (length(elts[[i]]) < maxLen && length(elts[[i]]) != 1) {
      warning("an argument will be fractionally recycled")
      elts[[i]] = rep(elts[[i]], length = maxLen)
    }
  }
  
  if (!no_calc) pm = rowMeans(as.data.frame(elts), na.rm=na.rm)
  
  return(pm)
}