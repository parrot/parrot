#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$


use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 29;

# macro tests

pir_output_is( <<'CODE', <<OUTPUT, "macro, zero parameters" );
.sub test :main
.macro answer()
	print	42
	print	"\n"
.endm
	.answer()
	end
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "macro, one unused parameter, literal term" );
.sub test :main
.macro answer(A)
	print	42
.endm
	.answer(42)
	print	"\n"
	end
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "macro, one unused parameter, register term" );
.sub test :main
.macro answer(A)
	print	42
.endm
	set	I0, 43
	.answer(I0)
	print	"\n"
	end
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, literal" );
.sub test :main
.macro answer(A)
	print	.A
.endm
	.answer(42)
	print	"\n"
	end
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, register" );
.sub test :main
.macro answer(A)
	print	.A
.endm
	set	I0,42
	.answer(I0)
	print	"\n"
	end
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, called twice" );
.sub test :main
.macro answer(A)
	print	.A
	print	"\n"
	inc	.A
.endm
	set	I0,42
	.answer(I0)
	.answer(I0)
	end
.end
CODE
42
43
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, label" );
.sub test :main
.macro answer(A)
	ne	I0,42,.$done
	print	.A
	print	"\n"
.local $done:
.endm
	set	I0,42
	.answer(I0)
	end
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "macro, one used parameter run twice, label" );
.sub test :main
.macro answer(A)
	ne	I0,42,.$done
	print	.A
	print	"\n"
.local $done:
.endm
	set	I0,42
	.answer(I0)
	.answer(I0)
	end
.end
CODE
42
42
OUTPUT

pir_output_is(<<'CODE', '32', "constant defined and used");
.sub test :main
.const int FOO = 32
  print FOO
  end
.end
CODE

pir_output_is(<<'CODE', 'foo', "constant defined and used");
.sub test :main
.const string FOO = "foo"
  print FOO
  end
.end
CODE

pasm_output_is(<<'CODE', 'foo', "constant defined, used in a macro call");
.constant FOO S0
.macro answer (bar)
  print .bar
.endm
  set .FOO,"foo"
  .answer(.FOO)
  end
CODE

open FOO, ">macro.tempfile";
print FOO <<'ENDF';
  set S0, "Betelgeuse\n"
ENDF
close FOO;

pasm_output_is(<<"CODE", <<OUTPUT, "basic include macro");
.include "macro.tempfile"
  print S0

  set S0, "Rigel"
.include "macro.tempfile"
  print S0
  end
CODE
Betelgeuse
Betelgeuse
OUTPUT

open FOO, ">macro.tempfile";   # Clobber previous
print FOO <<'ENDF';
.macro multiply(A,B)
	new P0, .Float
	set P0, .A
	new P1, .Float
	set P1, .B
	new P2, .Float
	mul P2, P1, P0
.endm
ENDF
close FOO;

pasm_output_is(<<"CODE", <<OUTPUT, "include a file defining a macro");
.include "macro.tempfile"
 .multiply(12,13)
 print P2
 print "\\n"
 end
CODE
156
OUTPUT

unlink("macro.tempfile");

pir_output_is( <<'CODE', <<OUTPUT, ".newid" );
.sub test :main
.macro newid(ID, CLASS)
    .sym .CLASS .ID
    .ID = new .CLASS
.endm
    .newid(var, Undef)
    var = 10
    print var
    print "\n"
    end
.end
CODE
10
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, ".newlex" );
.sub test :main
.macro newlex(ID, CLASS)
    .sym .CLASS .ID
    .ID = new .CLASS
    # store_lex -1, .ID , .ID	# how to stringify .ID
.endm
    .newlex(var, Undef)
    var = 10
    print var
    print "\n"
    end
.end
CODE
10
OUTPUT

pir_output_like( <<'CODE', <<OUTPUT, "too few params" );
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

pir_output_like( <<'CODE', <<OUTPUT, "too many params" );
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

pir_output_is( <<'CODE', <<OUTPUT, "ok param count" );
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

pir_output_like( <<'CODE', <<OUTPUT, "macro name is no ident" );
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

pir_output_like( <<'CODE', <<OUTPUT, "unterminated macro" );
.sub test :main
.macro M(


CODE
/End of file reached/
OUTPUT

pir_output_like( <<'CODE', <<OUTPUT, "unterminated macro 2" );
.sub test :main
.macro M(A, B)
  print .A
.endm
  .M(A, B
.end
CODE
/End of file reached/
OUTPUT

pir_output_like( <<'CODE', <<OUTPUT, "ill param def" );
.sub test :main
.macro M(A, B
  print .A
.endm
  .M(A, B)
.end
CODE
/Parameter definition in 'M' must be IDENT/
OUTPUT

pir_output_like( <<'CODE', <<OUTPUT, "no params" );
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


pir_output_like( <<'CODE', <<OUTPUT, "unknown macro" );
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

pir_output_like( <<'CODE', <<OUTPUT, "unexpected IDENTIFIER" );
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

pir_output_like( <<'CODE', <<OUTPUT, "unknown macro" );
.sub test :main
.macro M(A)
    .arg .A
.endm
    .M(a)
    end
.end
CODE
/in macro '.M'/
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "braces in param" );
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

pir_output_is( <<'CODE', <<OUTPUT, "braces and comma, with a newline in param" );
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

pir_output_is( <<'CODE', <<OUTPUT, "braces and parenthesis in param" );
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

