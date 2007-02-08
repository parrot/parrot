###
# [close]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&close'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv
    
    .return('')
.end
