#! perl -w
# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/stress1.pl - GC stress-testing

=head1 SYNOPSIS

    % time perl examples/benchmarks/stress1.pl

=head1 DESCRIPTION

Creates 500 arrays with 20000 elements each.

=cut

foreach (1..10) {
    my @arr;
    foreach (1..10) {
	$arr[$_] = buildarray();
    }

    my @arr1;
    foreach (1..20) {
	$arr1[$_] = buildarray();
    }

    my @arr2;
    foreach (1..20) {
	$arr2[$_] = buildarray();
    }
}

sub buildarray {
    my @foo;
    foreach (1..20000) {
	$foo[$_] = $_;
    }
    return \@foo;
}

=head1 SEE ALSO

F<examples/benchmarks/stress.pasm>, 
F<examples/benchmarks/stress.pl>, 
F<examples/benchmarks/stress1.pasm>, 
F<examples/benchmarks/stress2.pasm>, 
F<examples/benchmarks/stress2.pl>, 
F<examples/benchmarks/stress3.pasm>.

=cut
