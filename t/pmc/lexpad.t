#! parrot
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/lexpad.t - test LexPad PMC


=head1 SYNOPSIS

    % prove t/pmc/lexpad.t

=head1 DESCRIPTION

Tests the LexPad PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'
    plan(1)

    new_test()
.end

.sub new_test
    push_eh eh
    $P0 = new ['LexPad']
    pop_eh
    ok(0, "shouldn't be able to create a LexPad without an initializer")
    goto end
eh:
    ok(1, "can't create a LexPad without an initializer")
end:
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
