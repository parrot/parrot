# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

examples/benchmarks/boolean.pir: Manipulate the Boolean PMC

=head1 SYNOPSIS

parrot examples/benchmarks/boolean.pir

=head1 DESCRIPTION

This benchmark operates on the Boolean PMC, allocating new ones, setting them,
and performing logical operations on them.

=cut

.const num iterations = 10e6                    # Number of iterations.

.sub main :main

  .local num start_time, end_time
  .local int counter
  .local pmc a, b, c, result

  print "Perform "
  print iterations
  say " iterations of various Boolean operations"

  a = new 'Boolean', 1
  start_time = time

  counter = iterations
LOOP:
  b = new 'Boolean'
  b = 1
  c = new 'Boolean', b
  result = not a
  result = and result, b
  result = or result, c
  not result
  if result goto TRUE
  a = 0
  goto NEXT
TRUE:
  a = 1
NEXT:
  dec counter
  if counter > 0 goto LOOP

  end_time = time
  end_time = end_time - start_time
  end_time = end_time / iterations
  print "Elapsed time per iteration: "
  say end_time
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
