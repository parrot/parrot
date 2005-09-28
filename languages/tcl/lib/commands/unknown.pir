###
# [unknown]

.namespace [ "Tcl" ]

.sub "&unknown"
  .param pmc argv :slurpy

  $S0 = join " ", argv
  $I1 = spawnw $S0

  .return("")
.end
