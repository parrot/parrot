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

    # check to see if name is an array
    $S0  = substr name, -1, 1
    unless $S0 == ')' goto store
    $S0  = name
    $I0  = index $S0, '('
    if $I0 == -1 goto store
    $S0 = name
    $S0 = "can't define \"" . $S0
    $S0 = $S0 . "\": name refers to an element in an array"
    tcl_error $S0

store:
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
