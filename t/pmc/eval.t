#! perl -w

# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/eval.t - Dynamic Code Evaluation

=head1 SYNOPSIS

	% perl -Ilib t/pmc/eval.t

=head1 DESCRIPTION

Tests on-the-fly PASM, PIR and PAST compilation and invocation.

=cut

use Parrot::Test tests => 14;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "eval_sc");
	compreg P1, "PASM"	# get compiler
	set_args "(0)", "print \"in eval\\n\"\nset_returns \"()\"\nreturncc\n"
	get_results "(0)", P0
	invokecc P1			# compile
	invokecc P0			# eval code P0
	print "back again\n"
	end
CODE
in eval
back again
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "call subs in evaled code ");
    set S5, ".pcc_sub _foo:\n"
    concat S5, "print \"foo\\n\"\n"
    concat S5, "set_returns \"()\"\n"
    concat S5, "returncc\n"
    compreg P1, "PASM"
    set_args "(0)", S5
    invokecc P1
    find_global P0, "_foo"
    invokecc P0
    print "back\n"
    end
CODE
foo
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "call 2 subs in evaled code ");
    set S5, ".pcc_sub _foo:\n"
    concat S5, "print \"foo\\n\"\n"
    concat S5, "set_returns \"()\"\n"
    concat S5, "returncc\n"
    concat S5, ".pcc_sub _bar:\n"
    concat S5, "print \"bar\\n\"\n"
    concat S5, "set_returns \"()\"\n"
    concat S5, "returncc\n"
    compreg P1, "PASM"
    set_args "(0)", S5
    get_results "(0)", P6
    invokecc P1
    find_global P2, "_foo"
    invokecc P2
    print "back\n"
    find_global P2, "_bar"
    invokecc P2
    print "fin\n"
    end
CODE
foo
back
bar
fin
OUTPUT

SKIP: {
  skip("too much old calling conventions", 1);
output_is(<<'CODE', <<'OUTPUT', "nano forth sub");
_main:
    load_bytecode "examples/assembly/nanoforth2.pasm"
    print "ok 1\n"
    find_global P0, "_nano_forth_compiler"
    defined I0, P0
    if I0, ok2
    print "not "
ok2:
    print "ok 2\n"
    set S5, "1 7 + . 2 3 - .\n"
    set I0, 1
    set I1, 0
    set I2, 1
    set I3, 0
    set I4, 0
    invokecc
    set S5, ": i 1 + ; 5 i .\n"
    set I0, 1
    set I1, 0
    set I2, 1
    set I3, 0
    set I4, 0
    invokecc
    set S5, ": i 1 + ; : j i i ; 9 j .\n"
    set I0, 1
    set I1, 0
    set I2, 1
    set I3, 0
    set I4, 0
    # XXX fails with -S
    # invokecc
    end
CODE
ok 1
ok 2
8
-1
6
OUTPUT
}

pir_output_is(<<'CODE', <<'OUTPUT', "PIR compiler sub");

.sub test @MAIN
    .local NCI compiler
    find_global compiler, "xcompile"
    compreg "XPASM", compiler
    .local pmc my_compiler
    my_compiler = compreg "XPASM"
    .local pmc the_sub
    .local string code
    code = "print \"ok\\n\"\n"
    code .= "set_returns \"()\"\n"
    code .= "returncc\n"
    the_sub = my_compiler("_foo", code)
    the_sub()
    the_sub = global "_foo"
    the_sub()
.end

.sub xcompile
    .param string sub_name
    .param string code
    $S0 = ".pcc_sub "
    $S0 .= sub_name
    $S0 .= ":\n"
    $S0 .= code
    .local NCI pasm_compiler
    pasm_compiler = compreg "PASM"
    # print $S0
    $P0 = pasm_compiler($S0)
    .return($P0)
.end
CODE
ok
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "bug #31467");

  .sub main @MAIN
     $P1 = new Hash
     newsub $P0, .Sub, _builtin
     $P1['builtin'] = $P0

     $P2 = compreg "PIR"
     $S0 = ".sub main\nprint \"dynamic\\n\"\n.end\n"
     $P0 = $P2($S0)
     $P1['dynamic'] = $P0

     store_global "funcs", $P1

     $S0 = ".sub main\n$P1 = find_global\"funcs\"\n"
     $S0 .= "$P0 = $P1['dynamic']\n$P0()\n"
     $S0 .= "$P0 = $P1['builtin']\n$P0()\n"
     $S0 .= ".end\n"

     $P2 = compreg "PIR"
     $P0 = $P2($S0)
     $P0()
     end
  .end

  .sub _builtin
      print "builtin\n"
  .end
CODE
dynamic
builtin
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "compile PAST in PIR");

.sub main @MAIN
    .local pmc past_compiler
    past_compiler = compreg "PAST"
    .local string past_source
    past_source = 'Parrot_AST( PCC_Sub( Stmts( Py_Print( Const(7) ) Py_Print_nl() ) ) )'
    .local pmc past_compiled_sub
    past_compiled_sub = past_compiler(past_source)
    print "before\n"
    past_compiled_sub()
    print "after\n"
.end
CODE
before
7
after
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "compile PAST in PASM");
    compreg P1, "PAST"	# get compiler
    set_args "(0)", 'Parrot_AST( PCC_Sub( Stmts( Py_Print( Const(8) ) Py_Print_nl() ) ) )'
    get_results "(0)", P6
    invokecc P1
    print "before\n"
    invokecc P6
    invokecc P6
    invokecc P6
    invokecc P6
    print "after\n"
    end
