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
