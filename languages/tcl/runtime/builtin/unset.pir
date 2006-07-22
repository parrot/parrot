###
# [unset]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&unset'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv

  .local pmc find_var, var
  .get_from_HLL(find_var, '_tcl', '__find_var')

  .local string name
  .local int i
  i = 0
loop:
  if i == argc goto loop_end
  name = argv[i]
  # is this an array?
  # ends with )
  .local int char
  char = ord name, -1
  if char != 41 goto scalar
  # contains a (
  char = index name, '('
  if char == -1 goto scalar

array:
  .local string array_name
  array_name = substr name, 0, char
  
  .local string key
  .local int len
  len = length name
  len -= char
  len -= 2
  inc char
  key = substr name, char, len
 
  var = find_var(array_name)
  if null var goto no_such_var
  
  $I0 = exists var[key]
  if $I0 == 0 goto no_such_element
  delete var[key]
  goto next

no_such_element:
  $S0 = "can't unset \""
  $S0 .= name
  $S0 .= '": no such element in array'
  .throw($S0)

scalar:
  var = find_var(name)
  if null var goto no_such_var

  null var
  .local pmc store_var
  .get_from_HLL(store_var, '_tcl', '__store_var')
  store_var(name, var)
  # goto next

next:
  inc i
  goto loop

loop_end:
  .return('')

no_such_var:
  $S0 = "can't unset \""
  $S0 .= name
  $S0 .= '": no such variable'
  .throw($S0)
.end

