.HLL 'Tcl', ''
.namespace []

.sub '&format'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc == 0 goto noargs

  .local string format

  # pull off the format string.
  shift format, argv

  $S0 = sprintf format, argv

  .return($S0)

noargs:
  die 'wrong # args: should be "format formatString ?arg arg ...?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
