###
# [uplevel]

# Pretty much a copy of 'eval' except for the call_level...
# needs argument checking.

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&uplevel'
  .param pmc argv :slurpy
 
  .local int argc
  argc = elements argv
  if argc == 0 goto bad_args
 
  .local pmc __script, __call_level
  __script        = get_root_global ['_tcl'], '__script'
  __call_level    = get_root_global ['_tcl'], '__call_level'

  # save the old call level
  .local pmc call_chain
  .local int call_level
  call_chain = get_root_global ['_tcl'], 'call_chain'
  call_level = elements call_chain

  .local pmc new_call_level
  new_call_level = argv[0]
 
  .local int defaulted 
  (new_call_level,defaulted) = __call_level(new_call_level)
  if defaulted == 1 goto skip

  $P1 = shift argv # pop the call level argument 
skip:

  .local int difference
  $I0 = new_call_level
  difference = call_level - $I0

  .local pmc saved_call_chain
  saved_call_chain = new .ResizablePMCArray
  $I0 = 0
save_chain_loop:
  if $I0 == difference goto save_chain_end
  $P0 = pop call_chain
  push saved_call_chain, $P0
  inc $I0
  goto save_chain_loop
save_chain_end:

  $S0 = join ' ', argv
  # if we get an exception, we have to reset the environment
  .local pmc retval
  push_eh restore_and_rethrow
    $P0 = __script($S0)
    retval = $P0()
  clear_eh

  bsr restore
  .return(retval)

restore_and_rethrow:
  .catch()
  bsr restore
  .rethrow()

restore:
  # restore the old level
  $I0 = 0
restore_chain_loop:
  if $I0 == difference goto restore_chain_end
  $P0 = pop saved_call_chain
  push call_chain, $P0
  inc $I0
  goto restore_chain_loop
restore_chain_end:
  ret

bad_args:
  .throw('wrong # args: should be "uplevel ?level? command ?arg ...?"')
.end

