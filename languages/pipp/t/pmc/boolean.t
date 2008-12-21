#! ../../parrot
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/boolean.t - Boolean PMC

=head1 SYNOPSIS

    % perl t/harness t/pmc/boolean.t

=head1 DESCRIPTION

Tests C<PhpBoolean> PMC.

=cut

.loadlib "php_group"

.sub 'main' :main
    .include "include/test_more.pir"
    plan(2)

    truth_tests()
.end

.sub truth_tests
    .local pmc true, false

    true = new 'PhpBoolean'
    true = 1

    false = new 'PhpBoolean'
    false = 0

    is(true, 1, "true PhpBoolean is 1")
    is(false, "", "false PhpBoolean is empty")
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
