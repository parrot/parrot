.HLL 'Tcl', ''
.namespace []

.sub '&llength'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc != 1 goto bad_args
  # get necessary conversion subs
  .local pmc toList
  toList = get_root_global ['_tcl'], 'toList'
  .local pmc a_list
  a_list = argv[0]
  a_list = toList(a_list)
  .local pmc R
  .local pmc temp

$I0 = elements a_list
R  = new 'TclInt'
R  = $I0
  .return(R)
bad_args:
  die 'wrong # args: should be "llength list"'
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
