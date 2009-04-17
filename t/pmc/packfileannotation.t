#!parrot
# Copyright (C) 2006-2009, Parrot Foundation.

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

    plan(4)

    pa = new ['PackfileAnnotation']
    $I0 = defined pa
    ok($I0, 'PackfileAnnotation created')

    pa = 42
    pa.'set_key_id'(1)
    pa.'set_offset'(115200)

    $I0 = pa
    is($I0, 42, 'Value stored and fetched')
    $I0 = pa.'get_key_id'()
    is($I0, 1,  'KeyId stored and fetched')
    $I0 = pa.'get_offset'()
    is($I0, 115200, 'Offset stored and fetched')

.end
