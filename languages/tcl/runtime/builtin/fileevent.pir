.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&fileevent'
    .param pmc args :slurpy

    .local int argc
    argc = elements args

    if argc < 2 goto badargs
    if argc > 3 goto badargs

    .local pmc __channel, __script
    __channel = get_root_global ['_tcl'], '__channel'
    __script  = get_root_global ['_tcl'], '__script'

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

    if argc == 2 goto readable_2

    .local pmc script
    script = args[2]
    script = __script(script)

    .local pmc events
    events = get_root_global ['_tcl'], 'events'
    $P0    = new .ResizablePMCArray
    push events, $P0
    push $P0, channel
    push $P0, script

    .return('')

readable_2:
    .return('')

writable:
    channel = __channel(channel)
    .return('')

badargs:
    tcl_error 'wrong # args: should be "fileevent channelId event ?script?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
