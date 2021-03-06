#!./parrot
# Copyright (C) 2007-2014, Parrot Foundation.

=head1 NAME

t/pmc/object.t - test the Object PMC

=head1 SYNOPSIS

    % prove t/pmc/object.t

=head1 DESCRIPTION

Tests the Object PMC.

=cut

# L<PDD15/Object PMC API>
## TODO add more tests as this is documented and implemented

.sub main :main
    .include 'test_more.pir'

    plan(4)

    test_new()
    test_isa()
    test_subclass_object()
.end

.sub test_new
    throws_substring(<<'CODE', 'Object must be created by a class', 'new Object fails')
    .sub main
        new $P0, ['Object']
    .end
CODE
    throws_substring(<<'CODE', 'Object must be created by a class', 'new(pmc) Object fails')
    .sub main
        new $P0, ['String']
        new $P1, ['Object'], $P0
    .end
CODE
.end

.sub test_isa
    $P0 = new ['String']
    null $P1
    $I0 = isa $P0, $P1
    is($I0, 0, 'isa null pmc')
.end

.sub test_subclass_object
    $P0 = subclass "Object", "Foo"
    push_eh error
    $P1 = new $P0
    ok(1, 'subclass from Object')
    .return()

  error:
    # Object must be created by a class
    todo(0, 'subclass from Object', 'GH #1010 allow normal Object instantiaton')
    pop_eh
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
