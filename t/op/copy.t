#!./parrot
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$

=head1 NAME

t/op/copy - Testing the copy opcode

=head1 SYNOPSIS

    % prove t/op/copy.t

=head1 DESCRIPTION

Tests various PMCs with copy.

=cut

.sub 'main' :main
    .include 'test_more.pir'

    plan(4)

    test_basic()
    test_rt48467()
    test_tonull()
.end

.sub 'test_basic'
    .local pmc dest
    dest = new 'Integer'
    dest = 2

    .local pmc src
    src = new 'Float'
    src = 1.28

    dest = copy src
    isa_ok( dest, 'Float', 'copy should change type of PMC' )
    is( dest, 1.28, '... and its value' )
.end

.sub 'test_rt48467'
    .local pmc my_float
    my_float = subclass 'Float', 'Num'

    ##   my $x = 0;
    .local pmc dest
    dest = new 'Integer'
    dest = 0

    ##   my $y = 3.2;
    .local pmc src
    src = new 'Num'
    src = 3.2

    ##   $x = $y;
    dest = copy src

    ##   $y++;
    inc src

    ##   say '$x = ', $x;
    is( dest, 3.2, 'copy should make independent copies' )
.end

.sub 'test_tonull'
    null $P1
    $P2 = new 'Undef'
    .local string msg
    msg = 'failed'
    push_eh catch
    copy $P1, $P2
    goto check
catch:
    .get_results($P3)
    msg = $P3 ['message']
check:
    pop_eh
    is( msg, 'Null PMC in copy', 'copy to null throws' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
