#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 149-auto_m4.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::m4');

pass("Completed all tests in $0");

=for hints_for_testing Try to test all branches and conditions; consult
a recent code coverage report for guidance.  Certain branches appear to
be OS-specific.  Consider adding a note to the POD explaining what 'm4'
is.

=cut

################### DOCUMENTATION ###################

=head1 NAME

149-auto_m4.t - test config::auto::m4

=head1 SYNOPSIS

    % prove t/configure/149-auto_m4.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::m4.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::m4, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
