#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 134-auto_funcptr.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::funcptr');

=for hints_for_testing Check latest reports of Parrot configuration
tools testing coverage to see where your time available for writing
tests is spent.  Try to cover all branches and conditions.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

134-auto_funcptr.t - test config::auto::funcptr

=head1 SYNOPSIS

    % prove t/configure/134-auto_funcptr.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::funcptr.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::funcptr, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
