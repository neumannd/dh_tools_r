#' Mean Normalized Bias
#' 
#' Calculate a mean normalized bias.
#' 
#' MNB = 1/n * sum((p-o)/o)
#'
#' @param p numeric array; predicted values (model)
#' @param o numeric array; measured/observed values
#' @param na.rm a logical indicating whether missing values should be removed.
#'
#' @return numeric; mean normalized bias
#' @export
#'
#' @examples
#' 
#'   # ex 1
#'   p <- 1:5
#'   o <- 2:6
#'   mnb(p,o)
#'   > -0.29
#'   
#'   # ex 2
#'   p <- c(1:4, NA)
#'   o <- 2:6
#'   mnb(p,o)
#'   > -0.3208333
#'   
#'   # ex 3
#'   p <- c(1:4,NA)
#'   o <- 2:6
#'   mnb(p,o,na.rm=FALSE)
#'   > NA
#'   
#'   # ex 4
#'   p <- 1:5
#'   o <- c(2:5, 0)
#'   mnb(p,o)
#'   > -0.3208333
#'   
#'   # ex 5
#'   p <- 1:5
#'   o <- c(2:5, 0)
#'   mnb(p,o, na.rm=FALSE)
#'   > Inf
#' 
mnb <- function(p,o,na.rm=TRUE) {
  
  if (na.rm) {
    p.use <- p[!(is.na(o)|is.na(p)|o==0)]
    o.use <- o[!(is.na(o)|is.na(p)|o==0)]
  } else {
    p.use <- p
    o.use <- o
  }
  
  return(mean((p.use-o.use)/o.use, na.rm=na.rm))
  
}
