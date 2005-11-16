#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/lexicals.t - Lexical Ops

=head1 SYNOPSIS

	% perl -Ilib t/op/lexicals.t

=head1 DESCRIPTION

Tests various lexical scratchpad operations.

=cut

use Parrot::Test tests => 34;

output_is(<<'CODE', <<'OUTPUT', '.lex parsing - PASM');
.pcc_sub main:
    .lex "$a", P0
    print "ok\n"
    end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', '.lex parsing - PIR');
.sub main
    .lex "$a", P0
    print "ok\n"
    end
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', '.lex parsing - PIR, $P');
.sub main
    .lex '$a', $P0
    null $P0
    null $P1
    print "ok\n"
    end
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', '.lex parsing - PIR, local var');
.sub main
    .local pmc a
    .lex "$a", a
    print "ok\n"
    end
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', '.lex parsing - get_lexinfo');
.sub main
    .lex '$a', $P0
    .lex '$b', $P9
.include "interpinfo.pasm"
    interpinfo $P1, .INTERPINFO_CURRENT_SUB
    $P2 = $P1.'get_lexinfo'()
    $S0 = typeof $P2
    print_item $S0
    $I0 = elements $P2
    print_item $I0
    print_newline
.end
CODE
LexInfo 2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'get_lexpad - no pad');
.sub main
.include "interpinfo.pasm"
    interpinfo $P1, .INTERPINFO_CURRENT_SUB
    $P2 = $P1.'get_lexpad'()
    if null $P2 goto ok
    print "pad not NULL\n"
    end
ok:
    print "ok\n"
    end
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'get_lexpad - no pad inherited in coro');
.sub main
     coro()
.end
.sub coro
.include "interpinfo.pasm"
    interpinfo $P1, .INTERPINFO_CURRENT_SUB
    $P2 = $P1.'get_lexpad'()
    if null $P2 goto ok
    print "pad not NULL\n"
    .yield()
ok:
    print "ok\n"
    .yield()
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'get_lexpad - set var via pad');
.sub main
.include "interpinfo.pasm"
    .lex '$a', P0
    interpinfo $P1, .INTERPINFO_CURRENT_SUB
    .local pmc pad
    pad = $P1.'get_lexpad'()
    unless null pad goto ok
    print "pad is NULL\n"
    end
ok:
    print "ok\n"
    P1 = new .Integer
    P1 = 13013
    pad['$a'] = P1
    print P0
    print "\n"
    end
.end
CODE
ok
13013
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'synopsis example');
.sub main
    .lex '$a', P0
    P1 = new .Integer
    P1 = 13013
    store_lex '$a', P1
    print P0
    print "\n"
    end
.end
CODE
13013
OUTPUT


output_is(<<'CODE', <<'OUTPUT', ':outer parsing - PASM');
.pcc_sub main:
    print "ok\n"
    end
.pcc_sub :outer('main') foo:
    returncc
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', ':outer parsing - PIR');
.sub main
    print "ok\n"
.end
.sub foo :outer('main')
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', ':outer parsing - ident');
.sub main
    .local pmc a
    .lex "$a", a
    print "ok\n"
    end
.end
.sub foo :outer(main)
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'get_lexinfo from pad');
.sub main
.include "interpinfo.pasm"
    .lex '$a', P0
    interpinfo $P1, .INTERPINFO_CURRENT_SUB
    .local pmc pad, info
    pad = $P1.'get_lexpad'()
    unless null pad goto ok
    print "pad is NULL\n"
    end
ok:
    print "ok\n"
    info = pad.'get_lexinfo'()
    typeof $S0, info
    print $S0
    print "\n"
    end
.end
CODE
ok
LexInfo
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'get_outer');
.sub "main"
    foo()
.end
.sub foo :outer('main')
    .include "interpinfo.pasm"
    interpinfo $P1, .INTERPINFO_CURRENT_SUB
    $P2 = $P1."get_outer"()
    print $P2
    print "\n"
