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

    tcl_error "XXX: bad call to return"

onearg:
    $P0 = argv[0]
    tcl_return $P0

empty:
    tcl_return ''
.end
