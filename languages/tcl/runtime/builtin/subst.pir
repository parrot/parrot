.HLL 'Tcl', 'tcl_group'
.namespace

# RT#40779: this is only a stub.

.sub '&subst'
  .param pmc argv :slurpy
 

  .local pmc options
  options = new .ResizablePMCArray
  options[0] = 'nobackslashes'
  options[1] = 'nocommands'
  options[2] = 'novariables'

  .local pmc select_switches, switches
  select_switches  = get_root_global ['_tcl'], 'select_switches'

  switches = select_switches(options, argv)

  .local int argc
  argc = elements argv 
  if argc != 1 goto badargs

  .local string original_string
  original_string = argv[0]

  # There are 3 switches, 2^3 = 8 combinations.
  # combine them into a bitmask..
  $I1 = exists switches['nobackslashes']
  $I2 = exists switches['nocommands']
  $I3 = exists switches['novariables']
  $I1 *= 4
  $I2 *= 2
  $I1 += $I2
  $I1 += $I3
  
  if $I1 == 0 goto no_diff
  if $I1 == 1 goto var_only
  if $I1 == 2 goto cmd_only
  if $I1 == 3 goto cmd_and_var
  if $I1 == 4 goto back_only
  if $I1 == 5 goto back_and_var
  if $I1 == 6 goto back_and_cmd

  # $I1 == 7
all_three:
back_only:
cmd_only:
var_only:
back_and_cmd:
back_and_var:
cmd_and_var:

no_diff:
  .return (original_string)

badargs:
    tcl_error 'wrong # args: should be "subst ?-nobackslashes? ?-nocommands? ?-novariables? string"'

.end
