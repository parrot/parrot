#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 03-steplist.t

use strict;
use warnings;

BEGIN {
    use FindBin qw($Bin);
    use Cwd qw(cwd realpath);
    realpath($Bin) =~ m{^(.*\/parrot)\/.*$};
    our $topdir = $1;
    if ( defined $topdir ) {
        print "\nOK:  Parrot top directory located\n";
    }
    else {
        $topdir = realpath($Bin) . "/../..";
    }
    unshift @INC, qq{$topdir/lib};
}
use Test::More tests =>  4;
use Carp;
use_ok('Parrot::Configure::Step::List', qw|
    get_steps_list
| );

my @steps;
ok(@steps = get_steps_list(), "non-zero number of steps located");
my $badsteps = 0;
foreach my $s (@steps) {
    $badsteps++ unless $s =~ /^(init|inter|auto|gen)::\w+$/;
}
is($badsteps, 0, "no bad entries found in \@steps");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

03-steplist.t - test Parrot::Configure::Step::List

=head1 SYNOPSIS

    % prove t/configure/03-steplist.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by
Parrot::Configure::Step::List.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure::Step::List, F<Configure.pl>.

=cut
