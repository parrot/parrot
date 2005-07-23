###
# [source]

.namespace [ "Tcl" ]

.sub "&lindex"
  .local pmc argv 
  argv = foldup
  
  .local pmc retval
  .local int return_type

  .local int argc 
  argc = argv
  if argc < 1 goto bad_args
  
  .local pmc __list
  __list = find_global "_Tcl", "__list"

  $P0 = argv[0]
  (return_type, retval) = __list($P0)
  if return_type == TCL_ERROR goto done

have_list:
  if argc == 1 goto done

select_elem:
  $P0 = argv[1]
  .local pmc indices
  (return_type, indices) = __list($P0)
  if return_type == TCL_ERROR goto done
  
  .local int index
  .local int elems
  elems = indices
  $I0 = 0
select_loop:
  if $I0 >= elems goto done
  (return_type, retval) = __list(retval)
  if return_type == TCL_ERROR goto done
  
  # use a string so we get the int value of the contents
  # of the TclWord and not the size of the TclWord itself
  $S0 = indices[$I0]
  index = $S0
  retval = retval[index]
  
  inc $I0
  goto select_loop

bad_args:
  return_type = TCL_ERROR
  retval = new TclString
  retval = "wrong # args: should be \"lindex list ?index...?\""

done:
  .return(return_type, retval)
.end
