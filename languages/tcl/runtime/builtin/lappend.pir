##
# [list]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&lappend'
  .param pmc argv :slurpy

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
  read = get_root_global ['_tcl'], '__read'
  push_eh new_variable
    value = read(listname)
  clear_eh
  
  .local pmc __list

  __list = get_root_global ['_tcl'], '__list'
  value  = __list(value)
  goto loop

new_variable:
  value = new .TclList
  # goto loop

loop:
  if cnt == argc goto loop_done
  $P0 = argv[cnt]
  push value, $P0
  inc cnt
  goto loop
loop_done:
  .local pmc set
  set = get_root_global ['_tcl'], '__set'
  .return set(listname, value)

error:
  tcl_error 'wrong # args: should be "lappend varName ?value value ...?"'

.end
