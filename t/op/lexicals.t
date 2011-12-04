#!perl
# Copyright (C) 2001-2011, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test;

$ENV{TEST_PROG_ARGS} ||= '';

plan( skip_all => 'lexicals not thawed properly from PBC, TT #1171' )
    if $ENV{TEST_PROG_ARGS} =~ /--run-pbc/;

plan( tests => 54 );

=head1 NAME

t/op/lexicals.t - Lexical Ops

=head1 SYNOPSIS

    % prove t/op/lexicals.t

=head1 DESCRIPTION

Tests various lexical scratchpad operations, as described in PDD20.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', '.lex parsing - PASM (\'$a\') succeeds' );
.pcc_sub :main main:
    .lex "$a", P0
    print "ok\n"
    end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', '.lex parsing - PIR' );
.sub main :main
    .lex "$a", $P0
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', '.lex parsing - PIR, $P' );
.sub main :main
    .lex '$a', $P0
    null $P0
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', '.lex parsing - PIR, local var' );
.sub main :main
    .local pmc a
    .lex "$a", a
    print "ok\n"
.end
CODE
ok
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', '.lex - same PMC twice (PASM)' );
.pcc_sub :main main:
    .lex '$a', P0
    .lex '$b', P0
    new P0, 'String'
    set P0, "ok\n"
    find_lex P1, '$a'
    print P1
    find_lex P2, '$a'
    print P2
    end
CODE
ok
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', '.lex - same PMC twice fails (.local pmc ab)' );
.sub main :main
    .local pmc ab, a, b
    .lex '$a', ab
    .lex '$b', ab
    ab = new 'String'
    ab = "ok\n"
    a = find_lex '$a'
    print a
    b = find_lex '$b'
    print b
.end
CODE
ok
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'api parsing' );
.sub main :main
    .lex 'a', $P0
    store_lex 'a', $P0
    $P0 = find_lex 'a'
    print "ok\n"
.include 'interpinfo.pasm'
    load_bytecode 'pcore.pbc'      # TODO autoload/preload
    Parrot_interp_info $P1, .INTERPINFO_CURRENT_SUB
    $P2 = $P1.'get_lexinfo'()
    $P2 = $P1.'get_lexenv'()
    print "ok\n"
.end
CODE
ok
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'get_lexinfo' );
.sub main :main
    .lex '$a', $P0
    .lex '$b', $P9
.include "interpinfo.pasm"
    Parrot_interp_info $P1, .INTERPINFO_CURRENT_SUB
    $P2 = $P1.'get_lexinfo'()
    $S0 = typeof $P2
    print $S0
    print ' '
    $I0 = elements $P2
    say $I0
.end
CODE
LexInfo 2
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'get_lexinfo - no lexicals' );
.sub main :main
.include "interpinfo.pasm"
    Parrot_interp_info $P1, .INTERPINFO_CURRENT_SUB
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

pir_output_is( <<'CODE', <<'OUTPUT', 'get_lexpad - no pad' );
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

pir_output_is( <<'CODE', <<'OUTPUT', 'get_lexpad - no pad inherited in coro' );
.sub main :main
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

pir_output_is( <<'CODE', <<'OUTPUT', 'get_lexpad - set var via pad' );
.sub main :main
    .local pmc pad, interp
    interp = getinterp
    pad = interp["lexpad"]
    .lex '$a', $P0
    unless null pad goto ok
    print "pad is NULL\n"
    end
ok:
    print "ok\n"
    $P1 = new 'Integer'
    $P1 = 13013
    pad['$a'] = $P1
    print $P0
    print "\n"
    end
.end
CODE
ok
13013
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'get_lexpad - set two vars via pad (2 lex -> 2 pmc)' );
.sub main :main
    .lex '$a', $P0
    .lex '$b', $P2
    .local pmc pad, interp
    interp = getinterp
    pad = interp["lexpad"]
    unless null pad goto ok
    print "pad is NULL\n"
    end
ok:
    print "ok\n"
    $P1 = new 'Integer'
    $P1 = 13013
    pad['$a'] = $P1
    print $P0
    print "\n"
    $P1 = 42
    pad['$b'] = $P1
    print $P2
    print "\n"
    end
