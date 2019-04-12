#' Convert string/character time stamp to MS Excel time stamp
#'
#' Convert string/character time stamp to MS Excel time stamp
#'
#' @param time character; time stamp as character
#' @param reftime POSIXct, optional; provide another reference time
#'
#' @return time numeric; time as MS Excel time stamp in hours since 01/01/1900
#' @export
#'
#' @examples
#' 
#'   # 2001-03-30 01:00:00 UTC => 36980 hours since 1900-01-01 00:00 UTC
#'   time_char <- '2001-03-30 01:00:00 UTC'
#'   time_excel <- conv_time_POSIXct2excel(time_char)
#'   print(time_excel)
conv_time_str2excel = function(time, format = '%Y-%m-%d %H:%M', reftime = '1900-01-01 00:00 UTC', refformat = '%Y-%m-%d %H:%M') {
  
  ## Excel saves the time in days since 01-01-1900
  
  ## Example how I calculate number of days:
  # abc = as.POSIXct('2012-12-30 00:00 UTC', format = '%Y-%m-%d %H:%M')
  # def = as.POSIXct('2012-12-29 00:00 UTC', format = '%Y-%m-%d %H:%M')
  # as.numeric(abc) - as.numeric(def)
  # > 86400
  ## number of seconds!
  
  time=paste0(time, ' UTC')
  reftime=paste0(reftime, ' UTC')
  
  ndays = (as.numeric(as.POSIXct(time, format=format)) - as.numeric(as.POSIXct(reftime, format=refformat)))/86400 + 2
  
  return(ndays)
}