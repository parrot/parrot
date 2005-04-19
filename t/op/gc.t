#! perl -w

# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/gc.t - Garbage Collection

=head1 SYNOPSIS

	% perl -Ilib t/op/gc.t

=head1 DESCRIPTION

Tests garbage collection with the C<interpinfo> operation and various
DOD/GC related bugs.

=cut

use Parrot::Test tests => 19;

output_is( <<'CODE', '1', "sweep 1" );
      interpinfo I1, 2   # How many DOD runs have we done already?
      sweep 1
      interpinfo I2, 2   # Should be one more now
      sub I3, I2, I1
      print I3
      end
CODE

output_is( <<'CODE', '0', "sweep 0" );
      interpinfo I1, 2   # How many DOD runs have we done already?
      sweep 0
      interpinfo I2, 2   # Should be same
      sub I3, I2, I1
      print I3
      end
CODE

output_is( <<'CODE', '1', "sweep 0, with object that need destroy" );
      interpinfo I1, 2   # How many DOD runs have we done already?
      new P0, .Undef
      needs_destroy P0
      sweep 0
      interpinfo I2, 2   # Should be one more now
      sub I3, I2, I1
      print I3
      end
CODE

output_is( <<'CODE', '10', "sweep 0, with object that need destroy/destroy");
      interpinfo I1, 2   # How many DOD runs have we done already?
      new P0, .Undef
      needs_destroy P0
      new P0, .Undef # kill object
      sweep 0
      interpinfo I2, 2   # Should be one more now
      sub I3, I2, I1
      sweep 0
      interpinfo I4, 2   # Should be same as last
      sub I5, I4, I2
      print I3           # These create PMCs that need early DOD, so we need
      print I5           # to put them after the second sweep op.
      end
CODE

output_is( <<'CODE', '1', "collect" );
      interpinfo I1, 3   # How many garbage collections have we done already?
      collect
      interpinfo I2, 3   # Should be one more now
      sub I3, I2, I1
      print I3
      end
CODE

output_is( <<'CODE', <<'OUTPUT', "collectoff/on" );
      interpinfo I1, 3
      collectoff
      collect
      interpinfo I2, 3
      sub I3, I2, I1
      print I3
      print "\n"

      collecton
      collect
      interpinfo I4, 3
      sub I6, I4, I2
      print I6
      print "\n"

      end
CODE
0
1
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "Nested collectoff/collecton" );
      interpinfo I1, 3
      collectoff
      collectoff
      collecton
      collect           # This shouldn't do anything...    #'
      interpinfo I2, 3
      sub I3, I2, I1
      print I3
      print "\n"

      collecton
      collect           # ... but this should
      interpinfo I4, 3
      sub I6, I4, I2
      print I6
      print "\n"

      end
CODE
0
1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "sweepoff with newpmcs");
    print "starting\n"

    sweepoff
    set I0, 0

LOOP: new P0, .String
    set P0, "ABC"
    save P0
    inc I0
    lt I0, 127, LOOP

    print "ending\n"

    end
CODE
starting
ending
OUTPUT

output_is(<<'CODE', <<OUTPUT, "vanishing slingleton PMC");
_main:
    newsub P0, .Sub, _rand
    set I16, 100
    set I17, 0
loop:
    sweep 1
    invokecc
    inc I17
    lt I17, I16, loop
    print "ok\n"
    end

_rand:
    new P16, .Random
    set I5, P16[10]
    gt I5, 10, err
    lt I5, 0, err
    returncc
err:
    print "singleton destroyed .Random = ."
    new P16, .Random
    typeof S16, P16
    print S16
    print "\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "vanishing return continuation in method calls");
    newclass P1, "Foo"

    find_type I1, "Foo"
    new P3, I1
    print "ok\n"
    end

.namespace ["Foo"]
.pcc_sub __init:
    print "init\n"
    sweep 1
    new P6, .String
    set P6, "hi"
.include "interpinfo.pasm"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    callmethodcc "do_inc"
    sweep 1
    returncc

.pcc_sub do_inc:
    sweep 1
.include "interpinfo.pasm"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    inc P2
    sweep 1
    print "back from _inc\n"
    returncc

