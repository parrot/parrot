#!perl
use strict;
use TestCompiler tests => 39;

##############################
# Parrot Calling Conventions

output_is(<<'CODE', <<'OUT', "basic syntax - invokecc, constants");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    .const int y = 20
    .pcc_begin prototyped
    .arg 10
    .arg y
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub prototyped
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

output_is(<<'CODE', <<'OUT', "constants, bug 24667");
.sub _main prototyped
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin prototyped
    .arg 5
    .arg 6
    .arg 7
    .pcc_call sub
    .pcc_end
    end
.end
.sub _sub prototyped
    .param int a
    .param int b
    .param int c
    print a
    print "\n"
    print b
    print "\n"
    print c
    print "\n"
    end
.end
CODE
5
6
7
OUT

output_is(<<'CODE', <<'OUT', "basic syntax - order of return values");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin prototyped
    .pcc_call sub
    ret:
    .local int A
    .local int B
    .local int C
    .result A
    .result B
    .result C
    .pcc_end
    print A
    print "\n"
    print B
    print "\n"
    print C
    print "\n"
    end
.end
.pcc_sub _sub prototyped
    .pcc_begin_return
    .return 10
    .return 20
    .return 30
    .pcc_end_return
    end
.end
CODE
10
20
30
OUT

##############################
# tail recursion - caller saves - parrot calling convention
output_is(<<'CODE', <<'OUT', "tail recursive sub");
.sub _main
    .local int count
    count = 5
    .local int product
    product = 1
    .local Sub sub
    .local RetContinuation cc
    newsub sub, .Sub, _fact
    newsub cc, .RetContinuation, ret
   .pcc_begin prototyped
   .arg product
   .arg count
   .pcc_call sub, cc
 ret:
   .local int result
    .result result
    .pcc_end
    print result
    print "\n"
    end
.end

.pcc_sub _fact prototyped
   .param int product
   .param int count
   if count <= 1 goto fin
   product = product * count
   dec count
   product = _fact(product, count)
fin:
   .pcc_begin_return
    .return product
   .pcc_end_return
.end

CODE
120
OUT

output_is(<<'CODE', <<'OUT', "proto call, proto sub, invokecc, P param");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    $P0 = new PerlUndef
    $P0 = "ok 1\n"
    $P1 = new PerlUndef
    $P1 = "ok 2\n"
    .pcc_begin prototyped
    .arg $P0
    .arg $P1
    .pcc_call sub
    ret:
    .pcc_end
    print "back\n"
    end
.end
.pcc_sub _sub prototyped
    .param PerlUndef a
    .param PerlUndef b
    print a
    print b
   .pcc_begin_return
   .pcc_end_return
.end
CODE
ok 1
ok 2
back
OUT
output_is(<<'CODE', <<'OUT', "proto call, un proto sub, invokecc, P param");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    $P0 = new PerlUndef
    $P0 = "ok 1\n"
    $P1 = new PerlUndef
    $P1 = "ok 2\n"
    .pcc_begin prototyped
    .arg $P0
    .arg $P1
    .pcc_call sub
    ret:
    .pcc_end
    print "back\n"
    end
.end
.pcc_sub _sub
    .param PerlUndef a
    .param PerlUndef b
    print a
    print b
   .pcc_begin_return
   .pcc_end_return
.end
CODE
ok 1
ok 2
back
OUT

output_is(<<'CODE', <<'OUT', "proto call, proto sub, invokecc, S param");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    $S0 = "ok 1\n"
    $S1 = "ok 2\n"
    .pcc_begin prototyped
    .arg $S0
    .arg $S1
    .pcc_call sub
    ret:
    .pcc_end
    print "back\n"
    end
.end
.pcc_sub _sub prototyped
    .param string a
    .param string b
    print a
    print b
   .pcc_begin_return
   .pcc_end_return
.end
CODE
ok 1
ok 2
back
OUT

