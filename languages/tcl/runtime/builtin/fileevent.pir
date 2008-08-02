.HLL 'Tcl', ''
.namespace []

.sub '&fileevent'
    .param pmc args :slurpy

    .local int argc
    argc = elements args

    if argc < 2 goto badargs
    if argc > 3 goto badargs

    .local pmc getChannel, compileTcl
    getChannel = get_root_global ['_tcl'], 'getChannel'
    compileTcl  = get_root_global ['_tcl'], 'compileTcl'

    .local pmc channel, script
    .local string event
    channel = args[0]
    event   = args[1]
    if event == 'readable' goto readable
    if event == 'writable' goto writable

    $S0 = 'bad event name "' . event
    $S0 .= '": must be readable or writable'
    die $S0

readable:
    channel = getChannel(channel)

    if argc == 2 goto readable_2

    .local pmc script
    script = args[2]
    script = compileTcl(script)

    .local pmc events
    events = get_root_global ['_tcl'], 'events'
    $P0    = new 'TclList'
    push events, $P0
    push $P0, channel
    push $P0, script

    .return('')

readable_2:
    .return('')

writable:
    channel = getChannel(channel)
    .return('')

badargs:
    die 'wrong # args: should be "fileevent channelId event ?script?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
