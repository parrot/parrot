#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 138-auto_memalign.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::memalign');

=for hints_for_testing Check latest reports of Parrot configuration
tools testing coverage to see where your time available for writing
tests is spent.  Try to cover all branches and conditions.  Can you
generate cases where the 'eval's fail?  If so, examine the error message
with Test::More::like().

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

138-auto_memalign.t - test config::auto::memalign

=head1 SYNOPSIS

    % prove t/configure/138-auto_memalign.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::memalign.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::memalign, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
