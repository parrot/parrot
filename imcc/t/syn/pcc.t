#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 23;

##############################
# Parrot Calling Conventions

pir_output_is(<<'CODE', <<'OUT', "low-level syntax");
.sub test :main
    .const .Sub sub = "_sub"
    .const int y = 20
    .pcc_begin
    .arg 10
    .arg y
    .pcc_call sub
    .local string z
    .result z
    .pcc_end
    print z
    end
.end
.pcc_sub _sub
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

pir_output_is(<<'CODE', <<'OUT', "func() syntax");
.sub test :main
    .const int y = 20
    .local string z
    z = _sub(10, y)
    print z
    end
.end
.pcc_sub _sub
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


pir_output_is(<<'CODE', <<'OUT', "quoted sub names");
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

pir_output_is(<<'CODE', <<'OUT', "_func() syntax with var - global");
.sub test :main
    .local pmc the_sub
    the_sub = global "_sub"
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

pir_output_is(<<'CODE', "42\n", "multiple returns");
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

pir_output_is(<<'CODE', <<'OUT', "tail recursive sub");
.sub test :main
    .local int count, product, result
    count = 5
    product = 1
    result = _fact(product, count)
    print result
    print "\n"
    end
.end

.pcc_sub _fact
   .param int product
   .param int count
   if count > 1 goto recur
   .return (product)
recur:
   product = product * count
   dec count
   .return _fact(product, count)
.end

CODE
120
OUT


####################
# coroutine iterator
#

# pseudo source code:
#	main () {
#	  int i=5;
#	  foreach addtwo(i) {
#	    print $_, "\n";
#	  }
#	  print "done in main\n";
#	}
#
#	addtwo (int a) {
#	  int i;
#	  for (i=0; i<10; i++) {
#	    yield a+i;
#	  }
#	  print "done in coroutine\n";
#	}

pir_output_is(<<'CODE', <<'OUT', "coroutine iterator");
.sub test :main
  .local int i
  i=5
  newsub $P1, .Continuation, after_loop
loop:
  $I2 = _addtwo($P1, i)
    print $I2
    print "\n"
    goto loop
 after_loop:
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
  invokecc when_done
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

pir_output_is(<<'CODE', <<'OUT', "coroutine iterator - throw stop");
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
  new $P0, .Exception
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

    my $template = <<'TEMPLATE';
.sub test :main
    =LOCALS=
    =INITS=
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin
    =ARGS=
    .pcc_call sub
ret:
    .pcc_end
    end
.end
.pcc_sub _sub
    =PARAMS=
    =TESTS=
    print "all params ok\n"
    .pcc_begin_return
    .pcc_end_return
fail:
    print "failed\n"
    end
.end
TEMPLATE

sub repeat {
    my ($template, $n, %substs) = @_;
    my $code;
    foreach (split(/\n/, $template)) {
        if (/^(.*)=(\w+)=(.*)/) {
            my ($pre, $key, $post) = ($1, $2, $3);
            for my $i (0..$n-1) {
                (my $new = $substs{$key}) =~ s/\<index\>/$i/g;
                $code .= "$pre$new$post\n";
            }
        } else {
            $code .= "$_\n";
        }
    }

    return $code;
}

my $code = repeat($template, 18,
                  LOCALS => '.local int a<index>',
                  INITS => 'a<index> = <index>',
                  ARGS => '.arg a<index>',
                  PARAMS => '.param int a<index>',
                  TESTS => 'ne a<index>, <index>, fail');

pir_output_is($code, <<'OUT', "overflow integers");
all params ok
OUT

