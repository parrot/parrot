.HLL 'Tcl', ''
.namespace []

.sub '&lreplace'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv
    if argc < 3 goto bad_args

    .local pmc list, toList, retval, iterator, getIndex
    toList = get_root_global ['_tcl'], 'toList'
    getIndex = get_root_global ['_tcl'], 'getIndex'
    $P0 = shift argv
    list = toList($P0)
    list = clone list

    .local int size
    size = elements list

    .local int first, last, count
    $S0 = shift argv
    first = getIndex($S0,list)
    $S0  = shift argv
    last = getIndex($S0,list)

    if size == 0   goto empty
    if last < size goto first_1
    last = size
    dec last
first_1:
    if first >= 0 goto ok
    first = 0

ok:
    if first >= size goto doesnt_contain_elem

    count = last - first
    inc count
    if count < 0 goto insert

    splice list, argv, first, count
    .return(list)

insert:
    splice list, argv, first, 0
    .return(list)

empty:
    splice list, argv, 0, 0
    .return(list)

bad_args:
    die 'wrong # args: should be "lreplace list first last ?element element ...?"'

doesnt_contain_elem:
    $S0 = first
    $S0 = "list doesn't contain element " . $S0
    die $S0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
