.HLL 'Tcl', ''
.namespace []

.sub '&auto_load'
  .param string cmd

  .include 'iglobals.pasm'
  .local pmc tcl_library, config, interp
  tcl_library = get_global '$tcl_library'
  interp = getinterp
  config = interp[.IGLOBALS_CONFIG_HASH]
  .local string slash
  slash = config['slash']

  # strip off the leading :: if present.
  # XXX This is a big hack.

  $I0 = length cmd
  if $I0 < 3 goto filename
  $S0 = substr cmd, 0, 2
  if $S0 != '::' goto filename
  substr cmd, 0, 2, ''

filename:
  $S0 = tcl_library
  $S0 .= slash
  $S0 .= cmd
  $S0 .= '.tcl'

  .local pmc script
  $P99 = open $S0, '<'
  $S0 = $P99.'slurp'('')

  script = get_root_global ['_tcl'], 'compileTcl'

  # compile to PIR and put the sub in place...
  $P1 = script($S0, 'bsnl'=>1)
  $P1()

  .return('')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
