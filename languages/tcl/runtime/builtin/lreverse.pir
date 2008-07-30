.HLL 'Tcl', ''
.namespace []

.sub '&lreverse'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc != 1 goto bad_args

  .local pmc toList
  toList = get_root_global ['_tcl'], 'toList'
  .local pmc reverse
  reverse = get_root_global ['_tcl'], 'reverse'

  $P0 = argv[0]
  $P0 = toList($P0)
  $P0 = reverse($P0)
  .return ($P0)

bad_args:
  tcl_error 'wrong # args: should be "lreverse list"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
