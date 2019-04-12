#' Returns the number of days per month
#' 
#' Returns the number of days per month. 
#'
#' @param month numeric or array of numerics between 1 and 12
#' @param year numeric, optional [default: 2001; no leap year]
#'
#' @return numeric or array of numerics giving the number of days per month
#' @export TRUE
#' @import is.leapyear
#'
#' @examples
#' 
#' # #days in may 2001:
#' nDaysOfMonth(5)
#' > 31
#' 
#' # #days in February 2001:
#' nDaysOfMonth(2)
#' > 28
#' 
#' # #days in February 2004:
#' nDaysOfMonth(2, 2004)
#' > 29
#' 
#' # #days in a set of months in 2007
#' nDaysOfMonth(c(1,2,6,12), 2007)
#' > 31 28 30 31
nDaysOfMonth <- function(month, year = 2001) {
  
  nDaysOfMonths <- c(31,28,31,30,31,30,31,31,30,31,30,31)

  if (is.leapyear(year)) nDaysOfMonths[2] <- nDaysOfMonths[2] + 1

  return(nDaysOfMonths[month])

}
