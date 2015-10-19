#!./parrot
# Copyright (C) 2011-2015, Parrot Foundation.

=head1 NAME

t/op/gc-non-recursive.t - test for marking very large linked-list

=head1 SYNOPSIS

    % prove t/op/gc-non-recursive.t

=head1 DESCRIPTION

See http://trac.parrot.org/parrot/ticket/1723

It is a good test to detect GC problems with the string compactor
in ms and ms2.

=cut


.sub 'main' :main
    .include 'test_more.pir'

    .local pmc iterclass, intclass
    .local int maxloop
    maxloop = 500000

    .local pmc config
    .local string optimize

    load_bytecode 'config.pbc'
    config = '_config'()
    optimize = config['optimize']
    # with a non-optimized build loop less
    if optimize != '' goto optimized
    maxloop = 50000
  optimized:

    iterclass = newclass ['RangeIter']
    addattribute iterclass, '$!value'
    addattribute iterclass, '$!nextIter'
    intclass = subclass ['Integer'], 'Int'

    .local pmc head, next
    head = new iterclass
    $P0 = new intclass
    setattribute head, '$!value', $P0

    next = head
  loop:
    ($I0, next) = next.'reify'()
    if $I0 < maxloop goto loop
    sweep 1
    ok(1, "Marking of large list doesn't exhaust C stack")
    done_testing()
    .return ()

  non_optimized:
    skip("Disabled in non-optimized builds")
    done_testing()
    .return ()
.end


.namespace ['RangeIter']

.sub 'reify' :method
    .local pmc value, nextiter
    value = getattribute self, '$!value'
    nextiter = new ['RangeIter']
    setattribute self, '$!nextIter', nextiter
    $P0 = add value, 1.0
    setattribute nextiter, '$!value', $P0
    .return ($P0, nextiter)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