output_is(<<'CODE', <<'OUT', "proto call, nonproto sub, invokecc, S param");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    $S0 = "ok 1\n"
    $S1 = "ok 2\n"
    .pcc_begin non_prototyped
    .arg $S0
    .arg $S1
    .pcc_call sub
    ret:
    .pcc_end
    print "back\n"
    end
.end
.pcc_sub _sub non_prototyped
    .param string a
    .param string b
    print a
    print b
   .pcc_begin_return
   .pcc_end_return
.end
CODE
ok 1
ok 2
back
OUT

output_is(<<'CODE', <<'OUT', "proto call, unproto sub, invokecc, S param");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    $S0 = "ok 1\n"
    $S1 = "ok 2\n"
    .pcc_begin prototyped
    .arg $S0
    .arg $S1
    .pcc_call sub
    ret:
    .pcc_end
    print "back\n"
    end
.end
.pcc_sub _sub
    .param string a
    .param string b
    print a
    print b
   .pcc_begin_return
   .pcc_end_return
.end
CODE
ok 1
ok 2
back
OUT

output_is(<<'CODE', <<'OUT', "non_proto call, unproto sub, invokecc, S param");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    $S0 = "ok 1\n"
    $S1 = "ok 2\n"
    .pcc_begin non_prototyped
    .arg $S0
    .arg $S1
    .pcc_call sub
    ret:
    .pcc_end
    print "back\n"
    end
.end
.pcc_sub _sub
    .param string a
    .param string b
    print a
    print b
   .pcc_begin_return
   .pcc_end_return
.end
CODE
ok 1
ok 2
back
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

output_is(<<'CODE', <<'OUT', "coroutine iterator");
.sub _main
  .local int i
  i=5
  newsub $P0, .Coroutine, _addtwo
  newsub $P1, .Continuation, after_loop
  .pcc_begin prototyped
  .arg $P1
  .arg i
  .pcc_call $P0
 ret_addr:
  .result $I2
  .pcc_end
    print $I2
    print "\n"
    savetop
    invoke
    goto ret_addr
    restoretop
 after_loop:
  print "done in main\n"
  end
.end

.pcc_sub _addtwo
  .param Continuation when_done
  .param int a
  .local int i
  i = 0
 loop:
    if i >= 10 goto done
    $I5 = a+i
    .pcc_begin_yield
    .return $I5
    .pcc_end_yield
    i = i + 1
    goto loop
 done:
  print "done in coroutine\n"
  invoke when_done
  end
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

output_is(<<'CODE', <<'OUT', "sub calling another sub, SRegs");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    $S0 = "ok 1\n"
    $S1 = "ok 2\n"
    .pcc_begin prototyped
    .arg $S0
    .arg $S1
    .pcc_call sub
    ret:
    .pcc_end
    print "back\n"
    end
.end
.pcc_sub _sub
    .param string a
    .param string b
    print a
    print b
    .local Sub sub
    newsub sub, .Sub, _sub2
    $S0 = "ok 3\n"
    $S1 = "ok 4\n"
    .pcc_begin prototyped
    .arg $S0
    .arg $S1
    .pcc_call sub
    ret:
    .pcc_end
    print a
    print b
   .pcc_begin_return
   .pcc_end_return
.end
.pcc_sub _sub2
    .param string a
    .param string b
    print a
    print b
   .pcc_begin_return
   .pcc_end_return
.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 1
ok 2
back
OUT

output_is(<<'CODE', <<'OUT', "sub calling another sub, PRegs");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    $P0 = new PerlUndef
    $P1 = new PerlUndef
    $P0 = "ok 1\n"
    $P1 = "ok 2\n"
    .pcc_begin prototyped
    .arg $P0
    .arg $P1
    .pcc_call sub
    ret:
    .pcc_end
    print "back\n"
    end