CODE
before
8
8
8
8
after
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "compile PAST in PASM in PIR");

.sub test @MAIN

    # PIR
    .local pmc pasm_compiler
    pasm_compiler = compreg "PASM"

        # PASM
        .local string pasm_source
        pasm_source = "compreg P1, 'PAST'\n"

            # PAST
            pasm_source .= "set S1, 'Parrot_AST( PCC_Sub( Stmts( Py_Print( Const(8) ) Py_Print_nl() ) ) )'\n"
	    pasm_source .= "set_args \"(0)\", S1\n"
            pasm_source .= "get_results \"(0)\", P6\n"
            pasm_source .= "invokecc P1\n"
        # PASM
        pasm_source .= "print \"PASM: before\\n\"\n"
        pasm_source .= "invokecc P6\n"
        pasm_source .= "invokecc P6\n"
        pasm_source .= "invokecc P6\n"
        pasm_source .= "invokecc P6\n"
        pasm_source .= "print \"PASM: after\\n\"\n"
	pasm_source .= "set_returns \"()\"\n"
        pasm_source .= "returncc\n"

    # PIR
    .local pmc pasm_compiled_sub
    pasm_compiled_sub = pasm_compiler( pasm_source )
    print "PIR: before\n"
    pasm_compiled_sub()
    print "PIR: after\n"
.end
CODE
PIR: before
PASM: before
8
8
8
8
PASM: after
PIR: after
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "PIR compiler sub PASM");
.sub main @MAIN
  register_compiler()

  .local pmc compiler, invokable
  compiler = compreg "PUTS"

  invokable = compiler("ok 1")
  invokable()

.end

.sub register_compiler
  $P0 = find_global "puts"
  compreg "PUTS", $P0
.end

.sub puts
  .param string printme

  .local pmc pasm_compiler, retval
  pasm_compiler = compreg "PASM"

  .local string code

  code = "print \""
  code .= printme
  code .= "\\n\"\n"
  code .= "set_returns \"()\"\n"
  code .= "returncc\n"

  retval = pasm_compiler( code )

  .return (retval)
.end
CODE
ok 1
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "PIR compiler sub PIR");
.sub main @MAIN
  register_compiler()

  .local pmc compiler, invokable
  compiler = compreg "PUTS"

  invokable = compiler( "ok 1" )
  invokable()

.end

.sub register_compiler
 .local pmc counter
 counter = new Integer
 counter = 0
 store_global "counter", counter

  $P0 = find_global "_puts"
  compreg "PUTS", $P0
.end

.sub _puts
  .param string printme

  .local pmc pir_compiler, retval
  pir_compiler = compreg "PIR"

  .local pmc counter
  counter = find_global "counter"
  inc counter

  .local string code
  code = ".sub anonymous"
  $S0 = counter
  code .= $S0
  code .= " @ANON\n"
  code .= "print \""
  code .= printme
  code .= "\\n\"\n"
  code .=".end\n"

  retval = pir_compiler( code )

  .return (retval)
.end
CODE
ok 1
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "eval.get_string");
.sub main @MAIN

  .local pmc f1, f2
  .local pmc io
  f1 = compi("foo_1", "hello from foo_1")
  $S0 = f1
  io = open "temp.pbc", ">"
  print io, $S0
  close io
  load_bytecode "temp.pbc"
  f2 = compi("foo_2", "hello from foo_2")
  io = open "temp.pbc", ">"
  print io, f2
  close io
  load_bytecode "temp.pbc"
.end

.sub compi
  .param string name
  .param string printme
  .local string code
  .local pmc pir_compiler, retval
  pir_compiler = compreg "PIR"
  code = ".sub "
  code .= name
  code .= " @LOAD\n"
  code .= "print \""
  code .= printme
  code .= "\\n\"\n"
  code .= ".end\n"

  retval = pir_compiler(code)
  .return (retval)
.end
CODE
hello from foo_1
hello from foo_2
OUTPUT

END {
	unlink "temp.pnc", "temp.file";
};

pir_output_is(<<'CODE', <<'OUTPUT', "eval.freeze");
.sub main @MAIN
  .local pmc f, e
  .local pmc io
  f = compi("foo_1", "hello from foo_1")
  $S0 = freeze f
  io = open "temp.file", ">"
  print io, $S0
  close io
  print "written\n"
.end

.sub compi
  .param string name
  .param string printme
  .local string code
  .local pmc pir_compiler, retval
  pir_compiler = compreg "PIR"
  code = ".sub "
  code .= name
  code .= "\n"
  code .= "print \""
  code .= printme
  code .= "\\n\"\n"
  code .= ".end\n"

  retval = pir_compiler(code)
  .return (retval)
.end
CODE
written
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "eval.thaw");
.sub main @MAIN
    .local pmc io, e
    .local string file
    .local int size
    file = "temp.file"
    .include "stat.pasm"
    size = stat file, .STAT_FILESIZE
    io = open file, "<"
    $S0 = read io, size
    close io
    e = thaw $S0
    e()
    e = find_global "foo_1"
    e()
.end
CODE
hello from foo_1
hello from foo_1
OUTPUT
