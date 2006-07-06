###
# [upvar]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&upvar'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc < 2 goto bad_args
  
  .local pmc call_level,current_call_level, __call_level
  call_level = argv[0]
  .get_from_HLL(current_call_level, '_tcl', 'call_level')
  .get_from_HLL(__call_level, '_tcl', '__call_level')

  .local int defaulted
  (call_level,defaulted) = __call_level(call_level)
  if defaulted == 1 goto skip
  $P1 = shift argv

skip:
  # XXX Need error handling.
  
  # for each othervar/myvar pair, created a mapping from

  .local int counter,argc
  argc = argv
  counter = 0
loop:
  if counter >= argc goto done

  $I0 = call_level
  $I1 = current_call_level
 
  $S0 = argv[counter]
  inc counter
  $S1 = argv[counter]
 
  .local pmc __read, __set
  .get_from_HLL(__read, '_tcl', '__read')
  .get_from_HLL(__set, '_tcl', '__set')
  push_eh catch 
    $P1 = __read($S0)
    __set($S1, $P1)
  clear_eh
resume:

  inc counter
  goto loop
 
done:
  .return('')

catch:
  goto resume

bad_args:
  .throw('wrong # args: should be "upvar ?level? otherVar localVar ?otherVar localVar ...?"')
.end
