#! parrot
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

=head1 NAME

t/op/info.t - Info Ops

=head1 SYNOPSIS

    % prove t/op/info.t

=head1 DESCRIPTION

Tests the information finding operations.

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


    set I0, .ResizablePMCArray
    find_type I1, "ResizablePMCArray"
    is (I0, I1, 'find_type matches dot syntax')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
