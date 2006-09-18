# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

examples/benchmarks/stress2.pl - GC stress-testing

=head1 SYNOPSIS

    % time perl examples/benchmarks/stress2.pl

=head1 DESCRIPTION

Creates 200 arrays of 10000 elements each.

=cut

foreach (1..20) {
    my @arr;
    foreach (1..10) {
	$arr[$_] = buildarray();
    }
}

sub buildarray {
    my @foo;
    foreach (1..10000) {
	$foo[$_] = $_;
    }
    return \@foo;
}

=head1 SEE ALSO

F<examples/benchmarks/stress.pasm>, 
F<examples/benchmarks/stress.pl>, 
F<examples/benchmarks/stress1.pasm>, 
F<examples/benchmarks/stress1.pl>, 
F<examples/benchmarks/stress2.pasm>, 
F<examples/benchmarks/stress3.pasm>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
