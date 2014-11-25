#! perl
# Copyright (C) 2001-2014, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 17;

=head1 NAME

t/pmc/coroutines.t - Coroutines

=head1 SYNOPSIS

    % prove t/pmc/coroutine.t

=head1 DESCRIPTION

Tests the C<Coroutine> PMC.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', "Coroutine 1" );
.include "interpinfo.pasm"
.pcc_sub :main _main:
    .const 'Sub' P0 = "_coro"
    new P10, ['Integer']
    set P10, 2
    set_global "i", P10
lp:
    invokecc P0
    print "back "
    print P10
    print "\n"
    if P10, lp
    print "done\n"
    end
.pcc_sub _coro:
loop:
    get_global P11, "i"
    dec P11
    yield
    branch loop
CODE
back 1
back 0
done
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Coroutines - M. Wallace yield example" );

.sub __main__ :main
    .local pmc return
    .local pmc counter
    .const 'Sub' itr = "_iterator"

    .local pmc zero
    zero = new ['Integer']
    zero = 0

    return = new ['Continuation']
    set_label return, return_here
    loop:
        .begin_call
            .call itr, return
            .get_result counter
        .end_call

        print counter
        print " "

        zero = 0
        print zero
        print "\n"
    goto loop
return_here:
    .get_results ()
    end
.end

.sub _iterator
    .local pmc x
    x = new ['Integer']
    x = 0
    iloop:
        .begin_yield
        .set_yield x
        .end_yield
        x = x + 1
    if x <= 10 goto iloop
    returncc
.end
CODE
0 0
1 0
2 0
3 0
4 0
5 0
6 0
7 0
8 0
9 0
10 0
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Coroutine - exception in main" );
.include "interpinfo.pasm"
.pcc_sub :main _main:
    .const 'Sub' P0 = "_coro"
    push_eh _catchm
    new P16, ['Integer']
    set P16, 2
    set_global "i", P16
lp:
    invokecc P0
    print "back "
    print P16
    print "\n"
    null S0
    get_global P17, S0
    if P16, lp
    print "done\n"
    end
_catchm:
    get_results '0', P5
    print "catch main\n"
    end

.pcc_sub _coro:
    push_eh _catchc
corolp:
    get_global P17, "i"
    dec P17
    yield
    branch corolp
_catchc:
    get_results '0', P5
    print "catch coro\n"
    end
CODE
back 1
catch main
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Coroutine - exception in coro" );
.include "interpinfo.pasm"
.pcc_sub :main _main:
    .const 'Sub' P0 = "_coro"
    push_eh _catchm
    new P16, ['Integer']
    set P16, 2
    set_global "i", P16
lp:
    invokecc P0
    print "back "
    print P16
    print "\n"
    if P16, lp
    print "done\n"
    end
_catchm:
    get_results '0', P5
    print "catch main\n"
    end

.pcc_sub _coro:
    push_eh _catchc
corolp:
    get_global P17, "i"
    dec P17
    yield
    null S0
    get_global P17, S0
    branch corolp
_catchc:
    get_results '0', P5
    print "catch coro\n"
    end
CODE
back 1
catch coro
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Coroutine - exception in coro no handler" );
.include "interpinfo.pasm"
.pcc_sub :main _main:
    .const 'Sub' P0 = "_coro"
    push_eh _catchm
    new P16, ['Integer']
    set P16, 2
    set_global "i", P16
lp:
    invokecc P0
    print "back "
    print P16
    print "\n"
    if P16, lp
    print "done\n"
    end
_catchm:
    get_results '0', P5
    print "catch main\n"
    end
.pcc_sub _coro:
corolp:
    get_global P17, "i"
    dec P17
    yield
    null S0
    get_global P17, S0
    branch corolp
_catchc:
    print "catch coro\n"
    end
CODE
back 1
catch main
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Coroutine - exception in coro rethrow" );
.include "interpinfo.pasm"
.pcc_sub :main _main:
    .const 'Sub' P0 = "_coro"
    push_eh _catchm
    new P16, ['Integer']
    set P16, 2
    set_global "i", P16
lp:
    invokecc P0
    print "back "
    print P16
    print "\n"
    if P16, lp
    print "done\n"
    end
_catchm:
    get_results '0', P5
    print "catch main\n"
    end

.pcc_sub _coro:
    push_eh _catchc
corolp:
    get_global P17, "i"
    dec P17
    yield
    null S0
    get_global P17, S0
    branch corolp
_catchc:
    get_results '0', P5
    print "catch coro\n"
    rethrow P5
    end
CODE
back 1
catch coro
catch main
OUTPUT

pir_output_is( <<'CODE', "Coroutine\n", "Coro new - type" );

.sub main :main
    .local pmc c
    c = get_global "coro"
    typeof $S0, c
    say $S0
.end
.sub coro
    .local pmc x
    x = new ['Integer']
    x = 0
    iloop:
        .yield (x)
        x = x + 1
    if x <= 4 goto iloop
.end
CODE

pir_output_is( <<'CODE', "01234\n", "Coro new - yield" );

.sub main :main
    .local pmc c
    c = get_global "coro"
loop:
    .begin_call
    .call c
    .get_result   $P0 :optional
    .get_result   $I0 :opt_flag
    .end_call
    unless $I0,  ex
    print $P0
    goto loop
