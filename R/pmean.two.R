
pmean.two = function(a1, a2, na.rm=FALSE) {
  return(rowMeans(cbind(a1, a2), na.rm=na.rm))
}