#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/sub.t - Subroutine PMCs

=head1 SYNOPSIS

	% perl -Ilib t/pmc/sub.t

=head1 DESCRIPTION

Tests the creation and invocation of C<Sub>, C<Closure> and
C<Continuation> PMCs.

=cut

use Parrot::Test tests => 78;
use Test::More;
use Parrot::Config;

my $temp = "temp.pasm";

END {
    unlink($temp, 'temp.pbc');
};

output_is(<<'CODE', <<'OUTPUT', "PASM subs - newsub");
    print "main\n"
    newsub .Sub, .RetContinuation, _func, _ret
    invoke
_ret:
    print "back\n"
    end
_func:
    print "func\n"
    invoke P1
CODE
main
func
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM subs - newsub 2");
    print "main\n"
    newsub P0, .Sub, _func
    invokecc
    print "back\n"
    end
_func:
    print "func\n"
    invoke P1
CODE
main
func
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM subs - invokecc");
    new P0, .Sub
    set_addr P0, func

    set I5, 3
    set I0, 1
    set I1, 1
    null I2
    null I3
    null I4
    save I5

    invokecc

    restore I5
    print I5
    print "\n"
    end

func:
    print I5
    print "\n"

    eq I5, 0, endfunc
    dec I5

    save P1
    invokecc   # recursive invoke
    restore P1

endfunc:
    invoke P1
CODE
3
2
1
0
3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM subs - invokecc_p");
    new P0, .Sub
    set_addr P0, func

    set I5, 3
    set I0, 1
    set I1, 1
    null I2
    null I3
    null I4
    save I5

    invokecc P0

    restore I5
    print I5
    print "\n"
    end

func:
    print I5
    print "\n"

    eq I5, 0, endfunc
    dec I5

    save P1
    invokecc P0  # recursive invoke
    restore P1

endfunc:
    invoke P1
CODE
3
2
1
0
3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Continuation");
    new P5, .PerlInt
    set P5, 3
    store_global "foo", P5
    new P1, .Continuation
    set_addr P1, endcont
endcont:
    find_global P4, "foo"
    print "here "
    print P4
    print "\n"
    unless P4, done
    dec P4
    store_global "foo", P4
    print "going to cont\n"
    clone P0, P1
    invoke
done:
    print "done\n"
    end

CODE
here 3
going to cont
here 2
going to cont
here 1
going to cont
here 0
done
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "definedness of Continuation");
    new P1, .Continuation
    defined I1, P1
    print I1
    print "\n"
    set_addr P1, cont
    defined I1, P1
    print I1
    print "\n"
    end

cont:
    print "I'm a very boring continuation"
    end

CODE
0
1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM sub as closure");
    # sub foo {
    #     my ($n) = @_;
    #     sub {$n += shift}
    # }
    # my $f = foo(5);
    # print &$f(3), "\n";
    # print &$f(3), "\n";
    # print &$f(3), "\n";
main:

    new P0, .Sub
    set_addr P0, foo

    new P5, .PerlInt
    set P5, 5

    set I0, 0	# non-proto
    set I3, 1	# 1 arg
    invokecc
    set P0, P5	# the closure

    new P5, .PerlInt
    set P5, 3

    set I0, 0	# non-proto
    set I3, 1	# 1 arg
    pushbottomp	# preserve P regs
    invokecc
    save P5	# result in P5
    popbottomp
    restore P2

    print P2
    print "\n"

    set I0, 0	# non-proto
    set I3, 1	# 1 arg
    pushbottomp	# preserve P regs
    invokecc
    save P5	# result in P5
    popbottomp
    restore P2

    print P2
    print "\n"

    set I0, 0	# non-proto
    set I3, 1	# 1 arg
    pushbottomp	# preserve P regs
    invokecc
    save P5	# result in P5
    popbottomp
    restore P2

    print P2
    print "\n"

    end

# foo takes a number n (P5) and returns a sub (in P5) that takes
# a number i (P5) and returns n incremented by i.
foo:
    new_pad 0
    store_lex 0, "n", P5
    new P5, .Closure	# P5 has now the lexical "n" in the pad
    set_addr P5, f
    set I0, 0	# non-proto
    set I3, 1	# 1 retval
    invoke P1		# ret

