#!perl
use strict;
use TestCompiler tests => 14;

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

##############################
# tail recursion - caller saves - parrot calling convention
output_is(<<'CODE', <<'OUT', "tail recursive sub");
.sub _main
    .local int count
    count = 5
    .local int product
    product = 1
    .local Sub sub
    .local Continuation cc
    newsub sub, .Sub, _fact
    newsub cc, .Continuation, ret
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
   invoke
fin:
   invoke P1
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
    invoke P1
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
    invoke P1
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
    invoke P1
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
    invoke P1
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
    invoke P1
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
    invoke P1
.end
CODE
ok 1
ok 2
back
OUT

output_is(<<'CODE', <<'OUT', "wrong param count exception");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin non_prototyped
    .arg $S0
    .pcc_call sub
    ret:
    .pcc_end
    print "back\n"
    end
.end

.pcc_sub _sub
    .param string k
    .param string l
    print k
    print l
    invoke P1
.end
CODE
wrong param count
OUT

output_is(<<'CODE', <<'OUT', "wrong param count exception, call 2 subs");
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
    newsub sub, .Sub, _sub2
    .pcc_begin non_prototyped
    .arg $S0
    .pcc_call sub
    ret2:
    .pcc_end
    print "back\n"
    end
.end

.pcc_sub _sub
    .param string k
    .param string l
    print k
    print l
    invoke P1
.end

.pcc_sub _sub2
    .param string k
    .param string l
    print k
    print l
    invoke P1
.end
CODE
ok 1
ok 2
wrong param count
OUT


output_is(<<'CODE', <<'OUT', "wrong param count exception, catch it");
.sub _main
    .local Sub ex_handler
    newsub ex_handler, .Exception_Handler, _handler
    set_eh ex_handler
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin non_prototyped
    .arg $S0
    .pcc_call sub
    ret:
    .pcc_end
    print "back\n"
    end
.end

.sub _handler
    set S0, P5["_message"]	# P5 is the exception object
    eq S0, "wrong param count", ok
    print "not "
ok:
    print "ok\n"
    end
.end

.pcc_sub _sub
    .param string k
    .param string l
    print k
    print l
    invoke P1
.end
CODE
ok
OUT

output_is(<<'CODE', <<'OUT', "wrong param type exception");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin non_prototyped
    .arg $S0
    .pcc_call sub
    ret:
    .pcc_end
    print "back\n"
    end
.end

.pcc_sub _sub
    .param int k
    print k
    print "n"
    invoke P1
.end
CODE
wrong param type
OUT

output_is(<<'CODE', <<'OUT', "wrong param type exception - 2 params");
.sub _main
    .local Sub sub
    $S0 = "ok 1\n"
    newsub sub, .Sub, _sub
    .pcc_begin non_prototyped
    .arg $S0
    .arg $I0
    .pcc_call sub
    ret:
    .pcc_end
    print "back\n"
    end
.end

.pcc_sub _sub
    .param string k
    .param string l
    print k
    print l
    invoke P1
.end
CODE
wrong param type
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
    save i
    save a
    .pcc_begin_yield
    .return $I5
    .pcc_end_yield
    restore a
    restore i
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
