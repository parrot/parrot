# Copyright (C) 2013, Parrot Foundation.

=head1 NAME

examples/benchmarks/sort_rfa.pir - Sort a ResizableFloatArray of N floats

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/sort_rfa.pir 100000

Or use the default number of iterations:

    % time ./parrot examples/benchmarks/sort_rfa.pir

=head1 DESCRIPTION

Sorts an ResizableFloatArray of N random integers using builtin sort
function for ResizableFloatArray. The argument N is specified from the
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
  $P0 = new ['ResizableFloatArray'], N
  i = 0
  j = 0

LOOP:
  j = rand 0, N
  $P0[i] = j
  inc i
  if i < N goto LOOP

  $P0.'sort'()

  print "Sorted "
  print N
  print " floats\n"

.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

