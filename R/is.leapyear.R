#' Is a year a leap year?
#' 
#' Provides information (TRUE/FALSE) whether a year is a leap year (TRUE) or not (FALSE).
#'
#' Function originates from (CC BY-SA 3.0): https://quantitative-ecology.blogspot.com/2009/10/leap-years.html
#'
#' @param year a numeric giving a year
#'
#' @return Returns a logical. It is TRUE when 'year' is a leap year according to the Gregorian calender. Else it is false.
#' @export
#'
#' @examples
#'   is.leapyear(2012)
#'   # return: TRUE
#'   
#'   is.leapyear(2001)
#'   # return: FALSE
#'   
#'   is.leapyear(1998:2010)
#'   # return: FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE
is.leapyear=function(year){
  ## More information::
  # http://en.wikipedia.org/wiki/Leap_year
  # https://www.r-bloggers.com/leap-years/
  return(((year %% 4 == 0) & (year %% 100 != 0)) | (year %% 400 == 0))
}