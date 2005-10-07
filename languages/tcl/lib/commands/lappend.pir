##
# [list]

.namespace [ "Tcl" ]

.sub "&lappend"
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
  read = find_global "_Tcl", "__read"
  value = read(listname)
  
  .local pmc __list

  __list = find_global "_Tcl", "__list"
  value = __list(value)
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
  set = find_global "_Tcl", "__set"
  .return set(listname, value)

error:
  .throw ("wrong # args: should be \"lappend varName ?value value ...?\"")

.end
