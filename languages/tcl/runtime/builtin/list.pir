###
# [list]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&list'
  .param pmc argv :slurpy

  .return(argv)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
