###
# [rename]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&rename'
  .param pmc argv :slurpy

  .local int argc
  argc = argv

  if argc != 2 goto error
  .local string old_s
  old_s = argv[0]
  .local string new_s
  new_s = argv[1]

  # Change the epoch
  .get_from_HLL($P0, '_tcl', 'epoch')
  inc $P0

  .local string old_proc,new_proc
  old_proc = '&' . old_s
  new_proc = '&' . new_s

 
  .local pmc theSub
  # Grab the original sub
  push_eh doesnt_exist
    theSub = find_global old_proc
  clear_eh
  
  # see if an inlinable helper sub exists
  .get_from_HLL($P1, '_tcl'; 'builtins', old_s)

  # If newName is empty, then just delete
  if new_s == '' goto delete

add:
  # Create the new sub
  store_global new_proc, theSub
  
  if null $P1 goto delete
  # Create the new inlinable helper sub
  .set_in_HLL('_tcl'; 'builtins', new_s, $P1)

delete:
  null theSub
  store_global old_proc, theSub
  
  if null $P1 goto return
  # Delete the old inlinable helper sub
  .include 'interpinfo.pasm'
  $P1 = interpinfo .INTERPINFO_NAMESPACE_ROOT
  $P1 = $P1['_tcl'; 'builtins']
  delete $P1[old_s]

return:
  .return('')

doesnt_exist:
  $S0 = "can't rename \""
  $S0 .= old_s
  $S0 .= "\": command doesn't exist"
  .throw ($S0)

error:
  .throw ('wrong # args: should be "rename oldName newName"')

.end
