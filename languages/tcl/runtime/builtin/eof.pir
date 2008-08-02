.HLL 'Tcl', ''
.namespace []

.sub '&eof'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv

    if argc != 1 goto bad_args

    .local pmc getChannel,channel
    getChannel = get_root_global ['_tcl'], 'getChannel'

    channel = shift argv
    channel = getChannel(channel)

    .local int eof
    eof = isfalse channel

    .return(eof)
bad_args:
    die 'wrong # args: should be "eof channelId"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
