###
# [list]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&list'
  .param pmc argv :slurpy

  $P0 = new TclList
  assign $P0, argv

  .return($P0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