.end
CODE
ok
13013
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'synopsis example' );
.sub main :main
    .lex '$a', $P0
    $P1 = new 'Integer'
    $P1 = 13013
    store_lex '$a', $P1
    print $P0
    print "\n"
    end
.end
CODE
13013
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', ':lex parsing - PASM' );
.pcc_sub :main main:
    print "ok\n"
    end
.pcc_sub :lex foo:
    returncc
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', ':lex parsing - PIR' );
.sub main :main
    print "ok\n"
.end
.sub foo :lex
.end
CODE
ok
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', ':outer parsing - PASM' );
.pcc_sub :main main:
    print "ok\n"
    end
.pcc_sub :outer('main') foo:
    returncc
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', ':outer parsing - PIR' );
.sub main :main
    print "ok\n"
.end
.sub foo :outer('main')
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', ':outer parsing - ident' );
.sub main :main
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

pir_error_output_like( <<'CODE', <<'OUTPUT', ':outer parsing - missing :outer' );
.sub main
    print "ok\n"
.end
.sub foo :outer(oops)
.end
CODE
/Undefined :outer sub 'oops'\./
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'get_lexinfo from pad' );
.sub main :main
    .lex '$a', $P0
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

pir_output_is( <<'CODE', <<'OUTPUT', ':lex parsing - verify info and pad' );
.sub main :main
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

pir_output_is( <<'CODE', <<'OUTPUT', 'get_outer' );
.sub 'main' :main
    foo()
.end
.sub foo :outer('main')
    .include "interpinfo.pasm"
    Parrot_interp_info $P1, .INTERPINFO_CURRENT_SUB
    $P2 = $P1."get_outer"()
    print $P2
    print "\n"
.end
CODE
main
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'get_outer 2' );
.sub 'main' :main
    foo()
.end
.sub foo  :outer('main')
    bar()
.end
.sub bar   :outer('foo')
    .include "interpinfo.pasm"
    Parrot_interp_info $P1, .INTERPINFO_CURRENT_SUB
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

pir_output_is( <<'CODE', <<'OUTPUT', 'get_outer via interp' );
.sub 'main' :main
    .const 'Sub' foo = "foo"
    .local pmc foo_cl
    .lex "a", $P0
    foo_cl = newclosure foo
    foo_cl()
    print $P0
.end
.sub foo  :outer('main')
    .const 'Sub' bar = "bar"
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
    $P0 = new 'String'
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

pir_output_is( <<'CODE', <<'OUTPUT', 'closure 3' );
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
    .const 'Sub' anon = "anon"
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

pir_output_is( <<'CODE', <<'OUTPUT', 'closure 4' );
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
     .const 'Sub' choose_sub = "_choose"
     .const 'Sub' fail_sub = "_fail"
     fail = newclosure fail_sub
     arr1 = new 'ResizablePMCArray'
     arr1[0] = 1
     arr1[1] = 3
     arr1[2] = 5
     arr2 = new 'ResizablePMCArray'
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
     .param pmc choices

     .local pmc our_try, old_fail, cc, try
     .lex 'old_fail', old_fail
     .lex 'cc', cc
     .lex 'try', try
     #print "In choose\n"
     old_fail = find_lex "fail"
     .include "interpinfo.pasm"
     $P1 = Parrot_interp_info .INTERPINFO_CURRENT_CONT
     store_lex  "cc", $P1
     .const 'Sub' tr_sub = "_try"
     newclosure our_try, tr_sub
     store_lex "try", our_try
     $P2 = our_try(choices)
     .return($P2)
.end

.sub _try :outer(_choose)
     .param pmc choices

     .lex 'choices', $P0
     #print "In try\n"
     clone $P0, choices
     if choices goto have_choices
     $P1 = find_lex "old_fail"
     store_lex "fail", $P1
     $P1()
have_choices:
     .const 'Sub' f = "new_fail"
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

pir_output_is( <<'CODE', <<'OUTPUT', 'closure 5' );
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
    $P0 = new 'Integer'
    $P0 = 0

    .const 'Sub' bar_sub = "bar"
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

pir_output_is( <<'CODE', <<'OUTPUT', 'closure 6' );
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
    $P1 = new 'Integer'
    $P1 = i
    store_lex 'a', $P1
    print "foo: "
    print $P0
    print "\n"
    .const 'Sub' closure = 'bar'
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

