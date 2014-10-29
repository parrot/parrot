#! perl
# Copyright (C) 2001-2014, Parrot Foundation.

=head1 NAME

t/stress/gc.t - Garbage Collection

=head1 SYNOPSIS

    % perl -Ilib t/stress/gc.t

=head1 DESCRIPTION

Stress tests the garbage collectors.

=cut

use strict;
use warnings;

use lib qw(lib . ../lib ../../lib);
my @gc;
BEGIN { @gc = qw(gms ms2 ms inf); }
use Parrot::Test tests => 4 * (1+@gc);
use Test::More;
use Parrot::PMC qw(%pmc_types);

for my $gc (@gc, '--no-gc') {

    # override the args
    my $gc_arg = $gc eq '--no-gc' ? $gc : "--gc $gc";
    local $ENV{TEST_PROG_ARGS} = "-t $gc_arg --gc-debug --gc-nursery-size=0.0001 ";

    pasm_exit_code_is( <<'CODE', 0, "arraystress $gc_arg" );
    print "starting\n"
    new P0, 'Integer'
    print "ending\n"
    end
CODE

    pir_exit_code_is( <<'CODE', 0, "ResizablePMCArray stress $gc_arg" );
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

    pir_exit_code_is( <<'CODE', 0, "GC subs $gc_arg" );
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

    pir_exit_code_is( <<'CODE', 0, "GC coros $gc_arg" );
.sub 'main' :main
    .const 'Sub' $P99 = 'coro'
    .local pmc three, four, five
    three = clone $P99
    four  = clone $P99
    five  = clone $P99
    three(3)
    four(4)
    five(5)
    three(1)
    push_eh ehandler
    three(2)
    four(1)
    goto end

    ehandler:
      pop_eh
    end:
.end

.sub '' :anon :subid('coro')
    .param int x
    .yield (x)
    .yield (x)
.end
CODE

}
1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
