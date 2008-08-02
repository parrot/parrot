.HLL 'Tcl', ''
.namespace []

.sub '&lindex'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc < 1 goto bad_args

  .local pmc toList, getIndex
  toList  = get_root_global ['_tcl'], 'toList'
  getIndex = get_root_global ['_tcl'], 'getIndex'

  .local pmc list
  list = argv[0]
  list = toList(list)

have_list:
  if argc == 1 goto done

  $I0 = 0
select_elem:
  inc $I0
  if $I0 == argc goto done

  $P0 = argv[$I0]
  .local pmc indices
  push_eh not_a_list
    indices = toList($P0)
  pop_eh
  goto select

not_a_list:
  indices = new 'FixedPMCArray'
  indices = 1
  indices[0] = $P0

select:
  .local int index
  .local int elems
  elems = elements indices
  $I1 = 0
select_loop:
  if $I1 >= elems goto select_elem
  list = toList(list)

  $P0 = indices[$I1]
  index = getIndex($P0, list)

  $I2 = elements list
  if index >= $I2 goto empty
  if index < 0    goto empty

  list  = list[index]

  inc $I1
  goto select_loop

done:
  .return(list)

empty:
  .return('')

bad_args:
  die 'wrong # args: should be "lindex list ?index...?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
