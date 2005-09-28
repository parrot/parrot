#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/coroutines.t - Coroutines

=head1 SYNOPSIS

	% perl -Ilib t/pmc/coroutines.t

=head1 DESCRIPTION

Tests the C<Coroutine> PMC.

=cut

use Parrot::Test tests => 12;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "Coroutine 1");
.include "interpinfo.pasm"
_main:
    newsub P0, .Coroutine, _coro
    new P10, .Integer
    set P10, 2
    store_global "i", P10
lp:
    invokecc P0
    print "back "
    print P10
    print "\n"
    if P10, lp
    print "done\n"
    end
_coro:
    find_global P11, "i"
    dec P11
    yield
    branch _coro
CODE
back 1
back 0
done
OUTPUT

SKIP: {
    skip("should this really work with distinct registers", 1);
output_is(<<'CODE', <<'OUTPUT', "Coroutines");
    null I0
    null I3
    new P0, .Coroutine
    set_addr P0, co2
co1:
    set I10, 4
    print "start 1\n"
co1_loop:
    invokecc P0
    print "back  1\n"
    dec I10
    ne I10, 0, co1_loop
    print "done\n"
    end

co2:
    null I0
    null I3
    print "start 2\n"
    new P5, .Coroutine
    set_addr P5, co3
    set P6, P0
co2_loop:
    invokecc P0
    print "back  2\n"
    set I3, I3
    invokecc P5
    print "back  2b\n"
    set P0, P6
    branch co2_loop

co3:
    null I0
    null I3
    print "start 3\n"
    new P7, .Coroutine
    set_addr P7, co2_loop
    set P8, P0
co3_loop:
    invokecc P0
    print "back  3\n"
    set I3, I3
    set P0, P7
    invokecc P7
    print "back  3b\n"
    set P0, P8
    branch co3_loop

CODE
start 1
start 2
back  1
back  2
start 3
back  2b
back  1
back  2
back  3
back  3b
back  2b
back  1
back  2
back  3
back  2
back  2b
back  1
done
OUTPUT
}

output_is(<<'CODE', <<'OUTPUT', "Coroutines and lexicals 1");
.include "interpinfo.pasm"
    new_pad 0

    new P20, .String
    set P20, "main\n"
    store_lex -1, "a", P20

    newsub P0, .Coroutine, co1
    invokecc P0
    find_lex P21, "a"
    print P21
    invokecc P0
    print P21
    print "done\n"
    end

co1:
    new_pad 1
    new P22, .String
    set P22, "coro\n"

    store_lex -1, "a", P22
    yield
    print P22
    yield
CODE
main
coro
main
done
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Coroutines and lexicals 2");
.include "interpinfo.pasm"
    new_pad 0
    new_pad 1

    new P20, .Integer
    set P20, 20
    new P21, .Integer
    set P21, 21

    store_lex -1, "a", P20
    store_lex -2, "b", P21


    new P5, .Coroutine
    set_addr P5, co1

    new P6, .Coroutine
    set_addr P6, co2

    null I0
    set I3, 2
    set_args "(0,0)", P5, P6
    invokecc P5

    find_lex P10, "b"
    print P10
    print "\n"

    find_lex P10, "a"
    print P10
    print "\n"

    invokecc P5

    find_lex P10, "b"
    print P10
    print "\n"

    find_lex P10, "a"
    print P10
    print "\n"

    invokecc P5

    print "done\n"
    end

co1:
    get_params "(0,0)", P5, P6
    new_pad 2

    new P22, .Integer
    set P22, 22

    store_lex -1, "b", P22  # hides
    store_lex "a", P22      # replaces

    # invoke c02
    invokecc P6

    # return
    yield

    find_lex P10, "b"
    print P10
    print "\n"

    find_lex P10, "a"
    print P10
    print "\n"

    # return again
    yield

    find_lex P10, "b"
    print P10
    print "\n"

    find_lex P10, "a"
    print P10
    print "\n"

    # return again
    yield

co2:
    new_pad 1

    # return
    yield

CODE
21
22
22
22
21
22
22
22
done
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "Coroutines - M. Wallace yield example");

.sub __main__
    .local Coroutine itr
    .local object return
    .local object counter
    newsub itr, .Coroutine, _iterator

    .local object zero
    zero = new Integer
    zero = 0

    newsub return, .Continuation, return_here
    loop:
        .pcc_begin
            .pcc_call itr, return
            .result counter
        .pcc_end

        print counter
        print " "

        zero = 0
        print zero
        print "\n"
    goto loop
