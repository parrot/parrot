.namespace [ "Tcl" ]

.sub "&lassign"
  .local pmc argv
  .local int argc
  argv = foldup
  argc = argv
  if argc < 2 goto bad_args

  .local pmc retval
  .local pmc list
  list = shift argv

  .local pmc __list
  __list = find_global "_Tcl", "__list"
  ($I0, retval) = __list(list)
  if $I0 == TCL_ERROR goto bad_list
  list = retval

  .local string varname
  .local pmc set, value
  set = find_global "_Tcl", "__set"

var_loop:
  varname = shift argv
  value = shift list
  set(varname, value)

  unless list goto list_empty
  if argv goto var_loop

list_empty:
  value = new String
  value = ""
null_loop:
  unless argv goto var_end
  varname = shift argv
  set(varname, value)
  branch null_loop

var_end:
  .return(TCL_OK, list)

bad_list:
  .return(TCL_ERROR, retval)
bad_args:
  retval = new String
  retval = "wrong # args: should be \"lassign list varName ?varName ...?\""
  .return(TCL_ERROR, retval)
.end
