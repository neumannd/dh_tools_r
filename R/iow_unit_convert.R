# myunits = c("uM",
# "mg/l",
# "umol/l",
# "ug/l",
# "ug/l",
# "umol/l",
# "mg/l",
# "ml/l",
# "umol/l",
# "uM",
# "mg/l",
# "uM",
# "umol/l",
# "mg/l",
# "ug/l",
# "ppt",
# "psu",
# "m",
# "uM",
# "mg/l",
# "umol/l",
# "degC")

iow_unit_convert = function(value, unitIn, unitOut, parameter = "") {
  ## initialize return value
  out_value = NULL
  
  ## set molar masses
  molar_mass = list('N' = 14, 'O' = 16, 'P' = 31, 'Si' = 28, 'C' = 12)
  
  molar_mass$no2n = molar_mass$N;  molar_mass$no3n = molar_mass$N;    
  molar_mass$no23n = molar_mass$N; molar_mass$nh4n = molar_mass$N;
  
  molar_mass$tn = molar_mass$N;    molar_mass$din = molar_mass$N
  molar_mass$don = molar_mass$N;   molar_mass$pon = molar_mass$N
  
  molar_mass$o2 = 2*molar_mass$O;    molar_mass$sio4si = molar_mass$Si;
  molar_mass$po4p = molar_mass$P;  molar_mass$tp = molar_mass$P;
  
  molar_mass$dia = molar_mass$N;   molar_mass$flag = molar_mass$N;    
  molar_mass$cyano = molar_mass$N
  molar_mass$mezoo = molar_mass$N; molar_mass$mizoo = molar_mass$N;    
  
  if( (1 == length(value)) && (1 == length(unitIn)) && 
      (1 == length(unitOut)) && (1 == length(parameter))) {
    
    ## some special cases
    unitIn = gsub('M', 'mol/l', unitIn)
    unitOut = gsub('M', 'mol/l', unitOut)
    unitIn = gsub('psu', 'g/kg', unitIn)
    unitOut = gsub('psu', 'g/kg', unitOut)
    if (parameter == 'salin') unitIn = gsub('ppt', 'g/kg', unitIn)
    
    if (unitIn == unitOut) {
      out_value = value
    } else {
      if( length(grep('mol', c(unitIn, unitOut))) == 1 && length(grep('ml/l', c(unitIn, unitOut))) == 0) {
        if ( (length(grep('mol/', unitIn)) == 1 ) && (length(grep('g/', unitOut)) == 1 ) ) {
          value = value * molar_mass[[parameter]]
          unitIn = gsub('mol/', 'g/', unitIn)
        } else if ( (length(grep('g/', unitIn)) == 1 ) && (length(grep('mol/', unitOut)) == 1 ) ) {
          value = value / molar_mass[[parameter]]
          unitIn = gsub('g/', 'mol/', unitIn)
        } else {
          stop("iow_unit_convert: 'mol' in one of both units but no conversion implemented for this case")
        }
      }
      
      if (parameter == 'o2' && length(grep('ml/l', c(unitIn, unitOut))) == 1) {
        if ( unitOut == 'ml/l') {
          value = iow_unit_convert(value, unitIn, 'umol/m3', parameter) * 2.2391 * 10^(-5)
          unitIn = unitOut
        } else if ( unitIn == 'ml/l') {
          value = iow_unit_convert(value / 2.2391 * 10^(5), 'umol/m3', unitOut, parameter)
          unitIn = unitOut
        } else {
          stop("iow_unit_convert: 'ml/l' in one of both units but no conversion implemented for this case")
        }
      }
      
      out_value = ud.convert(value, unitIn, unitOut)
    }
    
    return(out_value)
    
  } else {
    stop('iow_unit_convert: input data needs to have length of 1')
  }
}
