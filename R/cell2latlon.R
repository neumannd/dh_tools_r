cell2latlon = function(lat, lon, resol) {
  x = -1
  y = -1
  
  if ( lon > grids[[resol]]$lonw && lon < grids[[resol]]$lone &&
       lat > grids[[resol]]$lats && lat < grids[[resol]]$latn) {
    x = floor((lon - grids[[resol]]$lonw) / grids[[resol]]$dlon) + 1
    y = floor((lat - grids[[resol]]$lats) / grids[[resol]]$dlat) + 1
  }
  
  return(list('x' = x, 'y' = y))
}