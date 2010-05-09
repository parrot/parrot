#!perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 26;

##############################
# Parrot Calling Conventions

pir_output_is( <<'CODE', <<'OUT', "low-level syntax" );
.sub test :main
    .const 'Sub' sub = "_sub"
    .const int y = 20
    .begin_call
    .set_arg 10
    .set_arg y
    .call sub
    .local string z
    .get_result z
    .end_call
    print z
    end
.end
.sub _sub
    .param int a
    .param int b
    print a
    print "\n"
    print b
    print "\n"
    .return ("ok\n")
.end
CODE
10
20
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "func() syntax" );
.sub test :main
    .const int y = 20
    .local string z
    z = _sub(10, y)
    print z
    end
.end
.sub _sub
    .param int a
    .param int b
    print a
    print "\n"
    print b
    print "\n"
    .return ("ok\n")
.end
CODE
10
20
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "quoted sub names" );
.sub main :main
    "foo"()
    print "ok\n"
.end

.sub "foo"
    print "foo\n"
    "new"()
.end

.sub "new"
    print "new\n"
.end
CODE
foo
new
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "_func() syntax with var - global" );
.sub test :main
    .local pmc the_sub
    the_sub = get_global "_sub"
    the_sub(10, 20)
    end
.end
.sub _sub
    .param int a
    .param int b
    print a
    print "\n"
    print b
    print "\n"
    end
.end
CODE
10
20
OUT

pir_output_is( <<'CODE', "42\n", "multiple returns" );
.sub test :main
.local int a, b
  (a, b) = _sub()
  print a
  print b
  print "\n"
.end

.sub _sub
.return ( 4,  2 )
.end
CODE

pir_output_is( <<'CODE', <<'OUT', "tail recursive sub" );
.sub test :main
    .local int count, product, result
    count = 5
    product = 1
    result = _fact(product, count)
    print result
    print "\n"
    end
.end

.sub _fact
   .param int product
   .param int count
   if count > 1 goto recur
   .return (product)
recur:
   product = product * count
   dec count
   .tailcall _fact(product, count)
.end

CODE
120
OUT

####################
# coroutine iterator
#

# pseudo source code:
#       main () {
#         int i=5;
#         foreach addtwo(i) {
#           print $_, "\n";
#         }
#         print "done in main\n";
#       }
#
#       addtwo (int a) {
#         int i;
#         for (i=0; i<10; i++) {
#           yield a+i;
#         }
#         print "done in coroutine\n";
#       }

pir_output_is( <<'CODE', <<'OUT', "coroutine iterator" );
.sub test :main
  .local int i
  i=5
  new $P1, 'Continuation'
  set_addr $P1, after_loop
loop:
  $I2 = _addtwo($P1, i)
    print $I2
    print "\n"
    goto loop
 after_loop:
  .get_results ()
  print "done in main\n"
.end

.sub _addtwo
  .param pmc when_done
  .param int a
  .local int i
  i = 0
 loop:
    if i >= 10 goto done
    $I5 = a+i
    .yield($I5)
    i = i + 1
    goto loop
 done:
  print "done in coroutine\n"
  when_done()
.end
CODE
5
6
7
8
9
10
11
12
13
14
done in coroutine
done in main
OUT

pir_output_is( <<'CODE', <<'OUT', "coroutine iterator - throw stop" );
.sub test :main
  .local int i
  i=5
  push_eh after_loop
loop:
  $I2 = _addtwo(i)
    print $I2
    print "\n"
    goto loop
 after_loop:
  print "done in main\n"
.end

.sub _addtwo
  .param int a
  .local int i
  i = 0
 loop:
    if i >= 10 goto done
    $I5 = a+i
    .yield($I5)
    i = i + 1
    goto loop
 done:
  print "done in coroutine\n"
  new $P0, 'Exception'
  throw $P0
.end
CODE
5
6
7
8
9
10
11
12
13
14
done in coroutine
done in main
OUT

pir_output_is( <<'CODE', <<'OUT', ".set_arg :flat" );
.sub _main
    .local pmc x, y, z, ar, ar2
    x = new 'String'
    x = "first\n"
    y = new 'String'
    y = "middle\n"
    z = new 'String'
    z = "last\n"
    ar = new 'ResizablePMCArray'
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    ar2 = new 'ResizablePMCArray'
    push ar2, "ok 3\n"
    push ar2, "ok 4\n"
    push ar2, "ok 5\n"
    .const 'Sub' s = "_sub"
    .begin_call
    .set_arg x
    .set_arg ar :flat
    .set_arg y
    .set_arg ar2 :flat
    .set_arg z
    .call s
    .end_call
    end
.end
.sub _sub
    .param pmc a
    .param pmc b
    .param pmc c
    .param pmc d
    .param pmc e
    .param pmc f
    .param pmc g
    .param pmc h
    print a
    print b
    print c
    print d
    print e
    print f
    print g
    print h
.end
CODE
first
ok 1
ok 2
middle
ok 3
ok 4
ok 5
last
OUT

pir_output_is( <<'CODE', <<'OUT', "foo (arg :flat)" );
.sub _main
    .local pmc x, y, z, ar, ar2
    x = new 'String'
    x = "first\n"
    y = new 'String'
    y = "middle\n"
    z = new 'String'
    z = "last\n"
    ar = new 'ResizablePMCArray'
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    ar2 = new 'ResizablePMCArray'
    push ar2, "ok 3\n"
    push ar2, "ok 4\n"
    push ar2, "ok 5\n"
    _sub(x, ar :flat, y, ar2 :flat, z)
    end
