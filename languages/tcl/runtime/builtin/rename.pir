###
# [rename]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&rename'
  .param pmc argv :slurpy

  .local int argc
  argc = argv
  if argc != 2 goto bad_args

  .local string oldName, newName
  oldName = argv[0]
  newName = argv[1]

  # Change the epoch
  $P0 = get_root_global ['_tcl'], 'epoch'
  inc $P0

  .local pmc sub, args, builtin, ns

  $P1 = getinterp
  ns = $P1['namespace'; 1]

  $S0 = '&' . oldName
  sub = ns[$S0]
  if null sub goto doesnt_exist

  # if the newName is '', just delete the sub
  .local int delete_only
  delete_only = 0
  if newName != '' goto delete_sub
  delete_only = 1

delete_sub:
  delete ns[$S0]
  
  if delete_only goto delete_builtin

add_sub:
  # Create the new sub
  $S0 = '&' . newName
  # first check to make sure it doesn't already exist
  $P0 = ns[$S0]
  if null $P0 goto set_new_sub

  $S0 = "can't rename to \""
  $S0 .= newName
  $S0 .= '": command already exists'
  tcl_error $S0

set_new_sub:
  ns[$S0] = sub

delete_builtin:
  builtin = get_root_global ['_tcl'; 'builtins'], oldName
  if null builtin goto return
  
  $P0 = get_root_namespace ['_tcl'; 'builtins']
  delete $P0[oldName]

  if delete_only goto return

add_builtin:
  set_root_global ['_tcl'; 'builtins'], newName, builtin

return:
  .return('')

doesnt_exist:
  if newName == '' goto cant_delete

  $S0 = "can't rename \""
  $S0 .= oldName
  $S0 .= "\": command doesn't exist"
  tcl_error $S0

cant_delete:
  $S0 = "can't delete \""
  $S0 .= oldName
  $S0 .= "\": command doesn't exist"
  tcl_error $S0

bad_args:
  tcl_error 'wrong # args: should be "rename oldName newName"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
