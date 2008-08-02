.HLL 'Tcl', ''
.namespace []

.sub '&lset'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc < 2 goto wrong_args

  .local string name, value
  name  = argv[0]
  value = pop argv
  dec argc

  .local pmc readVar, toList, setVar
  readVar = get_root_global ['_tcl'], 'readVar'
  toList = get_root_global ['_tcl'], 'toList'
  setVar  = get_root_global ['_tcl'], 'setVar'

  .local pmc retval, list
  list = readVar(name)
  list = toList(list)
  retval = list

  # we removed the value, so this would be one now
  if argc == 1 goto replace

lset:
  .local pmc getIndex
  getIndex = get_root_global ['_tcl'], 'getIndex'

  unless argc == 2 goto iterate
  $P0 = argv[1]
  $P0 = toList($P0)
  $I0 = elements $P0
  if $I0 == 0 goto replace

iterate:
  .local pmc indices, prev
  .local int outer_i
  outer_i = 0
outer_loop:
  inc outer_i
  if outer_i == argc goto done
  indices = argv[outer_i]
  indices = toList(indices)

  $I0 = 0
  $I1 = elements indices
loop:
  if $I0 == $I1 goto outer_loop

  $P0 = indices[$I0]
  $I2 = getIndex($P0, list)
  if $I2 < 0 goto out_of_range
  $I3 = elements list
  if $I2 >= $I3 goto out_of_range

  prev = list
  list = list[$I2]
  list = toList(list)
  prev[$I2] = list

  inc $I0
  goto loop

done:
  prev[$I2] = value
  setVar(name, retval)
  .return(retval)

out_of_range:
  die 'list index out of range'

wrong_args:
  die 'wrong # args: should be "lset listVar index ?index...? value"'

replace:
  .return setVar(name, value)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