SKIP: {
    skip("need variable register frame", 2);
$code = repeat($template, 40,
               LOCALS => '.local int a<index>',
               INITS => 'a<index> = <index>',
               ARGS => '.arg a<index>',
               PARAMS => '.param int a<index>',
               TESTS => 'ne a<index>, <index>, fail');
pir_output_is($code, <<'OUT', "overflowed spilled integers");
all params ok
OUT

$code = repeat($template, 40,
               LOCALS => ".local Integer a<index>\n\ta<index> = new Integer",
               INITS => 'a<index> = <index>',
               ARGS => '.arg a<index>',
               PARAMS => '.param Integer a<index>',
               TESTS => "set I0, a<index>\nne I0, <index>, fail");

pir_output_is($code, <<'OUT', "overflow pmcs 40");
all params ok
OUT

}
$code = repeat($template, 18,
               LOCALS => ".local Integer a<index>\n\ta<index> = new Integer",
               INITS => 'a<index> = <index>',
               ARGS => '.arg a<index>',
               PARAMS => '.param Integer a<index>',
               TESTS => "set I0, a<index>\nne I0, <index>, fail");

pir_output_is($code, <<'OUT', "overflow pmcs");
all params ok
OUT


pir_output_is(<<'CODE', <<'OUT', ".arg :flat");
.sub _main
    .local pmc x, y, z, ar, ar2, s
    x = new .String
    x = "first\n"
    y = new .String
    y = "middle\n"
    z = new .String
    z = "last\n"
    ar = new .ResizablePMCArray
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    ar2 = new .ResizablePMCArray
    push ar2, "ok 3\n"
    push ar2, "ok 4\n"
    push ar2, "ok 5\n"
    .const .Sub s = "_sub"
    .pcc_begin
    .arg x
    .arg ar :flat
    .arg y
    .arg ar2 :flat
    .arg z
    .pcc_call s
    .pcc_end
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

pir_output_is(<<'CODE', <<'OUT', "foo (arg :flat)");
.sub _main
    .local pmc x, y, z, ar, ar2
    x = new .String
    x = "first\n"
    y = new .String
    y = "middle\n"
    z = new .String
    z = "last\n"
    ar = new .ResizablePMCArray
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    ar2 = new .ResizablePMCArray
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

SKIP: {
  skip("cant do NCI on $^O", 1) unless ($^O =~ /linux/ || $^O =~ /darwin/);
pir_output_is(<<'CODE', <<'OUT', "nci");
.sub test :main
    .local pmc FABS, NULL
    null NULL
    dlfunc FABS, NULL, "fabs", "dd"
    .local float d, r
    d = -42
    r = FABS(d)
    print d
    print "\n"
    print r
    print "\n"
    end
.end
CODE
-42.000000
42.000000
OUT
}

pir_output_is(<<'CODE', <<'OUT', ":main pragma, syntax only");
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
pir_output_like(<<'CODE', <<'OUT', "more pragmas, syntax only");
.sub _main :main :load :postcomp
    print "ok\n"
    end
.end
CODE
/(ok\n){1,2}/
OUT

pir_output_is(<<'CODE', <<'OUT', "multi 1");
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


pir_output_is(<<'CODE', <<'OUT', "\:main defined twice");
.sub foo :main
	set S0, 'not ok'
	print S0
	print "\r\n"
	end
.end

.sub bar :main
	set S0, 'ok'
	print S0
	print "\r\n"
	end
.end
CODE
ok
OUT

pir_output_is(<<'CODE', <<'OUT', "\:anon subpragma, syntax only");
.sub anon :anon
    print "ok\n"
.end
CODE
ok
OUT

pir_output_like(<<'CODE', <<'OUT', "\:anon doesn't install symbol 1");
.sub main :main
    .local pmc result
    result= find_global 'anon'
    result()
    print "\n"
.end

.sub anon :anon
    print "not ok\n"
.end
CODE
/.*'anon'.*not found/
OUT

pir_output_is(<<'CODE', <<'OUT', "\:anon doesn't install symbol 2");
.sub main :main
    .local pmc result
    result= find_global 'anon'
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

pir_output_like(<<'CODE', <<'OUT', "multiple \:anon subs with same name");
.sub main :main
    .local pmc result
    result= find_global 'anon'
    result()
.end

.sub anon :anon
    print "nok 1\n"
.end

.sub anon :anon
    print "nok 2\n"
.end
CODE
/.*'anon'.*not found/
OUT
