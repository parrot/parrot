###
# [format]

#
# format string arg arg arg

.namespace [ "Tcl" ]

.sub "format"
  .local pmc argv 
  argv = foldup
  
  .local string format

  # pull off the format string.
  shift format, argv

  sprintf $S0, format, argv 

  $P0 = new String
  $P0 = $S0

done:
  .return(TCL_OK,$P0)
.end
