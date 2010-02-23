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

    plan(1)
    push_eh cant_instantiate
    $P0 = new 'Handle'
    print "not "
  cant_instantiate:
    say "ok 1"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
