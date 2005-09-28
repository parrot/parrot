###
# [format]

#
# format string arg arg arg

.namespace [ "Tcl" ]

.sub "&format"
  .param pmc argv :slurpy
  
  .local string format

  # pull off the format string.
  shift format, argv

  sprintf $S0, format, argv 

  .return($S0)
.end