.end

.sub _sub
    .param pmc a
    .param pmc b
    .param pmc c
    .param pmc d
    .param pmc e
    .param pmc f
    .param pmc g
    .param pmc h
    print a
    print b
    print c
    print d
    print e
    print f
    print g
    print h
.end

CODE
first
ok 1
ok 2
middle
ok 3
ok 4
ok 5
last
OUT

pir_output_is( <<'CODE', <<'OUT', ":main pragma, syntax only" );
.sub _main :main
    print "ok\n"
    end
.end
CODE
ok
OUT

# The result of the code should depend on whether we run parrot with the
# "-o code.pbc -r -r" command line params.
# Strangely, the same output is written
pir_output_like( <<'CODE', <<'OUT', "more pragmas, syntax only" );
.sub _main :main :load :postcomp
    print "ok\n"
    end
.end
CODE
/(ok\n){1,2}/
OUT

pir_output_is( <<'CODE', <<'OUT', "multi 1" );
.sub foo :multi()
    print "ok 1\n"
.end
.sub f1 :multi(int)
.end
.sub f2 :multi(int, float)
.end
.sub f3 :multi(Integer, Any, _)
.end
CODE
ok 1
OUT

pir_output_is( <<'CODE', <<'OUT', "\:main defined twice" );
.sub foo :main
        set $S0, 'not ok'
        print $S0
        print "\r\n"
        end
.end

.sub bar :main
        set $S0, 'ok'
        print $S0
        print "\r\n"
        end
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "\:anon subpragma, syntax only" );
.sub anon :anon
    print "ok\n"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "\:anon doesn't install symbol 1" );
.sub main :main
    .local pmc result
    result = get_global 'anon'
    unless null result goto callit
    result = get_global 'ok'
  callit:
    result()
.end

.sub anon :anon
    print "not ok\n"
.end

.sub ok
    print "ok\n"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "\:anon doesn't install symbol 2" );
.sub main :main
    .local pmc result
    result= get_global 'anon'
    result()
.end

.sub anon
    print "ok\n"
.end

.sub anon :anon
    print "not ok\n"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "multiple \:anon subs with same name" );
.sub main :main
    .local pmc result
    result= get_global 'anon'
    unless null result goto callit
    result = get_global 'ok'
  callit:
    result()
.end

.sub anon :anon
    print "nok 1\n"
.end

.sub anon :anon
    print "nok 2\n"
.end

.sub ok
    print "ok\n"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "()=foo() syntax, no return values" );
.sub main :main
        () = foo()
.end
.sub foo
        print "foo\n"
.end
CODE
foo
OUT

pir_output_is( <<'CODE', <<'OUT', "()=foo() syntax, skip returned value" );
.sub main :main
        () = foo()
.end
.sub foo
        print "foo\n"
    .return(1)
.end
CODE
foo
OUT

my $too_many_args = <<'CODE';
.sub main :main
    'foo'(_ARGS_)
    say "didn't segfault"
.end

.sub foo
.end
CODE

my $too_many_args_args = join ',', 1 .. 20_000;
$too_many_args =~ s/_ARGS_/$too_many_args_args/;

pir_output_is( $too_many_args, "didn't segfault\n", "calling a sub with way too many args" );

my $too_many_params = <<'CODE';
.sub main :main
    'foo'()
    say "didn't segfault"
.end

.sub foo
    _PARAMS_
.end
CODE

my $too_many_params_params = join map { "    .param pmc xx$_\n" } 1 .. 20_000;
$too_many_params =~ s/_PARAMS_/$too_many_params_params/;

pir_output_is( $too_many_params, "didn't segfault\n", "calling a sub with way too many params" );

pir_output_is( <<'CODE', <<'OUT', 'Unicode allowed in method names, TT #730' );
.sub 'main' :main
    $P0 = newclass 'Foo'
    $P1 = new $P0
    $S0 = unicode:"foo\x{b1}"
    $P1.$S0(1)
    $P1.unicode:"foo\x{b1}"(2)
.end

.namespace ['Foo']
.sub unicode:"foo\x{b1}" :method
    .param int count
    print 'ok '
    print count
    say ' - Unicode method names allowed'
.end
CODE
ok 1 - Unicode method names allowed
ok 2 - Unicode method names allowed
OUT

pir_output_is( <<'CODE', <<'OUT', 'named parameters');
.sub main
.local pmc foo
foo = get_global 'foo'

foo('x' => 1, 'y' => 2)
foo(1 :named('x'), 2 :named('y'))

.begin_call
.set_arg 1 :named('x')
.set_arg 2 :named('y')
.call foo
.end_call
.end

.sub foo
.param int i :named('y')
.param int j :named('x')
say i
say j
.end

CODE
2
1
2
1
2
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'escape sequences in sub names, TT #1125' );
.sub 'main'
    say "xyz:<\" \">"
    .const 'Sub' $P0 = 'foo'
    say $P0

    say ""

    say "xyz:<\\>"
    .const 'Sub' $P1 = 'bar'
    say $P1
.end

.sub "xyz:<\" \">" :subid('foo')
    say "xyz-quote"
.end

.sub "xyz:<\\>" :subid('bar')
    say "xyz-backslash"
.end
CODE
xyz:<" ">
xyz:<" ">

xyz:<\>
xyz:<\>
OUT

pir_output_is( <<'CODE', <<'OUT', ':named should default to param name');
.sub main
  $I0 = 'incr'('value'=>3)
  say $I0
.end

.sub 'incr'
  .param int value :named
  inc value
  .return(value)
.end
CODE
4
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
