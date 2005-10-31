#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/perl/manifest.t - sanity check the MANIFEST file

=head1 SYNOPSIS

	% perl t/harness t/perl/manifest.t

	% perl -I lib t/perl/manifest.t

=head1 DESCRIPTION

Checks that the distribution and the MANIFEST file agree.

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More tests => 5;

use Data::Dumper;
use File::Find qw(find);
use ExtUtils::Manifest;
use Parrot::Distribution;
use Parrot::Revision;

ok(-e $ExtUtils::Manifest::MANIFEST, 'MANIFEST exists');

my $manifest_skip = $ExtUtils::Manifest::MANIFEST . '.SKIP'; 
ok(-e $manifest_skip, 'MANIFEST.SKIP exists');


sub list_diff {
    my ($a, $b) = @_;

    my %elem;
    grep { $elem{$_}++ } @$a;
    grep { $elem{$_}-- } @$b;

    return ( [ sort grep { $elem{$_} < 0 } keys %elem ],
	     [ sort grep { $elem{$_} > 0 } keys %elem ] );
}

SKIP:
{
    # check that MANIFEST.SKIP is in sync with svn:ignore
    # An new MANIFEST.SKIP can be generated with tools/dev/gen_manifest_skip.pl
    skip 'Not a working copy', 3 unless ($Parrot::Revision::svn_entries || `svk ls .`);

    my $dist = Parrot::Distribution->new();
    my @from_svn = grep { $_ && $_ !~ m/^#/ } @{ $dist->gen_manifest_skip() };
    unshift @from_svn, '\B\.svn\b', '^debian$', '^debian/';   # added in gen_manifest_skip.pl
    open( MANIFEST_SKIP, '<', $manifest_skip ) or die "Can't open $manifest_skip: $!";
    my @from_manifest_skip = grep { $_ ne "\n" && $_ !~ m/^#/ } ( <MANIFEST_SKIP> );
    close( MANIFEST_SKIP );
    chomp(@from_manifest_skip);
    my ($svn_miss, $manifest_skip_miss) = list_diff(\@from_svn, \@from_manifest_skip);
    # print Dumper( $svn_miss, $manifest_skip_miss, \@from_svn, \@from_manifest_skip);

    local $" = "\n\t";

    ok(!@$svn_miss, 'all files in MANIFEST.SKIP are also in svn:ignore')
          or diag("File in MANIFEST.SKIP but not ignored by SVN:\n\t@$svn_miss");
    ok(!@$manifest_skip_miss, 'all svn:ignore files are in MANIFEST.SKIP')
        or diag("Files ignored by SVN but not in MANIFEST.SKIP:\n\t@$manifest_skip_miss");

    $ExtUtils::Manifest::Quiet = 1;

    my @missing = ExtUtils::Manifest::manicheck();
    ok(!@missing, 'manicheck()')
        or diag("Missing files:\n\t@missing");

    # Extra files are bound to turn up, no need to complain about it
    # my @extra = ExtUtils::Manifest::filecheck();
    # ok(!@extra, 'filecheck()')
    #     or diag("Extra files:\n\t@extra");
};