# expects arg in P5, returns incremented result in P5
f:
    find_lex P2, "n"	# invoke-ing the Sub pushes the lexical pad
    			# of the closure on the pad stack
    add P2, P5		# n += shift, the lexical is incremented
    new P5, .PerlInt
    set P5, P2
    set I0, 0	# non-proto
    set I3, 1	# 1 retval
    invoke P1		# ret

CODE
8
11
14
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM subs - tail invoke");
    new P0, .Sub
    set_addr P0, func1

    invokecc
    print "done\n"
    end

func1:
    print "in func1\n"

    new P0, .Sub
    set_addr P0, func2

    invoke    # tail invoke (reuses context already in P1)
    print "this should not be called\n"
    end

func2:
    print "in func2\n"
    invoke P1

CODE
in func1
in func2
done
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM subs - tail invoke with newsub");
    newsub P0, .Sub, func1

    invokecc
    print "done\n"
    end

func1:
    print "in func1\n"

    newsub P0, .Sub, func2

    invoke    # tail invoke (reuses context already in P1)
    print "this should not be called\n"

func2:
    print "in func2\n"
    invoke P1

CODE
in func1
in func2
done
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub calling a sub");
    print "main\n"
    newsub .Sub, .RetContinuation, _func1, ret1
    invoke
ret1:
    print "back\n"
    end

_func1:
    print "func1\n"
    pushbottomp
    newsub .Sub, .RetContinuation, _func2, ret2
    invoke
ret2:
    popbottomp
    print "func1\n"
    invoke P1

_func2:
    print "func2\n"
    invoke P1

CODE
main
func1
func2
func1
back
OUTPUT

for my $R (0..4) {
for my $N (254..258) {
output_is(<<"CODE", <<'OUTPUT', "test COW $R $N");
    print "main\\n"
    set I16, 0
    set I17, $N	 	#~1 chunk full
lp:
    save I16
    inc I16
    le I16, I17, lp
    newsub .Continuation, .RetContinuation, _func, ret
    pushbottomi
    invoke
    popbottomi
ret:
lp2:
    restore I16
    eq I16, I17, ok
    print "nok I16: "
    print I16
    print " I17: "
    print I17
    print "\\n"
    end
ok:
    dec I17
    if I17, lp2
    print "back\\n"
    end
_func:
    print "func\\n"
    set I0, $R
lp3:
    unless I0, cont
    save I0
    dec I0
    branch lp3
cont:
    invoke P1
CODE
main
func
back
OUTPUT
}
}

output_like(<<'CODE', <<'OUTPUT', "interp - warnings");
    new P0, .PerlUndef
    set I0, P0
    printerr "main:"
    newsub .Sub, .RetContinuation, _func, _ret
    invoke
_ret:
    printerr ":back"
    new P0, .PerlUndef
    set I0, P0
    end
_func:
    warningson 1
    new P0, .PerlUndef
    set I0, P0
    invoke P1
CODE
/^main:Use of uninitialized value in integer context
\s+in file.*:back$/s
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "interp - warnings 2");
    warningson 1
    newsub .Sub, .RetContinuation, _func, ret
    new P10, .PerlUndef
    set I0, P10
    printerr ":main"
    invoke
ret:
    printerr ":back:"
    new P10, .PerlUndef
    set I0, P10
    printerr ":end"
    end
_func:
    warningsoff 1
    new P0, .PerlUndef
    set I0, P0
    invoke P1
CODE
/^Use of uninitialized value in integer context
\s+in file.*:main:back:Use of un.*$/sm
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "interp - warnings 2 - updatecc");
    # the RetContinuation in P1 is created with warnings off
    newsub .Sub, .RetContinuation, _func, ret
    # turn warnings on in main
    warningson 1
    new P10, .PerlUndef
    set I0, P10
    printerr ":main"
    # update the state of the return continuation
    updatecc
    invoke
ret:
    printerr ":back:"
    new P10, .PerlUndef
    set I0, P10
    printerr ":end"
    end
_func:
    # turn off warnings in the sub
    warningsoff 1
    new P0, .PerlUndef
    set I0, P0
    invoke P1
CODE
/^Use of uninitialized value in integer context
\s+in file.*:main:back:Use of un.*$/sm
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "pcc sub");
    find_global P0, "_the_sub"
    defined I0, P0
    if I0, ok
    print "not "
