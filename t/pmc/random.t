#!parrot
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/random.t - Random numbers

=head1 SYNOPSIS

        % prove t/pmc/random.t

=head1 DESCRIPTION

Tests random number generation

=cut

.sub main :main
    # load this library
    load_bytecode 'library/Test/More.pir'

    # get the testing functions
    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ "Test::More" ]
    exports = split " ", "plan diag ok is is_deeply like isa_ok"

    test_namespace."export_to"(curr_namespace, exports)

    plan(1)

    new P0, .Random
    set I0, P0
    ok(1, 'Called random just fine')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
