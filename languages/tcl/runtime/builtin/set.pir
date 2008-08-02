.HLL 'Tcl', ''
.namespace []

.sub '&set'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc < 1 goto bad_args
  if argc > 2 goto bad_args
  # get necessary conversion subs
  .local pmc a_varName
  a_varName = argv[0]
  .local pmc a_newValue
  if argc < 2 goto default_newValue
  a_newValue = argv[1]
  goto done_newValue
default_newValue:
  null a_newValue
done_newValue:
  .local pmc R
  .local pmc temp

  if null a_newValue goto read_var

  .local pmc set
  set = get_root_global ['_tcl'], 'setVar'
  R = set(a_varName, a_newValue)
  goto end

read_var:
  .local pmc read
  read = get_root_global ['_tcl'], 'readVar'
  R = read(a_varName)

end:
  R = clone R
  .return(R)
bad_args:
  die 'wrong # args: should be "set varName ?newValue?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

