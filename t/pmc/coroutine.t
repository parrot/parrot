#! perl
# Copyright (C) 2001-2005, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 11;

=head1 NAME

t/pmc/coroutines.t - Coroutines

=head1 SYNOPSIS

    % prove t/pmc/coroutine.t

=head1 DESCRIPTION

Tests the C<Coroutine> PMC.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', "Coroutine 1" );
.include "interpinfo.pasm"
.pcc_sub _main:
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

.sub __main__
    .local pmc return
    .local pmc counter
    .const 'Sub' itr = "_iterator"

    .local pmc zero
    zero = new ['Integer']
    zero = 0

    return = new ['Continuation']
    set_addr return, return_here
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
_main:
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
_main:
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
_main:
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
_main:
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

pir_output_is( <<'CODE', 'Coroutine', "Coro new - type" );

.sub main :main
    .local pmc c
    c = get_global "coro"
    typeof $S0, c
    print $S0
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

pir_output_is( <<'CODE', '01234', "Coro new - yield" );

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

pir_output_like(
    <<'CODE', <<'OUTPUT', "Call an exited coroutine", todo => 'goes one iteration too far TT #1003' );
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

.sub _main
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
