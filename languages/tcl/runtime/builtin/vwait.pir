.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&vwait'
    .param pmc args :slurpy

    .local int argc
    argc = elements args

    if argc != 1 goto badargs

    .return('')

badargs:
    tcl_error 'wrong # args: should be "vwait name"'
.end
