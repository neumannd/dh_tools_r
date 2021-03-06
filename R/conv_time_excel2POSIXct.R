#' Convert MS Excel time stamp to POSIXct Format
#'
#' Convert MS Excel time stamp to POSIXct Format.
#'
#' @param time numeric; a time stamp in hours since 01/01/1900
#' @param reftime POSIXct, optional; provide another reference time
#'
#' @return time_POSIXct POSIXct: time in format POSIXct
#' @export
#'
#' @examples
#' 
#'   # 31069 hours since 01/01/1900 00:00:00 => 22/01/1985 
#'   time_excel <- 31069 
#'   time_posixct <- conv_time_excel2POSIXct(time_excel)
#'   print(time_posixct)
conv_time_excel2POSIXct = function(time, reftime = as.POSIXct('1900-01-01 00:00 UTC')) {
  
  ## Excel saves the time in days since 01-01-1900
  
  ## Example how I calculate number of days:
  # abc = as.POSIXct('2012-12-30 00:00 UTC', format = '%Y-%m-%d %H:%M')
  # def = as.POSIXct('2012-12-29 00:00 UTC', format = '%Y-%m-%d %H:%M')
  # as.numeric(abc) - as.numeric(def)
  # > 86400
  ## number of seconds!
  
  ndays = as.POSIXct((time-2)*86400, origin = reftime)
  
  return(ndays)
}