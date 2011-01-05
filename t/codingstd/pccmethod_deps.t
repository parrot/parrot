#! perl
# Copyright (C) 2007-2008, Parrot Foundation.

use strict;
use warnings;

use File::Glob;
use File::Spec;

use Test::More;

=head1 BUGS

This isn't part of t/src/checkdepend.t

=cut

my $pmc_dir  = File::Spec->catfile(qw( src pmc *.pmc ));
my @pmcs     = grep { contains_pccmethod($_) } glob($pmc_dir);
my $find_pmc = join( '|', map { s/\.pmc/\.dump/; quotemeta( $_ ) } @pmcs );
my $find_rx  = qr/^($find_pmc) : (.*)/;

open( my $fh, '<', 'Makefile' ) or die "Can't read Makefile: $!\n";

plan( tests => scalar @pmcs );

while (<$fh>) {
    next unless /$find_rx/;
    my ($file, $dependencies) = ($1, $2);

    ok( $dependencies =~ /PCCMETHOD\.pm/,
        "$file should mark PCCMETHOD.pm dependency in Makefile" );
}

sub contains_pccmethod {
    my $file = shift;
    open( my $fh, '<', $file ) or die "Can't read '$file': $!\n";

    local $_;
    while (<$fh>) {
        next unless /\bMETHOD\b/;
        return 1;
    }

    return;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
