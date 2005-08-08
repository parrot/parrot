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
  
  .local pmc __list, _list_index
  __list      = find_global "_Tcl", "__list"
  _list_index = find_global "_Tcl", "_list_index"

  .local pmc list
  $P0 = argv[0]
  (return_type, retval) = __list($P0)
  if return_type == TCL_ERROR goto done
  list = retval

have_list:
  if argc == 1 goto done

select_elem:
  $P0 = argv[1]
  .local pmc indices
  (return_type, retval) = __list($P0)
  if return_type == TCL_ERROR goto done
  indices = retval
  
  .local int index
  .local int elems
  elems = indices
  $I0 = 0
select_loop:
  if $I0 >= elems goto have_elem
  (return_type, retval) = __list(list)
  if return_type == TCL_ERROR goto done
  list = retval
  
  $P0 = indices[$I0]
  (return_type, retval) = _list_index(list, $P0)
  if return_type == TCL_ERROR goto done
  index = retval
  list  = list[index]
  
  inc $I0
  goto select_loop

bad_args:
  return_type = TCL_ERROR
  retval = new TclString
  retval = "wrong # args: should be \"lindex list ?index...?\""

have_elem:
  retval = list
done:
  .return(return_type, retval)
.end
