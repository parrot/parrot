#! perl -w
# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/fib.pl - Fibonacci Benchmark

=head1 SYNOPSIS

    % time perl examples/benchmarks/fib.pl n

=head1 DESCRIPTION

Calculates the Fibonacci Number for C<n> (defaults to 24 if
unspecified).

=cut

use strict;

sub fib {
	my $n = shift;
	return $n if ($n < 2);
	return fib($n-1) + fib($n-2);
}
my $N = shift || 24;

print "fib($N) = ", fib($N), "\n";

=head1 SEE ALSO

F<examples/benchmarks/fib.imc>.

=cut
