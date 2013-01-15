# Copyright (C) 2013, Parrot Foundation.

=head1 NAME

examples/benchmarks/sort.pir - Sort an FixedIntegerArray of N integers

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/sort.pir 100000

Or use the default number of iterations:

    % time ./parrot examples/benchmarks/sort.pir

=head1 DESCRIPTION

Sorts an FixedIntegetArray of N random integers using builtin sort
function for FixedIntegetArray. The argument N is specified from the
command line.

=cut

.loadlib 'math_ops'

.sub main :main
  .param pmc argv
  .local int N, i, j

  N = argv[1]
  if N < 1 goto USE_DEFAULT_SIZE
  goto USE_DEFINED_SIZE

USE_DEFAULT_SIZE:
  N = 1000000

USE_DEFINED_SIZE:
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

