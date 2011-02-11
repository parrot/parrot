#!./parrot
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/pmc/loritocontext.t - test LoritoContext PMC

=head1 SYNOPSIS

    % prove t/pmc/loritocontext.t

=head1 DESCRIPTION

Tests the LoritoContext PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(2)

    test_new()
.end

.sub 'test_new'
    $P0 = new 'LoritoContext'
    isa_ok($P0, 'LoritoContext')
    $P1 = $P0.'current_ctx'()
    isa_ok($P1,'Context')
.end
