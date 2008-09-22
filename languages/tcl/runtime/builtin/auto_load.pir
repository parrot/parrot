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

  $S0 = tcl_library
  $S0 .= slash
  $S0 .= cmd
  $S0 .= '.tcl'

  .local pmc script
  $P99 = open $S0, '<'
  $S0 = $P99.'slurp'('')

  script = get_root_global ['_tcl'], 'compileTcl'

  # compile to PIR and put the sub in place...
  $P1 = script($S0)
  $P1()

  .return('')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
