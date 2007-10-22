#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 124-auto_alignptrs.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::alignptrs');

=for hints_for_testing Check latest reports of Parrot configuration
tools testing coverage to see where your time available for writing
tests is spent.  Have all 3 parts of the 2nd if block been covered?
Write a test which generates the result 'skipped' when
miniparrot has been selected.  In POD, define 'minimum pointer alignment'.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

124-auto_alignptrs.t - test config::auto::alignptrs

=head1 SYNOPSIS

    % prove t/configure/124-auto_alignptrs.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::alignptrs.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::alignptrs, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
