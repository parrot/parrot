#! perl -w

use Parrot::Test tests => 17;
use Test::More; # Included for skip().

my $fp_equality_macro = <<'ENDOFMACRO';
.macro fp_eq ( J, K, L )
	save	N0
	save	N1
	save	N2

	set	N0, .J
	set	N1, .K
	sub	N2, N1,N0
	abs	N2, N2
	gt	N2, 0.000001, .$FPEQNOK

	restore N2
	restore	N1
	restore	N0
	branch	.L
.local $FPEQNOK:
	restore N2
	restore	N1
	restore	N0
.endm
.macro fp_ne ( J, K, L )
	save	N0
	save	N1
	save	N2

	set	N0, .J
	set	N1, .K
	sub	N2, N1,N0
	abs	N2, N2
	lt	N2, 0.000001, .$FPNENOK

	restore	N2
	restore	N1
	restore	N0
	branch	.L
.local $FPNENOK:
	restore	N2
	restore	N1
	restore	N0
.endm
ENDOFMACRO

output_is(<<CODE, <<OUTPUT, "Set/get strings");
        new P0, .PerlString
        set P0, "foo"
        set S0, P0
        eq S0, "foo", OK1
        print "not "
OK1:    print "ok 1\\n"

        set P0, "\0"
        set S0, P0
        eq S0, "\0", OK2
        print "not "
OK2:    print "ok 2\\n"

        set P0, ""
        set S0, P0
        eq S0, "", OK3
        print "not "
OK3:    print "ok 3\\n"

        set P0, 123
        set S0, P0
        eq S0, "123", OK4
        print "not "
OK4:    print "ok 4\\n"

        set P0, 1.234567
        set S0, P0
        eq S0, "1.234567", OK5
        print "not "
OK5:    print "ok 5\\n"

        set P0, "0xFFFFFF"
        set S0, P0
        eq S0, "0xFFFFFF", OK6
        print "not "
OK6:    print "ok 6\\n"

        end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<CODE, <<OUTPUT, "Setting integers");
        new P0, .PerlString
        set P0, "1"
        set I0, P0
        print I0
        print "\\n"

        new P0, .PerlString
        set P0, "2.0"
        set I0, P0
        print I0
        print "\\n"

        new P0, .PerlString
        set P0, ""
        set I0, P0
        print I0
        print "\\n"

        new P0, .PerlString
        set P0, "\0"
        set I0, P0
        print I0
        print "\\n"

        new P0, .PerlString
        set P0, "foo"
        set I0, P0
        print I0
        print "\\n"

        end
CODE
1
2
0
0
0
OUTPUT

output_is(<<"CODE", <<OUTPUT, "Setting numbers");
@{[ $fp_equality_macro ]}
        new P0, .PerlString
        set P0, "1"
        set N0, P0
        .fp_eq(N0, 1.0, OK1)
        print "not "
OK1:    print "ok 1\\n"

        new P0, .PerlString
        set P0, "2.0"
        set N0, P0
        .fp_eq(N0, 2.0, OK2)
        print "not "
OK2:    print "ok 2\\n"

        new P0, .PerlString
        set P0, ""
        set N0, P0
        .fp_eq(N0, 0.0, OK3)
        print "not "
OK3:    print "ok 3\\n"

        new P0, .PerlString
        set P0, "\0"
        set N0, P0
        .fp_eq(N0, 0.0, OK4)
        print "not "
OK4:    print "ok 4\\n"

        new P0, .PerlString
        set P0, "foo"
        set N0, P0
        .fp_eq(N0, 0.0, OK5)
        print "not "
OK5:    print "ok 5\\n"

        new P0, .PerlString
        set P0, "1.3e5"
        set N0, P0
        .fp_eq(N0, 130000.0, OK6)
        print "not "
OK6:    print "ok 6\\n"

        end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<CODE, <<OUTPUT, "ensure that concat ppp copies strings");
	new P0, .PerlString
	new P1, .PerlString
	new P2, .PerlString
	set P0, "foo"
	concat	P1, P0, P0

	print	P0
	print "\\n"

	print	P1
	print "\\n"

	set P1, "You can't teach an old dog new..."
	set P2, "clear physics"
	concat P0, P1, P2

	print P1
	print "\\n"
	print P2
	print "\\n"
	print P0
	print "\\n"
	end
CODE
foo
foofoo
You can't teach an old dog new...
clear physics
You can't teach an old dog new...clear physics
OUTPUT

output_is(<<CODE, <<OUTPUT, "ensure that concat pps copies strings");
	new P0, .PerlString
	new P1, .PerlString

	set S0, "Grunties"
	set P1, "fnargh"
	concat P0, P1, S0

	print S0
	print "\\n"
	print P1
	print "\\n"
	print P0
	print "\\n"

	end
CODE
Grunties
fnargh
fnarghGrunties
OUTPUT

output_is(<<CODE, <<OUTPUT, "Setting string copies");
	new P0, .PerlString
	set S0, "C2H5OH + 10H20"
	set P0, S0
	chopn S0, 8

	print S0
	print "\\n"
	print P0
	print "\\n"
	end
CODE
C2H5OH
C2H5OH + 10H20
OUTPUT

