#' Convert POSIXct Format to MS Excel time stamp
#'
#' Convert POSIXct Format to MS Excel time stamp
#'
#' @param time POSIXct; time in format POSIXct 
#' @param reftime POSIXct, optional; provide another reference time
#'
#' @return time numeric; time as MS Excel time stamp in hours since 01/01/1900
#' @export
#'
#' @examples
#' 
#'   # 2001-03-29 23:00:00 UTC => 36980 hours since 1900-01-01 00:00 UTC
#'   time_posixct <- as.POSIXct('2001-03-29 23:00:00 UTC', tz='UTC')
#'   time_excel <- conv_time_POSIXct2excel(time_posixct)
#'   print(time_excel)
conv_time_POSIXct2excel = function(time, reftime = as.POSIXct('1900-01-01 00:00 UTC')) {
  
  ## Excel saves the time in days since 01-01-1900
  
  ## Example how I calculate number of days:
  # abc = as.POSIXct('2012-12-30 00:00 UTC', format = '%Y-%m-%d %H:%M')
  # def = as.POSIXct('2012-12-29 00:00 UTC', format = '%Y-%m-%d %H:%M')
  # as.numeric(abc) - as.numeric(def)
  # > 86400
  ## number of seconds!
  
  ndays = (as.numeric(time) - as.numeric(reftime))/86400 + 2
  
  return(ndays)
}