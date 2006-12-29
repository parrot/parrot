.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&fileevent'
    .param pmc args :slurpy

    .local int argc
    argc = elements args

    if argc < 2 goto badargs
    if argc > 3 goto badargs

    .local pmc __channel
    __channel = get_root_global ['_tcl'], '__channel'

    .local pmc channel, script
    .local string event
    channel = args[0]
    event   = args[1]
    if event == 'readable' goto readable
    if event == 'writable' goto writable

    $S0 = 'bad event name "' . event
    $S0 .= '": must be readable or writable'
    tcl_error $S0

readable:
    channel = __channel(channel)
    .return('')

writable:
    channel = __channel(channel)
    .return('')

badargs:
    tcl_error 'wrong # args: should be "fileevent channelId event ?script?"'
.end
