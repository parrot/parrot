#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 147-auto_perldoc.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::perldoc');

=for hints_for_testing Try to test all branches and conditions; consult
a recent code coverage report for guidance.  You might consider adding a
line to the POD which indicates why this test is necessary, given the
fact that the user already has Perl 5.  (It is because packaging systems
can and do offer minimalist Perl 5 packages that omit 'perldoc'.)

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

147-auto_perldoc.t - test config::auto::perldoc

=head1 SYNOPSIS

    % prove t/configure/147-auto_perldoc.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::perldoc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::perldoc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
