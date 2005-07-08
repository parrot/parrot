###
# [source]

.namespace [ "Tcl" ]

.sub "lindex"
  .local pmc argv 
  argv = foldup
  
  .local pmc retval
  .local int return_type
  return_type = TCL_OK

  .local int argc 
  argc = argv
  if argc < 1 goto bad_args
  
  .local pmc list
  list = argv[0]
  
  $I0 = isa list, "String"
  unless $I0 goto have_list

from_string:
  .local pmc stringToList
  stringToList = find_global "_Tcl", "__stringToList"
  $S0 = list
  (return_type, retval) = stringToList($S0)
  if return_type == TCL_ERROR goto done
  list = retval

have_list:
  if argc != 1 goto select_elem
  retval = list
  goto done

select_elem:
  .local int index
  $S0 = argv[1]
  index = $S0
  retval = list[index]
  goto done

bad_args:
  return_type = TCL_ERROR
  retval = new TclString
  retval = "wrong # args: should be \"lindex list ?index...?\""

done:
  .return(return_type, retval)
.end