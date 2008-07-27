.HLL 'Tcl', 'tcl_group'
.namespace []

.sub '&incr'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc < 1 goto bad_args
  if argc > 2 goto bad_args
  # get necessary conversion subs
  .local pmc toInteger
  toInteger = get_root_global ['_tcl'], 'toInteger'
  .local pmc readVar
  readVar = get_root_global ['_tcl'], 'readVar'
  .local pmc a_varName
  a_varName = argv[0]
  a_varName = readVar(a_varName)
  a_varName = toInteger(a_varName)
  .local pmc a_increment
  if argc < 2 goto default_increment
  a_increment = argv[1]
  a_increment = toInteger(a_increment)
  goto done_increment
default_increment:
  a_increment = new 'TclInt'
  a_increment = 1
done_increment:
  .local pmc R
  .local pmc temp

a_varName += a_increment
R = clone a_varName
  .return(R)
bad_args:
  tcl_error 'wrong # args: should be "incr varName ?increment?"'
.end

