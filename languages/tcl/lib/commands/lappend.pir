##
# [list]

.namespace [ "Tcl" ]

.sub "&lappend"

  .local pmc argv
  argv = foldup 

  .local pmc value, retval
  .local int return_type

  .local int argc
  argc = argv
  if argc == 0 goto error

  .local string listname
  listname = argv[0]
  .local int cnt
  cnt = 1

  .local pmc read
  read = find_global "_Tcl", "__read"
  (return_type, value) = read(listname)
  if return_type == TCL_ERROR goto new_variable
  
  .local pmc __list
  __list = find_global "_Tcl", "__list"
  
  (return_type, retval) = __list(value)
  if return_type == TCL_ERROR goto done
  value = retval
  goto loop

new_variable:
  value = new TclList
  # goto loop

loop:
  if cnt == argc goto loop_done
  $P0 = argv[cnt]
  push value, $P0
  inc cnt
  goto loop
loop_done:
  .local pmc set
  set = find_global "_Tcl", "__set"
  (return_type, retval) = set($S1, value)
  goto done

error:
  return_type = TCL_ERROR
  retval = new TclString
  retval = "wrong # args: should be \"lappend varName ?value value ...?\""

done:
  .return(return_type,retval)
.end
