#!./parrot
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/pmc/testlib/test_server_ipv6.pir - Test server for the Socket PMC (IPv6 version)

=head1 DESCRIPTION

This server process is launched from t/pmc/socket.t to test the Socket PMC.

It listens on localhost:1234 and accepts only one connection. It echoes
everything it reads from that connection back to the client.

Upon successful startup the string "Server started" is printed to stdout.

After a timeout of 3 seconds, the process exits so it doesn't wait forever
in case of test failures.

=cut

.include 'socket.pasm'

.sub main :main
    .local pmc sock, address, conn
    .local string str, null_string
    .local int len, status

    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)
    address = sock.'getaddrinfo'(null_string, 1234, .PIO_PROTO_TCP, .PIO_PF_INET6, 0)
    sock.'bind'(address)
    sock.'listen'(5)

    say 'Server started'

    status = sock.'poll'(1, 3, 0)
    # timeout
    if status == 0 goto conn_done
    conn = sock.'accept'()
    str = conn.'local_address'()

    print 'Connection from '
    say str

    # echo incoming data
  recv_loop:
    status = conn.'poll'(1, 3, 0)
    # timeout
    if status == 0 goto recv_done
    str = conn.'recv'()
    len = length str
    if len == 0 goto recv_done
    conn.'send'(str)
    goto recv_loop

  recv_done:
    conn.'close'()
  conn_done:
    sock.'close'()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

