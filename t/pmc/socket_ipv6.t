#!./parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/pmc/socket_ipv6.t - tests for the Socket PMC that require IPv6

=head1 SYNOPSIS

    % prove t/pmc/socket_ipv6.t

=head1 DESCRIPTION

IPv6-related tests for the Socket PMC.

=cut

.include 'socket.pasm'
.include 'iglobals.pasm'
.include 'errors.pasm'



.sub main :main
    .include 'test_more.pir'

    plan(11)

    check_for_ipv6()

    test_tcp_socket6()
    test_udp_socket6()

    test_bind()

    test_server()
.end

.sub test_bind
    .local pmc sock, addrinfo, addr, it
    .local string str
    .local string expected_host, expected_port, expected_str
    .local int count, port

    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)
    port = 1234
    push_eh error_6
  retry_6:
    addrinfo = sock.'getaddrinfo'('::1', port, .PIO_PROTO_TCP, .PIO_PF_INET6, 1)

    # output addresses for debugging
    it = iter addrinfo
    count = 1
  loop:
    addr = shift it
    print '# address '
    print count
    print ': family '
    $I0 = addr[0]
    print $I0
    print ', type '
    $I0 = addr[1]
    print $I0
    print ', protocol '
    $I0 = addr[2]
    print $I0
    print "\n"
    inc count
    if it goto loop

    sock.'bind'(addrinfo)
    goto started_6

  error_6:
    inc port
    if port < 1244 goto retry_6
    pop_eh
    .local pmc exception
    .get_results(exception)
    throw exception

  started_6:
    pop_eh
    str = sock.'local_address'()
    expected_port = port  # need to coerce into a string
    expected_str = "::1:" . expected_port
    is(str, expected_str, "local address of bound socket is ::1")

    sock.'close'()

    # start again with an IPv4 address
  retry_4:
    push_eh error_4

    sock.'socket'(.PIO_PF_INET, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)
    addrinfo = sock.'getaddrinfo'('127.0.0.1', port, .PIO_PROTO_TCP, .PIO_PF_INET, 1)
    sock.'bind'(addrinfo)
    goto started_4

  error_4:
    inc port
    if port < 1244 goto retry_4
    pop_eh
    .local pmc exception
    .get_results(exception)
    throw exception

  started_4:
    pop_eh
    str = sock.'local_address'()
    expected_port = port  # need to coerce into a string
    expected_str = "127.0.0.1:" . expected_port
    is(str, expected_str, "local address of bound socket is 127.0.0.1")

    sock.'close'()
.end

.sub test_server
    .local pmc interp, conf, server, sock, address, result
    .local string command, str, null_string, part, expected_str
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
    command .= '" t/pmc/testlib/test_server_ipv6.pir'

    server = new 'FileHandle'
    server.'open'(command, 'rp')
    str = server.'readline'()
    part = substr str, 0, 34
    is(part, 'Server started, listening on port ', 'Server process started')
    part = substr str, 34, 4
    port = part

    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)
    address = sock.'getaddrinfo'(null_string, port, .PIO_PROTO_TCP, .PIO_PF_INET6, 0)
    sock.'connect'(address)

    str = server.'readline'()
    expected_str = "Connection from ::1:" . part
    expected_str .= "\n"
    is(str, expected_str, 'Server got a connection')

    status = sock.'send'('test message')
    is(status, '12', 'send')
    str = sock.'recv'()
    is(str, 'test message', 'recv')
    sock.'close'()

    server.'close'()
    status = server.'exit_status'()
    nok(status, 'Exit status of server process')
.end

.sub check_for_ipv6
    $P0 = getinterp
    $P1 = $P0[.IGLOBALS_CONFIG_HASH]

    $P2 = $P1['HAS_IPV6']
    $I1 = isnull $P2
    if $I1, no_ipv6
    say '# This Parrot is IPv6-aware'
    goto done

  no_ipv6:
    diag( 'No IPv6' )
    skip(11)
    exit 0
  done:
.end

.sub test_tcp_socket6
    .local pmc sock, sockaddr

    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)

    sockaddr = sock."sockaddr"('::1', 80, .PIO_PF_INET6)
    isa_ok(sockaddr,'Sockaddr',"A TCP ipv6 sockaddr to localhost was set")

    sockaddr = sock."sockaddr"("::1", 80, .PIO_PF_INET6)
    isa_ok(sockaddr,'Sockaddr',"A TCP ipv6 sockaddr to ::1 was set")
.end

.sub test_udp_socket6
    .local pmc sock, sockaddr

    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_DGRAM, .PIO_PROTO_UDP)

    sockaddr = sock."sockaddr"('::1', 80, .PIO_PF_INET6)
    isa_ok(sockaddr,'Sockaddr', "A UDP ipv6 sockaddr to localhost was set:")

    sockaddr = sock."sockaddr"("::1", 80, .PIO_PF_INET6)
    isa_ok(sockaddr,'Sockaddr', "A UDP ipv6 sockaddr to ::1 was set:")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
