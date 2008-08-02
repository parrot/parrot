.HLL 'Tcl', ''
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
  .local pmc makeVar
  makeVar = get_root_global ['_tcl'], 'makeVar'
  .local pmc a_varName
  a_varName = argv[0]
  $P0 = makeVar(a_varName)
  $S0 = typeof $P0
  if $S0 != 'Undef' goto got_var
  .local pmc setVar
  setVar = get_root_global ['_tcl'], 'setVar'
  $P0 = setVar(a_varName,0)
got_var:
  a_varName = toInteger($P0)
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
  die 'wrong # args: should be "incr varName ?increment?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
