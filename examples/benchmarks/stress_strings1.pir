# Copyright (C) 2010-2012, Parrot Foundation.

=head1 NAME

examples/benchmarks/stress_strings1.pir - comparison with stress_stringsu.pir

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/stress_strings1.pir
    % time ./parrot examples/benchmarks/stress_stringsu.pir

=head1 DESCRIPTION

Create non-encoded strings, running through the imcc optimizer.
Some of the strings are long-lived, most of them are short lived.

=cut

.sub 'main' :main
    .local pmc rsa # array of long lived strings.
    .local pmc args
    .local int i

    rsa = new ['ResizableStringArray']
    args = new ['ResizablePMCArray']
    i = 0
    push args, i
  loop:
    $S0 = "c"
    args[0] = i
    sprintf $S1, "%d", args
    $S2 = concat $S0, $S1
    $I0 = i % 10    # every 10th string is longlived
    if $I0 goto inc_i
    push rsa, $S2
  inc_i:
    inc i
    if i < 10000000 goto loop

.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
