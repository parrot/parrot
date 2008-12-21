# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/embed/eval.t - Testing the sub 'eval'.

=head1 SYNOPSIS

    % perl t/harness t/embed/eval_string.t

=head1 DESCRIPTION

Tests the sub 'eval' used for supporting embedding Pipp in other applications.

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
    .local pmc eval_sub
    .local int ret
    eval_sub = get_hll_global [ 'Pipp' ], 'eval'
    # call it with TAP diagnostics
    eval_sub("# only sea, not islands\n")

    eval_sub('<?php function no_args () { echo "# no_args was called\n"; } no_args(); ?>')

    # define a function
    # call it from here
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
