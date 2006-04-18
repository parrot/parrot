###
# [format]

#
# format string arg arg arg

.HLL 'Tcl', 'tcl_group'
.namespace [ '' ]

.sub "&format"
  .param pmc argv :slurpy

  .local int argc
  argc = argv
  if argc == 0 goto noargs

  .local string format

  # pull off the format string.
  shift format, argv

  $S0 = sprintf format, argv 

  .return($S0)

noargs:
  .throw('wrong # args: should be "format formatString ?arg arg ...?"')
.end
