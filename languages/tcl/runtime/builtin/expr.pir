.HLL 'Tcl', ''
.namespace []

.sub '&expr'
  .param pmc argv :slurpy

  .local string expr
  .local int argc
  .local int looper

  .local pmc compileExpr
  compileExpr = get_root_global ['_tcl'], 'compileExpr'

  expr = ''
  looper = 0
  argc = elements argv
  unless argc goto no_args

  expr = join ' ', argv

loop_done:
  .local pmc ns
  $P0 = getinterp
  ns  = $P0['namespace'; 1]

  $P1 = compileExpr(expr, 'ns'=>ns)
  $P2 = $P1()
  .return ($P2)

no_args:
  die 'wrong # args: should be "expr arg ?arg ...?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
