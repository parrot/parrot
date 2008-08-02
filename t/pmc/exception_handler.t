#! parrot
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/exception_handler.t - test ExceptionHandler PMC

=head1 SYNOPSIS

    % prove t/pmc/exception_handler.t

=head1 DESCRIPTION

Tests the ExceptionHandler PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(1)

    new P0, 'ExceptionHandler'
    ok(1, 'Instantiated ExceptionHandler')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
