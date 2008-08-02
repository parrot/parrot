.HLL 'Tcl', ''
.namespace []

.sub '&lappend'
  .param pmc argv :slurpy

  .local pmc value, retval
  .local int return_type
  .local int argc
  argc = elements argv
  if argc == 0 goto error

  .local string listname
  listname = argv[0]
  .local int cnt
  cnt = 1

  .local pmc read
  read = get_root_global ['_tcl'], 'readVar'
  push_eh new_variable
    value = read(listname)
  pop_eh

  .local pmc toList

  toList = get_root_global ['_tcl'], 'toList'
  value  = toList(value)
  goto loop

new_variable:
  value = new 'TclList'
  # goto loop

loop:
  if cnt == argc goto loop_done
  $P0 = argv[cnt]
  push value, $P0
  inc cnt
  goto loop
loop_done:
  .local pmc set
  set = get_root_global ['_tcl'], 'setVar'
  .return set(listname, value)

error:
  die 'wrong # args: should be "lappend varName ?value value ...?"'

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
