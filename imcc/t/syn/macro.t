#!perl
use strict;
use TestCompiler tests => 12;

# macro tests

##############################

output_is( <<'CODE', <<OUTPUT, "macro, zero parameters" );
.sub _main
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

output_is( <<'CODE', <<OUTPUT, "macro, one unused parameter, literal term" );
.sub _main
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

output_is( <<'CODE', <<OUTPUT, "macro, one unused parameter, register term" );
.sub _main
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

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, literal" );
.sub _main
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

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, register" );
.sub _main
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

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, called twice" );
.sub _main
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

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, label" );
.sub _main
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

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter run twice, label" );
.sub _main
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

output_is(<<'CODE', '32', "constant defined and used");
.sub _main
.const int FOO = 32
  print FOO
  end
.end
CODE

output_is(<<'CODE', 'foo', "constant defined and used");
.sub _main
.const string FOO = "foo"
  print FOO
  end
.end
CODE

output_is( <<'CODE', <<OUTPUT, ".newid" );
.sub _main
.macro newid(ID, CLASS)
    .sym .CLASS .ID
    .ID = new .CLASS
.endm
    .newid(var, PerlUndef)
    var = 10
    print var
    print "\n"
    end
.end
CODE
10
OUTPUT

output_is( <<'CODE', <<OUTPUT, ".newlex" );
.sub _main
.macro newlex(ID, CLASS)
    .sym .CLASS .ID
    .ID = new .CLASS
    # store_lex -1, .ID , .ID	# how to stringify .ID
.endm
    .newlex(var, PerlUndef)
    var = 10
    print var
    print "\n"
    end
.end
CODE
10
OUTPUT