pir_output_is( <<'CODE', <<'OUTPUT', 'closure 7 - evaled' );
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
    $P1 = new 'Integer'
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

pir_error_output_like( <<'CODE', <<'OUT', 'closure 8' );

# p6 example from pmichaud
# { my $x = 5;  { print $x; my $x = 4; print $x; } }

## According to S04 this is an error

.sub main :main
    .lex '$x', $P0
    $P0 = new 'Integer'
    $P0 = 5
    anon_1()
.end

.sub anon_1 :anon :outer(main)
    # anon closure
    $P0 = find_lex '$x'
    print $P0
    .lex '$x', $P1
    $P1 = new 'Integer'
    $P1 = 4
    print $P1
.end
CODE
/Null PMC access/
OUT

pir_output_is( <<'CODE', <<'OUTPUT', 'get undefined lexical' );
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
    if null $P2 goto ok
    print "Undefined name not NULL\n"
    end
ok:
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'find_name on lexicals' );
.sub main :main
    .lex 'a', $P0
    $P1 = new 'String'
    $P1 = "ok\n"
    store_lex 'a', $P1
    $P2 = find_name 'a'
    print $P0
    print $P1
    print $P2
.end
CODE
ok
ok
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'multiple names' );
.sub main :main
    .lex 'a', $P0
    .lex 'b', $P0
    .lex 'c', $P0
    $P1 = new 'String'
    $P1 = "ok\n"
    store_lex 'a', $P1
    $P2 = find_name 'b'
    print $P0
    print $P1
    print $P2
    $P3 = find_lex 'c'
    print $P3
.end
CODE
ok
ok
ok
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'package-scoped closure 1' );
# my $x;
# sub f{$x++}
# f()
# print "$x\n"
.sub '&main' :main :anon
    .local pmc sx
    .lex '$x', sx
    sx = new 'Integer'
    sx = 33
    '&f'()
    print sx    # no find_lex needed - 'sx' is defined here
    print "\n"

    '&f'()
    print sx
    print "\n"

    '&f'()
    print sx
    print "\n"
.end

.sub '&f' :outer('&main')
    $P0 = find_lex '$x'           # find_lex needed
    inc $P0
.end
CODE
34
35
36
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'package-scoped closure 2' );
# my $x;
# sub f{$x++}
# sub g{f();f()}
# g()
# print "$x\n"
.sub '&main' :main :anon
    .local pmc sx
    .lex '$x', sx
    sx = new 'Integer'
    sx = -32
    '&g'()
    print sx
    print "\n"

    '&g'()
    print sx
    print "\n"

    '&g'()
    print sx
    print "\n"

.end

.sub '&f' :outer('&main')
    $P0 = find_lex '$x'
    inc $P0
.end

.sub '&g' :outer('&main') # :outer not needed - no find_lex
    '&f'()
    '&f'()
.end
CODE
-30
-28
-26
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'package-scoped closure 3 - autoclose' );
#     sub f ($x) {
#         sub g ($y) { $x + $y }; g($x);
#     }
#     f(10); # 20
#     g(100); # 110
.sub '&f'
    .param pmc x
    .lex '$x', x
    $P0 = '&g'(x)
    .return ($P0)
.end

.sub '&g' :outer('&f')
    .param pmc y
    .lex '$y', y
    .local pmc x
    x = find_lex '$x'
    $P0 = add x, y
    .return ($P0)
.end

.sub '&main' :main :anon
    $P0 = '&f'(10)
    print $P0
    print "\n"
    $P0 = '&g'(100)
    print $P0
    print "\n"
.end


CODE
20
110
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'package-scoped closure 4 - autoclose' );
#     sub f ($x) {
#         sub g () { print $x };
#     }
#     g();
.sub '&f'
    .param pmc x
    .lex '$x', x
.end

.sub '&g' :outer('&f')
    .local pmc x
    x = find_lex '$x'
    print x
.end

.sub '&main' :main :anon
    '&g'()
    print "never\n"
.end
CODE
/Null PMC access/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'package-scoped closure 5 - autoclose' );
#     sub f ($x) {
#         sub g () { print "$x\n" };
#     }
#     f(10);
#     g();
.sub '&f'
    .param pmc x
    .lex '$x', x
.end

.sub '&g' :outer('&f')
    .local pmc x
    x = find_lex '$x'
    print x
    print "\n"
