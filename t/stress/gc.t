#! perl
# Copyright (C) 2001-2013, Parrot Foundation.

=head1 NAME

t/stress/gc.t - Garbage Collection

=head1 SYNOPSIS

    % perl -Ilib t/stress/gc.t

=head1 DESCRIPTION

Tests garbage collection.

=cut

use strict;
use warnings;

use lib qw(lib . ../lib ../../lib);
use Parrot::Test tests => 3;
use Test::More;
use Parrot::PMC qw(%pmc_types);

pasm_output_is( <<'CODE', <<'OUTPUT', "arraystress" );
    print "starting\n"
    new P0, 'Integer'
    print "ending\n"
    end
CODE
starting
ending
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "GC stress" );
.sub 'main' :main
    .param pmc args

    $I0 = 0
    .local int N
    N = args[1]
    if N <= 0 goto loop
      N = 10000

  loop:
    unless $I0 < N goto done
    $P0 = new ['ResizablePMCArray']
    inc $I0
    goto loop
  done:
.end
CODE
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "GC subs" );
.sub 'main' :main
    .param pmc args

    $I0 = 0
    .local int N
    N = args[1]
    if N <= 0 goto loop
      N = 10000

  loop:
    unless $I0 < N goto done
    'no-op'()
    inc $I0
    goto loop
  done:
.end

.sub 'no-op'
    noop
.end
CODE
OUTPUT

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
