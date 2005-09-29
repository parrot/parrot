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

  $S0 = sprintf format, argv 

  .return($S0)
.end
