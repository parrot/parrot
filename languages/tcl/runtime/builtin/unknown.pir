###
# [unknown]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&unknown'
  .param pmc argv :slurpy

  $S0 = join ' ', argv
  $I1 = spawnw $S0

  .return('')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