ok:
    print "ok 1\n"
    invokecc
    print "back\n"
    end
.pcc_sub _the_sub:
    print "in sub\n"
    invoke P1
CODE
ok 1
in sub
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "pcc sub, tail call");
    find_global P0, "_the_sub"
    defined I0, P0
    if I0, ok
    print "not "
ok:
    print "ok 1\n"
    invokecc
    print "back\n"
    end

.pcc_sub _the_sub:
    print "in sub\n"
    find_global P0, "_next_sub"
    get_addr I0, P0
    jump I0
    print "never here\n"

.pcc_sub _next_sub:
    print "in next sub\n"
    invoke P1
    print "never here\n"
    end
CODE
ok 1
in sub
in next sub
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "pcc sub perl::syn::tax");
    find_global P0, "_the::sub::some::where"
    defined I0, P0
    if I0, ok
    print "not "
ok:
    print "ok 1\n"
    invokecc
    print "back\n"
    end
.pcc_sub _the::sub::some::where:
    print "in sub\n"
    invoke P1
CODE
ok 1
in sub
back
OUTPUT

open S, ">$temp" or die "Can't write $temp";
print S <<'EOF';
  .pcc_sub _sub1:
  print "in sub1\n"
  end
EOF
close S;

output_is(<<'CODE', <<'OUTPUT', "load_bytecode call sub");
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pasm"
    print "loaded\n"
    find_global P0, "_sub1"
    defined I0, P0
    if I0, ok1
    print "not "
ok1:
    print "found sub\n"
    invoke
    print "never\n"
    end
CODE
main
loaded
found sub
in sub1
OUTPUT

open S, ">$temp" or die "Can't write $temp";
print S <<'EOF';
  .pcc_sub _sub1:
  print "in sub1\n"
  invoke P1
EOF
close S;

output_is(<<'CODE', <<'OUTPUT', "load_bytecode call sub, ret");
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pasm"
    print "loaded\n"
    find_global P0, "_sub1"
    defined I0, P0
    if I0, ok1
    print "not "
ok1:
    print "found sub\n"
    invokecc
    print "back\n"
    end
CODE
main
loaded
found sub
in sub1
back
OUTPUT

open S, ">$temp" or die "Can't write $temp";
print S <<'EOF';
  .pcc_sub _sub1:
  print "in sub1\n"
  invoke P1
  .pcc_sub _sub2:
  print "in sub2\n"
  invoke P1
EOF
close S;

output_is(<<'CODE', <<'OUTPUT', "load_bytecode call different subs, ret");
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pasm"
    print "loaded\n"
    find_global P0, "_sub1"
    defined I0, P0
    if I0, ok1
    print "not "
ok1:
    print "found sub1\n"
    set P10, P0
    invokecc
    print "back\n"
    find_global P0, "_sub2"
    defined I0, P0
    if I0, ok2
    print "not "
ok2:
    print "found sub2\n"
    invokecc
    print "back\n"
    set P0, P10
    invokecc
    print "back\n"
    end
CODE
main
loaded
found sub1
in sub1
back
found sub2
in sub2
back
in sub1
back
OUTPUT

system(".$PConfig{slash}parrot$PConfig{exe} -o temp.pbc $temp");

output_is(<<'CODE', <<'OUTPUT', "load_bytecode PBC call different subs, ret");
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pbc"
    print "loaded\n"
    find_global P0, "_sub1"
    defined I0, P0
    if I0, ok1
    print "not "
ok1:
    print "found sub1\n"
    set P10, P0
    invokecc
    print "back\n"
    find_global P0, "_sub2"
    defined I0, P0
    if I0, ok2
    print "not "
ok2:
    print "found sub2\n"
    invokecc
    print "back\n"
    set P0, P10
    invokecc
    print "back\n"
    end
CODE
main
loaded
found sub1
in sub1
back
found sub2
in sub2
back
in sub1
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "equality of closures");
      new P0, .Closure
      set_addr P0, f1
      clone P1, P0
      eq P0, P1, OK1
      print "not "
OK1:  print "ok 1\n"

      new P2, .Closure
      set_addr P2, f2
      eq P0, P2, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
      end

f1:
      print "Test\n"
      end

f2:
      new P1, .PerlUndef
      end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "equality of subs");
      new P0, .Sub
      set_addr P0, f1
      clone P1, P0
      eq P0, P1, OK1
      print "not "
