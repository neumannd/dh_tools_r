#' Calculate max value for plot axes
#'
#' Calculates the axis limits (min,max) for plotting a data series. Different 
#' types of methods can be choosen, such no rounding of min and max values and
#' rounding to the n_th digit.
#' 
#' Values for type (we define x.max.sharp <- max(x, na.rm = TRUE)):
#' 
#'  0: use x.max.sharp; except if it is 0; then use x.max.default
#'  1: some complicated estimation: ceiling(x.max.sharp/10^(floor(log10(x.max.sharp))-1))*10^(floor(log10(x.max.sharp))-1)
#'  2: round up to two significant digits: signif(x.max.sharp, digits = 1) * 2
#'  3: round up to one significant digit: signif(x.max.sharp, digits = 1) * 1
#'
#' @param x numeric: one or more values for 
#' @param type integer: type of choosing the max value (0, 1, 2 or 3)
#' @param x.max.default numeric: user provided alternative max value [dafault: 1]
#' @return numeric: max value for the plot axis
#' 
#' @export
get.max4plot <- function(x, type, x.max.default = 1) {
  
  x.max.sharp = max(x, na.rm = TRUE)
  
  if ( x.max.sharp == 0 ) {
    x.max.plot = x.max.default
  } else {
    if ( type == 0 ) {
      x.max.plot = x.max.sharp
    } else if ( type == 1 ) {
      x.max.plot = ceiling(x.max.sharp/10^(floor(log10(x.max.sharp))-1))*10^(floor(log10(x.max.sharp))-1)
    } else if ( type == 2 ) {
      x.max.plot = signif(x.max.sharp, digits = 1) * 2
    } else if ( type == 3 ) {
      x.max.plot = signif(x.max.sharp, digits = 1)
      if(x.max.plot < x.max.sharp) {
        x.max.plot = signif(2*x.max.sharp-x.max.plot, digits = 2)
      }
    } else {
      x.max.plot = x.max.default
    }
  }
  
  return(x.max.plot)
}
