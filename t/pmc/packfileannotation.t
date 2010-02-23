#!parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/packfileannotation.t - test the PackfileAnnotation PMC

=head1 SYNOPSIS

    % prove t/pmc/packfileannotation.t

=head1 DESCRIPTION

Tests the PackfileAnnotation PMC.

=cut

# PackfileAnnotation constructor
.sub 'test' :main
.include 'test_more.pir'
    .local pmc pa

    plan(5)

    pa = new ['PackfileAnnotation']
    $I0 = defined pa
    ok($I0, 'PackfileAnnotation created')

    pa.'set_name'('line')
    pa.'set_offset'(115200)
    pa = 42

    $S0 = pa.'get_name'()
    is($S0, 'line',  'Name stored and fetched')
    $I0 = pa.'get_offset'()
    is($I0, 115200, 'Offset stored and fetched')
    $I0 = pa
    is($I0, 42, 'Value stored and fetched')

    # We can't fetch string from integer annotation
    push_eh check
    $I1 = 1
    $S0 = pa
    $I0 = 0
  check:
    pop_eh
    ok($I0, "Can't fetch wrong value from Annotation")

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
