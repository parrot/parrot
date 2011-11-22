#!./parrot
# Copyright (C) 2006-2011, Parrot Foundation.

=head1 NAME

t/pmc/socket.t - test the Socket PMC

=head1 SYNOPSIS

    % prove t/pmc/socket.t

=head1 DESCRIPTION

Tests the Socket PMC.

The IPv6-related tests in this file do not actually require an IPv6 networking
stack, so we don't need to check if this parrot is IPv6-aware.

=cut

.include 'socket.pasm'
.include 'iglobals.pasm'

.sub main :main
    .include 'test_more.pir'

    plan(20)

    test_init()
    test_get_fd()
    test_read()
    test_readline()
    test_clone()
    test_bool()
    test_close()
    test_is_closed()
    test_tcp_socket()
    test_tcp_socket6()
    test_udp_socket()
    test_udp_socket6()
    test_server()

.end

.sub test_init
    new $P0, ['Socket']
    ok(1, 'Instantiated a Socket PMC')

    $S0 = typeof $P0
    is($S0, 'Socket', 'PMC has correct type')
.end

.sub test_get_fd
    new $P0, ['Socket']
    $N0 = $P0.'get_fd'()
    ok(1, "can get_fd a Socket")
.end

.sub test_read
    new $P0, ['Socket']
    $N0 = $P0.'read'(5)
    is($N0, 0, 'Socket read returns 0 when not connected')
.end

.sub test_readline
    new $P0, ['Socket']
    $N0 = $P0.'readline'()
    is($N0, 0, 'Socket readline returns 0 when not connected')
.end

.sub test_bool
    new $P0, ['Socket']
    nok($P0, 'get_bool on closed Socket')
.end

.sub test_close
    new $P0, ['Socket']
    $P0.'close'()
    ok(1, 'Closed a Socket')
    nok($P0,'A closed Socket returns False')
.end

.sub test_is_closed
    new $P0, ['Socket']

    $N0 = $P0.'is_closed'()
    is($N0, 1, 'Socket is_closed returned 1 to new socket')
.end

.sub test_clone
    new $P0, ['Socket']
    $P1 = $P0."sockaddr"("localhost", 1234)

    $P2 = clone $P0
    ok(1, 'Cloned a Socket PMC')

    $S0 = typeof $P2
    $S1 = 'Socket'

    $I0 = iseq $S0, $S1
    ok($I0, 'Cloned PMC has correct type TT#1820')
.end

.sub test_create_socket
    .param int pio_pf
    .param int pio_sock
    .param int pio_proto
    .param string msg

    .local pmc sock, ex
    .local int r
    r = 0
    push_eh failed
    sock = new 'Socket'
    sock.'socket'(pio_pf, pio_sock, pio_proto)
    pop_eh
    r = 1
    goto check
  failed:
    .get_results(ex)
    finalize ex
    pop_eh
    $S0 = ex['message']
    diag($S0)
  check:
    is(r, 1, msg)
.end

.sub test_tcp_socket
    test_create_socket(.PIO_PF_INET, .PIO_SOCK_STREAM, .PIO_PROTO_TCP, 'Created a TCP Socket')
.end

.sub test_tcp_socket6
    test_create_socket(.PIO_PF_INET6, .PIO_SOCK_STREAM, .PIO_PROTO_TCP, 'Created a IPv6 TCP Socket')
.end

.sub test_udp_socket6
    test_create_socket(.PIO_PF_INET6, .PIO_SOCK_DGRAM, .PIO_PROTO_UDP, 'Created a IPv6 UDP Socket')
.end

.sub test_udp_socket
    test_create_socket(.PIO_PF_INET, .PIO_SOCK_DGRAM, .PIO_PROTO_UDP, 'Created a UDP Socket')
.end

.sub test_server
    .local pmc interp, conf, server, sock, address, result
    .local string command, str, part
    .local int status, port

    interp = getinterp
    conf = interp[.IGLOBALS_CONFIG_HASH]

  run_tests:
    command = '"'
    str = conf['build_dir']
    command .= str
    str = conf['slash']
    command .= str
    command .= 'parrot'
    str = conf['exe']
    command .= str
    command .= '" t/pmc/testlib/test_server.pir'

    server = new 'FileHandle'
    server.'open'(command, 'rp')
    str = server.'readline'()
    part = substr str, 0, 34
    is(part, 'Server started, listening on port ', 'Server process started')
    part = substr str, 34, 4
    port = part

    sock = new 'Socket'
    result = sock.'socket'(.PIO_PF_INET, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)
    ok(result, 'socket')
    address = sock.'sockaddr'('localhost', port)
    sock.'connect'(address)
    status = sock.'send'('test message')
    is(status, '12', 'send')
    str = sock.'recv'()
    is(str, 'test message', 'recv')
    sock.'close'()

    server.'close'()
    status = server.'exit_status'()
    nok(status, 'Exit status of server process')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
