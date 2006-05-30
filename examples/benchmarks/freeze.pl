#! perl -w
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

examples/benchmarks/freeze.pl - Freeze/Thaw Benchmarks

=head1 SYNOPSIS

    % time perl examples/benchmarks/freeze.pl

=head1 DESCRIPTION

Freeze/thaw a C<ResizablePMCArray>. Uses C<Storable> to archive the array.

=cut

use strict;
use warnings;

use Storable qw( freeze thaw dclone );
use Time::HiRes qw( time );

my @a;
my $s = time();
for my $i (0..99999) {
    push @a, $i;
};
my $e = time();
printf "constr.time %.6f\n", $e-$s;

$s = time();
my $image = freeze(\@a);
$e = time();
printf "freeze time %.6f\n", $e-$s;

$s = time();
my @b = @{ thaw $image };
$e = time();
printf "  thaw time %.6f\n", $e-$s;

#$s = time();
#my $c = dclone \@a;
#$e = time();
#printf " clone time %.6f\n", $e-$s;

print "Image len ", length($image), "\n";
print "array size ", scalar(@b), "\n";

=head1 SEE ALSO

F<examples/benchmarks/freeze.pasm>.

=cut