.end

.sub '&main' :main :anon
    '&f'(10)
    '&g'()
.end
CODE
10
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'package-scoped closure 6 - autoclose' );
#     sub f ($x) {
#         sub g () { print "$x\n" };
#     }
#     f(10);
#     f(20);
#     g();
.sub '&f'
    .param pmc x
    .lex '$x', x
.end

.sub '&g' :outer('&f')
    .local pmc x
    x = find_lex '$x'
    print x
    print "\n"
.end

.sub '&main' :main :anon
    '&f'(10)
    '&f'(20)
    '&g'()
.end
CODE
20
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'find_lex: (Perl6 OUTER::)', todo => 'not yet implemented' );
.sub main :main
    .lex '$x', 42
    get_outer()
.end

.sub 'get_outer' :outer('main')
    .lex '$x', 13
    $P0 = find_lex '$x', 1
    say $P0
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'nested scopes' );

=for never

# The following PIR should be like:

use strict;

test_closures();

sub test_closures
{
    my @closures;

    # create some closures, outer scope
    {
         my $shared = 1;

         # inner scope
         for (1..3) {
            my $not_shared = 1;
            my $sub_num    = $_;
            push @closures,
                 sub {
                     print "Sub $sub_num was called $not_shared times. Any sub was called $shared times.\n";
                     $shared++;
                     $not_shared++;
                 };
         }
    }

    for ( 1 .. 4 ) {
         foreach ( @closures ) {
             $_->();
         }
    }

}

=cut

.sub test_closures :main

    .lex '@closures', $P0
    $P0 = new 'ResizablePMCArray'

    # create some closures, outer scope
    outer_scope()

    # and call them in turn.
    $I0 = 0
    NEXT_LOOP0:
    if $I0 >= 4 goto DONE_LOOP0
        $I1 = 0
        NEXT_LOOP1:
        if $I1 >= 3 goto DONE_LOOP1
           $P1 = $P0[$I1]
           $P1()
           inc $I1
           goto NEXT_LOOP1
        DONE_LOOP1:
        inc $I0
        goto NEXT_LOOP0
    DONE_LOOP0:

.end

# Return n closures, each with lexical references to "$n" and "$sub_num".
.sub 'outer_scope' :outer('test_closures')

    .lex '$shared', $P0
    $P0 = new 'Integer'
    $P0 = 1

    $I3 = 1
    NEXT:
    if $I3 > 3 goto DONE
        inner_scope( $I3 )
        inc $I3
        goto NEXT
    DONE:

.end


.sub 'inner_scope' :outer('outer_scope')
    .param int topic

    .lex '$sub_num', $P0
    $P0 = new 'Integer'
    $P0 = topic

    .lex '$not_shared', $P1
    $P1 = new 'Integer'
    $P1 = 1

    find_lex $P2, '@closures'
    .const 'Sub' $P3 = 'anonymous'
    newclosure $P4, $P3
    push $P2, $P4

    .return ()
.end

.sub 'anonymous' :outer('inner_scope')

    find_lex $P0, '$sub_num'
    find_lex $P1, '$not_shared'
    find_lex $P2, '$shared'

    print "Sub "
    print $P0
    print " was called "
    print $P1
    print " times. Any sub was called "
    print $P2
    print " times.\n"

    inc $P1
    inc $P2

    .return ()
.end


CODE
Sub 1 was called 1 times. Any sub was called 1 times.
Sub 2 was called 1 times. Any sub was called 2 times.
Sub 3 was called 1 times. Any sub was called 3 times.
Sub 1 was called 2 times. Any sub was called 4 times.
Sub 2 was called 2 times. Any sub was called 5 times.
Sub 3 was called 2 times. Any sub was called 6 times.
Sub 1 was called 3 times. Any sub was called 7 times.
Sub 2 was called 3 times. Any sub was called 8 times.
Sub 3 was called 3 times. Any sub was called 9 times.
Sub 1 was called 4 times. Any sub was called 10 times.
Sub 2 was called 4 times. Any sub was called 11 times.
Sub 3 was called 4 times. Any sub was called 12 times.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'Double-inner scope called from closure' );
.sub 'main' :main
    .local pmc x
    x = 'foo'()
    x('world')
.end

