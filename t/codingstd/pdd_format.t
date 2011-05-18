#! perl
# Copyright (C) 2001-2011, Parrot Foundation.

use strict;
use warnings;

use Test::More tests =>  1;
use Carp;
use Tie::File;

my @pdddirs = qw(
    ./docs/pdds
    ./docs/pdds/draft
);

my @pddfiles = ();
foreach my $dir (@pdddirs) {
    die "Directory '$dir' is not found, or not a directory" if not -d $dir;

    my @pdds = glob "$dir/pdd*.pod"
        or warn "No PDD files found in directory '$dir'";

    push @pddfiles, @pdds;
}

my @diagnostics = ();
foreach my $pdd (@pddfiles) {
    my $diag = check_pdd_formatting($pdd);
    if ( $diag ) {
        push @diagnostics, $diag;
    }
}

for my $msg (@diagnostics) {
    diag($msg);
}
cmp_ok( scalar(@diagnostics), '==', 0, 'PDDs are formatted correctly' );

sub check_pdd_formatting {
    my $pdd = shift;

    my $diag = q{};
    my @toolong = ();
    my @sections_needed = qw(
        Abstract
        Description
        Implementation
        References
    );
    my %sections_seen;
    my @lines;
    tie @lines, 'Tie::File', $pdd
        or croak "Unable to tie to $pdd: $!";
    for (my $i=0; $i<=$#lines; $i++) {
        if (
            ( length( $lines[$i] ) > 78 )
            and
            ( $lines[$i] !~ m/^(?:F|L)<|<http|\$Id:\s+/ )
        ) {
            push @toolong, ($i + 1);
        }
        if ( $lines[$i] =~ m{^=head2\s+(.+?)\s*$} ) {
            $sections_seen{$1}++;
        }
    }
    untie @lines or croak "Unable to untie from $pdd: $!";
    if ( @toolong ) {
        $diag .=
            qq{$pdd has } .
            scalar(@toolong) .
            qq{ lines > 78 chars:  @toolong\n};
    }
    foreach my $need (@sections_needed) {
        if ( ! $sections_seen{$need} ) {
            $diag .= qq{$pdd lacks 'head2' $need section\n};
        }
    }
    return $diag;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
