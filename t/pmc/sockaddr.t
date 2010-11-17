#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.

=head1 NAME

t/pmc/sockaddr.t - test the Sockaddr PMC

=head1 SYNOPSIS

    % prove t/pmc/sockaddr.t

=head1 DESCRIPTION

Test the Sockaddr PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(6)

    test_basic()
    test_bool()
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
    push_eh handler
    ok($P1, 'get_bool on a SockAddr')
    goto done
handler:
    pop_eh
    todo(0,'get_bool on SockAddr does not work TT#1822')
done:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
