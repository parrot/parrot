.HLL 'Tcl', ''
.namespace []

.sub '&lreverse'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc != 1 goto bad_args

  .local pmc toList
  toList = get_root_global ['_tcl'], 'toList'

  $P0 = argv[0]
  $P0 = toList($P0)
  $P0 = clone $P0
  $P0.'reverse'()

  .return ($P0)
bad_args:
  die 'wrong # args: should be "lreverse list"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
