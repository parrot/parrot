.HLL 'Tcl', ''
.namespace []

.sub '&append'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv

  .local pmc read
  read = get_root_global ['_tcl'], 'readVar'

  .local string value
  .local int looper
  looper = 1

  if argc == 0 goto badargs

  .local string name
  name = argv[0]

  if argc == 1 goto getter

setter:
  push_eh new_variable
    $P1 = read(name)
  pop_eh

  value = $P1
  goto loop

new_variable:
  value = ''

loop:
  if looper == argc goto loop_done

  $S2 = argv[looper]
  concat value, $S2
  inc looper
  goto loop

loop_done:
  .local pmc set
  set = get_root_global ['_tcl'], 'setVar'
  .return set(name, value)

getter:
  .return read(name)

badargs:
  die 'wrong # args: should be "append varName ?value value ...?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
