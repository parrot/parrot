#! perl -w

use Parrot::Test tests => 9;

output_is( <<'CODE', <<OUTPUT, "macro, zero parameters" );
answer	macro
	print	42
	print	"\n"
endm
	answer
	end
CODE
42
OUTPUT

output_is( <<'CODE', <<OUTPUT, "macro, one unused parameter, literal term" );
answer	macro	A
	print	42
endm
	answer	42
	print	"\n"
end
CODE
42
OUTPUT

output_is( <<'CODE', <<OUTPUT, "macro, one unused parameter, register term" );
answer	macro	A
	print	42
endm
	set	I0, 43
	answer	I0
	print	"\n"
end
CODE
42
OUTPUT

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, literal" );
answer	macro	A
	print	A
endm
	answer	42
	print	"\n"
end
CODE
42
OUTPUT

SKIP: { skip("Await exceptions", 1);

output_is( <<'CODE', <<OUTPUT, "macro, one parameter in call, not in def" );
answer	macro
	print A
endm
	answer 42
	print "\n"
end
CODE
42
OUTPUT
}

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, register" );
answer	macro	A
	print	A
endm
	set	I0,42
	answer	I0
	print	"\n"
end
CODE
42
OUTPUT

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, called twice" );
answer	macro	A
	print	A
	print	"\n"
	inc	A
endm
	set	I0,42
	answer	I0
	answer	I0
end
CODE
42
43
OUTPUT

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter, label" );
answer	macro	A
	ne	I0,42,$done
	print	A
	print	"\n"
$done:
endm
	set	I0,42
	answer	I0
end
CODE
42
OUTPUT

output_is( <<'CODE', <<OUTPUT, "macro, one used parameter run twice, label" );
answer	macro	A
	ne	I0,42,$done
	print	A
	print	"\n"
$done:
endm
	set	I0,42
	answer	I0
	answer	I0
end
CODE
42
42
OUTPUT