OK1:  print "ok 1\n"

      new P2, .Sub
      set_addr P2, f2
      eq P0, P2, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
      end

f1:
      print "Test\n"
      end

f2:
      new P1, .PerlUndef
      end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "continuation close over register stacks");
    set S20, "ok\n"
    savetop
    newsub P0, .Continuation, next
    restoretop
    concat S20, "not ", S20
    invoke
    print "bad\n"
next:
    restoretop
    print S20
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "DOD marks continuation's register stacks");
    set S20, "ok\n"
    savetop
    newsub P0, .Continuation, next
    restoretop
    null S20
    sweep 1
    collect
    invoke
    print "bad\n"
next:
    restoretop
    print S20
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUT', "MAIN pragma, syntax only");
.pcc_sub @MAIN _main:
    print "ok\n"
    end
CODE
ok
OUT

open S, ">$temp" or die "Can't write $temp";
print S <<'EOF';
  .pcc_sub @LOAD _sub1:
  print "in sub1\n"
  invoke P1
EOF
close S;

output_is(<<'CODE', <<'OUTPUT', 'load_bytecode @LOAD');
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pasm"
    print "back\n"
    end
CODE
main
in sub1
back
OUTPUT

open S, ">$temp" or die "Can't write $temp";
print S <<'EOF';
  .pcc_sub _error:
  print "error\n"
  .pcc_sub @LOAD _sub1:
  print "in sub1\n"
  invoke P1
EOF
close S;

output_is(<<'CODE', <<'OUTPUT', 'load_bytecode @LOAD second sub');
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pasm"
    print "back\n"
    end
CODE
main
in sub1
back
OUTPUT

system(".$PConfig{slash}parrot$PConfig{exe} -o temp.pbc $temp");

output_is(<<'CODE', <<'OUTPUT', 'load_bytecode @LOAD in pbc');
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pbc"
    print "back\n"
    end
CODE
main
in sub1
back
OUTPUT

open S, ">$temp" or die "Can't write $temp";
print S <<'EOF';
  .pcc_sub @LOAD _sub1:
  print "in sub1\n"
  invoke P1
  .pcc_sub _sub2:
  print "in sub2\n"
  invoke P1
EOF
close S;

output_is(<<'CODE', <<'OUTPUT', "load_bytecode autorun first");
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pasm"
    print "loaded\n"
    find_global P0, "_sub2"
    invokecc
    print "back\n"
    end
CODE
main
in sub1
loaded
in sub2
back
OUTPUT

system(".$PConfig{slash}parrot$PConfig{exe} -o temp.pbc $temp");

output_is(<<'CODE', <<'OUTPUT', "load_bytecode autorun first in pbc");
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pbc"
    print "loaded\n"
    find_global P0, "_sub2"
    invokecc
    print "back\n"
    end
CODE
main
in sub1
loaded
in sub2
back
OUTPUT

open S, ">$temp" or die "Can't write $temp";
print S <<'EOF';
  .pcc_sub _sub1:
  print "in sub1\n"
  invoke P1
  .pcc_sub @LOAD _sub2:
  print "in sub2\n"
  invoke P1
EOF
close S;

output_is(<<'CODE', <<'OUTPUT', "load_bytecode autorun second");
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pasm"
    print "loaded\n"
    find_global P0, "_sub1"
    invokecc
    print "back\n"
    end
CODE
main
in sub2
loaded
in sub1
back
OUTPUT

system(".$PConfig{slash}parrot$PConfig{exe} -o temp.pbc $temp");

output_is(<<'CODE', <<'OUTPUT', "load_bytecode autorun second in pbc");
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pbc"
    print "loaded\n"
    find_global P0, "_sub1"
    invokecc
    print "back\n"
    end
CODE
main
in sub2
loaded
in sub1
back
OUTPUT

open S, ">$temp" or die "Can't write $temp";
print S <<'EOF';
  .pcc_sub @LOAD _sub1:
  print "in sub1\n"
  invoke P1
  .pcc_sub @LOAD _sub2:
  print "in sub2\n"
  invoke P1
EOF
close S;

output_is(<<'CODE', <<'OUTPUT', "load_bytecode autorun both");
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pasm"
    print "loaded\n"
    find_global P0, "_sub1"
    invokecc
    print "back\n"
    end
