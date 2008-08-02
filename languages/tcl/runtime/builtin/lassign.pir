.HLL 'Tcl', ''
.namespace []

.sub '&lassign'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc < 2 goto bad_args

  .local pmc retval
  .local pmc list
  list = shift argv

  .local pmc toList
  toList = get_root_global ['_tcl'], 'toList'
  list   = toList(list)

  .local string varname
  .local pmc set, value
  set = get_root_global ['_tcl'], 'setVar'

var_loop:
  varname = shift argv
  value = shift list
  set(varname, value)

  unless list goto list_empty
  if argv goto var_loop

list_empty:
  value = new 'TclString'
  value = ''
null_loop:
  unless argv goto var_end
  varname = shift argv
  set(varname, value)
  branch null_loop

var_end:
  .return(list)

bad_args:
  die 'wrong # args: should be "lassign list varName ?varName ...?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
