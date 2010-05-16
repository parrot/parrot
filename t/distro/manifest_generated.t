#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
plan(tests => 5);

=head1 NAME

t/distro/manifest_generated.t - check sanity of MANIFEST.generated file

=head1 SYNOPSIS

    % prove t/distro/manifest_generated.t

=head1 DESCRIPTION

Checks that MANIFEST.generated is in the required format (eg: sorted) and that it
contains appropriate items (eg: PMC generated files).

=cut

ok( -e 'MANIFEST.generated', 'MANIFEST.generated exists' );

# slurp MANIFEST.generated, ignoring comment lines
open my $fh, '<', 'MANIFEST.generated'
    or die "open MANIFEST.generated: $!";
my @contents = grep {!/^#/} map {chomp; $_} <$fh>;
close $fh;

is_deeply([sort @contents], \@contents, 'MANIFEST.generated is sorted');

# parse records
my @records;
is_deeply(  [grep {
        my $match = m/^ (\S+) \s+ (\[ \w* \] \w*) $/x;
        push @records, [$1, $2] if $match;
        not $match } @contents],
        [],
        'MANIFEST.generated contains no irregular records' );

# check for appropriate contents
my %contained_files = map {$$_[0] => 1} @records;
is_deeply(  [],
        [grep {not exists $contained_files{$_}} glob('include/pmc/*.h')],
        'MANIFEST.generated lists all core PMC headers' );

is_deeply(  [],
        [grep {not exists $contained_files{$_}} glob('src/pmc/*.dump')],
        'MANIFEST.generated lists all core PMC dump files' )

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
