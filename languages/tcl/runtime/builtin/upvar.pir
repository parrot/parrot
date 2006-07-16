###
# [upvar]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&upvar'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc < 2 goto bad_args
  
  .local pmc call_level, call_level_diff, __call_level
  .get_from_HLL(call_level,      '_tcl', 'call_level')
  .get_from_HLL(call_level_diff, '_tcl', 'call_level_diff')
  .get_from_HLL(__call_level,    '_tcl', '__call_level')

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

  .local int counter, argc
  argc       = argv
  counter    = 0
  .local pmc difference
  difference = new .Integer
  difference = orig_call_level - new_call_level
loop:
  if counter >= argc goto done
  
  .local string old_var, new_var
  old_var = argv[counter]
  inc counter
  new_var = argv[counter]
  
  $P0 = __find_var(new_var)
  if null $P0 goto store_var
  $S0 = 'variable "'
  $S0 .= new_var
  $S0 .= '" already exists'
  .throw($S0)

store_var:
  assign call_level, new_call_level
  call_level_diff += difference
  $P1 = __make(old_var)
  call_level_diff -= difference
  assign call_level, orig_call_level
  __set(new_var, $P1)

  inc counter
  goto loop
 
done:
  .return('')

bad_args:
  .throw('wrong # args: should be "upvar ?level? otherVar localVar ?otherVar localVar ...?"')
.end