.end
.pcc_sub _sub
    .param PerlUndef a
    .param PerlUndef b
    print a
    print b
    .local Sub sub
    newsub sub, .Sub, _sub2
    $P0 = new PerlUndef
    $P1 = new PerlUndef
    $P0 = "ok 3\n"
    $P1 = "ok 4\n"
    .pcc_begin prototyped
    .arg $P0
    .arg $P1
    .pcc_call sub
    ret:
    .pcc_end
    print a
    print b
   .pcc_begin_return
   .pcc_end_return
.end
.pcc_sub _sub2
    .param PerlUndef a
    .param PerlUndef b
    print a
    print b
   .pcc_begin_return
   .pcc_end_return
.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 1
ok 2
back
OUT

output_is(<<'CODE', <<'OUT', "in, out different P param, 2 subs");
.sub _main
    .local Sub sub
    .local PerlUndef x
    x = new PerlUndef
    x = 42
    newsub sub, .Sub, _sub
    .pcc_begin prototyped
    .arg x
    .pcc_call sub
    ret:
    .local PerlUndef y
    .result y
    .pcc_end
    .local PerlUndef z
    z = y
    .pcc_begin prototyped
    .arg y
    .pcc_call sub
    ret2:
    .result y
    .pcc_end
    print x
    print "\n"
    print y
    print "\n"
    print z
    print "\n"
    end
.end
.pcc_sub _sub prototyped
    .param PerlUndef a
    .local PerlUndef res
    res = new PerlUndef
    res = a + 1
    .pcc_begin_return
    .return res
    .pcc_end_return
.end
CODE
42
44
43
OUT

output_is(<<'CODE', <<'OUT', "sub calling another");
# sub g() { return 42; }
# sub f() { return g(); }
# print f(), "\n"
# mostly generated from pirate.py

.sub __main__
    new_pad 0
    newsub $P0, .Sub, _sub0       # (genFunction:378)
    store_lex -1, 'g', $P0        # (genFunction:380)
    newsub $P1, .Sub, _sub1       # (genFunction:378)
    store_lex -1, 'f', $P1        # (genFunction:380)
    find_lex $P5, 'f'             # (callingExpression:325)
    newsub $P6, .RetContinuation, ret1 # (callingExpression:331)
    .pcc_begin non_prototyped     # (callingExpression:332)
    .pcc_call $P5, $P6            # (callingExpression:335)
ret1:
    .result $P4                   # (callingExpression:338)
    .pcc_end                      # (callingExpression:339)
    print $P4                      # (visitPrint:394)
    print "\n"                    # (visitPrintnl:403)
    end                           # (compile:574)
.end

# g from line 1
.pcc_sub _sub0 non_prototyped
    .local pmc res0               # (visitReturn:528)
    res0 = new PerlInt            # (expressConstant:153)
    res0 = 42                     # (expressConstant:154)
    .pcc_begin_return             # (visitReturn:530)
    .return res0                  # (visitReturn:531)
    .pcc_end_return               # (visitReturn:532)
.end


# f from line 3
.pcc_sub _sub1 non_prototyped
    .local pmc res1               # (visitReturn:528)
    find_lex $P2, 'g'             # (callingExpression:325)
    newsub $P3, .RetContinuation, ret0 # (callingExpression:331)
    .pcc_begin non_prototyped     # (callingExpression:332)
    .pcc_call $P2, $P3            # (callingExpression:335)
ret0:
    .result res1                  # (callingExpression:338)
    .pcc_end                      # (callingExpression:339)
    .pcc_begin_return             # (visitReturn:530)
    .return res1                  # (visitReturn:531)
    .pcc_end_return               # (visitReturn:532)
.end
CODE
42
OUT


output_is(<<'CODE', <<'OUT', "coroutine generator throwing exception");
## this is mainly from Michal Wallace
## generator_try_bug.imc

## this exposes a bug in parrot exception handling
## a function returns a function and that function
## throws an error. The error is not caught.

# count returns a generator, which counts down to zero and then
# throws an exception, which is caught in main

