.HLL 'Tcl', ''
.namespace []

#
# When this sub is invoked, it will load in the actual definition
# of [parray] and replace this stub. This allows us to defer the cost of
# loading it for every partcl invocation.
#

#
# XXX Perhaps replace most of the guts here with a call to auto_load?
#
.sub '&parray'
  .param pmc args :slurpy

  .include 'iglobals.pasm'
  .local pmc tcl_library, config, interp
  tcl_library = get_global '$tcl_library'
  interp = getinterp
  config = interp[.IGLOBALS_CONFIG_HASH]
  .local string slash
  slash = config['slash']

  $S0 = tcl_library
  $S0 .= slash
  $S0 .= 'parray.tcl'

  .local pmc script
  $P99 = open $S0, '<'
  $S0 = $P99.'slurp'('')

  script = get_root_global ['_tcl'], 'compileTcl'

  # compile to PIR and put the sub in place...
  $P1 = script($S0)
  $P1()

  # Now call the version that we just created.
  $P3 = find_name '&parray'
  .return $P3( args :flat )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
