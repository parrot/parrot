.HLL '_Tcl', ''
.namespace

.sub __listToDict
  .param pmc list

  .local int sizeof_list
  sizeof_list = elements list
  
  $I0 = mod sizeof_list, 2
  if $I0 == 1 goto odd_args

  .local pmc result
  result = new 'TclDict'

  .local int pos
  pos = 0
  
loop:
  if pos >= sizeof_list goto done
  $S1 = list[pos]
  inc pos
  $P2 = list[pos]
  inc pos
  $S0 = typeof $P2
  if $S0 == 'TclConst'  goto is_string
  if $S0 == 'TclString'  goto is_string
  if $S0 == 'String'  goto is_string
is_list:
  $P2 = __listToDict($P2)
  result[$S1] = $P2
  goto loop
  
is_string:
  # Can we listify the value here? If so, make it into a dictionary.
  $P3 = __list($P2)
  $I0 = elements $P3
  if $I0 <= 1 goto only_string
  push_eh only_string
    $P3 = __listToDict($P3)
  clear_eh
  result[$S1] = $P3
  goto loop

only_string:
  result[$S1] = $P2
  goto loop

done:
  .return (result)

odd_args:
  tcl_error 'missing value to go with key'
.end

.sub __stringToDict
  .param string str

  .local pmc list
  $P0 = new 'TclString'
  list = $P0.'get_list'(str)
  .return __listToDict(list)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
