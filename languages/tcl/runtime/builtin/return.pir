###
# [return]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&return'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv

    if argc == 0 goto empty
    if argc == 1 goto onearg

    if argc != 3 goto bad_call
    $S0 = argv[0]
    $S1 = argv[1]
    $S2 = argv[2]

    if $S0 != '-code' goto bad_call
    if $S1 != 'error' goto bad_call

    tcl_error $S2

bad_call:
    tcl_error 'XXX: bad call to return'

onearg:
    $P0 = argv[0]
    tcl_return $P0

empty:
    tcl_return ''
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