ex:
    print "\n"
.end
.sub coro
    .local pmc x
    x = new ['Integer']
    x = 0
    iloop:
        .yield (x)
        x = x + 1
    if x <= 4 goto iloop
.end
CODE

# TODO: Fails with Null PMC access in get_string()
pir_output_like(
    <<'CODE', <<'OUTPUT', "Call an exited coroutine", todo => 'goes one iteration too far GH #1106' );
.sub main :main
    .local pmc c
    c = get_global "coro"
loop:
    $P0 = c()
    print $P0
    goto loop
.end
.sub coro
    .local pmc x
    x = new ['Integer']
    x = 0
    iloop:
        .yield (x)
        x = x + 1
    if x <= 4 goto iloop
.end
CODE
/\A01234Cannot resume dead coroutine/
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "check whether interface is done" );

.sub _main :main
    .local pmc pmc1
    pmc1 = new ['Coroutine']
    .local int bool1
    does bool1, pmc1, "invokable"
    print bool1
    print "\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
1
0
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "re-entering coro from another sub" );

.sub main :main
    .local int z
    .const 'Sub' corou = "_coroufn"
    corou("from main")
    z = 0
  loop:
    unless z < 4 goto end
    met(corou)
    inc z
    goto loop
  end:
.end

.sub met
    .param pmc corou
    corou()
.end

.sub _coroufn
    .param string x
    .local int j
    print "coroutine: first call "
    print x
    print "\n"
    j = 0
  coroufn_1:
    inc j
    print "yield #"
    print j
    print "\n"
    .yield()
    goto coroufn_1
.end
CODE
coroutine: first call from main
yield #1
yield #2
yield #3
yield #4
yield #5
OUTPUT

pir_output_is(
    <<'CODE', <<'OUTPUT',  "Continue coroutine with params");
.sub 'main' :main
    coro(1)
    coro(2)
    coro(3)
.end
.sub coro
    .param int x
    .local int y
    y = 0
  loop:
    say x
    .yield(x)
    .param int y
    x += y
    if y >= 0 goto loop
.end
CODE
1
3
6
OUTPUT

pir_output_is(
    <<'CODE', <<'OUTPUT', "Final return from coroutine", todo => 'one invoke too many GH #1106' );
.sub 'MyCoro'
    .yield(1)
    .yield(2)
    .return(4)
.end

.sub 'main' :main
    $I0 = MyCoro()
    say $I0
    $I0 = MyCoro()
    say $I0
    $I0 = MyCoro()
    say $I0
.end
CODE
1
2
4
OUTPUT

SKIP: {
    skip "with darwin valgrind", 2 if $ENV{VALGRIND} and $^O eq 'darwin';

# Note: TT #1702/GH #564 argued that dead coros should be resumable.
pir_error_output_like(<<'CODE', <<'OUTPUT', "Resume dead coroutine w/o autoreset");
.sub 'MyCoro'
    .yield(1)      # 2. ff y=1=>0
    .yield(2)      # 4. ff y=1=>0
    .return(4)     # 6. returncc !ff
.end

.sub 'main' :main
    $I0 = MyCoro() # 1. setup first ctx
    print $I0
    $I0 = MyCoro() # 3. !ff y=>1
    print $I0
    $I0 = MyCoro() # 5. !ff y=>1
    print $I0

    push_eh ehandler
    $I0 = MyCoro() # 7. ff (y=0) => Cannot resume dead coroutine
    print $I0

    ehandler:
    pop_eh
.end
CODE
/\A124Cannot resume dead coroutine/
OUTPUT

# Note: TT #1710/GH #585 argued that if one clone is dead the other are also dead.
# Wrong. Each coro is dead/exhausted independently here.
pir_error_output_like(
    <<'CODE', <<'OUTPUT', "No dead clones" );
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

    restart:
    four(1)

    ehandler:
    pop_eh
    goto restart
.end

.sub '' :anon :subid('coro')
    .param int x
    print x
    print '.0-'
    .yield (x)

    print x
    print '.1-'
    .yield (x)

    print x
    print '.done-'
.end
CODE
/\A3.0-4.0-5.0-3.1-3.done-4.1-5.1-4.done-5.done-Cannot resume dead coroutine/
OUTPUT

}

pir_output_is(<<'CODE', <<'OUTPUT', "Manual reset" );
.sub 'main' :main
    .const 'Coroutine' $P99 = 'MyCoro'
    $I0 = MyCoro()
    say $I0
    $I0 = MyCoro()
    say $I0

    $P99.'reset'()
    $I0 = MyCoro()
    say $I0
    $I0 = MyCoro()
    say $I0
.end
.sub 'MyCoro'
    .yield(1)
    .yield(2)
    .return(3)
.end
CODE
1
2
1
2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "autoreset", todo => 'one invoke too many GH #1106' );
.sub 'main' :main
    .const 'Coroutine' $P99 = 'MyCoro'
    $P99.'autoreset'()
    $I0 = MyCoro()
    say $I0
    $I0 = MyCoro()
    say $I0
    $I0 = MyCoro()
    say $I0
    $I0 = MyCoro()
    say $I0
.end
.sub 'MyCoro'
    .yield(1)
    .yield(2)
    .return(3)
.end
CODE
1
2
3
1
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
