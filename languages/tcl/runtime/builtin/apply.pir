.HLL 'Tcl', ''
.namespace []

.sub '&apply'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc == 0 goto no_args

  .local pmc toList, lambda
  toList = get_root_global ['_tcl'], 'toList'
  lambda = argv[0]
  lambda = toList(lambda)

  $I0 = elements lambda
  if $I0 < 2 goto bad_lambda
  if $I0 > 3 goto bad_lambda

  tcl_return ''

bad_lambda:
  $S0 = argv[0]
  $S0 = "can't interpret \"" . $S0
  $S0 = $S0 . "\" as a lambda expression"
  die $S0

no_args:
  die 'wrong # args: should be "apply lambdaExpr ?arg1 arg2 ...?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
