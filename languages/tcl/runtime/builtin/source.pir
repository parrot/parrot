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

  .local pmc IO
  .local string file_contents
  IO = getclass 'ParrotIO'
  push_eh badfile
    file_contents = IO.'slurp'( filename )
  clear_eh

  .local pmc ns, interp
  interp = getinterp
  ns = interp['namespace';1]

  .local pmc __script, code
  __script = get_root_global ['_tcl'], '__script'
  code = __script ( file_contents, 'ns' => ns, 'bsnl' => 1)

  .return code()

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
