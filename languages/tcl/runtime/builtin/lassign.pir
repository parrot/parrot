.namespace [ "Tcl" ]

.sub "&lassign"
  .param pmc argv :slurpy

  .local int argc
  argc = argv
  if argc < 2 goto bad_args

  .local pmc retval
  .local pmc list
  list = shift argv

  .local pmc __list
  __list = find_global "_Tcl", "__list"
  list = __list(list)

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
  value = new .String
  value = ""
null_loop:
  unless argv goto var_end
  varname = shift argv
  set(varname, value)
  branch null_loop

var_end:
  .return(list)

bad_args:
  .throw ("wrong # args: should be \"lassign list varName ?varName ...?\"")
.end
