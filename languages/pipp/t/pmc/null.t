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

.sub 'main' :main
    .include "include/test_more.pir"
    plan(2)

    truth_tests()
    stringification_tests()
.end

.sub truth_tests
    .local pmc null_value

    null_value = new 'PhpNull'

    nok(null_value,"PhpNull isn't")
.end

.sub stringification_tests
    .local pmc null_value
    .local string s
    .local int is_ok

    null_value = new 'PhpNull'
    s = null_value
    is_ok = s == ''
    ok( is_ok, 'stringification' )
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
