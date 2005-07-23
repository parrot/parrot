###
# [append]

#
# append var [...]

.namespace [ "Tcl" ]

.sub "&append"
  .local pmc argv
  argv = foldup

  .local int argc 
  argc = argv

  .local pmc read
  read = find_global "_Tcl", "__read"

  .local int return_type
  .local pmc value
  .local int looper
  looper = 1

  if argc == 0 goto error

  .local string name
  name = argv[0]
  
  if argc == 1 goto getter

setter:
  (return_type, $P1) = read(name)
  
  if return_type == TCL_ERROR goto new_variable
  value = clone $P1
  goto loop

new_variable:
  value = new TclString
  value = ""
  #goto loop

loop:
  if looper == argc goto loop_done

  $S2 = argv[looper]
  concat value, $S2
  inc looper
  goto loop

loop_done:
  .local pmc set
  set = find_global "_Tcl", "__set"
  (return_type, value) = set(name, value)
  goto done

getter:
  (return_type, value) = read(name)
  goto done

error:
  return_type = TCL_ERROR
  value = new TclString
  value = "wrong # args: should be \"append varName ?value value ...?\""

done:
  .return(return_type, value)
.end
