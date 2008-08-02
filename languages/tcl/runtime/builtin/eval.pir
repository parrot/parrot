.HLL 'Tcl', ''
.namespace []

.sub '&eval'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  unless argc goto bad_args

  .local pmc ns
  $P0 = getinterp
  ns  = $P0['namespace'; 1]

  .local pmc compileTcl
  compileTcl = get_root_global ['_tcl'], 'compileTcl'

  .local string code
  code = join ' ', argv
  $P2  = compileTcl(code, 'ns'=>ns)
  .return $P2()

bad_args:
  die 'wrong # args: should be "eval arg ?arg ...?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
