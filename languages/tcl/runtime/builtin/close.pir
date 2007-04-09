###
# [close]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&close'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv

    if argc != 1 goto bad_args
    
    .local string channel_id
    channel_id = argv[0]

    .local pmc channels, next_channel_id, io_obj
    channels = get_root_global ['_tcl'], 'channels'
    next_channel_id = get_root_global ['_tcl'], 'next_channel_id'

    io_obj = channels[channel_id]
    if null io_obj goto channelid_error

    io_obj.'flush'() # XXX refactor when we have events working
    close io_obj

    delete channels[channel_id]
    # XXX update channel ids (after "proper" way of handling ids is defined)

    .return('')

  channelid_error:
    $S0 = 'can not find channel name "'
    $S0 .= channel_id
    $S0 .= '"'
    tcl_error $S0

  bad_args:
    tcl_error 'wrong # args: should be "close channelId"'

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
