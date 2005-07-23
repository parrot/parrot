##
# [list]

.namespace [ "Tcl" ]

.sub "&list"

  .local pmc argv 
  argv = foldup

  # convert the Array returned by foldup into a TclList.
  # XXX Is there a more efficient way to do this?

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

  .return(0,retval)
.end
