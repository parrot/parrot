#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 125-auto_headers.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::headers');

=for hints_for_testing You may need to write SKIP blocks to encapsulate
OS-specific tests.  Check latest reports of Parrot configuration tools
testing coverage to see where your time available for writing tests is
spent.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

125-auto_headers.t - test config::auto::headers

=head1 SYNOPSIS

    % prove t/configure/125-auto_headers.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::headers.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::headers, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
