#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/macro.t - IMCC Macros

=head1 SYNOPSIS

	% perl t/op/macro.t

=head1 DESCRIPTION

Tests IMCC C<.macro> syntax.

=cut

use Parrot::Test tests => 18;
use Test::More;

output_is( <<'CODE', <<OUTPUT, "macro, zero parameters" );
.macro answer()
	print	42
	print	"\n"
.endm
	.answer()
	end
CODE
42
OUTPUT

output_is( <<'CODE', <<OUTPUT, "macro, one unused parameter, literal term" );
.macro answer(A)
	print	42
.endm
	.answer(42)
	print	"\n"
	end
CODE
42
OUTPUT

output_is( <<'CODE', <<OUTPUT, "macro, one unused parameter, register term" );
.macro answer(A)
	print	42
.endm
	set	I0, 43
	.answer(I0)
	print	"\n"
	end
CODE
42
OUTPUT

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, literal" );
.macro answer(A)
	print	.A
.endm
	.answer(42)
	print	"\n"
	end
CODE
42
OUTPUT

SKIP: { skip("Await exceptions", 1);

output_is( <<'CODE', <<OUTPUT, "macro, one parameter in call, not in def" );
.macro answer(A)
	print .A
.endm
	.answer(42)
	print "\n"
	end
CODE
42
OUTPUT
}

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, register" );
.macro answer(A)
	print	.A
.endm
	set	I0,42
	.answer(I0)
	print	"\n"
	end
CODE
42
OUTPUT

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, called twice" );
.macro answer(A)
	print	.A
	print	"\n"
	inc	.A
.endm
	set	I0,42
	.answer(I0)
	.answer(I0)
	end
CODE
42
43
OUTPUT

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, label" );
.macro answer(A)
	ne	I0,42,.$done
	print	.A
	print	"\n"
.local $done:
.endm
	set	I0,42
	.answer(I0)
	end
CODE
42
OUTPUT

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter run twice, label" );
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
CODE
42
42
OUTPUT

output_is(<<'CODE', '32', "constant defined and used");
.constant FOO 32
  print .FOO
  end
CODE

output_is(<<'CODE', 'foo', "constant defined and used");
.constant FOO "foo"
  print .FOO
  end
CODE

output_is(<<'CODE', 'foo', "constant defined and used");
.constant FOO S0
  set .FOO,"foo"
  print .FOO
  end
CODE

output_is(<<'CODE', 'foo', "constant defined, used in a macro call");
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

output_is(<<"CODE", <<OUTPUT, "basic include macro");
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
    new P0, .PerlNum
    set P0, .A
    new P1, .PerlNum
    set P1, .B
    new P2, .PerlNum
    mul P2, P1, P0
  .endm
ENDF
close FOO;

output_is(<<"CODE", <<OUTPUT, "include a file defining a macro");
.include "macro.tempfile"
  .multiply(12,13)
  print P2
  print "\\n"
  end
CODE
156
OUTPUT

##############################
output_is(<<'CODE', '1', "find file in runtime includes");
    .include "stdio.pasm"
    print .PIO_STDOUT_FILENO
    end
CODE

open FOO, ">macro.tempfile";   # Clobber previous
close FOO;
unlink("macro.tempfile");

output_is( <<'CODE', <<OUTPUT, "macro, same args" );
.macro Test(X)
    print .X
    print "\n"
.endm

.macro XTest(X)
    .Test(.X)
.endm

    .XTest("hi")
    end
CODE
hi
OUTPUT

output_is( <<'CODE', <<OUTPUT, "local labels" );
.macro Test(X)
    print "Test label arg\n"
    branch .X
.endm

.macro XTest()
    .Test(.$end)
.local $end:
.endm

    .XTest()
    end
CODE
Test label arg
OUTPUT
1;




