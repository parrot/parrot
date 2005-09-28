###
# [source]

.namespace [ "Tcl" ]

.sub "&lindex"
  .param pmc argv :slurpy
  
  .local int argc 
  argc = argv
  if argc < 1 goto bad_args
  
  .local pmc __list, _list_index
  __list      = find_global "_Tcl", "__list"
  _list_index = find_global "_Tcl", "_list_index"

  .local pmc list
  list = argv[0]
  list = __list(list)

have_list:
  if argc == 1 goto done

select_elem:
  $P0 = argv[1]
  .local pmc indices
  indices = __list($P0)
  
  .local int index
  .local int elems
  elems = indices
  $I0 = 0
select_loop:
  if $I0 >= elems goto done
  list = __list(list)
  
  $P0 = indices[$I0]
  index = _list_index(list, $P0)
  list  = list[index]
  
  inc $I0
  goto select_loop

done:
  .return(list)

bad_args:
  .throw("wrong # args: should be \"lindex list ?index...?\"")

.end
