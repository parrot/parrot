#!/usr/bin/perl -w
use strict;
use Storable qw( freeze thaw dclone );
use Time::HiRes qw( time );

my (@a);
my ($s, $e);
$s = time();
for my $i (0..99999) {
    push @a, $i;
};
$e = time();
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

