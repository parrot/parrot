.HLL 'Tcl', ''
.namespace []

.sub '&source'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc != 1 goto bad_args

  .local string filename
  filename = shift argv

  .local string file_contents
  $P99 = open filename, '<'
  push_eh badfile
    file_contents = $P99.'slurp'('')
  pop_eh

  .local pmc ns, interp
  interp = getinterp
  ns = interp['namespace';1]

  .local pmc compileTcl, code
  compileTcl = get_root_global ['_tcl'], 'compileTcl'
  code = compileTcl ( file_contents, 'ns' => ns, 'bsnl' => 1)

  .return code()

badfile:
  $S0 = "couldn't read file \""
  $S0 .= filename
  $S0 .= '": no such file or directory'
  die $S0

bad_args:
  die 'wrong # args: should be "source fileName"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
