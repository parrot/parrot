##
# [list]

.namespace [ "Tcl" ]

.sub "&list"
  .param pmc argv :slurpy

  # convert the Array returned by foldup into a TclList.
  #   Is there a more efficient way to do this?
  #   <@leo> coke: I don't think there is a better solution for this

  .local int argc
  argc = argv
 
  .local pmc retval
  retval = new TclList
 
  .local int cnt
  cnt = 0
LOOP:
  if cnt >= argc goto DONE
  $P0 = argv[cnt]
  retval[cnt] = $P0
  inc cnt
  goto LOOP
DONE: 

  .return(retval)
.end
