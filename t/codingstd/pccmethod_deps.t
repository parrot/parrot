#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

use File::Glob;
use File::Spec;

use Test::More;

my $pmc_dir  = File::Spec->catfile( qw( src pmc *.pmc ) );
my @pmcs     = grep { contains_pccmethod( $_ ) } glob( $pmc_dir );
my $find_pmc = join( '|', map { s/\.pmc/\.dump/; $_ } @pmcs );
my $find_rx  = qr/^($find_pmc) : /;

open( my $fh, '<', 'Makefile' ) or die "Can't read Makefile: $!\n";

plan( tests => scalar @pmcs );

while (<$fh>)
{
    next unless /$find_rx/;
    my ($file) = $1;

    my $has_dep = 0;

    while (<$fh>)
    {
        last unless /\S/;
        next unless /PCCMETHOD\.pm/;
        $has_dep = 1;
        last;
    }
    ok( $has_dep, "$file should mark PCCMETHOD.pm dependency" );
}

sub contains_pccmethod
{
    my $file = shift;
    open( my $fh, '<', $file ) or die "Can't read '$file': $!\n";

    local $_;
    while (<$fh>)
    {
        next unless /PCCMETHOD/;
        return 1;
    }

    return;
}
