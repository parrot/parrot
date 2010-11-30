#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.

=head1 NAME

t/pmc/socket.t - test the Socket PMC

=head1 SYNOPSIS

    % prove t/pmc/socket.t

=head1 DESCRIPTION

Tests the Socket PMC.

=cut

.include 'socket.pasm'
.sub main :main
    .include 'test_more.pir'

    plan(16)

    test_init()
    test_clone()
    test_bool()
    test_close()
    test_tcp_socket()
    test_tcp_socket6()
    test_raw_tcp_socket()
    test_raw_tcp_socket6()
    test_udp_socket()
    test_udp_socket6()
    test_raw_udp_socket()
    test_raw_udp_socket6()

.end

.sub test_init
    new $P0, ['Socket']
    ok(1, 'Instantiated a Socket PMC')

    $N0 = $P0.'get_fd'()
    isnt($N0, -1, 'Socket get_fd did not return -1')

    $S0 = typeof $P0
    is($S0, 'Socket', 'PMC has correct type')
.end

.sub test_bool
    new $P0, ['Socket']
    ok($P0, 'get_bool on Socket')
.end

.sub test_close
    new $P0, ['Socket']
    $P0.'close'()
    ok(1, 'Closed a Socket')
    nok($P0,'A closed Socket returns False')
.end

.sub test_clone
    new $P0, ['Socket']
    $P1 = $P0."sockaddr"("localhost", 1234)

    $P2 = clone $P1
    ok(1, 'Cloned a Socket PMC')

    $S0 = typeof $P2
    $S1 = 'Socket'
    $I0 = iseq $S0, $S1
    todo($I0, 'Cloned PMC has correct type TT#1820')
.end

.sub test_tcp_socket
    .local pmc sock
    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)
    ok(sock, 'Created a TCP Socket')
.end

.sub test_tcp_socket6
    .local pmc sock
    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)
    ok(sock, 'Created a IPv6 TCP Socket')
.end

.sub test_raw_tcp_socket6
    .local pmc sock
    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_RAW, .PIO_PROTO_TCP)
    ok(sock, 'Created a raw IPv6 TCP Socket')
.end

.sub test_udp_socket6
    .local pmc sock
    sock = new 'Socket'

    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_STREAM, .PIO_PROTO_UDP)
    ok(sock, 'Created a IPv6 UDP Socket')
.end

.sub test_raw_udp_socket6
    .local pmc sock
    sock = new 'Socket'

    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_RAW, .PIO_PROTO_UDP)
    ok(sock, 'Created a raw IPv6 UDP Socket')
.end

.sub test_raw_tcp_socket
    .local pmc sock
    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET, .PIO_SOCK_RAW, .PIO_PROTO_TCP)
    ok(sock, 'Created a raw TCP Socket')
.end

.sub test_udp_socket
    .local pmc sock
    sock = new 'Socket'

    sock.'socket'(.PIO_PF_INET, .PIO_SOCK_STREAM, .PIO_PROTO_UDP)
    ok(sock, 'Created a UDP Socket')
.end

.sub test_raw_udp_socket
    .local pmc sock
    sock = new 'Socket'

    sock.'socket'(.PIO_PF_INET, .PIO_SOCK_RAW, .PIO_PROTO_UDP)
    ok(sock, 'Created a raw UDP Socket')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
