#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.

=head1 NAME

t/pmc/sockaddr.t - test the Sockaddr PMC

=head1 SYNOPSIS

    % prove t/pmc/sockaddr.t

=head1 DESCRIPTION

Test the Sockaddr PMC.

=cut

.include 'socket.pasm'
.include 'sysinfo.pasm'
.loadlib 'sys_ops'

.sub main :main
    .include 'test_more.pir'

    plan(10)

    test_basic()
    test_bool()
    test_string()
    test_unix()
    test_unix_empty()
.end

.sub test_basic
    new $P0, ['Socket']
    ok(1, 'Instantiated a Socket PMC')

    $P1 = $P0."sockaddr"("localhost", 1234)
    ok(1, 'socket.sockaddr method successful')

    $I0 = isnull $P0
    $I0 = not $I0
    ok($I0, 'Sockaddr PMC created')

    $S0 = typeof $P1
    is($S0, 'Sockaddr', 'PMC has correct type')

    $P2 = clone $P1
    $S2 = typeof $P2
    is($S2, 'Sockaddr', 'PMC clone has correct type')
.end

.sub test_bool
    $P0 = new 'Socket'
    $P1 = $P0."sockaddr"("localhost", 1234)
    ok($P1, 'get_bool on a SockAddr')
.end

.sub test_string
    $P0 = new 'Socket'

    $P1 = $P0."sockaddr"("localhost", 1234)
    is($P1,"127.0.0.1:1234","sockaddr stringification")

    null $S0
    $P1 = $P0."sockaddr"($S0, 56789)
    is($P1,"127.0.0.1:56789","sockaddr stringification")
.end

.sub test_unix
    .local pmc sock, addr
    .local string os

    sock = new 'Socket'
    os = sysinfo .SYSINFO_PARROT_OS
    if os == 'MSWin32' goto skip

    addr = sock."sockaddr"("sock.local", 0, .PIO_PF_UNIX)
    is(addr,"sock.local","sockaddr_un stringification")

    goto end
skip:
    push_eh null_handler
    addr = sock."sockaddr"("sock.local", 0, .PIO_PF_UNIX)

    ok(0, "exception not thrown")

null_handler:
    pop_eh
    ok(1, "exception caught")
end:
.end

.sub test_unix_empty
    .local pmc sock, addr
    .local string os

    os = sysinfo .SYSINFO_PARROT_OS
    if os == 'MSWin32' goto windows

    sock = new 'Socket'
    push_eh null_handler
    null $S0
    addr = sock."sockaddr"($S0, 0, .PIO_PF_UNIX)
    $S0 = addr

    ok(0, "exception not thrown")

null_handler:
    pop_eh
    ok(1, "exception caught")
    goto end
windows:
    ok(1, "unix sockets not supported on windows")
end:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