.end
CODE
main
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'get_outer 2');
.sub "main"
    foo()
.end
.sub foo  :outer('main')
    bar()
.end
.sub bar   :outer('foo')
    .include "interpinfo.pasm"
    interpinfo $P1, .INTERPINFO_CURRENT_SUB
    $P2 = $P1."get_outer"()
    print $P2
    print "\n"
    $P3 = $P2."get_outer"()
    print $P3
    print "\n"
.end
CODE
foo
main
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'closure 1');
.sub "main"
    .lex 'a', $P0
    $P1 = new .String
    $P1 = "main_a\n"
    store_lex 'a', $P1
    $P2 = find_lex 'a'
    print $P2
    foo()
    print $P0
    $P2 = find_lex 'a'
    print $P2
.end
.sub foo  :outer('main')
    .lex 'b', $P0
    $P1 = new .String
    $P1 = "foo_b\n"
    store_lex 'b', $P1
    bar()
.end
.sub bar   :outer('foo')
    .lex 'b', $P0
    $P1 = new .String
    $P1 = "bar_b\n"
    store_lex 'b', $P1
    $P2 = find_lex 'b'
    print $P2
    $P2 = find_lex 'a'
    print $P2
.end
CODE
main_a
bar_b
main_a
main_a
main_a
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'closure 2');
.sub "main"
    .lex 'a', $P0
    $P1 = new .String
    $P1 = "main_a\n"
    store_lex 'a', $P1
    $P2 = find_lex 'a'
    print $P2
    foo()
    print $P0
    $P2 = find_lex 'a'
    print $P2
.end
.sub foo  :outer('main')
    .lex 'b', $P0
    $P1 = new .String
    $P1 = "foo_b\n"
    store_lex 'b', $P1
    bar()
    $P2 = find_lex 'b'
    print $P2
.end
.sub bar   :outer('foo')
    .lex 'b', $P0
    $P1 = new .String
    $P1 = "bar_b\n"
    store_lex 'b', $P1
    $P2 = find_lex 'b'
    print $P2
    $P2 = find_lex 'a'
    print $P2
    $P2 = "ex_main_a\n"
.end
CODE
main_a
bar_b
main_a
foo_b
ex_main_a
ex_main_a
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'closure 3');
# sub foo {
#     my ($n) = @_;
#     sub {$n += shift}
# }
# my $f = foo(5);
# print &$f(3), "\n";
# my $g = foo(20);
# print &$g(3), "\n";
# print &$f(3), "\n";
# print &$g(4), "\n";

.sub foo
    .param pmc arg
    .local pmc n
    .lex '$n', n
    n = arg
    .const .Sub anon = "anon"
    $P0 = newclosure anon
    .return ($P0)
.end

.sub anon :outer(foo)
    .param pmc arg
    $P0 = find_lex '$n'
    # in practice we need copying the arg but as it is passed
    # as native int, we already have a fresh pmc
    $P0 += arg
    .return ($P0)
.end

.sub main :main
    .local pmc f, g
    .lex '$f', f
    .lex '$g', g
    f = foo(5)
    $P0 = f(3)
    print $P0
    print "\n"
    g = foo(20)
    $P0 = g(3)
    print $P0
    print "\n"
    $P0 = f(3)
    print $P0
    print "\n"
    $P0 = g(4)
    print $P0
    print "\n"
.end
CODE
8
23
11
27
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'closure 4');
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

