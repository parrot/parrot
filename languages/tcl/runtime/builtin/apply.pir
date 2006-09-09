###
# [apply]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&apply'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc == 0 goto no_args

  tcl_return ''

no_args:
  tcl_error 'wrong # args: should be "apply lambdaExpr ?arg1 arg2 ...?"' 
.end
