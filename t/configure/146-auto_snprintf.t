#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 146-auto_snprintf.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::snprintf');

=for hints_for_testing The documentation for this package is skimpy;
please try to improve it, e.g., by providing a short description of what
the 'autosnprintf' is.  Try to test all branches and conditions; consult
a recent code coverage report for guidance.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

146-auto_snprintf.t - test config::auto::snprintf

=head1 SYNOPSIS

    % prove t/configure/146-auto_snprintf.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::snprintf.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::snprintf, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