.sub __main__
    new_pad 0

    # count() returns a generator
    .local Sub count
    newsub count, .Sub, _count

    # here's where we'll store it
    .local pmc generator

    # call count and get the generator
    .local PerlInt start
    start = new PerlInt
    start = 3
    .pcc_begin non_prototyped
    .arg start
    .pcc_call count
ret0:
    .result generator
    .pcc_end


    ## HERE IS where we want the try block to start ####
    .local Sub handler
    newsub handler, .Exception_Handler, catch0
    set_eh handler

    # now call the generator, until that throws 'StopIteration'
    # protect against endless loops
    set I20, 10
loop:
    dec I20
    unless I20, err
    .pcc_begin non_prototyped
    .arg $P0
    .pcc_call generator
ret1:
    .result $P0
    .pcc_end
    print $P0
    print "\n"
    goto loop

    # end the "try" block (we never get here)
    clear_eh
    goto endtry0
catch0:
    print "caught it!\n"
endtry0:
    end
err:
    print "didn't stop\n"
    end
.end

# here is count(), which returns the generator
.pcc_sub _count non_prototyped
   .param PerlInt start
   .local pmc gen_fun
   .local pmc gen_obj
   store_lex -1, "start", start
   newsub gen_fun, .Coroutine, _count_g
   .pcc_begin_return
   .return gen_fun
   .pcc_end_return
.end

# here is the generator itself
# all it does is throw StopIteration
.pcc_sub _count_g non_prototyped
    .local PerlInt c
count_loop:
    find_lex c, -1, "start"
    lt c, 0, stop
    .pcc_begin_yield
    .return c
    .pcc_end_yield
    c = c - 1
    # this branch was to _coung_g, which isn't quite right
    # code shouldn't branch to the entry label, where some
    # function prologue does exist
    # OTOH there might be some more bugs with coruoutines
    goto count_loop

stop:
    .local pmc ex0
    .local pmc msg0
    ex0 = new Exception
    msg0 = new PerlString
    msg0 = 'StopIteration'
    ex0['_message'] = msg0
    throw ex0
.end

## end of test case ###############################

CODE
3
2
1
0
caught it!
OUT

    my $template = <<'TEMPLATE';
.sub _main
    =LOCALS=
    =INITS=
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin prototyped
    =ARGS=
    .pcc_call sub
ret:
    .pcc_end
    end
.end
.pcc_sub _sub prototyped
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

output_is($code, <<'OUT', "overflow integers");
all params ok
OUT

SKIP: {
    skip "massive spilling not yet implemented", 1;
$code = repeat($template, 40,
               LOCALS => '.local int a<index>',
               INITS => 'a<index> = <index>',
               ARGS => '.arg a<index>',
               PARAMS => '.param int a<index>',
               TESTS => 'ne a<index>, <index>, fail');
output_is($code, <<'OUT', "overflowed spilled integers");
all params ok
OUT
}

$code = repeat($template, 18,
               LOCALS => ".local PerlInt a<index>\n\ta<index> = new PerlInt",
               INITS => 'a<index> = <index>',
               ARGS => '.arg a<index>',
               PARAMS => '.param PerlInt a<index>',
               TESTS => "set I0, a<index>\nne I0, <index>, fail");

output_is($code, <<'OUT', "overflow pmcs");
all params ok
OUT

output_is(<<'CODE', <<'OUT', ".flatten_arg non-prototyped 1");
.pcc_sub _main prototyped
    .local Sub sub
    newsub sub, .Sub, _sub
    .local pmc ar
    ar = new PerlArray
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    .pcc_begin non_prototyped
    .flatten_arg ar
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub non_prototyped
    .param pmc a
    .param pmc b
    print a
    print b
    end
.end
CODE
ok 1
ok 2
OUT

