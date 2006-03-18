#! perl -w
# Copyright (C) 2001-2006 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/arriter.pl - Iterator Benchmark

=head1 SYNOPSIS

    % time perl examples/benchmarks/arriter.pl

=head1 DESCRIPTION

Sets up an array and then loops over its contents, incrementing a
variable and setting hash values.

=cut

use strict;
use warnings;

use Data::Dumper;

# declaration of lexicals
my (%ha, , $i, @k, @nk, $s);

# same as @k = qw( A B C D E F G H I J ); 
for ($i = 0; $i < 10; $i++) {
    $s = chr(65 + $i);
    push @k, $s;
}


# set up all 5 element permutations of qw( A B C D E F G H I J )
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

my $j = 0;
for $s (@k) {
    ++$j;
    $ha{$s} = 1;
}
print scalar(@k), "\n";
print "$j\n";
print scalar keys(%ha), "\n";
print $ha{'AAAAA'};
print $ha{'ABCDE'};
print $ha{'BBBBB'};
print $ha{'CCCCC'};
print $ha{'HHHHH'};
print $ha{'IIIII'};
print "\n";

=head1 SEE ALSO

F<examples/benchmarks/arriter.pir>,
F<examples/benchmarks/arriter_o1.pir>.

=cut