CODE
main
in sub1
in sub2
loaded
in sub1
back
OUTPUT

system(".$PConfig{slash}parrot$PConfig{exe} -o temp.pbc $temp");

output_is(<<'CODE', <<'OUTPUT', "load_bytecode autorun both in pbc");
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.pbc"
    print "loaded\n"
    find_global P0, "_sub1"
    invokecc
    print "back\n"
    end
CODE
main
in sub1
in sub2
loaded
in sub1
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', '@MAIN pragma');
.pcc_sub _first:
    print "first\n"
    invoke P1
.pcc_sub @MAIN _main:
    print "main\n"
    end
CODE
main
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'two @MAIN pragmas');
.pcc_sub _first:
    print "first\n"
    invoke P1
.pcc_sub @MAIN _main:
    print "main\n"
    end
.pcc_sub @MAIN _second:
    print "second\n"
    invoke P1
CODE
main
OUTPUT

output_is(<<'CODE', <<'OUTPUT', '@MAIN pragma call subs');
.pcc_sub _first:
    print "first\n"
    invoke P1
.pcc_sub _second:
    print "second\n"
    invoke P1
.pcc_sub @MAIN _main:
    print "main\n"
    find_global P0, "_first"
    invokecc
    find_global P0, "_second"
    invokecc
    end
CODE
main
first
second
OUTPUT

my ($fpc, $cfg);
$cfg = "include/parrot/config.h";
open(I, $cfg) or die "Cant read $cfg: $!";
while (<I>) {
    if (/FRAMES_PER_CHUNK\s+(\d+)/) {
	$fpc = $1;
	last;
    }
}
close I;
die "Cant find FRAMES_PER_CHUNK in $cfg" unless ($fpc) ;
for my $N ($fpc-2..$fpc+2) {
output_is(<<"CODE", <<'OUTPUT', "test COW w strings $N");
    print "main\\n"
    set I16, 0
    set I17, $N
lp:
    set S16, I16
    savetop
    inc I16
    le I16, I17, lp
    newsub P0, .Continuation, _func
    invokecc

lp2:
    restoretop
    set S0, I16
    # triggers DOD with --gc-debug
    ne S0, S16, nok
    dec I16
    if I16, lp2
    print "ok\\n"
    end
nok:
    print "not ok S0 = '"
    print S0
    print "' S16 = '"
    print S16
    print "'\\n"
    end
_func:
    print "func\\n"
    set I16, 0
    set I17, @{[ $N+$fpc ]}
lp3:
    set S16, I16
    savetop
    inc I16
    le I16, I17, lp3
    invoke P1
CODE
main
func
ok
OUTPUT
}


$temp = "temp.imc";
open S, ">$temp" or die "Can't write $temp";
print S <<'EOF';
.emit
  .pcc_sub @LOAD _sub1:
  print "in sub1\n"
  invoke P1
.eom
EOF
close S;

output_is(<<'CODE', <<'OUTPUT', 'load_bytecode @LOAD first sub - imc');
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.imc"
    print "back\n"
    end
CODE
main
in sub1
back
OUTPUT

open S, ">$temp" or die "Can't write $temp";
print S <<'EOF';
.emit
  .pcc_sub _foo:
  print "error\n"
.eom
.emit
# LOAD or other pragmas are only evaluated on the first
# instruction of a compilation unit
  .pcc_sub @LOAD _sub1:
  print "in sub1\n"
  invoke P1
.eom
EOF
close S;

output_is(<<'CODE', <<'OUTPUT', 'load_bytecode @LOAD second sub - imc');
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.imc"
    print "back\n"
    end
CODE
main
in sub1
back
OUTPUT

open S, ">$temp" or die "Can't write $temp";
print S <<'EOF';
.emit
  .pcc_sub _foo:
  print "error\n"
  .pcc_sub _sub1:
  print "in sub1\n"
  invoke P1
.eom
EOF
close S;

output_is(<<'CODE', <<'OUTPUT', 'load_bytecode no @LOAD - imc');
.pcc_sub _main:
    print "main\n"
    load_bytecode "temp.imc"
    print "back\n"
    end
CODE
main
back
OUTPUT


output_like(<<'CODE', <<'OUTPUT', "warn on in main");
##PIR##
.sub _main @MAIN
.include "warnings.pasm"
    warningson .PARROT_WARNINGS_UNDEF_FLAG
    _f1()