.sub main :main
     .local pmc fail, arr1, arr2, x, y, choose
     .lex 'fail', fail
     .lex 'arr1', arr1
     .lex 'arr2', arr2
     .lex 'x', x
     .lex 'y', y
     .lex 'choose', choose
     .const .Sub choose_sub = "_choose"
     .const .Sub fail_sub = "_fail"
     fail = newclosure fail_sub
     arr1 = new PerlArray
     arr1[0] = 1
     arr1[1] = 3
     arr1[2] = 5
     arr2 = new PerlArray
     arr2[0] = 1
     arr2[1] = 5
     arr2[2] = 9

     choose = newclosure choose_sub
     x = choose(arr1)
     #print "Chosen "
     #print x
     #print " from arr1\n"

     # need to create a new closure: these closures have different state
     choose = newclosure choose_sub
     y = choose(arr2)
     #print "Chosen "
     #print y
     #print " from arr2\n"
     $I1 = x
     $I2 = y
     $I0 = $I1 * $I2
     if $I0 == 15 goto success
     fail()
     print "Shouldn't get here without a failure report\n"
     branch the_end
success:
     print x
     print " * "
     print y
     print " == 15!\n"
the_end:
     end
.end

.sub _choose :outer(main)
     .param PerlArray choices
     .local pmc our_try, old_fail, cc, try
     .lex 'old_fail', old_fail
     .lex 'cc', cc
     .lex 'try', try
     #print "In choose\n"
     old_fail = find_lex "fail"
     .include "interpinfo.pasm"
     $P1 = interpinfo .INTERPINFO_CURRENT_CONT
     store_lex  "cc", $P1
     .const .Sub tr_sub = "_try"
     newclosure our_try, tr_sub
     store_lex "try", our_try
     $P2 = our_try(choices)
     .return($P2)
.end

.sub _try :outer(_choose)
     .param PerlArray choices
     .lex 'choices', $P0
     #print "In try\n"
     clone $P0, choices
     if choices goto have_choices
     $P1 = find_lex "old_fail"
     store_lex "fail", $P1
     $P1()
have_choices:
     .const .Sub f = "new_fail"
     newclosure $P2, f
     store_lex "fail", $P2
     $P3 = find_lex "choices"
     shift $P4, $P3

     .return($P4)
.end

.sub new_fail :outer(_try)
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
.end
CODE
3 * 5 == 15!
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'closure 5');
# FIXME - we need to detect the destruction of the P registers
# associated with the Contexts for the calls of xyzzy and plugh.
# Otherwise, this test is just a repeat of others

.sub main :main
	.local pmc func
	func = xyzzy()

	invokecc func
	invokecc func
	invokecc func
.end

.sub xyzzy
	$P1 = plugh()
	.return ($P1)
.end

.sub plugh
	$P1 = foo()
	.return ($P1)
.end

.sub foo
	.lex 'a', $P0
	$P0 = new Integer
	$P0 = 0

	.const .Sub bar_sub = "bar"
	$P1 = newclosure bar_sub
	.return ($P1)
.end

.sub bar :anon :outer(foo)
	$P0 = find_lex 'a'
	inc $P0
	print "bar: "
	print $P0
	print "\n"
.end
CODE
bar 1
bar 2
bar 3
OUTPUT

pir_output_like(<<'CODE', <<'OUTPUT', 'get non existing');
.sub "main"
    .lex 'a', $P0
    foo()
.end
.sub foo  :outer('main')
    .lex 'b', $P0
    bar()
.end
.sub bar   :outer('foo')
    .lex 'c', $P0
    $P2 = find_lex 'no_such'
.end
CODE
/Lexical 'no_such' not found/
OUTPUT

output_is(<<CODE, <<OUTPUT, "simple store and fetch");
	new_pad 0
	new P0, .Integer
	new P1, .Integer
	set P0, 12
	set P1, 7
	store_lex 0, "Integer", P0
	find_lex P1, "Integer"
	print P1
        print "\\n"
	find_lex P1, 0, "Integer"
	print P1
        print "\\n"
	end
CODE
12
12
OUTPUT

output_is(<<CODE, <<OUTPUT, "Repeated stores with the same key");
	new_pad 0
	new P0, .Integer
	new P1, .Integer
        set I0, 0
