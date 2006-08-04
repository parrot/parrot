###
# [source]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&lindex'
  .param pmc argv :slurpy
  
  .local int argc 
  argc = argv
  if argc < 1 goto bad_args
  
  .local pmc __list, _list_index
  __list      = get_root_global ['_tcl'], '__list'
  _list_index = get_root_global ['_tcl'], '_list_index'

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
  indices = __list($P0)
  
  .local int index
  .local int elems
  elems = elements indices
  $I1 = 0
select_loop:
  if $I1 >= elems goto select_elem
  list = __list(list)
  
  $P0 = indices[$I1]
  index = _list_index(list, $P0)
  list  = list[index]
  
  inc $I1
  goto select_loop

done:
  .return(list)

bad_args:
  .throw('wrong # args: should be "lindex list ?index...?"')
.end
