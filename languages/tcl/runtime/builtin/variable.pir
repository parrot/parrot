###
# [variable]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&variable'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv
    if argc == 0 goto bad_args

    .local pmc __find_var, __store_var, __namespace
    __find_var  = get_root_global ['_tcl'], '__find_var'
    __store_var = get_root_global ['_tcl'], '__store_var'
    __namespace = get_root_global ['_tcl'], '__namespace'

    .local pmc iter, name, value, ns
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

    ns = __namespace(name)
    $S0 = ns[-1]
    # store as a lexical *and* a global
    __store_var($S0, value)
    __store_var(name, value, 'global'=>1)
    goto loop

no_value:
    ns = __namespace(name)
    $S0 = ns[-1]
    # if the variable exists, just insert it as a lexical
    # otherwise, create a new Undef and insert it as both lexical and global
    value = __find_var(name, 'global'=>1)
    if null value goto create_new
    __store_var($S0, value)
    goto end

create_new:
    value = new .Undef
    # store as a lexical *and* a global
    __store_var($S0, value)
    __store_var(name, value, 'global'=>1)

end:
    .return('')

bad_args:
    tcl_error 'wrong # args: should be "variable ?name value...? name ?value?"'
.end