LOOP:
	set P0, I0
	store_lex 0, "a", P0
	find_lex P1, "a"
	print P1
        print "\\n"
        inc I0
        lt I0, 10, LOOP
	end
CODE
0
1
2
3
4
5
6
7
8
9
OUTPUT

output_is(<<CODE, <<OUTPUT, "nested scopes");
  new P0, .Integer
  new P1, .Integer
  new P2, .Integer
  new P3, .Integer
  set P0, 0
  set P1, 1
  set P2, 2

  # outer most lexical scope
  new_pad 0
  store_lex 0, "a", P0
  find_lex P3, "a"
  print P3
  print "\\n"

    new_pad 1
    store_lex 1, "a", P1

      new_pad 2
      store_lex 2, "c", P2
      find_lex P3, "c"
      print P3
      print "\\n"
      pop_pad

    find_lex P3, "a"
    print P3
    print "\\n"

    pop_pad

  find_lex P3, "a"
  print P3
  print "\\n"
  end
CODE
0
2
1
0
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Replacing a scope at the same depth.");
# sub f($x) {
#     sub g($y) {
#         my $foo = $y
#         if $y > 0 { f $y - 1 }
#         $outer::bar = $foo - 1
#     }
#     $foo = $x + 1
#     g $x
#     print $foo, $bar
# }

	new P3, .Integer
	set P3, 2
	save P3
	bsr sub1
	end

sub2:
	saveall
	new_pad 1
	restore P1
	new P2, .Integer
	set P2, 0
	clone P3, P1
	dec P3
	store_lex 1, "foo", P3
	save P3
	eq P1, P2, done
	bsr sub1
done:
	find_lex P2, "foo"
	clone P3, P2
	store_lex 0, "bar", P3
	pop_pad
	restoreall
	ret

sub1:
	saveall
	new_pad 0
	restore P0
	clone P3, P0
	inc P3
	store_lex 0, "foo", P3
	save P0
	find_lex P2, "foo"
	print P2
	print " before sub2\n"
	bsr sub2
	find_lex P2, "foo"
	print P2
	print " = foo after sub2\n"
	find_lex P2, "bar"
	print P2
	print " = bar after sub2\n"
	pop_pad
	restoreall
	ret

CODE
3 before sub2
2 before sub2
1 before sub2
1 = foo after sub2
-1 = bar after sub2
2 = foo after sub2
0 = bar after sub2
3 = foo after sub2
1 = bar after sub2
OUTPUT

output_is(<<CODE, <<OUTPUT, "pad stack ops");
	new_pad P10, 0
        new_pad P11, 0
        new_pad P12, 0

	new P0, .Integer
	new P1, .Integer
	new P2, .Integer
	set P0, 12
	set P1, 7
	set P2, 46

        set P10[0;"a"], P0
        set P11[0;"a"], P1
        set P12[0;"a"], P2

        push_pad P10
        find_lex P20, "a"
        print P20
        print "\\n"

        push_pad P11
        find_lex P20, "a"
        print P20
        print "\\n"

        push_pad P12
        find_lex P20, "a"
        print P20
        print "\\n"

        pop_pad
        find_lex P20, "a"
        print P20
        print "\\n"

        peek_pad P22
        pop_pad
        find_lex P20, "a"
        print P20
        print "\\n"

        set P20, P22["a"]
        print P20
        print "\\n"

	end
CODE
12
7
46
7
12
7
OUTPUT

output_is(<<'CODE', <<OUTPUT, "pop_pad_p");
	new_pad P10, 0
        new_pad P11, 0
        new_pad P12, 0

	new P0, .Integer
	new P1, .Integer
	new P2, .Integer
	set P0, 12
	set P1, 7
	set P2, 46

        set P10[0;"a"], P0
        set P11[0;"a"], P1
        set P12[0;"a"], P2

        push_pad P10
        push_pad P11
        push_pad P12

        pop_pad P1
        pop_pad P2
        pop_pad P3

        set P4, P1[0;"a"]
        set P5, P2[0;"a"]
        set P6, P3[0;"a"]

        print P4
        print "\n"
        print P5
        print "\n"
        print P6
        print "\n"
	end
