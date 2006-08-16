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

  .local pmc sub, args, builtin

  $S0 = '&' . oldName
  push_eh doesnt_exist
    sub = get_root_global ['tcl'], $S0
  clear_eh

  # if the newName is '', just delete the sub
  .local int delete_only
  delete_only = 0
  if newName != '' goto delete_sub
  delete_only = 1


delete_sub:
  $P0 = get_root_namespace ['tcl']
  delete $P0[$S0]
  
  if delete_only goto delete_builtin

add_sub:
  # Create the new sub
  $S0 = '&' . newName
  # first check to make sure it doesn't already exist
  push_eh set_new_sub
    $P0 = get_root_global ['tcl'], $S0
  clear_eh

  $S0 = "can't rename to \""
  $S0 .= newName
  $S0 .= '": command already exists'
  tcl_error $S0

set_new_sub:
  set_root_global ['tcl'], $S0, sub


delete_builtin:
  push_eh delete_args
    builtin = get_root_global ['_tcl'; 'builtins'], oldName
  clear_eh
  
  $P0 = get_root_namespace ['_tcl'; 'builtins']
  delete $P0[oldName]

  if delete_only goto delete_args

add_builtin:
  set_root_global ['_tcl'; 'builtins'], newName, builtin


delete_args:
  $P0 = get_root_global ['_tcl'], 'proc_args'
  $I0 = exists $P0[oldName]
  unless $I0 goto return

  args = $P0[oldName]
  delete $P0[oldName]

  if delete_only goto return

add_args:
  $P0[newName] = args


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
