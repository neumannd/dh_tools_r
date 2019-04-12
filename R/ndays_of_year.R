#' Get number of days of provided year
#' 
#' Return the number of days of the year provided as input argument
#'
#' @param year numeric; a year
#'
#' @return numeric: numer of days of the particular year
#' @export
#'
#' @examples
#' 
#' # a non-leap year:
#' ndays_of_year(2001)
#' > 365
#' 
#' # a leap year:
#' ndays_of_year(2004)
#' > 366
ndays_of_year = function(year) {
  nDays = 365
  if (is.leapyear(year)) nDays = 366
  return(nDays)
}