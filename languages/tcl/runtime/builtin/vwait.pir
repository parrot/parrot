.HLL 'Tcl', ''
.namespace []

.sub '&vwait'
    .param pmc args :slurpy

    .local int argc
    argc = elements args

    if argc != 1 goto badargs
    .return('')

badargs:
    die 'wrong # args: should be "vwait name"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
