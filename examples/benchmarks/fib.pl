#!/usr/bin/perl -w
use strict;

sub fib {
	my $n = shift;
	return $n if ($n < 2);
	return fib($n-1) + fib($n-2);
}
my $N = shift || 24;

print "fib($N) = ", fib($N), "\n";
