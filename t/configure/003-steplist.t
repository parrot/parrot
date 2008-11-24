#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 003-steplist.t

use strict;
use warnings;
use Test::More tests => 3;
use Carp;
use lib qw( lib );
use Parrot::Configure::Step::List qw| get_steps_list |;

my @steps;
ok( @steps = get_steps_list(), "non-zero number of steps located" );
my $badsteps = 0;
foreach my $s (@steps) {
    $badsteps++ unless $s =~ /^(init|inter|auto|gen)::\w+$/;
}
is( $badsteps, 0, "no bad entries found in \@steps" );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

003-steplist.t - test Parrot::Configure::Step::List

=head1 SYNOPSIS

    % prove t/configure/003-steplist.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by
Parrot::Configure::Step::List.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure::Step::List, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
