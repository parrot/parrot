.HLL 'Tcl', ''
.namespace []

.sub '&continue'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv

    if argc != 0 goto bad_args

    tcl_continue

bad_args:
    die 'wrong # args: should be "continue"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
