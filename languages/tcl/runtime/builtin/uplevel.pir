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
  .local pmc call_level, call_level_diff
  call_level      = get_root_global ['_tcl'], 'call_level'
  call_level_diff = get_root_global ['_tcl'], 'call_level_diff'

  .local pmc new_call_level, old_call_level
  new_call_level = argv[0]
  old_call_level = clone call_level
 
  .local int defaulted 
  (new_call_level,defaulted) = __call_level(new_call_level)
  if defaulted == 1 goto skip

  $P1 = shift argv # pop the call level argument 
skip:

  .local pmc difference
  difference = new .Integer
  difference = old_call_level - new_call_level

  # Set the new level 
  assign call_level, new_call_level
  call_level_diff += difference

  $S0 = join ' ', argv
  $P0 = __script($S0)
  # if we get an exception, we have to reset the environment
  push_eh restore_and_rethrow
    $P0 = $P0()
  clear_eh

  # restore the old level
  call_level_diff -= difference
  assign call_level, old_call_level

done:
  .return($P0)

restore_and_rethrow:
  .catch()

  # restore the old level
  call_level_diff -= difference
  assign call_level, old_call_level

  .rethrow()

bad_args:
  .throw('wrong # args: should be "uplevel ?level? command ?arg ...?"')
.end