output_is(<<'CODE', <<'OUT', ".flatten_arg non-prototyped 2");
.pcc_sub _main prototyped
    .local Sub sub
    newsub sub, .Sub, _sub
    .local pmc ar
    .local pmc x
    x = new PerlString
    x = "first\n"
    ar = new PerlArray
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    .pcc_begin non_prototyped
    .arg x
    .flatten_arg ar
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub non_prototyped
    .param pmc a
    .param pmc b
    print a
    print b
    end
.end
CODE
first
ok 1
OUT

output_is(<<'CODE', <<'OUT', ".flatten_arg non-prototyped 3");
.pcc_sub _main prototyped
    .local Sub sub
    newsub sub, .Sub, _sub
    .local pmc ar
    .local pmc x
    x = new PerlString
    x = "first\n"
    .local pmc y
    y = new PerlString
    y = "last\n"
    ar = new PerlArray
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    .pcc_begin non_prototyped
    .arg x
    .flatten_arg ar
    .arg y
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub non_prototyped
    .param pmc a
    .param pmc b
    .param pmc c
    .param pmc d
    print a
    print b
    print c
    print d
    end
.end
CODE
first
ok 1
ok 2
last
OUT

output_is(<<'CODE', <<'OUT', ".flatten_arg non-prototyped 4");
.pcc_sub _main prototyped
    .local Sub sub
    newsub sub, .Sub, _sub
    .local pmc x
    x = new PerlString
    x = "first\n"
    .local pmc y
    y = new PerlString
    y = "middle\n"
    .local pmc z
    z = new PerlString
    z = "last\n"
    .local pmc ar
    ar = new PerlArray
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    .local pmc ar2
    ar2 = new PerlArray
    push ar2, "ok 3\n"
    push ar2, "ok 4\n"
    push ar2, "ok 5\n"
    .pcc_begin non_prototyped
    .arg x
    .flatten_arg ar
    .arg y
    .flatten_arg ar2
    .arg z
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub non_prototyped
    .param pmc a
    .param pmc b
    .param pmc c
    .param pmc d
    .param pmc e
    .param pmc f
    .param pmc g
    .param pmc h
    print "Got "
    print I3
    print " params\n"
    print a
    print b
    print c
    print d
    print e
    print f
    print g
    print h
    end
.end
CODE
Got 8 params
first
ok 1
ok 2
middle
ok 3
ok 4
ok 5
last
OUT

output_is(<<'CODE', <<'OUT', ".flatten_arg prototyped 1");
.pcc_sub _main prototyped
    .local Sub sub
    newsub sub, .Sub, _sub
    .local pmc x
    x = new PerlString
    x = "first\n"
    .local pmc y
    y = new PerlString
    y = "middle\n"
    .local pmc z
    z = new PerlString
    z = "last\n"
    .local pmc ar
    ar = new PerlArray
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    .local pmc ar2
    ar2 = new PerlArray
    push ar2, "ok 3\n"
    push ar2, "ok 4\n"
    push ar2, "ok 5\n"
    .pcc_begin prototyped
    .arg x
    .flatten_arg ar
    .arg y
    .flatten_arg ar2
    .arg z
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub prototyped
    .param pmc a
    .param pmc b
    .param pmc c
    .param pmc d
    .param pmc e
    .param pmc f
    .param pmc g
    .param pmc h
    .local int count
    print "Got "
    count = I1 + I2
    count = count + I3
    count = count + I4
    print count
    print " params\n"
    print a
    print b
    print c
    print d
    print e
    print f
    print g
    print h
    end
.end
CODE
Got 8 params
first
ok 1
ok 2
middle
ok 3
ok 4
ok 5
last
OUT

