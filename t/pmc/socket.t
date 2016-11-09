#!./parrot
# Copyright (C) 2006-2014, Parrot Foundation.

=head1 NAME

t/pmc/socket.t - test the Socket PMC

=head1 SYNOPSIS

    % prove t/pmc/socket.t

=head1 DESCRIPTION

Tests the Socket PMC.

The IPv6-related tests are in F<t/pmc/socket_ipv6.t>.
We sometimes cannot even create an IPv6 family socket without
HAS_IPV6, see GH #1068.

=cut

.loadlib 'io_ops'
.loadlib 'sys_ops'
.include 'socket.pasm'
.include 'sysinfo.pasm'
.include 'iglobals.pasm'

.sub main :main
    .include 'test_more.pir'

    plan(24)

    test_init()
    test_get_fd()
    test_read()
    test_clone()
    test_bool()
    test_close()
    test_is_closed()
    test_tcp_socket()
    test_udp_socket()
    test_unix_socket()
    test_getprotobyname()
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

.sub test_getprotobyname
    new $P0, ['Socket']
    $I0 = $P0.'getprotobyname'("icmp")
    is($I0, 1, 'Socket getprotobyname(icmp) returned 1')

    $I0 = $P0.'getprotobyname'("tcp")
    is($I0, 6, 'Socket getprotobyname(tcp) returned 6')

    lives_ok(<<'CODE', "empty protocol name does not coredump")
.sub main
    new $P0, ['Socket']
    $I0 = $P0.'getprotobyname'("")
.end
CODE

    lives_ok(<<'CODE', "non-existent protocol name does not coredump")
.sub main
    new $P0, ['Socket']
    $I0 = $P0.'getprotobyname'("junk")
.end
CODE

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

    .return(sock)
.end

.sub test_tcp_socket
    test_create_socket(.PIO_PF_INET, .PIO_SOCK_STREAM, .PIO_PROTO_TCP, 'Created a TCP Socket')
.end

.sub test_udp_socket
    test_create_socket(.PIO_PF_INET, .PIO_SOCK_DGRAM, .PIO_PROTO_UDP, 'Created a UDP Socket')
.end

.sub test_unix_socket
    .local pmc sock, addr, os
    .local string os_str

    # Skip this test on Windows: sockaddr.t already tests that sockaddr()
    # fails.
    os_str = sysinfo .SYSINFO_PARROT_OS
    if os_str == 'MSWin32' goto windows

    sock = test_create_socket(.PIO_PF_UNIX, .PIO_SOCK_STREAM, 0, 'Created a Unix Socket')
    addr = sock.'sockaddr'('sock.local', 0, .PIO_PF_UNIX)

    os = new 'OS'

    push_eh null_handler
    os.'unlink'('sock.local')
null_handler:
    pop_eh
    sock.'bind'(addr)

    # This will throw an exception if no socket was created
    os.'unlink'('sock.local')
    goto end
windows:
    ok(1, "unix sockets not supported on windows")
end:
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

    .local int i, len, oldlen, readlen
    i = 0
  loop:
    str = concat str, "a"
    i = i + 1
    if i < 2048 goto loop
    oldlen = length str
    status = sock.'send'(str)
    is(status, oldlen, 'send() big')
    str = ""
    .local string tmpstr
  loop1:
    tmpstr = sock.'read'(1024)
    readlen = length tmpstr
    str = concat str, tmpstr
    len = length str
    # diag(len)
    if len == 0 goto bigger
    if len < oldlen goto loop1
  bigger:
    is(len, oldlen, 'read(1024) chunked')

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
