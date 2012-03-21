#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.

=head1 NAME

t/library/rand.t

=head1 DESCRIPTION

Test the Math::Rand PBC

=head1 SYNOPSIS

    % prove t/library/rand.t

=cut

.include 'load_bytecode.pir'

.sub main :main
    '__load_bytecode'('Math/Rand.pbc')

    .include 'test_more.pir'
    plan(7)

    test_rand_srand()
    test_rand_max()
.end

.sub test_rand_srand
    .local pmc rand
    rand = get_global [ 'Math'; 'Rand' ], 'rand'
    .local pmc srand
    srand = get_global [ 'Math'; 'Rand' ], 'srand'
    $I0 = rand()
    is($I0,16838)
    $I0 = rand()
    is($I0,5758)
    $I0 = rand()
    is($I0,10113)
    $I0 = rand()
    is($I0,17515)
    srand(1)
    $I0 = rand()
    is($I0,16838)
    $I0 = rand()
    is($I0,5758)
.end

.sub test_rand_max
    .local pmc rand_max
    rand_max = get_global [ 'Math'; 'Rand' ], 'RAND_MAX'
    $I0 = rand_max()
    is($I0,32767)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
