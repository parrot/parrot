##
# [list]

.namespace [ "Tcl" ]

.sub "&llength"
  .param pmc listval

  if argcP != 1 goto bad_args

  .local pmc retval
  .local int return_type

  .local pmc __list
  __list = find_global "_Tcl", "__list"

  (return_type, retval) = __list(listval)
  if return_type == TCL_ERROR goto done
  listval = retval
 
list_like:
  $I0 = listval
  retval = new TclInt
  retval = $I0

done:
  .return(return_type,retval)

bad_args:
  $P1 = new String
  $P1 = "wrong # args: should be \"llength list\""
  .return(TCL_ERROR,$P1)
.end
