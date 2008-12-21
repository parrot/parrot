# Copyright (C) 2008, The Perl Foundation.
# $Id: null.t 34021 2008-12-17 13:41:30Z Whiteknight $

=head1 NAME

t/embed/eval_string.t - Testing the PhpNull PMC

=head1 SYNOPSIS

    % perl t/harness t/embed/eval_string.t

=head1 DESCRIPTION

Tests the sub 'eval_string' used for supporting embedding Pipp in other applications.

=cut

.sub '_load' :anon :init :load

    load_bytecode 'pipp.pbc'

.end

.sub 'main' :main
    .include "include/test_more.pir"
    plan(1)

    ok( 1, 'no tests implemented yet')
    # TODO:
    # find sub 'eval_string'
    .local pmc eval_string_sub
    .local int ret
    eval_string_sub = get_hll_global [ 'Pipp' ], 'eval_string'
    # call it with test output
    eval_string_sub()

    # define a function
    # call it from here
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
