###
# [upvar]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&upvar'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc < 2 goto bad_args
  
  .local pmc call_level, __call_level
  .get_from_HLL(call_level, '_tcl', 'call_level')
  .get_from_HLL(__call_level, '_tcl', '__call_level')

  .local pmc new_call_level, orig_call_level
  orig_call_level = new .Integer
  assign orig_call_level, call_level
  .local int defaulted
  $P0 = argv[0]
  (new_call_level,defaulted) = __call_level($P0)
  if defaulted == 1 goto skip
  $P1 = shift argv

skip:
  # XXX Need error handling.
  
  # for each othervar/myvar pair, created a mapping from
 
  .local pmc __make, __set, __find_var
  .get_from_HLL(__make, '_tcl', '__make')
  .get_from_HLL(__set, '_tcl', '__set')
  .get_from_HLL(__find_var, '_tcl', '__find_var')

  .local int counter,argc
  argc = argv
  counter = 0
loop:
  if counter >= argc goto done
  
  $S0 = argv[counter]
  inc counter
  $S1 = argv[counter]
  
  $P0 = __find_var($S1)
  if null $P0 goto store_var
  $S0 = 'variable "'
  $S0 .= $S1
  $S0 .= '" already exists'
  .throw($S0)

store_var:
  assign call_level, new_call_level
  $P1 = __make($S0)
  assign call_level, orig_call_level
  __set($S1, $P1)

  inc counter
  goto loop
 
done:
  .return('')

bad_args:
  .throw('wrong # args: should be "upvar ?level? otherVar localVar ?otherVar localVar ...?"')
.end