output_is(<<'CODE', <<'OUT', ".flatten_arg - overflow");
.pcc_sub _main prototyped
    .local Sub sub
    newsub sub, .Sub, _sub
    .local pmc x
    x = new PerlString
    x = "first\n"
    .local pmc y
    y = new PerlString
    y = "middle\n"
    .local pmc z
    z = new PerlString
    z = "last\n"
    .local pmc ar
    ar = new PerlArray
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    .local pmc ar2
    ar2 = new PerlArray
    push ar2, "ok 3\n"
    push ar2, "ok 4\n"
    push ar2, "ok 5\n"
    push ar2, "ok 6\n"
    push ar2, "ok 7\n"
    push ar2, "ok 8\n"
    push ar2, "ok 9\n"
    push ar2, "ok 10\n"
    push ar2, "ok 11\n"
    push ar2, "ok 12\n"
    .pcc_begin non_prototyped
    .arg x
    .flatten_arg ar
    .arg y
    .flatten_arg ar2
    .arg z
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub non_prototyped
    .param pmc a
    .param pmc b
    .param pmc c
    .param pmc d
    .param pmc e
    .param pmc f
    .param pmc g
    .param pmc h
    .param pmc i
    .param pmc j
    .param pmc k
    .param pmc l
    .param pmc m
    .param pmc n
    .param pmc o
    print "Got "
    print I3
    print " params\n"
    print a
    print b
    print c
    print d
    print e
    print f
    print g
    print h
    print i
    print j
    print k
    print l
    print m
    print n
    print o
    end
.end
CODE
Got 11 params
first
ok 1
ok 2
middle
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
ok 12
last
OUT

output_is(<<'CODE', <<'OUT', ".flatten_arg multiple instances");
.pcc_sub _main prototyped
    .local Sub sub
    newsub sub, .Sub, _sub
    .local pmc ar
    ar = new PerlArray
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    .pcc_begin non_prototyped
    .flatten_arg ar
    .pcc_call sub
    ret:
    .pcc_end
    .pcc_begin non_prototyped
    .flatten_arg ar
    .pcc_call sub
    ret2:
    .pcc_end
    end
.end
.pcc_sub _sub non_prototyped
    .param pmc a
    .param pmc b
    print a
    print b
   .pcc_begin_return
   .pcc_end_return
    end
.end
CODE
ok 1
ok 2
ok 1
ok 2
OUT

output_is(<<'CODE', <<'OUT', "(regression) comment handling in pcc_params");
.sub __main
	.local Sub main_sub
	newsub main_sub, .Sub, _main
	.pcc_begin non_prototyped
        .arg P5
	.pcc_call main_sub
ret:
	.pcc_end
        print "ok\n"
	end
.end

.pcc_sub _main non_prototyped
#Positional parameters:
	.param PerlArray command_line
        .pcc_begin_return
        .pcc_end_return
.end
CODE
ok
OUT

