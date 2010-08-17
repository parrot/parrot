#!./parrot
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$

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

    plan(1)

    push_eh cant_instantiate
      new $P0, ['Object']
    pop_eh
    ok(0, 'Able to instantiate Object')
    goto done_1
cant_instantiate:
    ok(1, 'Unable to Instantiate Object')
done_1:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