output_is(<<'CODE', <<OUTPUT, "repeat");
	new P0, .PerlString
	set P0, "x"
	new P1, .PerlInt
	set P1, 12
	new P2, .PerlString
	repeat P2, P0, P1
        print P2
        print "\n"

        set P0, "y"
        new P1, .PerlNum
        set P1, 6.5
        repeat P2, P0, P1
        print P2
        print "\n"

        set P0, "z"
        new P1, .PerlString
        set P1, "3"
        repeat P2, P0, P1
        print P2
        print "\n"

        set P0, "a"
        new P1, .PerlUndef
        repeat P2, P0, P1
        print P2
        print "\n"

	end
CODE
xxxxxxxxxxxx
yyyyyy
zzz

OUTPUT

output_is(<<'CODE', <<OUTPUT, "repeat_int");
	new P0, .PerlString
	set P0, "x"
	set I1, 12
	new P2, .PerlString
	repeat P2, P0, I1
        print P2
        print "\n"

        set P0, "za"
        set I1, 3
        repeat P2, P0, I1
        print P2
        print "\n"
	end
CODE
xxxxxxxxxxxx
zazaza
OUTPUT


output_is(<<CODE, <<OUTPUT, "if(PerlString)");
        new P0, .PerlString
	set S0, "True"
	set P0, S0
        if P0, TRUE
        print "false"
        branch NEXT
TRUE:   print "true"
NEXT:   print "\\n"

        new P1, .PerlString
        set S1, ""
        set P1, S1
        if P1, TRUE2
        print "false"
        branch NEXT2
TRUE2:  print "true"
NEXT2:  print "\\n"

        new P2, .PerlString
        set S2, "0"
        set P2, S2
        if P2, TRUE3
        print "false"
        branch NEXT3
TRUE3:  print "true"
NEXT3:  print "\\n"

        new P3, .PerlString
        set S3, "0123"
        set P3, S3
        if P3, TRUE4
        print "false"
        branch NEXT4
TRUE4:  print "true"
NEXT4:  print "\\n"

        new P4, .PerlString
        if P4, TRUE5
        print "false"
        branch NEXT5
TRUE5:  print "true"
NEXT5:  print "\\n"
        end
CODE
true
false
false
true
false
OUTPUT

# XXX these tests better should get generated
#     with all combinations of params and ops
output_is(<<'CODE', <<OUTPUT, "add str_int, str_int");
	new P0, .PerlString
	set P0, "23"
	new P1, .PerlString
	set P1, "2"
	new P2, .PerlUndef
	add P2, P0, P1
	print P2
	print "\n"
	end
CODE
25
OUTPUT

output_is(<<"CODE", <<OUTPUT, "add str_int, str_num");
@{[ $fp_equality_macro ]}
	new P0, .PerlString
	set P0, "23"
	new P1, .PerlString
	set P1, "2.5"
	new P2, .PerlUndef
	add P2, P0, P1
        .fp_eq(P2, 25.5, EQ1)
        print "not "
EQ1:    print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "add str_int, int");
	new P0, .PerlString
	set P0, "23"
	new P1, .PerlInt
	set P1, 2
	new P2, .PerlUndef
	add P2, P0, P1
	print P2
	print "\n"
	end
CODE
25
OUTPUT

output_is(<<"CODE", <<OUTPUT, "add str_int, num");
@{[ $fp_equality_macro ]}
	new P0, .PerlString
	set P0, "23"
	new P1, .PerlNum
	set P1, 2.5
	new P2, .PerlUndef
	add P2, P0, P1
        .fp_eq(P2, 25.5, EQ1)
        print "not "
EQ1:    print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<"CODE", <<OUTPUT, "add str_num, int");
@{[ $fp_equality_macro ]}
	new P0, .PerlString
	set P0, "23.5"
	new P1, .PerlInt
	set P1, 2
	new P2, .PerlUndef
	add P2, P0, P1
        .fp_eq(P2, 25.5, EQ1)
        print "not "
EQ1:    print "ok 1\\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "concat must morph dest to a string");
	new P0, .PerlString
	new P1, .PerlUndef
	set P0, "foo"
	concat	P1, P0, P0

	print	P0
	print "\n"
	print	P1
	print "\n"
	end
CODE
foo
foofoo
OUTPUT

output_is(<<'CODE', <<OUTPUT, "cmp");
	new P1, .PerlString
	new P2, .PerlString

        set P1, "abc"
        set P2, "abc"
        cmp I0, P1, P2
        print I0
        print "\n"

        set P1, "abcde"
        set P2, "abc"
        cmp I0, P1, P2
        print I0
        print "\n"
 
        set P1, "abc"
        set P2, "abcde"
        cmp I0, P1, P2
        print I0
        print "\n"

        end
CODE
0
1
-1
OUTPUT

output_is(<<'CODE', <<OUTPUT, "cmp with PerlInt");
	new P1, .PerlInt
	new P2, .PerlString
        set P2, "10"

# Int. vs Str.
        set P1, 10
        cmp I0, P1, P2
        print I0
        print "\n"

        set P1, 20
        cmp I0, P1, P2
        print I0
        print "\n"
 
        set P1, 0
        cmp I0, P1, P2
        print I0
        print "\n"

# Str. vs Int. 
        set P1, 0
        cmp I0, P2, P1
        print I0
        print "\n"

        set P1, 20
        cmp I0, P2, P1
        print I0
        print "\n"

        set P1, 10
        cmp I0, P2, P1
        print I0
        print "\n"

        end
CODE
0
1
-1
1
-1
0
OUTPUT

1;