SKIP: {
  skip("cant do NCI on $^O", 1) unless ($^O =~ /linux/);
output_is(<<'CODE', <<'OUT', "nci");
.sub _main
    .sym pmc FABS
    .sym pmc NULL
    null NULL
    dlfunc FABS, NULL, "fabs", "dd"
    .sym float d
    .sym float r
    d = -42
    .pcc_begin prototyped
    .arg d
    .nci_call FABS
    .result r
    .pcc_end
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

output_is(<<'CODE', <<'OUT', "MAIN pragma, syntax only");
.sub _main prototyped, @MAIN
    print "ok\n"
    end
.end
CODE
ok
OUT

output_is(<<'CODE', <<'OUT', "more pragmas, syntax only");
.sub _main prototyped, @MAIN, @IMMEDIATE, @LOAD, @POSTCOMP
    print "ok\n"
    end
.end
CODE
ok
OUT

output_is(<<'CODE', <<'OUT', "_func() syntax");
.sub _main
    _sub(10, 20)
    end
.end
.pcc_sub _sub prototyped
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
output_is(<<'CODE', <<'OUT', "_func() syntax with var");
.sub _main
    .local pmc the_sub
    the_sub = global "_sub"
    the_sub(10, 20)
    end
.end
.pcc_sub _sub prototyped
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

output_is(<<'CODE', <<'OUT', "P3 is NULL - 11 args");
.sub _main
    P3 = new .PerlArray
    # call with 11 parameters
    _foo($P1, $P2, $P3, $P4, $P5, $P6, $P7, $P8, $P9, $P10, $P11)
    end
.end

.sub _foo
    isnull P3, p3_is_null
    print "P3 is not NULL\n"
    goto return
p3_is_null:
    print "P3 is NULL\n"
return:
.end
CODE
P3 is NULL
OUT

output_is(<<'CODE', <<'OUT', "P3 isnt NULL - 12 args");
.sub _main
    null P3
    # call with 12 parameters
    _foo($P1, $P2, $P3, $P4, $P5, $P6, $P7, $P8, $P9, $P10, $P11, $P12)
    end
.end

.sub _foo
    isnull P3, p3_is_null
    print "P3 is not NULL\n"
    $I0 = P3
    print $I0
    print "\n"
    print I3
    print "\n"
    goto return
p3_is_null:
    print "P3 is NULL\n"
return:
.end
CODE
P3 is not NULL
1
11
OUT

output_is(<<'CODE', <<'OUT', "P3 isnt NULL - 13 args");
.sub _main
    null P3
    # call with 13 parameters
    _foo($P1, $P2, $P3, $P4, $P5, $P6, $P7, $P8, $P9, $P10, $P11, $P12, $P13)
    end
.end

.sub _foo
    isnull P3, p3_is_null
    print "P3 is not NULL\n"
    $I0 = P3
    print $I0
    print "\n"
    print I3
    print "\n"
    goto return
p3_is_null:
    print "P3 is NULL\n"
return:
.end
CODE
P3 is not NULL
2
11
OUT

output_is(<<'CODE', <<'OUT', "argcX identifiers");
.sub _main
    .local int i
    .local int j
    .local float f
    .local string s
    .local string t
    .local string u
    .local pmc p
    .local pmc q
    _func(i,j,f,s,t,u,p,q)
    print "proto "
    print is_prototyped
    print "\n"
    print "P "
    print argcP
    print "\n"
    end
.end
.sub _func
    print "proto "
    print is_prototyped
    print "\n"
    print "I "
    print argcI
    print "\n"
    print "S "
    print argcS
    print "\n"
    print "P "
    print argcP
    print "\n"
    print "N "
    print argcN
    print "\n"
.end
CODE
proto 1
I 2
S 3
P 2
N 1
proto 0
P 0
OUT

output_is(<<'CODE', "mongueur\nmonger\n", "multiple declaration in a .sym/.local directive");
.sub main
.sym string s, t
  s = "mongueur\n"
  t = "monger\n"
  print s
  print t
  end
.end
CODE

output_is(<<'CODE', "42\n", "oneliner return");
.sub _main
.sym int a, b
  (a, b) = _sub()   
  print a
  print b
  print "\n"
  _sub1()
  end
.end

.sub _sub prototyped
.return ( 4,  2 )
.end

.sub _sub1 prototyped
.return ( )
.end
CODE

output_is(<<'CODE', <<'OUT', "oneliner yield");
.sub _main
  .local int i
  i=5
  newsub $P0, .Coroutine, _addtwo
  newsub $P1, .Continuation, after_loop
  .pcc_begin prototyped
  .arg $P1
  .arg i
  .pcc_call $P0
 ret_addr:
  .result $I2
  .pcc_end
    print $I2
    print "\n"
    savetop
    invoke
    goto ret_addr
    restoretop
 after_loop:
  print "done in main\n"
  end
.end

.pcc_sub _addtwo
  .param Continuation when_done
  .param int a
  .local int i
  i = 0
 loop:
    if i >= 10 goto done
    $I5 = a+i
    .yield ( $I5 )
    i = i + 1
    goto loop
 done:
  print "done in coroutine\n"
  invoke when_done
  end
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
