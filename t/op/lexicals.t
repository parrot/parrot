#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;


=head1 NAME

t/op/lexicals.t - Lexical Ops

=head1 SYNOPSIS

	% prove t/op/lexicals.t

=head1 DESCRIPTION

Tests various lexical scratchpad operations, as described in PDD20.

=cut


output_is(<<'CODE', <<'OUTPUT', '.lex parsing - PASM (\'$a\') succeeds');
.pcc_sub main:
    .lex "$a", P0
    print "ok\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', '.lex parsing - PASM (S0) fails', todo => 'specification unclear');
.pcc_sub main:
	S0 = '$a'
    .lex S0, P0
    print "ok\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', '.lex parsing - PASM ($S0) fails', todo => 'specification unclear');
.pcc_sub main:
	$S0 = '$a'
    .lex $S0, P0
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
.sub main :main
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
.sub main :main
    .local pmc a
    .lex "$a", a
    print "ok\n"
    end
.end
CODE
ok
OUTPUT

output_like(<<'CODE', <<'OUTPUT', '.lex - same PMC twice fails (PASM)');
.pcc_sub main:
    .lex '$a', P0
    .lex '$b', P0
	end
CODE
/variable .* is already lexical for .*/
OUTPUT

pir_output_like(<<'CODE', <<'OUTPUT', '.lex - same PMC twice fails (P0)');
.sub main :main
    .lex '$a', P0
    .lex '$b', P0
.end
CODE
/variable .* is already lexical for .*/
OUTPUT

pir_output_like(<<'CODE', <<'OUTPUT', '.lex - same PMC twice fails ($P0)');
.sub main :main
    .lex '$a', $P0
    .lex '$b', $P0
.end
CODE
/variable .* is already lexical for .*/
OUTPUT

pir_output_like(<<'CODE', <<'OUTPUT', '.lex - same PMC twice fails (.local pmc ab)');
.sub main :main
	.local pmc ab
    .lex '$a', ab
    .lex '$b', ab
.end
CODE
/variable .* is already lexical for .*/
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'api parsing');
.sub main :main
	.lex 'a', $P0
	store_lex 'a', $P0
	$P0 = find_lex 'a'
	print "ok\n"
.include 'interpinfo.pasm'
        load_bytecode "pcore.pir"      # TODO autoload/preload
	interpinfo $P1, .INTERPINFO_CURRENT_SUB
	$P2 = $P1.'get_lexinfo'()
	$P2 = $P1.'get_lexenv'()
	print "ok\n"
.end
CODE
ok
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'get_lexinfo');
.sub main :main
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

pir_output_is(<<'CODE', <<'OUTPUT', 'get_lexinfo - no lexicals');
.sub main :main
.include "interpinfo.pasm"
    interpinfo $P1, .INTERPINFO_CURRENT_SUB
    $P2 = $P1.'get_lexinfo'()
	if null $P2 goto ok
    print "LexInfo not NULL\n"
    end
ok:
	print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'get_lexpad - no pad');
.sub main :main
    .local pmc pad, interp
    interp = getinterp
    pad = interp["lexpad"]
    if null pad goto ok
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
    .local pmc pad, interp
    interp = getinterp
    pad = interp["lexpad"]
    if null pad goto ok
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
    .local pmc pad, interp
    interp = getinterp
    pad = interp["lexpad"]
    .lex '$a', P0
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

pir_output_is(<<'CODE', <<'OUTPUT', 'get_lexpad - set two vars via pad (2 lex -> 2 pmc)');
.sub main
    .lex '$a', P0
    .lex '$b', P2
    .local pmc pad, interp
    interp = getinterp
    pad = interp["lexpad"]
    .local pmc pad
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
    P1 = 42
    pad['$b'] = P1
    print P2
    print "\n"
    end
.end
CODE
ok
13013
42
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

output_is(<<'CODE', <<'OUTPUT', ':lex parsing - PASM');
.pcc_sub main:
    print "ok\n"
    end
.pcc_sub :lex foo:
    returncc
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', ':lex parsing - PIR');
.sub main
    print "ok\n"
.end
.sub foo :lex
.end
CODE
ok
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

pir_output_is(<<'CODE', <<'OUTPUT', ':outer parsing - missing :outer');
.sub main
    print "ok\n"
.end
.sub foo :outer(oops)
.end
CODE
Undefined :outer sub 'oops'.
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'get_lexinfo from pad');
.sub main
    .lex '$a', P0
    .local pmc pad, interp, info
    interp = getinterp
    pad = interp["lexpad"]
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

pir_output_is(<<'CODE', <<'OUTPUT', ':lex parsing - verify info and pad');
.sub main
    foo()
    print "ok\n"