.pcc_sub __increment:
    print "inc\n"
    sweep 1
    returncc
CODE
init
inc
back from _inc
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "failing if regsave is not marked");
    newclass P9, "Source"
    newclass P10, "Source::Buffer"
    find_type I9,"Source"
    new P12, I9

    set S20, P12
    print S20
    set S20, P12
    print S20
    end

.namespace ["Source"]
.pcc_sub __get_string:	# buffer
.include "interpinfo.pasm"
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    getprop P12, "buf", P2
    sweep 1
    typeof I12, P12
    ne I12, .PerlUndef, buffer_ok
    find_type I12, "Source::Buffer"
    new P12, I12
    new P14, .String
    set P14, "hello\n"
    setprop P12, "buf", P14
    setprop P2, "buffer", P12
buffer_ok:
    set I0, 1
    null I1
    set I2, 1
    null I3
    null I4
    set S5, P12
    returncc

.namespace ["Source::Buffer"]
.pcc_sub __get_string:
    sweep 1
    interpinfo P2, .INTERPINFO_CURRENT_OBJECT
    getprop P12, "buf", P2
    set S16, P12
    set S5, S16
    set I0, 1
    null I1
    set I2, 1
    null I3
    null I4
    returncc
CODE
hello
hello
OUTPUT

# this is a stripped down version of imcc/t/syn/pcc_16
# s. also classes/retcontinuation.pmc
output_is(<<'CODE', <<OUTPUT, "coro context and invalid return continuations");
    newsub P0, .Coroutine, co1
l:
    invokecc
    inc I20
    lt I20, 3, l
    print "done\n"
    end
co1:
    set P17, P1
col:
    print "coro\n"
    sweep 1
    invoke P0
    branch col
CODE
coro
coro
coro
done
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "Fun with nondeterministic searches");