.sub 'foo' :outer('main')
    .local pmc a, bar
    a = new 'String'
    a = 'hello '
    .lex '$a', a
    $P0 = get_global 'bar'
    bar = newclosure $P0
    .return (bar)
.end

.sub 'bar' :outer('foo')
    .param pmc b
    .lex '$b', b
    .const 'Sub' $P0 = 'bar_inner'
    capture_lex $P0
    .local pmc a
    a = find_lex '$a'
    print a
    say b
    'bar_inner'()
.end

.sub 'bar_inner' :outer('bar')
    .local pmc a, b
    a = find_lex '$a'
    b = find_lex '$b'
    print a
    say b
.end
CODE
hello world
hello world
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Patrick's request" );
.sub 'main' :main
    foo('try 1')
    foo('try 2')
    foo('try 3')
.end

.sub 'foo' :subid('foo')
    .param pmc x
    .lex '$x', x
    print "outer foo "
    say x
    'inner'()
.end

.sub 'inner' :outer('foo')
    .local pmc x
    x = find_lex '$x'
    print "inner foo "
    say x
    $P0 = new 'String'
    $P0 = 'BOGUS!'
    store_lex '$x', $P0
.end
CODE
outer foo try 1
inner foo try 1
outer foo try 2
inner foo try 2
outer foo try 3
inner foo try 3
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Bob's recursion bug");
.sub main :main
    rpwi(0)
.end

.sub rpwi
    .param int recursive_p
    unless recursive_p goto do_lex
    print "rpwi:  recursive case\n"
    .return ()
do_lex:
    .lex "(SAVED *SHARP-EQUAL-ALIST*)", $P40
    $P40 = new 'Integer'
    $P40 = 99
    .const 'Sub' $P80 = "(:INTERNAL rpwi 0)"
    newclosure $P81, $P80
    ## $P81 = clone $P80
    ## pushaction $P81
    print "rpwi:  lex case\n"
    rpwi(1)
    $P81()
.end

.sub "(:INTERNAL rpwi 0)" :anon :outer('rpwi')
    print "[restoring *SHARP-EQUAL-ALIST*]\n"
    find_lex $P40, "(SAVED *SHARP-EQUAL-ALIST*)"
    print "[got "
    print $P40
    print "]\n"
.end
CODE
rpwi:  lex case
rpwi:  recursive case
[restoring *SHARP-EQUAL-ALIST*]
[got 99]
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Jonathan's recursive case" );
.sub 'main' :main
    $P0 = new 'ResizablePMCArray'
    push $P0, 'a'
    $P1 = new 'ResizablePMCArray'
    $P2 = new 'ResizablePMCArray'
    push $P2, 'simple'
    push $P1, $P2
    push $P1, 'test'
    $P3 = new 'ResizablePMCArray'
    push $P3, 'for'
    push $P3, 'a'
    push $P3, 'simple'
    push $P1, $P3
    push $P0, $P1
    push $P0, 'script'
    'dump_thing'($P0, '# ')
.end

.sub 'dump_thing'
    .param pmc thing
    .param pmc prefix
    .lex '$thing', thing
    .lex '$prefix', prefix

    $P0 = get_hll_global 'anon_1'
    $P1 = newclosure $P0
    .lex '$recur', $P1

    $P2 = find_lex '$thing'
    $I0 = isa $P2, 'ResizablePMCArray'
    unless $I0 goto not_ResizablePMCArray

    $P3 = find_lex '$prefix'
    print $P3
    print "[\n"
    $P4 = get_hll_global 'anon_2'
    $P5 = newclosure $P4
    $P6 = find_lex '$thing'
    'map'($P5, $P6)
    $P7 = find_lex '$prefix'
    print $P7
    print "]\n"
    goto end_if

  not_ResizablePMCArray:
    $P8 = find_lex '$prefix'
    print $P8
    $P9 = find_lex '$thing'
    print $P9
    print "\n"
  end_if:
.end

.sub 'anon_1' :outer('dump_thing')
    .param pmc subthing
    .lex '$subthing', subthing
    $P0 = find_lex '$subthing'
    $P1 = find_lex '$prefix'
    $P2 = new 'String'
    $P2 = concat $P1, '    '
   'dump_thing'($P0, $P2)
.end

.sub 'anon_2' :outer('dump_thing')
    .param pmc topic
    .lex "$_", topic
    $P0 = find_lex '$recur'
    $P1 = find_lex '$_'
    $P0($P1)