return_here:
    end
.end

.pcc_sub _iterator
    .local object x
    x = new Integer
    x = 0
    iloop:
        .pcc_begin_yield
        .return x
        .pcc_end_yield
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

output_is(<<'CODE', <<'OUTPUT', "Coroutine - exception in main");
.include "interpinfo.pasm"
_main:
    newsub P0, .Coroutine, _coro
    newsub P16, .Exception_Handler, _catchm
    set_eh P16
    new P16, .Integer
    set P16, 2
    store_global "i", P16
lp:
    invokecc P0
    print "back "
    print P16
    print "\n"
    find_global P17, "no_such"
    if P16, lp
    print "done\n"
    end
_coro:
    newsub P16, .Exception_Handler, _catchc
    set_eh P16
corolp:
    find_global P17, "i"
    dec P17
    yield
    branch corolp
_catchc:
    print "catch coro\n"
    end
_catchm:
    print "catch main\n"
    end
CODE
back 1
catch main
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Coroutine - exception in coro");
.include "interpinfo.pasm"
_main:
    newsub P0, .Coroutine, _coro
    newsub P16, .Exception_Handler, _catchm
    set_eh P16
    new P16, .Integer
    set P16, 2
    store_global "i", P16
lp:
    invokecc P0
    print "back "
    print P16
    print "\n"
    if P16, lp
    print "done\n"
    end
_coro:
    newsub P16, .Exception_Handler, _catchc
    set_eh P16
corolp:
    find_global P17, "i"
    dec P17
    yield
    find_global P17, "no_such"
    branch corolp
_catchc:
    print "catch coro\n"
    end
_catchm:
    print "catch main\n"
    end
CODE
back 1
catch coro
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Coroutine - exception in coro no handler");
.include "interpinfo.pasm"
_main:
    newsub P0, .Coroutine, _coro
    newsub P16, .Exception_Handler, _catchm
    set_eh P16
    new P16, .Integer
    set P16, 2
    store_global "i", P16
lp:
    invokecc P0
    print "back "
    print P16
    print "\n"
    if P16, lp
    print "done\n"
    end
_coro:
corolp:
    find_global P17, "i"
    dec P17
    yield
    find_global P17, "no_such"
    branch corolp
_catchc:
    print "catch coro\n"
    end
_catchm:
    print "catch main\n"
    end
CODE
back 1
catch main
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Coroutine - exception in coro rethrow");
.include "interpinfo.pasm"
_main:
    newsub P0, .Coroutine, _coro
    newsub P16, .Exception_Handler, _catchm
    set_eh P16
    new P16, .Integer
    set P16, 2
    store_global "i", P16
lp:
    invokecc P0
    print "back "
    print P16
    print "\n"
    if P16, lp
    print "done\n"
    end
_coro:
    newsub P16, .Exception_Handler, _catchc
    set_eh P16
corolp:
    find_global P17, "i"
    dec P17
    yield
    find_global P17, "no_such"
    branch corolp
_catchc:
    print "catch coro\n"
    rethrow P5
    end
_catchm:
    print "catch main\n"
    end
CODE
back 1
catch coro
catch main
OUTPUT


pir_output_is(<<'CODE', 'Coroutine', "Coro new - type");

.sub main @MAIN
    .local pmc c
    c = global "coro"
    typeof S0, c
    print S0
.end
.sub coro
    .local pmc x
    x = new Integer
    x = 0
    iloop:
        .yield (x)
        x = x + 1
    if x <= 4 goto iloop
.end
CODE

pir_output_is(<<'CODE', '01234', "Coro new - yield");

.sub main @MAIN
    .local pmc c
    c = global "coro"
loop:
    .pcc_begin
    .pcc_call c
    .result   $P0 :optional
    .result   $I0 :opt_flag
    .pcc_end
    unless $I0,  ex
    print $P0
    goto loop
ex:
.end
.sub coro
    .local pmc x
    x = new Integer
    x = 0
    iloop:
        .yield (x)
        x = x + 1
    if x <= 4 goto iloop
.end
CODE

pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");

.sub _main
    .local pmc pmc1
    pmc1 = new Coroutine
    .local int bool1
    does bool1, pmc1, "scalar"
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

