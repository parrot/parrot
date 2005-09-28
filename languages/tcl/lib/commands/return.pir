###
# [return]

.namespace [ "Tcl" ]

.sub "&return"
   .param pmc argv :slurpy
 
  .local int argc 
  argc = argv

  if argc == 0 goto noargs
  if argc == 1 goto onearg

  .throw ("XXX: bad call to return")

onearg:
  $P0 = argv[0]
  .tcl_return($P0)

noargs:
  .tcl_return ("")

.end
