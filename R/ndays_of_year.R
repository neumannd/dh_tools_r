ndays_of_year = function(year) {
  nDays = 365
  if (is.leapyear(year)) nDays = 366
  return(nDays)
}