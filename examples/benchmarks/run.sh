#!/bin/sh
for e in examples/benchmarks/*.winxed
do
  ./winxed -c --noan $e
done
for e in examples/benchmarks/*.pir examples/benchmarks/*.pasm
do
  ./parrot -O2 $e
done
