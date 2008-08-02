.HLL 'Tcl', ''
.namespace []

.sub '&upvar'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc < 2 goto bad_args

  .local pmc getCallLevel, call_chain
  .local int call_level
  getCallLevel = get_root_global ['_tcl'], 'getCallLevel'
  call_chain   = get_root_global ['_tcl'], 'call_chain'
  call_level   = elements call_chain

  .local int new_call_level, defaulted
  $P0 = argv[0]
  (new_call_level,defaulted) = getCallLevel($P0)
  if defaulted == 1 goto skip
  $P1 = shift argv
  dec argc

skip:
  $I0 = argc % 2
  if $I0 == 1 goto bad_args

  # for each othervar/myvar pair, created a mapping from

  .local pmc makeVar, setVar, findVar
  makeVar     = get_root_global ['_tcl'], 'makeVar'
  setVar      = get_root_global ['_tcl'], 'setVar'
  findVar = get_root_global ['_tcl'], 'findVar'

  .local int counter, argc
  argc       = elements argv
  counter    = 0
  .local int difference
  difference = call_level - new_call_level
loop:
  if counter >= argc goto done

  .local string old_var, new_var
  old_var = argv[counter]
  inc counter
  new_var = argv[counter]

  if new_call_level == 0 goto store_var
  $P0 = findVar(new_var, 'depth'=>1)
  if null $P0 goto store_var
  $S0 = 'variable "'
  $S0 .= new_var
  $S0 .= '" already exists'
  die $S0

store_var:
  .local pmc saved_call_chain
  saved_call_chain = new 'TclList'
  $I0 = 0
save_chain_loop:
  if $I0 == difference goto save_chain_end
  $P0 = pop call_chain
  push saved_call_chain, $P0
  inc $I0
  goto save_chain_loop
save_chain_end:

  $P1 = makeVar(old_var, 'depth'=>1)

  # restore the old level
  $I0 = 0
restore_chain_loop:
  if $I0 == difference goto restore_chain_end
  $P0 = pop saved_call_chain
  push call_chain, $P0
  inc $I0
  goto restore_chain_loop
restore_chain_end:

  # because we don't want to use assign here (we want to provide a new
  # alias, not use an existing one), do this work by hand

  if call_level goto lexical

  .local pmc ns
  .local string name
  ns   = splitNamespace(new_var, 1)
  name = pop ns
  name = '$' . name

  unshift ns, 'tcl'
  ns = get_root_namespace ns
  ns[name] = $P1
  inc counter
  goto loop

lexical:
  $P0 = call_chain[-1]
  $S0 = '$' . new_var
  $P0[$S0] = $P1
  inc counter
  goto loop

done:
  .return('')

bad_args:
  die 'wrong # args: should be "upvar ?level? otherVar localVar ?otherVar localVar ...?"'
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
