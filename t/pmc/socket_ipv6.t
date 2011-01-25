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

    plan(10)

    check_for_ipv6()

# IPv6 and sockaddr doesn't work. The tests should use getaddrinfo
#    test_tcp_socket6()
#    test_raw_tcp_socket6()
#    test_udp_socket6()
#    test_raw_udp_socket6()

    test_bind()

    test_server()
.end

.sub test_bind
    .local pmc sock, addrinfo
    .local string str
    .local int result

    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)
    push_eh try_ip6_localhost
    addrinfo = sock.'getaddrinfo'('localhost', 1234, .PIO_PROTO_TCP, .PIO_PF_INET6, 1)
    goto ok
  try_ip6_localhost:
    pop_eh
    addrinfo = sock.'getaddrinfo'('ip6-localhost', 1234, .PIO_PROTO_TCP, .PIO_PF_INET6, 1)
  ok:
    result = sock.'bind'(addrinfo)
    is(result, 0, 'bind ok (IPv6 localhost)')

    str = sock.'local_address'()
    is(str, "::1:1234", "local address of bound socket is ::1")

    sock.'close'()

    sock.'socket'(.PIO_PF_INET, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)
    addrinfo = sock.'getaddrinfo'('localhost', 1234, .PIO_PROTO_TCP, .PIO_PF_INET, 1)
    result = sock.'bind'(addrinfo)
    is(result, 0, 'bind ok (IPv4 localhost)')

    str = sock.'local_address'()
    is(str, "127.0.0.1:1234", "local address of bound socket is 127.0.0.1")
    sock.'close'()
.end

.sub test_server
    .local pmc interp, conf, server, sock, address, result
    .local string command, str
    .local int status

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
    is(str, "Server started\n", 'Server process started')

    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)
    push_eh try_ip6_localhost
    address = sock.'getaddrinfo'('localhost', 1234, .PIO_PROTO_TCP, .PIO_PF_INET6, 0)
    goto ok
  try_ip6_localhost:
    pop_eh
    address = sock.'getaddrinfo'('ip6-localhost', 1234, .PIO_PROTO_TCP, .PIO_PF_INET6, 0)
  ok:
    status = sock.'connect'(address)
    nok(status, 'connect')

    str = server.'readline'()
    is(str, "Connection from ::1:1234\n", 'Server got a connection from ::1:1234')

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
    skip(4)
    exit 0
  done:
.end

.sub test_tcp_socket6
    .local pmc sock, sockaddr
    sock = new 'Socket'

    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)
    sockaddr = sock."sockaddr"("localhost",80, .PIO_PF_INET6)
    isa_ok(sockaddr,'Sockaddr',"A TCP ipv6 sockaddr to localhost was set")

    sockaddr = sock."sockaddr"("::1",80, .PIO_PF_INET6)
    isa_ok(sockaddr,'Sockaddr',"A TCP ipv6 sockaddr to ::1 was set")
.end

.sub test_raw_tcp_socket6
    .local pmc sock, sockaddr
    sock = new 'Socket'

    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_RAW, .PIO_PROTO_TCP)
    sockaddr = sock."sockaddr"("localhost",80,.PIO_PF_INET6)
    isa_ok(sockaddr,'Sockaddr',"A raw TCP ipv6 sockaddr to localhost was set:")
    sockaddr = sock."sockaddr"("::1",80,.PIO_PF_INET6)
    isa_ok(sockaddr,'Sockaddr',"A raw TCP ipv6 sockaddr to ::1 was set:")
.end

.sub test_udp_socket6
    .local pmc sock, sockaddr
    sock = new 'Socket'

    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_STREAM, .PIO_PROTO_UDP)
    sockaddr = sock."sockaddr"("localhost",80,.PIO_PF_INET6)
    isa_ok(sockaddr,'Sockaddr', "A UDP ipv6 sockaddr to localhost was set:")

    sockaddr = sock."sockaddr"("::1",80,.PIO_PF_INET6)
    isa_ok(sockaddr,'Sockaddr', "A UDP ipv6 sockaddr to ::1 was set:")
.end

.sub test_raw_udp_socket6
    .local pmc sock, sockaddr
    sock = new 'Socket'

    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_RAW, .PIO_PROTO_UDP)
    sockaddr = sock."sockaddr"("localhost",80,.PIO_PF_INET6)
    isa_ok(sockaddr,'Sockaddr', "A raw UDP ipv6 sockaddr to localhost was set: ")
    sockaddr = sock."sockaddr"("::1",80,.PIO_PF_INET6)
    isa_ok(sockaddr,'Sockaddr', "A raw UDP ipv6 sockaddr to ::1 was set: ")
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
