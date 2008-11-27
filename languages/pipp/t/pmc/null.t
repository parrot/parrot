#! ../../parrot
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/null.t - Testing the PhpNull PMC

=head1 SYNOPSIS

    % perl t/harness t/pmc/null.t

=head1 DESCRIPTION

Tests C<PhpNull> PMC.

=cut

.loadlib "php_group"
.HLL "PHP"

.sub 'main' :main
    .include "include/test_more.pir"
    plan(1)

    truth_tests()
.end

.sub truth_tests
    .local pmc null_value

    null_value = new 'PhpNull'

    nok(null_value,"PhpNull isn't")
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
