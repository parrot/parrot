#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_icu-01.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::icu');

=for hints_for_testing Provide an explanation in the POD for what 'ICU'
is.  Try to test all branches and conditions; consult a recent code
coverage report for guidance.  See if you can write tests which generate
the 'die's, then capture the error messages and analyze them.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_icu-01.t - test config::auto::icu

=head1 SYNOPSIS

    % prove t/steps/auto_icu-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::icu.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::icu, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
