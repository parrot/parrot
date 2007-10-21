#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 137-auto_gc.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::gc');

=for hints_for_testing Check latest reports of Parrot configuration
tools testing coverage to see where your time available for writing
tests is spent.  Try to cover all branches and conditions.  In the
course of testing, try to determine whether the comment in the for=
block in runsteps() should continue to reside in the code.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

137-auto_gc.t - test config::auto::gc

=head1 SYNOPSIS

    % prove t/configure/137-auto_gc.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::gc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