.end

.sub 'map'
    .param pmc block
    .param pmc array
    .local pmc result, it
    result = new 'ResizablePMCArray'
    it = iter array
    loop:
    unless it goto loop_end
    $P0 = shift it
    $P0 = block($P0)
    push result, $P0
    goto loop
    loop_end:
    .return (result)
.end
CODE
# [
#     a
#     [
#         [
#             simple
#         ]
#         test
#         [
#             for
#             a
#             simple
#         ]
#     ]
#     script
# ]
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'TT #536: lexical sub lookup' );
.sub 'main' :main
    .const 'Sub' $P0 = 'lexfoo'
    .lex 'foo1', $P0
    .lex 'foo2', $P0

    'foo1'(1)
    'foo2'(2)
.end

.sub 'lexfoo'
    .param int count
    print 'ok '
    print count
    say ' - looking up lexical sub'
.end

.sub 'foo2'
    .param int count
    print 'not ok '
    print count
    say ' - looked up global sub, not lexical'
.end
CODE
ok 1 - looking up lexical sub
ok 2 - looking up lexical sub
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'find_dynamic_lex basic' );
.sub 'main' :main
    $P0 = box 'main'
    .lex '$*VAR', $P0
    'foo'()
    $P1 = find_dynamic_lex '$*VAR'
    if null $P1 goto p1_null
    print 'not '
  p1_null:
    say 'null'
.end

.sub 'foo'
    $P1 = find_dynamic_lex '$*VAR'
    say $P1
.end
CODE
main
null
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "find_dynamic_lex doesn't search outer" );
.sub 'main' :main
    $P0 = box 'main'
    .lex '$*VAR', $P0
    'bar'()
.end

.sub 'bar'
    $P0 = box 'bar'
    .lex '$*VAR', $P0
    'foo'()
.end

.sub 'foo' :outer('main')
    $P1 = find_dynamic_lex '$*VAR'
    say $P1
    $P1 = find_lex '$*VAR'
    say $P1
.end
CODE
bar
main
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', 'find_dynamic_lex two levels deep' );
.sub 'main' :main
    $P0 = box 'main'
    .lex '$*VAR', $P0
    'bar'()
.end

.sub 'bar'
    'foo'()
.end

.sub 'foo'
    $P1 = find_dynamic_lex '$*VAR'
    say $P1
.end
CODE
main
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'I-register lexicals' );
.sub main :main
    'il'()
.end
.sub 'il'
    .lex '$i', $I0
    store_lex '$i', 42
    $I1 = find_lex '$i'
    say $I1
    'il_fetch'()
.end
.sub 'il_fetch' :outer('il')
    $I0 = find_lex '$i'
    say $I0
.end
CODE
42
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'N-register lexicals' );
.sub main :main
    'nl'()
.end
.sub 'nl'
    .lex '$n', $N0
    store_lex '$n', 6.9
    $N1 = find_lex '$n'
    say $N1
    'nl_fetch'()
.end
.sub 'nl_fetch' :outer('nl')
    $N0 = find_lex '$n'
    say $N0
.end
CODE
6.9
6.9
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'S-register lexicals' );
.sub main :main
    'sl'()
.end
.sub 'sl'
    .lex '$s', $S0
    store_lex '$s', 'Staropramen'
    $S1 = find_lex '$s'
    say $S1
    'sl_fetch'()
.end
.sub 'sl_fetch' :outer('sl')
    $S0 = find_lex '$s'
    say $S0
.end
CODE
Staropramen
Staropramen
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'all register lexicals' );
.sub main :main
    .lex 'i', $I0
    .lex 'n', $N0
    .lex 's', $S0
    .lex 'p', $P0

    store_lex 'i', 101
    store_lex 'n', 4.2
    store_lex 's', 'Starobrno'
    $P1 = box 'Pilsner Urquell'
    store_lex 'p', $P1

    'czech'()
.end
.sub 'czech' :outer('main')
    $I0 = find_lex 'i'
    say $I0
    $N0 = find_lex 'n'
    say $N0
    $S0 = find_lex 's'
    say $S0
    $P0 = find_lex 'p'
    say $P0
.end
CODE
101
4.2
Starobrno
Pilsner Urquell
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
