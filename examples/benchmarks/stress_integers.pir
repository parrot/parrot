# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

examples/benchmarks/stress_strings.pir - GC strings stress-testing

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/stress_strings.pir

=head1 DESCRIPTION

Create a lots of strings. Some of them are long-lived, most of them are short lived.

Main purpose - test compact_pool performance.

=cut

.sub 'main' :main
    .local pmc rsa # array of long lived strings.

    .local int i

    rsa = new ['ResizablePMCArray']
    i = 0
  loop:
    $I0 = i % 10    # every 10th string is longlived
    if $I0 goto inc_i
    push rsa, i
    $I0 = i % 1000
    if $I0 goto inc_i
    sweep 1
  inc_i:
    inc i
    if i < 100000 goto loop

.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
