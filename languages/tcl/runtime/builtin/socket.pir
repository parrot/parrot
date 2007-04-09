=head1 [socket]

Sockets!

=cut

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&socket'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv
    if argc < 2 goto bad_args
    if argc > 2 goto bad_args

    .local string host
    .local int port
    host = argv[0]
    port = argv[1]

    load_bytecode 'library/tcpstream.pir'
    .local pmc stream
    stream = new 'TCPStream'
    stream.'connect'(host, port)

    .local pmc channels, next_channel_id
    channels        = get_root_global ['_tcl'], 'channels'
    next_channel_id = get_root_global ['_tcl'], 'next_channel_id'

    .local string channel_id
    channel_id = 'sock'
    # get a new file channel name
    $S0 = next_channel_id
    channel_id .= $S0
    inc next_channel_id

    channels[channel_id] = stream

    .return(channel_id)

bad_args:
    tcl_error 'wrong # args: should be "socket ?-myaddr addr? ?-myport myport? ?-async? host port" or "socket -server command ?-myaddr addr? port"'
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
