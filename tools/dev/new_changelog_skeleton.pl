#! perl
# Copyright (C) 2012-2013, 2015, Parrot Foundation.

use strict;
use warnings;
use autodie;
use JSON;
use lib 'lib';
use Parrot::BuildUtil;

my $changelog_path    = './Changelog';
my $release_info_path = './tools/release/release.json';

=head1 NAME

F<tools/dev/new_changelog_skeleton.pl>

=head1 DESCRIPTION

This program adds a new release announcement skeleton to ChangeLog.

=head1 EXAMPLE

Run this command

    perl tools/dev/new_changelog_skeleton.pl

and then "git status" should show a modification to the ChangeLog file.

=cut

my $c = 1;
my @months   = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
my %months   = map { uc($_) => $c++ } @months;
my $month_re = join '|', @months;

my $original_lines = Parrot::BuildUtil::slurp_file($changelog_path);
my $json           = Parrot::BuildUtil::slurp_file($release_info_path);

my $href = decode_json($json)
    or die "Failed to decode json";

my ( $version, $next_date ) =
    map { $href->{$_} or die "'$_' missing from $release_info_path" }
    qw( release.version release.nextdate );
    # "release.version"  : "7.7.0",
    # "release.nextdate" : "15 Sep 2015",

my ( $major, $minor, $patch ) = split /\./, $version;
die unless defined $patch;

my $re = qr{ \A (\d{1,2}) [ ] ($month_re) [ ] (\d{4}) \z }msx;
my ( $day, $month_name, $year ) = ( $next_date =~ /$re/ )
    or die;

my $month = $months{ uc $month_name } or die;

$month++;
if ( $month == 13 ) {
    $year++;
    $month = 1;
}

$minor++;
if ( $minor == 12 ) {
    $major++;
    $minor = 0;
}

my $date_ymd = sprintf '%04d-%02d-%02d', $year, $month, $day;

my $skeleton =<<"SKELETON";
$date_ymd    release $major.$minor.0
    - Core
    - Build
    - Documentation
    - Tests
    - Community

SKELETON

open my $wfh, '>', $changelog_path;
print $wfh $skeleton, $original_lines;
close $wfh;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
