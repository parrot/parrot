.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&after'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc == 0 goto bad_args
  
  $I0 = argv[0]
  $N0 = $I0 / 1000
  sleep $N0

  .return('')

bad_args:
  .throw('wrong # args: should be "after option ?arg arg ...?"')
.end

