###
# [unset]

.HLL 'Tcl', 'tcl_group'
.namespace [ '' ]

.sub "&unset"
  .param pmc argv :slurpy

  # For now, pretend the usage is "unset <foo>"

  .local int argc
  argc = argv

  .local string name
  name = argv[0]
  .local pmc find_var, var
  .get_from_HLL(find_var, '_tcl', '__find_var')
  
  # is this an array?
  # ends with )
  .local int char
  char = ord name, -1
  if char != 41 goto scalar
  # contains a (
  char = index name, "("
  if char == -1 goto scalar

array:
  .local string array
  array = substr name, 0, char
  
  .local string key
  .local int len
  len = length name
  len -= char
  len -= 2
  inc char
  key = substr name, char, len
  
  push_eh no_such_var
    var = find_var(array)
  clear_eh
  if null var goto no_such_var
  
  $I0 = exists var[key]
  if $I0 == 0 goto no_such_element
  delete var[key]
  .return("")

no_such_element:
  $S0 = "can't unset \""
  $S0 .= name
  $S0 .= "\": no such element in array"
  .throw($S0)

scalar:
  push_eh no_such_var
    var = find_var(name)
  clear_eh
  if null var goto no_such_var

  null var
  .local pmc store_var
  .get_from_HLL(store_var, '_tcl', '__store_var')
  store_var(name, var)
  .return("")

no_such_var:
  $S0 = "can't unset \""
  $S0 .= name
  $S0 .= "\": no such variable"
  .throw($S0)
.end
