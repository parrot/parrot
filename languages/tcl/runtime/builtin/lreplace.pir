##
# [lreplace]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&lreplace'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv
    if argc < 3 goto bad_args

    .local pmc list, __list, retval, iterator, __index
    __list = get_root_global ['_tcl'], '__list'
    __index = get_root_global ['_tcl'], '__index'
    $P0 = shift argv
    list = __list($P0)
    list = clone list

    .local int first,last, count, size
    size = list
    $S0 = shift argv
    first = __index($S0,list)
    $S0  = shift argv
    last = __index($S0,list)

    if last < size goto last_2
    last = size
    dec last
  last_2:
    if last >= 0 goto first_1
    last = 0
  first_1:
    if first >= 0 goto ok
    first = 0

  ok:
    count = last - first
    dec count

    splice list, argv, first, count

    .return (list)

  bad_args:
    tcl_error 'wrong # args: should be "lreplace list first last ?element element ...?"'
.end
