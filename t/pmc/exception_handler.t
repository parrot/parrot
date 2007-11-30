#! parrot
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/exception_handler.t - test Exception_Handler PMC

=head1 SYNOPSIS

    % prove t/pmc/exception_handler.t

=head1 DESCRIPTION

Tests the Exception_Handler PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(1)

    new P0, 'Exception_Handler'
    ok(1, 'Instantiated .Exception_Handler')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
