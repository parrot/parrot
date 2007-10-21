#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 141-auto_env.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::env');

=for hints_for_testing The documentation for this package is skimpy;
please try to improve it, e.g., by explaining what 'setenv' and
'unsetenv' are.  Try to cover all branches and conditions.  Check latest
reports of Parrot configuration tools testing coverage to see where your
time available for writing tests is spent.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

141-auto_env.t - test config::auto::env

=head1 SYNOPSIS

    % prove t/configure/141-auto_env.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::env.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::env, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
