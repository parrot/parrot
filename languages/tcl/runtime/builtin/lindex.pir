###
# [source]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&lindex'
  .param pmc argv :slurpy
  
  .local int argc 
  argc = argv
  if argc < 1 goto bad_args
  
  .local pmc __list, __index
  __list  = get_root_global ['_tcl'], '__list'
  __index = get_root_global ['_tcl'], '__index'

  .local pmc list
  list = argv[0]
  list = __list(list)

have_list:
  if argc == 1 goto done

  $I0 = 0
select_elem:
  inc $I0
  if $I0 == argc goto done

  $P0 = argv[$I0]
  .local pmc indices
  push_eh not_a_list
    indices = __list($P0)
  clear_eh
  goto select

not_a_list:
  indices = new .FixedPMCArray
  indices = 1
  indices[0] = $P0

select:
  .local int index
  .local int elems
  elems = elements indices
  $I1 = 0
select_loop:
  if $I1 >= elems goto select_elem
  list = __list(list)
  
  $P0 = indices[$I1]
  index = __index($P0, list)
  list  = list[index]
  
  inc $I1
  goto select_loop

done:
  .return(list)

bad_args:
  tcl_error 'wrong # args: should be "lindex list ?index...?"'
.end
