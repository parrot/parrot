.HLL 'Tcl', ''
.namespace []

.sub '&cd'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv

  if argc >= 2 goto bad_args
  if argc == 0 goto noargs

  .local string dir
  dir = argv[0]
  goto cd_it

noargs:
  $P0 = new 'Env'
  dir = $P0['HOME']

cd_it:
  $P0 = new 'OS'
  $S0 = $P0.'chdir'(dir)
  .return  ($S0)

bad_args:
  die 'wrong # args: should be "cd ?dirName?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
