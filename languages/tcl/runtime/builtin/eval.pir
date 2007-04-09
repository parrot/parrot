###
# [eval]

#
# eval arg [... arg arg]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&eval'
  .param pmc argv :slurpy
 
  .local int argc
  argc = elements argv
  unless argc goto bad_args

  .local pmc ns
  $P0 = getinterp
  ns  = $P0['namespace'; 1]
 
  .local pmc __script
  __script = get_root_global ['_tcl'], '__script'

  .local string code
  code = join ' ', argv
  $P2  = __script(code, 'ns'=>ns)
  .return $P2()

bad_args:
  tcl_error 'wrong # args: should be "eval arg ?arg ...?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
