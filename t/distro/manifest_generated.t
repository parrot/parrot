#! perl
# Copyright (C) 2010-2012, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
plan(tests => 4);

=head1 NAME

t/distro/manifest_generated.t - check sanity of MANIFEST.generated file

=head1 SYNOPSIS

    % prove t/distro/manifest_generated.t

=head1 DESCRIPTION

Checks that MANIFEST.generated is in the required format and that it
contains appropriate items (eg: PMC generated files).

=cut

ok( -e 'MANIFEST.generated', 'MANIFEST.generated exists' );

# slurp MANIFEST.generated, ignoring comment lines
open my $fh, '<', 'MANIFEST.generated'
    or die "open MANIFEST.generated: $!";
my @contents = grep {!/^#/} map {chomp; $_} <$fh>;
close $fh;

# is_deeply([sort @contents], \@contents, 'MANIFEST.generated is sorted');

# parse records
my @records;
is_deeply(  [grep {
        my $match = m/^ (\S+) \s+ (\[ \w* \] \w*) $/x;
        push @records, [$1, $2] if $match;
        not $match } @contents],
        [],
        'MANIFEST.generated contains no irregular records' );

# Check for appropriate contents
my %contained_files = map  { $_->[0] => 1 } @records;
my @missing_headers = grep {!$contained_files{$_}} glob('include/pmc/*.h');
my @missing_dumps   = grep {!$contained_files{$_}} glob('src/pmc/*.dump');

# Note that a failure of only 'include/pmc/pmc_default.h' means
# that `make clean` and `make realclean` are failing to
# remove 'include/pmc/pmc_default.h', so it does not get rebuilt,
# and therefore is not added to 'MANIFEST.generated'. This is a bug
# that needs fixing, but in the meantime, either remove
# 'include/pmc/pmc_default.h' after `make realclean`, or use
# `git clean -dnx` and `git clean -dfx`.
# See https://github.com/parrot/parrot/issues/1206
ok( !@missing_headers, 'MANIFEST.generated lists all core PMC headers' )
    or diag( join "\n\t", 'Missing:', @missing_headers);

ok( !@missing_dumps, 'MANIFEST.generated lists all core PMC dump files' )
    or diag( join "\n\t", 'Missing:', @missing_dumps);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
