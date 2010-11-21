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

    plan(4)

    check_for_ipv6()

    test_tcp_socket6()
    test_raw_tcp_socket6()
    test_udp_socket6()
    test_raw_udp_socket6()
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
    sockaddr = sock."sockaddr"("::1",80)
    ok(sockaddr,"A TCP ipv6 sockaddr was set")
.end

.sub test_raw_tcp_socket6
    .local pmc sock, sockaddr
    sock = new 'Socket'

    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_RAW, .PIO_PROTO_TCP)
    sockaddr = sock."sockaddr"("::1",80)
    ok(sockaddr,"A raw TCP ipv6 sockaddr was set")
.end

.sub test_udp_socket6
    .local pmc sock, sockaddr
    sock = new 'Socket'

    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_STREAM, .PIO_PROTO_UDP)
    sockaddr = sock."sockaddr"("::1",80)
    ok(sockaddr,"A UDP ipv6 sockaddr was set")
.end

.sub test_raw_udp_socket6
    .local pmc sock, sockaddr
    sock = new 'Socket'

    sock.'socket'(.PIO_PF_INET6, .PIO_SOCK_RAW, .PIO_PROTO_UDP)
    sockaddr = sock."sockaddr"("::1",80)
    ok(sockaddr,"A raw UDP ipv6 sockaddr was set")
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
