#! perl -w
# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/arriter.pl - Iterator Benchmark

=head1 SYNOPSIS

    % time perl examples/benchmarks/arriter.pl

=head1 DESCRIPTION

Sets up an array an then loops over its contents, incrementing a
variable and setting hash values.

=cut

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
print "\n";

=head1 SEE ALSO

F<examples/benchmarks/arriter.imc>,
F<examples/benchmarks/arriter_o1.imc>.

=cut
