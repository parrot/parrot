.HLL 'Tcl', ''
.namespace []

.sub '&exit'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv

    if argc > 1 goto bad_args

    .local int returnCode
    returnCode = 0
    if argc == 0 goto got_returnCode

    .local pmc toInteger
    toInteger = get_root_global ['_tcl'], 'toInteger'
    .local pmc arg
    arg = shift argv
    arg = toInteger(arg)

    returnCode = arg

got_returnCode:

    exit returnCode

bad_args:
    die 'wrong # args: should be "exit ?returnCode?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