.end
.sub _f1
    $P0 = new PerlUndef
    print $P0
.end
CODE
/uninit/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "warn on in sub");
##PIR##
.sub _main @MAIN
.include "warnings.pasm"
    _f1()
    $P0 = new PerlUndef
    print $P0
    print "ok\n"
.end
.sub _f1
    warningson .PARROT_WARNINGS_UNDEF_FLAG
.end
CODE
ok
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "warn on in sub, turn off in f2");
##PIR##
.sub _main @MAIN
.include "warnings.pasm"
    _f1()
    $P0 = new PerlUndef
    print "back\n"
    print $P0
    print "ok\n"
.end
.sub _f1
    warningson .PARROT_WARNINGS_UNDEF_FLAG
    _f2()
    $P0 = new PerlUndef
    print $P0
.end
.sub _f2
    warningsoff .PARROT_WARNINGS_UNDEF_FLAG
.end
CODE
/uninit.*\n.*\nback\nok/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub names");
.pcc_sub main:
    .include "interpinfo.pasm"
    interpinfo P20, .INTERPINFO_CURRENT_SUB
    print P20
    print "\n"
    find_global P0, "the_sub"
    invokecc
    interpinfo P20, .INTERPINFO_CURRENT_SUB
    print P20
    print "\n"
    end
.pcc_sub the_sub:
    interpinfo P20, .INTERPINFO_CURRENT_SUB
    print P20
    print "\n"
    interpinfo P1, .INTERPINFO_CURRENT_CONT
    invoke P1
CODE
main
the_sub
main
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub names w MAIN");
.pcc_sub dummy:
    print "never\n"
    noop
.pcc_sub @MAIN main:
    .include "interpinfo.pasm"
    interpinfo P20, .INTERPINFO_CURRENT_SUB
    print P20
    print "\n"
    find_global P0, "the_sub"
    invokecc
    interpinfo P20, .INTERPINFO_CURRENT_SUB
    print P20
    print "\n"
    end
.pcc_sub the_sub:
    interpinfo P20, .INTERPINFO_CURRENT_SUB
    print P20
    print "\n"
    interpinfo P1, .INTERPINFO_CURRENT_CONT
    invoke P1
CODE
main
the_sub
main
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub names undefined");
    .include "interpinfo.pasm"
    interpinfo P20, .INTERPINFO_CURRENT_SUB
    print P20
    print "ok 1\n"
    defined I0, P20
    unless I0, ok
    print "not"
ok:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub names w newsub");
##PIR##
.sub main @MAIN
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_CURRENT_SUB
    print $P0
    foo()
    print "\n"
.end
.sub foo
    $P0 = interpinfo .INTERPINFO_CURRENT_SUB
    print $P0
   bar()
    $P0 = interpinfo .INTERPINFO_CURRENT_SUB
    print $P0
.end
.sub bar
    $P0 = interpinfo .INTERPINFO_CURRENT_SUB
    print $P0
.end
CODE
mainfoobarfoo
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "caller introspection");
##PIR##
.sub main @MAIN
.include "interpinfo.pasm"
    # this test will fail when run with -Oc
    # as the call chain is cut down with tail calls
    foo()
    $P0 = find_global "Bar", "foo"
    $P0()
    print "ok\n"
.end
.sub foo
    print "main foo\n"
    $P0 = find_global "Bar", "bar"
    $P0()
.end
.namespace ["Bar"]
.sub bar
    print "Bar bar\n"
    $P1 = getinterp
    $P0 = $P1["sub"]
    print "subname: "
    print $P0
    print "\n"
    foo()
.end
.sub foo
    print "Bar foo\n"
    $P1 = getinterp
    $I0 = 0
    newsub $P2, .Exception_Handler, tb_end
    set_eh $P2
tb_loop:
    $P0 = $P1["sub"; $I0]
    print "caller "
    print $I0
    print " "
    print $P0
    print "\n"
    inc $I0
    goto tb_loop
tb_end:
.end
CODE
main foo
Bar bar
subname: bar
Bar foo
caller 0 foo
caller 1 bar
caller 2 foo
caller 3 main
Bar foo
caller 0 foo
caller 1 main
ok
OUTPUT
