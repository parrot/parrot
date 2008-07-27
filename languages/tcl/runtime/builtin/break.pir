.HLL 'Tcl', 'tcl_group'
.namespace []

.sub '&break'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv

    if argc != 0 goto bad_args

    tcl_break

bad_args:
    tcl_error 'wrong # args: should be "break"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
