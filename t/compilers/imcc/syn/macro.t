#!perl
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Config;
use Parrot::Test tests => 42;

# macro tests

pir_output_is( <<'CODE', <<'OUTPUT', 'macro, zero parameters' );
.sub test :main
.macro answer()
    print    42
    print    "\n"
.endm
    .answer()
    end
.end
CODE
42
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'macro, zero parameters, line number' );
.sub test :main
.macro answer()
    null  $P1
    print $P1
.endm
    .answer()
    end
.end
CODE
/(?s:Null PMC access .*current instr.*:(4|-1)\))/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'macro, zero parameters, line number' );
.sub test :main
.macro answer()
.endm
    null $P1
    print $P1
    end
.end
CODE
/(?s:Null PMC access .*current instr.*:(5|-1)\))/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'macro, zero parameters, line number' );
.sub test :main
.macro answer()
    null $P1
.endm
    .answer()
    print $P1
    end
.end
CODE
/(?s:Null PMC access .*current instr.*:(6|-1)\))/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'macro, one unused parameter, literal term' );
.sub test :main
.macro answer(A)
    print    42
.endm
    .answer(42)
    print    "\n"
    end
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'macro, one unused parameter, register term' );
.sub test :main
.macro answer(A)
    print    42
.endm
    set    $I0, 43
    .answer($I0)
    print    "\n"
    end
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'macro, one used parameter, literal' );
.sub test :main
.macro answer(A)
    print    .A
.endm
    .answer(42)
    print    "\n"
    end
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'macro, one used parameter, register' );
.sub test :main
.macro answer(A)
    print    .A
.endm
    set    $I0,42
    .answer($I0)
    print    "\n"
    end
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'macro, one used parameter, called twice' );
.sub test :main
.macro answer(A)
    print    .A
    print    "\n"
    inc    .A
.endm
    set    $I0,42
    .answer($I0)
    .answer($I0)
    end
.end
CODE
42
43
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'macro, one used parameter, label' );
.sub test :main
.macro answer(A)
    ne    $I0,42,.$done
    print    .A
    print    "\n"
.label $done:
.endm
    set    $I0,42
    .answer($I0)
    end
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'macro, one used parameter run thrice, label' );
.sub test :main
.macro answer(A)
    ne    $I0,42,.$done
    print    .A
    print    "\n"
.label $done:
.endm
    set    $I0,42
    .answer($I0)
    .answer($I0)
    inc $I0
    .answer($I0)
.end
CODE
42
42
OUTPUT

pir_output_is( <<'CODE', '32', 'constant defined and used' );
.sub test :main
.const int FOO = 32
  print FOO
  end
.end
CODE

pir_output_is( <<'CODE', 'foo', 'constant defined and used' );
.sub test :main
.const string FOO = "foo"
  print FOO
  end
.end
CODE

pasm_output_is( <<'CODE', 'foo', 'constant defined, used in a macro call' );
.macro_const FOO S0
.macro answer (bar)
  print .bar
.endm
  set .FOO,"foo"
  .answer(.FOO)
  end
CODE


pir_output_is( <<'CODE', '42', 'macro_const int in PIR' );
.macro_const theanswer 42
.sub main :main
    print .theanswer
.end
CODE

pir_output_is( <<'CODE', 'Hello', 'macro_const string in PIR' );
.macro_const sayhello "Hello"
.sub main :main
    print .sayhello
.end
CODE

pir_output_is( <<'CODE', 'Hello', 'macro_const register in PIR' );
.macro_const firstreg $S0
.sub main :main
    .firstreg = "Hello"
    print .firstreg
.end
CODE

pir_output_like( <<'CODE', '/3\.14/', 'macro_const num in PIR' );
.macro_const pi 3.14
.sub main :main
    print .pi
    print "\n"
.end
CODE

open my $FOO, '>', "macro.tempfile_$$";
print $FOO <<'ENDF';
  set S0, "Betelgeuse\n"
ENDF
close $FOO;

pasm_output_is( <<"CODE", <<'OUTPUT', 'basic include macro' );
.include "macro.tempfile_$$"
  print S0

  set S0, "Rigel"
.include "macro.tempfile_$$"
  print S0
  end
CODE
Betelgeuse
Betelgeuse
OUTPUT

open $FOO, '>', "macro.tempfile_$$";    # Clobber previous
print $FOO <<'ENDF';
.macro multiply(A,B)
    new P0, 'Float'
    set P0, .A
    new P1, 'Float'
    set P1, .B
    new P2, 'Float'
    mul P2, P1, P0
.endm
ENDF
close $FOO;

pasm_output_is( <<"CODE", <<'OUTPUT', 'include a file defining a macro' );
.include "macro.tempfile_$$"
 .multiply(12,13)
 print P2
 print "\\n"
 end
CODE
156
OUTPUT

unlink("macro.tempfile_$$");

pir_output_is( <<'CODE', <<'OUTPUT', '.newid' );
.sub test :main
.macro newid(ID, CLASS)
    .local pmc .ID
    .ID = new .CLASS
.endm
    .newid(var, 'Undef')
    var = 10
    print var
    print "\n"
    end
.end
CODE
10
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', '.newlex' );
.sub test :main
.macro newlex(ID, CLASS)
    .local pmc .ID
    .ID = new .CLASS
    # store_lex -1, .ID , .ID    # how to stringify .ID
