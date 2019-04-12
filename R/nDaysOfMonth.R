#' Returns the number of days per month
#'
#' @param month numeric or array of numerics between 1 and 12
#' @param year numeric, optional
#'
#' @return numeric or array of numerics giving the number of days per month
#' @export TRUE
#' @import is.leapyear
#'
#' @examples
nDaysOfMonth <- function(month, year = 2001) {
  
  nDaysOfMonths <- c(31,28,31,30,31,30,31,31,30,31,30,31)

  if (is.leapyear(year)) nDaysOfMonths[2] <- nDaysOfMonths[2] + 1

  return(nDaysOfMonths[month])

}
