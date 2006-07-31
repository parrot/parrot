###
# [expr]

#
# expr arg [... arg arg]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&expr'
  .param pmc argv :slurpy
 
  .local string expr
  .local int argc
  .local int looper

  .local pmc __expr
  __expr = get_root_global ['_tcl'], '__expr'

  expr = ''
  looper = 0
  argc = argv 
  unless argc goto no_args

  expr = join ' ', argv

loop_done:
  $P1 = __expr(expr)
  $P2 = $P1()
  .return ($P2)

no_args:
  .throw('wrong # args: should be "expr arg ?arg ...?"')
.end