.endm
    .newlex(var, 'Undef')
    var = 10
    print var
    print "\n"
    end
.end
CODE
10
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'too few params' );
.sub test :main
.macro M(A, B)
    print .A
    print .B
.endm
    .M("never")
    end
.end
CODE
/Macro 'M' requires 2 arguments, but 1 given/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'too many params' );
.sub test :main
.macro M(A, B)
    print .A
    print .B
.endm
    .M("never", "x", "y")
    end
.end
CODE
/Macro 'M' requires 2 arguments, but 3 given/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'ok param count' );
.sub test :main
.macro M(A, B)
    print .A
    print .B
.endm
    .M("fine", "\n")
    end
.end
CODE
fine
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'macro name is no ident' );
.sub test :main
.macro 42(A, B)
    print .A
    print .B
.endm
    .M("never", "x", "y")
    end
.end
CODE
/Macro names must be identifiers/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'unterminated macro' );
.sub test :main
.macro M(


CODE
/End of file reached/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'unterminated macro 2', );
.sub test :main
.macro M(A, B)
  print .A
.endm
  .M(A, B
.end
CODE
/End of file reached/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'ill param def' );
.sub test :main
.macro M(A, B
  print .A
.endm
  .M(A, B)
.end
CODE
/Parameter definition in 'M' must be IDENT/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'no params' );
.sub test :main
.macro M(A, B)
    print .A
    print .B
.endm
    .M
    end
.end
CODE
/Macro 'M' needs 2 arguments/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'unknown macro' );
.sub test :main
.macro M(A, B)
    print .A
    print .B
.endm
    .N(1,2)
    end
.end
CODE
/(unknown macro|unexpected DOT)/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'unexpected IDENTIFIER' );
.sub test :main
.macro M()
    this gives a parse error
.endm
    .M()
    end
.end
CODE
/error, unexpected IDENTIFIER/
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'unknown macro' );
.sub test :main
.macro M(A)
    .set_arg .A
.endm
    .M(a)
    end
.end
CODE
/in macro '.M'/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'braces in param' );
.macro M(A)
    print .A
.endm
.sub test :main
    $S0 = "foo\n"
    .M({$S0})
    end
.end
CODE
foo
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'braces and comma, with a newline in param' );
.macro M(A)
    .A
.endm
.sub test :main
    $S0 = "foo\n"
    .M({set $S0, "bar\n"
    print $S0})
    end
.end
CODE
bar
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'braces and parenthesis in param' );
.macro M(A)
    .A
.endm
.sub test :main
    .M({foo()})
    end
.end

.sub foo
    print "foo\n"
.end
CODE
foo
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'test that macros labels names can have the prefix $' );
.sub test :main
.macro test_label_names()
    branch .$jump
    print 'do not print this'
  .label $jump:
    print 'print this'
    print "\n"
.endm
    .test_label_names()
.end
CODE
print this
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'test that macros labels names can have the prefix $' );
.sub test :main
.macro SpinForever (Count)
    .label $LOOP: dec .COUNT # ".label $LOOP" defines a local label.
    branch .$LOOP # Jump to said label.
.endm
.end
CODE
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'invalid label syntax' );
.sub test :main
    .macro m()
        .local $iter_loop:
        print "ok\n"
    .endm

    .m()
.end
CODE
/syntax error(, unexpected LABEL)?/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'call a sub in a macro' );
.macro call_sub(L)
   print "entering macro call_sub\n"
   .L()
   print "leaving macro call_sub\n"
.endm

.sub main :main
  print_abc()
  .call_sub(print_abc)
.end

.sub print_abc
   print "abc\n"
.end
CODE
abc
entering macro call_sub
abc
leaving macro call_sub
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'set a sub as an attribute, in a macro' );

.macro create_inst(inst_name,M)
    print "entering macro create_inst\n"
    .inst_name = new 'MyClass'
    .const 'Sub' c3 = .M
    setattribute .inst_name, 'MyFuncInMyClass', c3
    print "leaving macro create_inst\n"
.endm

.sub main :main
    say_twice( 'say_twice' )

    .local pmc my_class
    my_class = newclass 'MyClass'
    addattribute my_class, 'MyFuncInMyClass'

    .local pmc my_inst_1, my_func_1
    .create_inst(my_inst_1, "say_twice")
    my_func_1 = getattribute my_inst_1, 'MyFuncInMyClass'
    my_func_1('my_func_1')

    .local pmc my_inst_2, my_func_2
    .create_inst(my_inst_2, "say_twice")
    my_func_2 = getattribute my_inst_2, 'MyFuncInMyClass'
    my_func_2('my_func_2')
.end

.sub say_twice
   .param string msg

   print msg
   print ' '
   print msg
   print "\n"
.end
CODE
say_twice say_twice
entering macro create_inst
leaving macro create_inst
my_func_1 my_func_1
entering macro create_inst
leaving macro create_inst
my_func_2 my_func_2
OUTPUT

pir_error_output_like( <<'CODE', <<'OUTPUT', 'macro label outside of macro declaration (TT #902)' );
.macro While(conditional, code)

.label $beginwhile:
    unless .conditional goto .$endwhile
    .code
  goto .$beginwhile
.label $endwhile:
.endm

.sub main
.While($I0 < 3, {
say $I0
goto .$endwhile
inc $I0
})
.end
CODE
/Invalid LABEL outside of macro/
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
