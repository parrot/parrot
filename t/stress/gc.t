#! perl
# Copyright (C) 2001-2015, Parrot Foundation.

=head1 NAME

t/stress/gc.t - Garbage Collection

=head1 SYNOPSIS

    % prove t/stress/gc.t

=head1 DESCRIPTION

Stress tests all garbage collectors.
May require >10 min, but should reliably detect all GC assertions and segfaults.

=cut

use strict;
use warnings;

use lib qw(lib . ../lib ../../lib);
my @gc;
BEGIN { @gc = qw(gms ms2 ms inf); }
use Parrot::Test tests => 6 * (1+@gc);
use Test::More;
use Parrot::PMC qw(%pmc_types);
use Parrot::Config;
use File::Spec;

my $parrot  = File::Spec->join( File::Spec->curdir(), 'parrot' . $PConfig{exe} );
my $JSONnqp = File::Spec->join( qw(compilers data_json JSON.nqp) );
my $opsc_03past = File::Spec->join( qw(t compilers opsc 03-past.t) );

sub gc_exit_test {
    my ($cmd, $gc, $msg) = @_;
    my $exit_code;
    if ($exit_code = run_command($cmd,
                                 CD  => $PConfig{build_dir},
                                 STDOUT => "test_$$.out",
                                 STDERR => "test_$$.err" ))
    {
        diag("'$cmd' failed with exit code $exit_code.")
    }
    else {
        unlink("test_$$.out", "test_$$.err");
    }
  TODO:
    {
        local $TODO = 'inf instability GH #1136' if $gc eq 'inf';
        is($exit_code, 0, $msg);
    }
}

for my $gc (@gc, '--no-gc') {

    # override the args
    my $gc_arg = $gc eq '--no-gc' ? $gc : "--gc $gc";
    local $ENV{TEST_PROG_ARGS} = "-t11 $gc_arg --gc-debug --gc-nursery-size=0.0001 ";
    my @TODO = $gc =~ /^ms/ ? ('todo' => 'ms instability GH #1143') : ();
    @TODO = $gc eq 'inf' ? ('todo' => 'inf instability GH #1136') : @TODO;

    pir_exit_code_is( <<'CODE', 0, "GC array stress $gc_arg", @TODO );
.sub 'main' :main
    print "starting\n"
    .local int arr_size
    arr_size = 28
    _bench( 'FixedFloatArray', arr_size )
    _bench( 'FixedIntegerArray', arr_size )
    _bench( 'FixedPMCArray', arr_size )
    _bench( 'FixedStringArray', arr_size )
    _bench( 'ResizableFloatArray', arr_size )
    _bench( 'ResizableIntegerArray', arr_size )
    _bench( 'ResizablePMCArray', arr_size )
    _bench( 'ResizableStringArray', arr_size )
    print "ending\n"
.end
.sub _bench
    .param string arr_class
    .param int arr_size
    .local pmc arr_1, arr_2
    arr_1 = new arr_class
    arr_1 = arr_size
    arr_2 = new arr_class
    arr_2 = arr_size
    .local num start_time
    start_time = time
    .local int x_index, value
    x_index = 0
    value = 1
X_LOOP:
    if x_index >= arr_size goto X_DONE
    arr_1[x_index] = value
    arr_2[x_index] = 0
    inc x_index
    inc value
    goto X_LOOP
X_DONE:
    .local int max_index, z_index, y_index
    max_index = arr_size - 1
    y_index = 0
Y_LOOP:
    if y_index >= 100 goto Y_DONE
    z_index = max_index
Z_LOOP:
    if z_index < 0 goto Z_DONE
    set $I3, arr_2[z_index]
    set $I4, arr_1[z_index]
    add $I3, $I4
    arr_2[z_index] = $I3
    dec z_index
    branch Z_LOOP
Z_DONE:
    inc y_index
    branch Y_LOOP
Y_DONE:
    .local num start_time, end_time, span_time
    end_time = time
    span_time = end_time - start_time
    .local string arr_type
    arr_type = typeof arr_1
    print arr_type
    print ": "
    print span_time
    print "s\n"
.end
CODE

    pir_exit_code_is( <<'CODE', 0, "GC rpa stress $gc_arg" );
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
    $P0 = 8
    push $P0, $I0  # force realloc
    inc $I0
    goto loop
  done:
.end
CODE

    pir_exit_code_is( <<'CODE', 0, "GC subs stress $gc_arg" );
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

    # And now a two big ones: involving lots of ops, strings and rpa's.
    gc_exit_test
      ("$parrot -D1 $gc_arg --gc-debug --gc-nursery-size=0.0001 -- parrot-nqp.pbc --target=pir $JSONnqp",
       $gc,
       "GC CallContext - GH #1159");

    gc_exit_test
      ("$parrot -D1 $gc_arg --gc-debug --gc-nursery-size=0.001 -- parrot-nqp.pbc $opsc_03past",
       $gc,
       "GC opsc/03-past.t");
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
