.HLL 'Tcl', ''
.namespace []

# XXX contains only enough for [package require tcltest]

.sub '&package'
    .param pmc args :slurpy

    .local int argc
    argc = args
    if argc < 2 goto bad_subcommand
    if argc > 3 goto bad_subcommand


    .local string subcommand, package_name
    subcommand = shift args
    if subcommand != 'require' goto check_present
    package_name = shift args
    if package_name != 'tcltest' goto bad_subcommand
    # XXX ignoring optional 3rd arg...

    .include 'iglobals.pasm'
    .local pmc tcl_library, config, interp
    tcl_library = get_global '$tcl_library'
    interp = getinterp
    config = interp[.IGLOBALS_CONFIG_HASH]
    .local string slash
    slash = config['slash']

    $S0 = tcl_library
    $S0 .= slash
    $S0 .= 'tcltest'
    $S0 .= slash
    $S0 .= 'tcltest.tcl'

    .local pmc script
    $P99 = open $S0, '<'
    $S0 = $P99.'slurp'('')

    script = get_root_global ['_tcl'], 'compileTcl'

    # compile to PIR and put the sub(s) in place...
    $P1 = script($S0, 'bsnl'=>1)
    $P1()



    # for now, fail (& succeed) silently
bad_subcommand:
   .return ('')

check_present:
   if subcommand != 'present' goto bad_subcommand
   $S0 = shift args
   $S0 = 'package ' . $S0
   $S0 .= ' is not present'
   die $S0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
