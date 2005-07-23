#! perl -w

# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/eval.t - Dynamic Code Evaluation

=head1 SYNOPSIS

	% perl -Ilib t/pmc/eval.t

=head1 DESCRIPTION

Tests on-the-fly PASM, PIR and PAST compilation and invocation.

=cut

use Parrot::Test tests => 12;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "eval_sc");
	compreg P1, "PASM"	# get compiler
	set S5, "in eval\n"
	set I0, 1
	set I2, 1
	compile P0, P1, "print S5\nreturncc\n"
	invokecc			# eval code P0
	print "back again\n"
	end
CODE
in eval
back again
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "call subs in evaled code ");
    set S5, ".pcc_sub _foo:\n"
    concat S5, "print \"foo\\n\"\n"
    concat S5, "returncc\n"
    compreg P1, "PASM"
    compile P20, P1, S5     # keep it anchored
    find_global P0, "_foo"
    invokecc
    print "back\n"
    end
CODE
foo
back
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "call 2 subs in evaled code ");
    set S5, ".pcc_sub _foo:\n"
    concat S5, "print \"foo\\n\"\n"
    concat S5, "returncc\n"
    concat S5, ".pcc_sub _bar:\n"
    concat S5, "print \"bar\\n\"\n"
    concat S5, "returncc\n"
    compreg P1, "PASM"
    compile P0, P1, S5
    set P6, P0		# keep Sub PMC segment alive
    find_global P0, "_foo"
    invokecc
    print "back\n"
    find_global P0, "_bar"
    invokecc
    print "fin\n"
    end
CODE
foo
back
bar
fin
OUTPUT

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
    $P0 = compile pasm_compiler, $S0
    .pcc_begin_return
	.return $P0
    .pcc_end_return
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
     $S0 = ".sub main\nprint \"dynamic\\n\"\nreturncc\n.end"
     $P0 = compile $P2, $S0
     $P1['dynamic'] = $P0

     store_global "funcs", $P1

     $S0 = ".sub main\n$P1 = find_global\"funcs\"\n"
     $S0 .= "$P0 = $P1['dynamic']\n$P0()\n"
     $S0 .= "$P0 = $P1['builtin']\n$P0()\n"
     $S0 .= "returncc\n.end"

     $P2 = compreg "PIR"
     $P0 = compile $P2, $S0
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
    past_compiled_sub = compile past_compiler, past_source
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
    compile P0, P1, 'Parrot_AST( PCC_Sub( Stmts( Py_Print( Const(8) ) Py_Print_nl() ) ) )'
    print "before\n"
    invokecc
    invokecc
    invokecc
    invokecc
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
            pasm_source .= "compile P0, P1, 'Parrot_AST( PCC_Sub( Stmts( Py_Print( Const(8) ) Py_Print_nl() ) ) )'\n"
        # PASM
        pasm_source .= "print \"PASM: before\\n\"\n"
        pasm_source .= "invokecc\n"
        pasm_source .= "invokecc\n"
        pasm_source .= "invokecc\n"
        pasm_source .= "invokecc\n"
        pasm_source .= "print \"PASM: after\\n\"\n"
        pasm_source .= "returncc\n"

    # PIR
    .local pmc pasm_compiled_sub
    pasm_compiled_sub = compile pasm_compiler, pasm_source
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

  invokable = compile compiler, "ok 1"
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
  code .= "null I0\n"
  code .= "null I3\n"
  code .= "returncc\n"

  retval = compile pasm_compiler, code

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

  invokable = compile compiler, "ok 1"
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

  retval = compile pir_compiler, code

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

  retval = compile pir_compiler, code
  .return (retval)
.end
CODE
hello from foo_1
hello from foo_2
OUTPUT

END {
	unlink "temp.pnc";
};