# code by Piers Cawley
=pod

  ;;; Indicate that the computation has failed, and that the program
  ;;; should try another path.  We rebind this variable as needed.
  (define fail
    (lambda () (error "Program failed")))

  ;;; Choose an arbitrary value and return it, with backtracking.
  ;;; You are not expected to understand this.
  (define (choose . all-choices)
    (let ((old-fail fail))
      (call-with-current-continuation
       (lambda (continuation)
         (define (try choices)
           (if (null? choices)
               (begin
                 (set! fail old-fail)
                 (fail))
               (begin
                 (set! fail
                      (lambda () (continuation (try (cdr choices)))))
                 (car choices))))
         (try all-choices)))))

  ;;; Find two numbers with a product of 15.
  (let ((x (choose 1 3 5))
        (y (choose 1 5 9)))
    (for-each display `("Trying " ,x " and " ,y #\newline))
    (unless (= (* x y) 15)
      (fail))
    (for-each display `("Found " ,x " * " ,y " = 15" #\newline)))

=cut

.sub main
     .local pmc arr1
     .local pmc arr2
     .local pmc x
     .local pmc y
     .local pmc choose
     .local pmc fail
     new_pad 0
     $P0 = new PerlArray
     store_lex 0, "*paths*", $P0
     $P0 = new String
     $P0 = "@"
     store_lex 0, "failsym", $P0
     store_lex 0, "choose", $P0
     store_lex 0, "fail", $P0
     newsub choose, .Closure, _choose
     store_lex "choose", choose
     newsub fail, .Closure, _fail
     store_lex "fail", fail
     arr1 = new PerlArray
     store_lex 0, "arr1", arr1
     arr1[0] = 1
     arr1[1] = 3
     arr1[2] = 5
     arr2 = new PerlArray
     store_lex 0, "arr2", arr2
     arr2[0] = 1
     arr2[1] = 5
     arr2[2] = 9

     x = choose(arr1)
     store_lex 0, "x", x
     #print "Chosen "
     #print x
     #print " from arr1\n"

     # need to create a new closure: these closures have different state
     #
     # arr2 and x,y have to be lexicals as due to continuations
     # all variables needs refetching after a subroutine call

     newsub choose, .Closure, _choose
     arr2 = find_lex "arr2"
     y = choose(arr2)
     store_lex 0, "y", y
     #print "Chosen "
     #print y
     #print " from arr2\n"
     x = find_lex "x"
     $I1 = x
     $I2 = y
     $I0 = $I1 * $I2
     if $I0 == 15 goto success
     $P0 = find_lex "fail"
     $P0()
     print "Shouldn't get here without a failure report\n"
     branch the_end
success:
     x = find_lex "x"
     y = find_lex "y"
     print x
     print " * "
     print y
     print " == 15!\n"
the_end:
     end
.end

.sub _choose
     .param PerlArray choices
     .local pmc our_try
     #print "In choose\n"
     new_pad 1
     find_lex $P0, "fail"
     store_lex 1, "old_fail", $P0
     .include "interpinfo.pasm"
     $P1 = interpinfo .INTERPINFO_CURRENT_CONT
     store_lex 1, "cc", $P1
     newsub our_try, .Closure, _try
     store_lex 1, "try", our_try
     $P2 = our_try(choices)
     .pcc_begin_return
     .return $P2
     .pcc_end_return
.end

.sub _try
     .param PerlArray choices
     #print "In try\n"
     new_pad 2
     clone $P0, choices
     store_lex 2, "choices", $P0
     if choices goto have_choices
     $P1 = find_lex "old_fail"
     store_lex "fail", $P1
     $P1()
have_choices:
     newsub $P2, .Closure, new_fail
     store_lex "fail", $P2
     $P3 = find_lex "choices"
     shift $P4, $P3

     .pcc_begin_return
     .return $P4
     .pcc_end_return

new_fail:
     .local pmc our_try
     .local pmc our_cc
     #print "In new_fail\n"
     our_cc = find_lex "cc"
     our_try = find_lex "try"
     $P2 = find_lex "choices"
     $P3 = our_try($P2)
     our_cc($P3)
.end

.sub _fail
     print "Program failed\n"
     .pcc_begin_return
     .pcc_end_return
.end
CODE
3 * 5 == 15!
OUTPUT

pir_output_is(<<'CODE', <<OUTPUT, "Recursion and exceptions");

# this did segfault with GC_DEBUG

.sub main @MAIN
    .local pmc n
    new_pad 0
    $P0 = getinterp
    $P0."recursion_limit"(10)
    newclass $P0, "b"
    $I0 = find_type "b"
    $P0 = new $I0
    $P1 = new Integer
    $P1 = 0
    n = $P0."b11"($P1)
    print "ok 1\n"
    print n
    print "\n"
.end
.namespace ["b"]
.sub b11 method
    .param pmc n
    .local pmc n1
    # new_pad -1
    # store_lex -1, "n", n
    n1 = new Integer
    n1 = n + 1
    push_eh catch
    n = self."b11"(n1)
    # store_lex -1, "n", n
    clear_eh
catch:
    # n = find_lex "n"
    .return(n)
.end
CODE
ok 1
9
OUTPUT

output_is(<<'CODE', <<OUTPUT, "write barrier 1");
    null I2
    set I3, 100
lp3:
    null I0
    set I1, 1000
    new P1, .ResizablePMCArray
lp1:
    new P2, .ResizablePMCArray
    new P0, .Integer
    set P0, I0
    set P2[0], P0
    set P1[I0], P2
    if I0, not_0
    needs_destroy P0
    # force marking past P2[0]
    sweep 0
not_0:
    new P3, .Undef
    new P4, .Undef
    inc I0
    lt I0, I1, lp1

    null I0
    # trace 1
lp2:
    set P2, P1[I0]
    set P2, P2[0]
    eq P2, I0, ok
    print "nok\n"
    print "I0: "
    print I0
    print " P2: "
    print P2
    print " type: "
    typeof S0, P2
    print S0
    print " I2: "
    print I2
    print "\n"
    exit 1
ok:
    inc I0
    lt I0, I1, lp2
    inc I2
    lt I2, I3, lp3
    print "ok\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "write barrier 2 - hash");
    null I2
    set I3, 100
lp3:
    null I0
    set I1, 100
    new P1, .Hash
lp1:
    new P2, .Hash
    new P0, .Integer
    set P0, I0
    set S0, I0
    set P2["first"], P0
    set P1[S0], P2
    if I0, not_0
    new P0, .Integer
    needs_destroy P0
    null P0
    # force full sweep
    sweep 0
not_0:
    new P3, .Undef
    new P4, .Undef
    inc I0
    lt I0, I1, lp1

    null I0
    # trace 1
lp2:
    set S0, I0
    set P2, P1[S0]
    set P2, P2["first"]
    eq P2, I0, ok
    print "nok\n"
    print "I0: "
    print I0
    print " P2: "
    print P2
    print " type: "
    typeof S0, P2
    print S0
    print " I2: "
    print I2
    print "\n"
    exit 1
ok:
    inc I0
    lt I0, I1, lp2
    inc I2
    lt I2, I3, lp3
    print "ok\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "write barrier 3 - ref");
    null I2
    set I3, 10
lp3:
    null I0
    set I1, 100
    new P5, .Ref
    new P0, .Integer
    needs_destroy P0
    # force partial sweep
    # ref should now be black
    sweep 0
    # store white hash in ref - needs a barrier
    new P1, .Hash
    setref P5, P1
    null P1
    new P0, .Integer
    needs_destroy P0
    null P0
    # force full sweep
    sweep 0
    deref P1, P5
lp1:
    new P0, .Integer
    new P2, .Ref, P0
    set P0, I0
    set S0, I0
    set P1[S0], P2
    if I0, not_0
    new P0, .Integer
not_0:
    new P3, .Undef
    new P4, .Undef
    inc I0
    lt I0, I1, lp1

    null I0
    deref P1, P5
    # trace 1
lp2:
    set S0, I0
    set P2, P1[S0]
    deref P2, P2
    eq P2, I0, ok
    print "nok\n"
    print "I0: "
    print I0
    print " P2: "
    print P2
    print " type: "
    typeof S0, P2
    print S0
    print " I2: "
    print I2
    print "\n"
    exit 1
ok:
    inc I0
    lt I0, I1, lp2
    inc I2
    lt I2, I3, lp3
    print "ok\n"
    end

CODE
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "write barrier 4 - tqueue");
    null I2
    set I3, 100
lp3:
    null I0
    set I1, 10
    new P5, .TQueue
    new P0, .Integer
    needs_destroy P0
    # force partial sweep
    # P5 should now be black
    sweep 0
    # store white queue P1 in black P5 - needs a barrier
    new P1, .TQueue
    push P5, P1
    null P1
    new P0, .Integer
    needs_destroy P0
    # force  sweep
    sweep 0
    shift P1, P5
    push P5, P1
lp1:
    new P0, .Integer
    needs_destroy P0
    # force  sweep
    sweep 0
    set P0, I0
    new P2, .TQueue
    push P2, P0
    push P1, P2
    new P3, .Undef
    new P4, .Undef
    inc I0
    lt I0, I1, lp1

    null I0
    shift P1, P5
lp2:
    shift P2, P1
    shift P2, P2
    eq P2, I0, ok
    print "nok\n"
    print "I0: "
    print I0
    print " P2: "
    print P2
    print " type: "
    typeof S0, P2
    print S0
    print " I2: "
    print I2
    print "\n"
    exit 1
ok:
    inc I0
    lt I0, I1, lp2
    inc I2
    lt I2, I3, lp3
    print "ok\n"
    end

CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "verify deleg_pmc object marking");
.sub main @MAIN
    .local pmc cl, s, t
    cl = subclass "String", "X"
    addattribute cl, "o3"
    addattribute cl, "o4"
    s = new "X"
    $P0 = new String
    $S0 = "ok" . " 3\n"
    $P0 = $S0
    setattribute s, "X\0o3", $P0
    $P0 = new String
    $S0 = "ok" . " 4\n"
    $P0 = $S0
    setattribute s, "X\0o4", $P0
    null $P0
    null $S0
    null cl
    sweep 1
    s = "ok 1\n"
    print s
    .local int i
    i = 0
lp:
    t = new "X"
    inc i
    if i < 1000 goto lp
    t = "ok 2\n"
    print s
    print t
    $P0 = getattribute s, "X\0o3"
    print $P0
    $P0 = getattribute s, "X\0o4"
    print $P0
.end
CODE
ok 1
ok 1
ok 2
ok 3
ok 4
OUTPUT
