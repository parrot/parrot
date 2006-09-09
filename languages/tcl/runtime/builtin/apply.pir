###
# [apply]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&apply'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc == 0 goto no_args

  .local pmc __list, lambda
  __list = get_root_global ['_tcl'], '__list'
  lambda = argv[0]
  lambda = __list(lambda)

  $I0 = elements lambda
  if $I0 < 2 goto bad_lambda
  if $I0 > 3 goto bad_lambda

  tcl_return ''

bad_lambda:
  $S0 = argv[0]
  $S0 = "can't interpret \"" . $S0
  $S0 = $S0 . "\" as a lambda expression"
  tcl_error $S0

no_args:
  tcl_error 'wrong # args: should be "apply lambdaExpr ?arg1 arg2 ...?"' 
.end
