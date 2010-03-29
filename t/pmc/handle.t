#! parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/handle.t - Handle basic type

=head1 SYNOPSIS

    % prove t/pmc/handle.t

=head1 DESCRIPTION

Tests the Handle PMC. Handle is abstract, so no real tests of functionality
here.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(2)
    'test_create'()
    'test_does_tt_1473'()
.end

.sub 'test_create'
    push_eh cant_instantiate
    $P0 = new 'Handle'
    ok(0, "Can instantiate an abstract type")
    pop_eh
    goto create_end
  cant_instantiate:
    ok(1, "Cannot instantiate an abstract type")
    pop_eh
  create_end:
.end

.sub 'test_does_tt_1473'
    push_eh cant_do_does
    $P0 = get_class 'Handle'
    $I0 = does $P0, 'Handle'
    ok($I0, "Handle does Handle")
    goto does_end
  cant_do_does:
    ok(0, "Does throws an exception")
  does_end:
    pop_eh
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
