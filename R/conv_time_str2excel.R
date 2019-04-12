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