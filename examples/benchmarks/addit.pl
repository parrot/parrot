#! perl -w
# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/addit.pl - Variable Argument Subroutines

=head1 SYNOPSIS

    % time perl examples/benchmarks/addit.pl

=head1 DESCRIPTION

Joe Wilson's original Perl version of his C<varargs> subroutines
benchmark. It calls an "add it" function 500000 times in a loop and
prints the result (21001097.97).

=cut

use strict;
sub varargs_adder {
    my $sum = 0;
    for (my $a = $#_; $a >= 0; --$a) {
        $sum += $_[$a];
    }
    return $sum
}
my $result = 0;
my @args;
$args[0] = 1000;
$args[1] = 7.100;
$args[2] = 87;
$args[3] = "3.87";
$args[4] = "21000000";
for (my $x = 500000; $x >= 0; --$x) {
    $result = varargs_adder(@args);
}
print "$result\n";

=head1 SEE ALSO

F<examples/benchmarks/addit.pasm>, F<examples/benchmarks/addit.imc>,
F<examples/benchmarks/addit2.imc>.

=cut
