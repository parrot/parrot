# Copyright (C) 2013, Parrot Foundation.

=head1 NAME

examples/benchmarks/sort.pir - Sort an FixedIntegetArray of 10000 integers

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/sort.pir

=head1 DESCRIPTION

Sorts an FixedIntegetArray of 10000 random integers using builtin sort
function for FixedIntegetArray

=cut

.loadlib 'math_ops'

.sub main :main
  .param pmc argv
  .local int N, i, j
        
  N = argv[1]
  $P0 = new ['FixedIntegerArray'], N
  i = 0
  j = 0

LOOP:
  j = rand 0, N
  $P0[i] = j
  inc i
  if i < N goto LOOP

  $P0.'sort'()

.end


=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

