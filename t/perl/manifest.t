#! perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;

use Data::Dumper;
use File::Find qw(find);
use ExtUtils::Manifest;
use Parrot::Distribution;
use Parrot::Revision;


=head1 NAME

t/perl/manifest.t - sanity check the MANIFEST file

=head1 SYNOPSIS

	% prove t/perl/manifest.t

=head1 DESCRIPTION

Checks that the distribution and the MANIFEST file agree.

=cut


ok(-e $ExtUtils::Manifest::MANIFEST, 'MANIFEST exists');


ok(-e $ExtUtils::Manifest::MANIFEST . '.SKIP', 'MANIFEST.SKIP exists');


SKIP:
{
    skip 'Not a working copy' => 1
        unless ($Parrot::Revision::svn_entries || `svk ls .`);

    diag "this may take a while...";

    $ExtUtils::Manifest::Quiet = 1;

    my @missing = ExtUtils::Manifest::manicheck();
    ok(!@missing, 'manicheck()')
        or diag("Missing files:\n\t@missing");
};


# remember to change the number of tests :-)
BEGIN { plan tests => 3; }