.end
.sub foo :lex
    .local pmc pad, interp, info
    interp = getinterp
    pad = interp["lexpad"]
    unless null pad goto ok
    print "pad is NULL\n"
    end
ok:
    print "ok\n"
    typeof $S0, pad
    print $S0
    print "\n"
    info = pad.'get_lexinfo'()
    typeof $S0, info
    print $S0
    print "\n"
.end
CODE
ok
LexPad
LexInfo
ok
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

pir_output_is(<<'CODE', <<'OUTPUT', 'get_outer via interp');
.sub "main"
    .const .Sub foo = "foo"
    .local pmc foo_cl
    .lex "a", $P0
    foo_cl = newclosure foo
    foo_cl()
    print $P0
.end
.sub foo  :outer('main')
    .const .Sub bar = "bar"
    .local pmc bar_cl
    bar_cl = newclosure bar
    bar_cl()
.end
.sub bar   :outer('foo')
    .local pmc sub, interp, pad
    interp = getinterp
    sub = interp["outer"]
    print sub
    print "\n"
    sub = interp["outer"; "sub"]
    print sub
    print "\n"
    sub = interp["outer"; 2]
    print sub
    print "\n"
    sub = interp["outer"; "sub"; 2]
    print sub
    print "\n"
    $P0 = new .String
    $P0 = "I messed with your var\n"
    pad = interp["outer"; "lexpad"; 2]
    pad['a'] = $P0
.end
CODE
foo
foo
main
main
I messed with your var
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

.sub _fail :outer(main)
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
	.local pmc f
	f = xyzzy()
	f()
	f()
	f()
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
bar: 1
bar: 2
bar: 3
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'closure 6');
# Leo's version of xyzzy original by particle, p5 by chip     #'

.sub main :main
	.local pmc f,g
        f = xyzzy(42)
        $P0 = f()
        $P0 = f()
        $P0 = f()
        g = xyzzy(13013)
        $P0 = g()
        $P0 = f()
.end

.sub xyzzy
        .param int i
        .local pmc f
        f = plugh(i)
        .return (f)
.end

.sub plugh
        .param int i
        .local pmc f
        f = foo(i)
        .return (f)
.end

.sub foo
        .param int i
        .lex 'a', $P0
        $P1 = new Integer
        $P1 = i
        store_lex 'a', $P1
        print "foo: "
        print $P0
        print "\n"
        .const .Sub closure = 'bar'
        $P2 = newclosure closure
        .return($P2)
.end

.sub bar :anon :outer(foo)
        $P0 = find_lex 'a'
        inc $P0
        store_lex 'a', $P0
        print "bar: "
        print $P0
        print "\n"
.end
CODE
foo: 42
bar: 43
bar: 44
bar: 45
foo: 13013
bar: 13014
bar: 46
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'closure 7 - evaled');
.sub main :main
    .local pmc f,g
    f = xyzzy(42)
    $P0 = f()
    $P0 = f()
    $P0 = f()
    g = xyzzy(13013)
    $P0 = g()
    $P0 = f()
.end

.sub xyzzy
    .param int i
    .local pmc f
    f = plugh(i)
    .return (f)
.end

.sub plugh
    .param int i
    .local pmc f
    f = foo(i)
    .return (f)
.end

.sub foo
    .param int i
    .lex 'a', $P0
    $P1 = new Integer
    $P1 = i
    store_lex 'a', $P1
    print "foo: "
    print $P0
    print "\n"
    .local string code
    code = <<'EOC'
    .sub bar :anon :outer(foo)
	$P0 = find_lex 'a'
	inc $P0
	store_lex 'a', $P0
	print "bar: "
	print $P0
	print "\n"
    .end
EOC
    .local pmc compiler
    compiler = compreg "PIR"
    $P1 = compiler(code)
    $P2 = $P1[0]   # first sub of eval
    $P3 = newclosure $P2
    .return($P3)
.end
CODE
foo: 42
bar: 43
bar: 44
bar: 45
foo: 13013
bar: 13014
bar: 46
OUTPUT

pir_output_is(<<'CODE', '54', 'closure 8', todo => 'unspeccced or b0rken');

# p6 example from pmichaud
# { my $x = 5;  { print $x; my $x = 4; print $x; } }

.sub main :main
    .lex '$x', $P0
    $P0 = new .Integer
    $P0 = 5
    anon_1()
.end

.sub anon_1 :anon :outer(main)
    # anon closure
    $P0 = find_lex '$x'
    print $P0
    .lex '$x', $P1
    $P1 = new .Integer
    $P1 = 4
    print $P1
.end
CODE

pir_output_like(<<'CODE', <<'OUTPUT', 'get non existing');
.sub "main" :main
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


## remember to change the number of tests :-)
BEGIN { plan tests => 36; }
