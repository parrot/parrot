#!/usr/bin/perl -w
use strict;

my (%ha, %hb, $i, @k, @nk, $s);
for ($i = 0; $i < 10; $i++) {
    $s = chr(65 + $i);
    push @k, $s;
}
for my $e (0..3) {
    for ($i = 0; $i < 10; $i++) {
	for $s (@k) {
	    my $nk = $s . chr(65 + $i);
	    push @nk, $nk;
	}
    }
    @k = @nk;
    @nk = ();
}
print scalar(@k), "\n";

my $j = 0;
for $s (@k) {
    ++$j;
    $ha{$s} = 1;
}
print "$j\n";
print scalar keys(%ha), "\n";
print $ha{"AAAAA"};
print $ha{"ABCDE"};
print $ha{"BBBBB"};
print $ha{"CCCCC"};
print $ha{"HHHHH"};
print $ha{"IIIII"};
print "\n"