CODE
46
7
12
OUTPUT

output_is(<<CODE, <<OUTPUT, "access by position");
	new_pad 0
        new_pad 1
        new_pad 2

	new P0, .Integer
	new P1, .Integer
	new P2, .Integer
	new P3, .Integer
	new P4, .Integer
	new P5, .Integer
	set P0, 10
	set P1, 11
	set P2, 12
	set P3, 13
	set P4, 14
	set P5, 15

        store_lex 0, "a", P0
        store_lex -3, 1, P1

        store_lex 1, 0, P2
        store_lex -2, 1, P3

        store_lex 2, 0, P4
        store_lex -1, "x", P5

        find_lex P6, "a"
        print P6
        print "\\n"
        find_lex P6, 0, "a"
        print P6
        print "\\n"

        find_lex P6, 0
        print P6
        print "\\n"
        find_lex P6, -1, 0
        print P6
        print "\\n"
        find_lex P6, 2, 1
        print P6
        print "\\n"

        find_lex P6, 1, 0
        print P6
        print "\\n"
        find_lex P6, -2, 0
        print P6
        print "\\n"
        find_lex P6, -2, 1
        print P6
        print "\\n"

        find_lex P6, -3, 0
        print P6
        print "\\n"
        find_lex P6, 0, 1
        print P6
        print "\\n"

        store_lex "a", P5
        find_lex P6, "a"
        print P6
        print "\\n"
        find_lex P6, 0, "a"
        print P6
        print "\\n"
        find_lex P6, 0, 0
        print P6
        print "\\n"



        end
CODE
10
10
14
14
15
12
12
13
10
11
15
15
15
OUTPUT

output_is(<<'CODE', <<OUTPUT, "store by name, get by idx");
	new_pad 0
	new P0, .String
	set P0, "ok 1\n"
	store_lex -1, "a", P0
	new P0, .String
	set P0, "ok 2\n"
	store_lex -1, "b", P0
	new P0, .String
	set P0, "ok 3\n"
	store_lex -1, "c", P0
	find_lex P1, 0
	print P1
	find_lex P1, 1
	print P1
	find_lex P1, 2
	print P1
	end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_like(<<'CODE', <<OUTPUT, "accessing non-existent pad, +ve index");
       new_pad 0
       new P0, .Integer
       store_lex 2, "foo", P0
       end
CODE
/Pad index out of range/
OUTPUT

output_like(<<'CODE', <<OUTPUT, "accessing non-existent pad, -ve index");
       new_pad 0
       new P0, .Integer
       store_lex -2, "foo", P0
       end
CODE
/Pad index out of range/
OUTPUT

output_is(<<'CODE', <<OUTPUT, "store with unspecified pad");
       new_pad 0
       new P0, .Integer
       set P0, 10
       store_lex 0, "abc", P0
       new P1, .Integer
       set P1, 20
       store_lex "abc", P1
       new P2, .Integer
       find_lex P2, "abc"
       print P2
       print "\n"
       end
CODE
20
OUTPUT

output_like(<<'CODE', <<OUTPUT, "invalid store with unspecified pad");
       new_pad 0
       new P0, .Integer
       store_lex "abc", P0
       end
CODE
/Lexical 'abc' not found/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "Fetch invalid var. from specific pad");
       new_pad 0
       new P0, .Integer
       find_lex P0, 0, "Wibble"
       end
CODE
/Lexical 'Wibble' not found/
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "current pad depth");
.sub main :main
    new_pad 0
    new_pad -1
    $P0 = peek_pad
    $I0 = elements $P0
    print $I0
    new_pad -1
    $P0 = peek_pad
    $I0 = elements $P0
    print $I0
    print "\n"
.end
CODE
23
OUTPUT


