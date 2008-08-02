.HLL 'Tcl', ''
.namespace []

.sub '&variable'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv
    if argc == 0 goto bad_args

    .local pmc findVar, storeVar, splitNamespace
    findVar  = get_root_global ['_tcl'], 'findVar'
    storeVar = get_root_global ['_tcl'], 'storeVar'
    splitNamespace = get_root_global ['_tcl'], 'splitNamespace'

    .local pmc iter, name, value, ns
    iter = new 'Iterator', argv
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
    $S0 = $S0 . '": name refers to an element in an array'
    die $S0

store:
    unless iter goto no_value
    value = shift iter

    ns = splitNamespace(name)
    $S0 = ns[-1]
    # store as a lexical *and* a global
    storeVar($S0, value)
    storeVar(name, value, 'global'=>1)
    goto loop

no_value:
    ns = splitNamespace(name)
    $S0 = ns[-1]
    # if the variable exists, just insert it as a lexical
    # otherwise, create a new Undef and insert it as both lexical and global
    value = findVar(name, 'global'=>1)
    if null value goto create_new
    storeVar($S0, value)
    goto end

create_new:
    value = new 'Undef'
    # store as a lexical *and* a global
    storeVar($S0, value)
    storeVar(name, value, 'global'=>1)

end:
    .return('')

bad_args:
    die 'wrong # args: should be "variable ?name value...? name ?value?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
