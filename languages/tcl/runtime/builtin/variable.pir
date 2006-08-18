###
# [variable]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&variable'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv
    if argc == 0 goto bad_args

    .local pmc __set
    __set = get_root_global ['_tcl'], '__set'

    .local pmc iter, name, value
    iter = new .Iterator, argv
loop:
    unless iter goto end
    name = shift iter
    unless iter goto no_value
    value = shift iter
    __set(name, value)
    goto loop
no_value:
    value = new .Undef
    __set(name, value)
end:
    .return('')

bad_args:
    tcl_error 'wrong # args: should be "variable ?name value...? name ?value?"'
.end
