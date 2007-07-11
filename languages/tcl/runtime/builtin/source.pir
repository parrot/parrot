###
# [source]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&source'
  .param pmc argv :slurpy
  
  .local int argc 
  argc = elements argv
  if argc != 1 goto bad_args

  .local string filename
  filename = shift argv

   .local pmc __precompiled
   __precompiled = get_root_global [ '_tcl' ], 'check_precompiled'

execute:
  push_eh badfile
    $P1 = __precompiled(filename)
  clear_eh
  .return $P1()

badfile:
  $S0 = "couldn't read file \""
  $S0 .= filename
  $S0 .= '": no such file or directory'
  tcl_error $S0

bad_args:
  tcl_error 'wrong # args: should be "source fileName"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
