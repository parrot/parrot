#! perl -w

use Parrot::Test tests => 124;
use Test::More;

output_is( <<'CODE', <<OUTPUT, "set_s_s|sc" );
	set	S4, "JAPH\n"
	set     S5, S4
	print	S4
	print   S5
	end
CODE
JAPH
JAPH
OUTPUT

output_is( <<'CODE', <<OUTPUT, "clone" );
        set     S0, "Foo\n"
	clone   S1, S0
        print   S0
	print   S1

	clone   S1, "Bar\n"
	print   S1
        chopn   S1, 1   # Check that the contents of S1 are no longer constant
	print   S1
        print   "\n"

	end
CODE
Foo
Foo
Bar
Bar
OUTPUT

output_is( <<'CODE', '4', "length_i_s" );
	set	I4, 0
	set	S4, "JAPH"
	length	I4, S4
	print	I4
	end
CODE

output_is( <<'CODE', '0', "0 length substr" );
	set	I4, 0
	set	S4, "JAPH"
        substr  S3, S4, 1, 0
	length  I4, S3
        print   I4
	end
CODE

output_is( <<'CODE', <<OUTPUT, "chopn with clone" );
	set	S4, "JAPHxyzw"
	set	S5, "japhXYZW"
        clone   S3, S4
	set	S1, "\n"
	set	I1, 4
	chopn	S4, 3
	chopn	S4, 1
        chopn   S5, I1
	print	S4
        print   S1
	print	S5
        print   S1
	print	S3
        print   S1
	end
CODE
JAPH
japh
JAPHxyzw
OUTPUT

output_is( <<'CODE', <<OUTPUT, "chopn with set" );
	set	S4, "JAPHxyzw"
	set	S5, "japhXYZW"
        set     S3, S4
	set	S1, "\n"
	set	I1, 4
	chopn	S4, 3
	chopn	S4, 1
        chopn   S5, I1
	print	S4
        print   S1
	print	S5
        print   S1
	print	S3
        print   S1
	end
CODE
JAPH
japh
JAPH
OUTPUT

output_is(<<'CODE', <<OUTPUT, "chopn, OOB values");
	set	S1, "A string of length 21"
	chopn	S1, 0
	print	S1
	print	"\n"
	chopn	S1, 4
	print	S1
	print	"\n"
	# -length cuts now
	chopn	S1, -4
	print	S1
	print	"\n"
	chopn	S1, 1000
	print	S1
	print	"** nothing **\n"
	end
CODE
A string of length 21
A string of lengt
A st
** nothing **
OUTPUT

output_is(<<'CODE', <<OUTPUT, "Three argument chopn");
	set	S1, "Parrot"

	chopn	S2, S1, 0
	print	S1
	print	"\n"
	print	S2
	print	"\n"

	chopn	S2, S1, 1
	print	S1
	print	"\n"
	print	S2
	print	"\n"

        set     I0, 2
	chopn	S2, S1, I0
	print	S1
	print	"\n"
	print	S2
	print	"\n"

	chopn	S2, "Parrot", 3
	print	S2
	print	"\n"

	chopn	S1, S1, 5
	print	S1
	print	"\n"

        set     S1, "Parrot"
        set     S3, S1
        chopn   S2, S1, 3
        print   S3
	print	"\n"

        set     S3, S1
        chopn   S1, 3
        print   S3
	print	"\n"

	end
CODE
Parrot
Parrot
Parrot
Parro
Parrot
Parr
Par
P
Parrot
Par
OUTPUT

output_is(<<'CODE', <<OUTPUT, "Three argument chopn, OOB values");
	set	S1, "Parrot"

	chopn	S2, S1, 7
	print	S1
	print	"\n"
	print	S2
	print	"\n"

	chopn	S2, S1, -1
	print	S1
	print	"\n"
	print	S2
	print	"\n"

	end
CODE
Parrot

Parrot
P
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "substr_s_s|sc_i|ic_i|ic" );
	set	S4, "12345JAPH01"
	set	I4, 5
	set	I5, 4
	substr	S5, S4, I4, I5
	print	S5
	substr S5, S4, I4, 4
	print  S5
	substr S5, S4, 5, I5
	print  S5
	substr S5, S4, 5, 4
	print  S5
	substr S5, "12345JAPH01", I4, I5
	print  S5
	substr S5, "12345JAPH01", I4, 4
	print  S5
	substr S5, "12345JAPH01", 5, I5
	print  S5
	substr S5, "12345JAPH01", 5, 4
	print  S5
	print  "\n"
	end
CODE
JAPHJAPHJAPHJAPHJAPHJAPHJAPHJAPH
OUTPUT

# negative offsets
output_is(<<'CODE', <<'OUTPUT', "neg substr offset");
	set	S0, "A string of length 21"
	set I0, -9
	set I1, 6
	substr S1, S0, I0, I1
	print S0
	print "\n"
	print S1
	print "\n"
	end
CODE
A string of length 21
length
OUTPUT

# This asks for substring it shouldn't be allowed...
output_is(<<'CODE', 'Cannot take substr outside string', "substr OOB");
	set	S0, "A string of length 21"
	set I0, -99
	set I1, 6
	substr S1, S0, I0, I1
	end
CODE

# This asks for substring it shouldn't be allowed...
output_is(<<'CODE', 'Cannot take substr outside string', "substr OOB");
	set S0, "A string of length 21"
	set I0, 99
	set I1, 6
	substr S1, S0, I0, I1
	end
CODE

# This asks for substring much greater than length of original string
output_is(<<'CODE', <<'OUTPUT', "len>strlen");
	set	S0, "A string of length 21"
	set I0, 12
	set I1, 1000
	substr S1, S0, I0, I1
	print  S0
	print "\n"
	print S1
	print "\n"
	end
CODE
A string of length 21
length 21
OUTPUT

# The same, with a negative offset
output_is(<<'CODE', <<'OUTPUT', "len>strlen, -ve os");
	set	S0, "A string of length 21"
	set I0, -9
	set I1, 1000
	substr S1, S0, I0, I1
	print S0
	print "\n"
	print S1
	print "\n"
	end
CODE
A string of length 21
length 21
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "5 arg substr, replacement = length" );
  set S0, "abcdefghijk"
  set S1, "xyz"
  substr S2, S0, 4, 3, S1
  print S0
  print "\n"
  print S1
  print "\n"
  print S2
  print "\n"
  end
CODE
abcdxyzhijk
xyz
efg
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "5 arg substr, replacement > length" );
  set S0, "abcdefghijk"
  set S1, "xyz0123"
  substr S2, S0, 4, 3, S1
  print S0
  print "\n"
  print S1
  print "\n"
  print S2
  print "\n"
  end
CODE
abcdxyz0123hijk
xyz0123
efg
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "5 arg substr, replacement < length" );
  set S0, "abcdefghijk"
  set S1, "x"
  substr S2, S0, 4, 3, S1
  print S0
  print "\n"
  print S1
  print "\n"
  print S2
  print "\n"
  end
CODE
abcdxhijk
x
efg
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "5 arg substr, offset at end of string" );
  set S0, "abcdefghijk"
  set S1, "xyz"
  substr S2, S0, 11, 3, S1
  print S0
  print "\n"
  print S1
  print "\n"
  print S2
  print "\n"
  end
CODE
abcdefghijkxyz
xyz

OUTPUT

output_is( <<'CODE', 'Can only replace inside string or index after end of string', "5 arg substr, offset past end of string" );
  set S0, "abcdefghijk"
  set S1, "xyz"
  substr S2, S0, 12, 3, S1
  print S0
  print "\n"
  print S1
  print "\n"
  print S2
  print "\n"
  end
CODE

output_is( <<'CODE', <<'OUTPUT', "5 arg substr, -ve offset, repl=length" );
  set S0, "abcdefghijk"
  set S1, "xyz"
  substr S2, S0, -3, 3, S1
  print S0
  print "\n"
  print S1
  print "\n"
  print S2
  print "\n"
  end
CODE
abcdefghxyz
xyz
ijk
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "5 arg substr, -ve offset, repl>length" );
  set S0, "abcdefghijk"
  set S1, "xyz"
  substr S2, S0, -6, 2, S1
  print S0
  print "\n"
  print S1
  print "\n"
  print S2
  print "\n"
  end
CODE
abcdexyzhijk
xyz
fg
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "5 arg substr, -ve offset, repl<length" );
  set S0, "abcdefghijk"
  set S1, "xyz"
  substr S2, S0, -6, 4, S1
  print S0
  print "\n"
  print S1
  print "\n"
  print S2
  print "\n"
  end
CODE
abcdexyzjk
xyz
fghi
OUTPUT

output_is( <<'CODE', 'Can only replace inside string or index after end of string', "5 arg substr, -ve offset out of string" );
  set S0, "abcdefghijk"
  set S1, "xyz"
  substr S2, S0, -12, 4, S1
  print S0
  print "\n"
  print S1
  print "\n"
  print S2
  print "\n"
  end
CODE

output_is( <<'CODE', <<'OUTPUT', "5 arg substr, length > strlen " );
  set S0, "abcdefghijk"
  set S1, "xyz"
  substr S2, S0, 3, 11, S1
  print S0
  print "\n"
  print S1
  print "\n"
  print S2
  print "\n"
  end
CODE
abcxyz
xyz
defghijk
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "5 arg substr, length > strlen, -ve offset" );
  set S0, "abcdefghijk"
  set S1, "xyz"
  substr S2, S0, -3, 11, S1
  print S0
  print "\n"
  print S1
  print "\n"
  print S2
  print "\n"
  end
CODE
abcdefghxyz
xyz
ijk
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "4-arg, replacement-only substr" );
  set S0, "abcdefghijk"
  set S1, "xyz"
  substr S0, 3, 3, S1
  print S0
  print "\n"
  print S1
  print "\n"
  end
CODE
abcxyzghijk
xyz
OUTPUT

output_is( <<'CODE', 'PH', "3-arg substr" );
  set S0, "JAPH"
  substr S1, S0, 2
  print S1
  end
CODE

output_is( <<'CODE', '<><', "concat_s_s|sc, null onto null" );
 print "<>"
 concat S0, S0
 concat S1, ""
 print "<"
 end
CODE

output_is(<<'CODE', <<OUTPUT, "concat_s_sc, repeated two-arg concats" );
  set S12, ""
  set I0, 0
WHILE:
  concat S12, "hi"
  add I0, 1
  lt I0, 10, WHILE
  print S12
  print "\n"
  end
CODE
hihihihihihihihihihi
OUTPUT


output_is( <<'CODE', <<OUTPUT, 'concat_s_s|sc, "foo1" onto null' );
 concat S0, "foo1"
 set S1, "foo2"
 concat S2, S1
 print S0
 print "\n"
 print S2
 print "\n"
 end
CODE
foo1
foo2
OUTPUT

output_is( <<'CODE', <<OUTPUT, "concat_s_s|sc" );
	set S1, "fish"
	set S2, "bone"
	concat S1, S2
	print S1
	concat S1, "\n"
	print S1
	end
CODE
fishbonefishbone
OUTPUT

output_is( <<'CODE', <<OUTPUT, "concat_s_s|sc_s|sc" );
	set S1, "japh"
	set S2, "JAPH"
	concat S0, "japh", "JAPH"
	print S0
	print "\n"
	concat S0, S1, "JAPH"
	print S0
	print "\n"
	concat S0, "japh", S2
	print S0
	print "\n"
	concat S0, S1, S2
	print S0
	print "\n"
	end
CODE
japhJAPH
japhJAPH
japhJAPH
japhJAPH
OUTPUT

output_is( <<'CODE', <<OUTPUT, "concat - ensure copy is made" );
	set S2, "JAPH"
	concat S0, S2, ""
	concat S1, "", S2
	chopn S0, 1
	chopn S1, 1
	print S2
	print "\n"
	end
CODE
JAPH
OUTPUT


output_is(<<"CODE", <<'OUTPUT', "clears");
@{[ set_str_regs( sub {"BOO $_[0]\\n"} ) ]}
	clears
@{[ print_str_regs() ]}
	print "done\\n"
	end
CODE
done
OUTPUT

my @strings = (
  "hello", "hello",
  "hello", "world",
  "world", "hello",
  "hello", "hellooo",
  "hellooo", "hello",
  "hello", "hella",
  "hella", "hello",
  "hella", "hellooo",
  "hellooo", "hella",
  "hElLo", "HeLlO",
  "hElLo", "hElLo"
);

output_is(<<CODE, <<OUTPUT, "eq_s_s_ic");
@{[ compare_strings( 0, "eq", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "eq_sc_s_ic");
@{[ compare_strings( 1, "eq", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "eq_s_sc_ic");
@{[ compare_strings( 2, "eq", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "eq_sc_sc_ic");
@{[ compare_strings( 3, "eq", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "ne_s_s_ic");
@{[ compare_strings( 0, "ne", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "ne_sc_s_ic");
@{[ compare_strings( 1, "ne", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "ne_s_sc_ic");
@{[ compare_strings( 2, "ne", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "ne_sc_sc_ic");
@{[ compare_strings( 3, "ne", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "lt_s_s_ic");
@{[ compare_strings( 0, "lt", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "lt_sc_s_ic");
@{[ compare_strings( 1, "lt", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "lt_s_sc_ic");
@{[ compare_strings( 2, "lt", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "lt_sc_sc_ic");
@{[ compare_strings( 3, "lt", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "le_s_s_ic");
@{[ compare_strings( 0, "le", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "le_sc_s_ic");
@{[ compare_strings( 1, "le", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "le_s_sc_ic");
@{[ compare_strings( 2, "le", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "le_sc_sc_ic");
@{[ compare_strings( 3, "le", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "gt_s_s_ic");
@{[ compare_strings( 0, "gt", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "gt_sc_s_ic");
@{[ compare_strings( 1, "gt", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "gt_s_sc_ic");
@{[ compare_strings( 2, "gt", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "gt_sc_sc_ic");
@{[ compare_strings( 3, "gt", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "ge_s_s_ic");
@{[ compare_strings( 0, "ge", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "ge_sc_s_ic");
@{[ compare_strings( 1, "ge", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "ge_s_sc_ic");
@{[ compare_strings( 2, "ge", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<CODE, <<OUTPUT, "ge_sc_sc_ic");
@{[ compare_strings( 3, "ge", @strings ) ]}
    print "ok\\n"
    end
ERROR:
    print "bad\\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "same constant twice bug");
       set     S0, ""
       set     S1, ""
       set     S2, "foo"
       concat  S1,S1,S2
       print   S1
       print   S0
       print   "\n"
       end
CODE
foo
OUTPUT

output_is(<<'CODE','Cannot get character of empty string','2-param ord, empty string');
	ord I0,""
	print I0
	end
CODE

output_is(<<'CODE','Cannot get character of empty string','2-param ord, empty string register');
	ord I0,S0
	print I0
	end
CODE

output_is(<<'CODE','Cannot get character of empty string','3-param ord, empty string');
	ord I0,"",0
	print I0
	end
CODE

output_is(<<'CODE','Cannot get character of empty string','3-param ord, empty string register');
	ord I0,S0,0
	print I0
	end
CODE

output_is(<<'CODE',ord('a'),'2-param ord, one-character string');
	ord I0,"a"
	print I0
	end
CODE

output_is(<<'CODE',ord('a'),'2-param ord, multi-character string');
	ord I0,"abc"
	print I0
	end
CODE

output_is(<<'CODE',ord('a'),'2-param ord, one-character string register');
	set S0,"a"
	ord I0,S0
	print I0
	end
CODE

output_is(<<'CODE',ord('a'),'3-param ord, one-character string');
	ord I0,"a",0
	print I0
	end
CODE

output_is(<<'CODE',ord('a'),'3-param ord, one-character string register');
	set S0,"a"
	ord I0,S0,0
	print I0
	end
CODE

output_is(<<'CODE',ord('b'),'3-param ord, multi-character string');
	ord I0,"ab",1
	print I0
	end
CODE

output_is(<<'CODE',ord('b'),'3-param ord, multi-character string register');
	set S0,"ab"
	ord I0,S0,1
	print I0
	end
CODE

output_is(<<'CODE', 'Cannot get character past end of string','3-param ord, multi-character string');
	ord I0,"ab",2
	print I0
	end
CODE

output_is(<<'CODE', 'Cannot get character past end of string','3-param ord, multi-character string');
	set S0,"ab"
	ord I0,S0,2
	print I0
	end
CODE

output_is(<<'CODE',ord('a'),'3-param ord, one-character string, from end');
	ord I0,"a",-1
	print I0
	end
CODE

output_is(<<'CODE',ord('a'),'3-param ord, one-character string register, from end');
	set S0,"a"
	ord I0,S0,-1
	print I0
	end
CODE

output_is(<<'CODE',ord('b'),'3-param ord, multi-character string, from end');
	ord I0,"ab",-1
	print I0
	end
CODE

output_is(<<'CODE',ord('b'),'3-param ord, multi-character string register, from end');
	set S0,"ab"
	ord I0,S0,-1
	print I0
	end
CODE

output_is(<<'CODE','Cannot get character before beginning of string','3-param ord, multi-character string register, from end, OOB');
	set S0,"ab"
	ord I0,S0,-3
	print I0
        end
CODE

output_is(<<'CODE',chr(32),'chr of 32 is space in ASCII');
        chr S0, 32
        print S0
        end
CODE

output_is(<<'CODE',chr(65),'chr of 65 is A in ASCII');
        chr S0, 65
        print S0
        end
CODE

output_is(<<'CODE',chr(122),'chr of 122 is z in ASCII');
        chr S0, 122
        print S0
	end
CODE

output_is(<<CODE, <<OUTPUT, "if_s_ic");
	set	S0, "I've told you once, I've told you twice..."
	if	S0, OK1
	print	"not "
OK1:	print	"ok 1\\n"

	set	S0, "0.0"
	if	S0, OK2
	print	"not "
OK2:	print	"ok 2\\n"

	set	S0, ""
	if	S0, BAD3
	branch OK3
BAD3:	print	"not "
OK3:	print	"ok 3\\n"

	set	S0, "0"
	if	S0, BAD4
	branch OK4
BAD4:	print	"not "
OK4:	print	"ok 4\\n"

	set	S0, "0e0"
	if	S0, OK5
	print	"not "
OK5:	print	"ok 5\\n"

	set	S0, "x"
	if	S0, OK6
	print	"not "
OK6:	print	"ok 6\\n"

	set	S0, "\\x0"
	if	S0, OK7
	print	"not "
OK7:	print	"ok 7\\n"

	set	S0, "\\n"
	if	S0, OK8
	print	"not "
OK8:	print	"ok 8\\n"

	set	S0, " "
	if	S0, OK9
	print	"not "
OK9:	print	"ok 9\\n"

# An empty register should be false...
        clears
        if      S1, BAD10
        branch  OK10
BAD10:	print	"not "
OK10:	print	"ok 10\\n"

	end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
OUTPUT

output_is(<<CODE, <<OUTPUT, "repeat_s_s|sc_i|ic");
	set S0, "x"

	repeat S1, S0, 12
	print S0
	print "\\n"
	print S1
	print "\\n"

	set I0, 12
	set S2, "X"

	repeat S3, S2, I0
	print S2
	print "\\n"
	print S3
	print "\\n"

	repeat S4, "~", 12
	print S4
	print "\\n"

	repeat S5, "~", I0
	print S5
	print "\\n"

	print ">"
	repeat S6, "***", 0
	print S6
	print "< done\\n"

	end
CODE
x
xxxxxxxxxxxx
X
XXXXXXXXXXXX
~~~~~~~~~~~~
~~~~~~~~~~~~
>< done
OUTPUT

output_is(<<'CODE',"Cannot repeat with negative arg\n",'repeat OOB');
	repeat S0, "japh", -1
	end
CODE

output_is(<<'CODE',<<OUTPUT,"index, 3-arg form");
      set S0, "Parrot"
      set S1, "Par"
      index I1, S0, S1
      print I1
      print "\n"

      set S1, "rot"
      index I1, S0, S1
      print I1
      print "\n"

      set S1, "bar"
      index I1, S0, S1
      print I1
      print "\n"

      end
CODE
0
3
-1
OUTPUT

output_is(<<'CODE',<<OUTPUT,"index, 4-arg form");
      set S0, "Barbarian"
      set S1, "ar"
      index I1, S0, S1, 0
      print I1
      print "\n"

      index I1, S0, S1, 2
      print I1
      print "\n"

      set S1, "qwx"
      index I1, S0, S1, 0
      print I1
      print "\n"

      end
CODE
1
4
-1
OUTPUT

output_is(<<'CODE',<<OUTPUT,"index, 4-arg form, bug 22718");
	set S1, "This is not quite right"
	set S0, " is "
	index I0, S1, S0, 0
	print I0
	set S0, "is"
	index I0, S1, S0, 0
	print I0
	print "\n"
	end
CODE
42
OUTPUT

output_is(<<'CODE',<<OUTPUT,"index, null strings");
      set S0, "Parrot"
      set S1, ""
      index I1, S0, S1
      print I1
      print "\n"

      index I1, S0, S1, 0
      print I1
      print "\n"

      index I1, S0, S1, 5
      print I1
      print "\n"

      index I1, S0, S1, 6
      print I1
      print "\n"

      set S0, ""
      set S1, "a"
      index I1, S0, S1
      print I1
      print "\n"

      index I1, S0, S1, 0
      print I1
      print "\n"

      set S0, "Parrot"
      null S1
      index I1, S0, S1
      print I1
      print "\n"

      null S0
      null S1
      index I1, S0, S1
      print I1
      print "\n"
      end
CODE
-1
-1
-1
-1
-1
-1
-1
-1
OUTPUT

output_is(<<'CODE',<<OUTPUT,"index, embedded nulls");
      set S0, "Par\0\0rot"
      set S1, "\0"
      index I1, S0, S1
      print I1
      print "\n"

      index I1, S0, S1, 4
      print I1
      print "\n"

      end
CODE
3
4
OUTPUT

output_is(<<'CODE',<<OUTPUT,"index, big strings");
      set S0, "a"
      repeat S0, S0, 10000
      set S1, "a"
      repeat S1, S1, 500
      index I1, S0, S1
      print I1
      print "\n"

      index I1, S0, S1, 1234
      print I1
      print "\n"

      index I1, S0, S1, 9501
      print I1
      print "\n"

      end
CODE
0
1234
-1
OUTPUT

output_is(<<'CODE',<<OUTPUT,"index, big, hard to match strings");
# Builds a 24th iteration fibonacci string (approx. 100K)
      set S1, "a"
      set S2, "b"
      set I0, 0
LOOP:
      set S3, S1
      concat S1, S2, S3
      set S2, S3
      inc I0
      lt I0, 24, LOOP

      index I1, S1, S2
      print I1
      print "\n"

      index I1, S1, S2, 50000
      print I1
      print "\n"
      end
CODE
46368
-1
OUTPUT

output_is(<<'CODE',<<OUTPUT,"index, multibyte matching");
    set S0, "\xAB"
    find_chartype I0, "8859-1"
    set_chartype S0, I0
    find_encoding I0, "singlebyte"
    set_encoding S0, I0

    find_encoding I0, "utf8"
    find_chartype I1, "unicode"
    transcode S1, S0, I0, I1

    eq S0, S1, equal
    print "not "
equal:
    print "equal\n"

    index I0, S0, S1
    print I0
    print "\n"
    index I0, S1, S0
    print I0
    print "\n"
    end
CODE
equal
0
0
OUTPUT

output_is(<<'CODE',<<OUTPUT,"index, multibyte matching 2");
    set S0, "\xAB\xBA"
    set S1, "foo\xAB\xAB\xBAbar"
    find_chartype I0, "8859-1"
    set_chartype S0, I0
    find_encoding I0, "singlebyte"
    set_encoding S0, I0

    find_chartype I0, "unicode"
    find_encoding I1, "utf8"
    transcode S1, S1, I1, I0

    index I0, S0, S1
    print I0
    print "\n"
    index I0, S1, S0
    print I0
    print "\n"
    end
CODE
-1
4
OUTPUT

output_is(<<'CODE',<<OUTPUT,"num to string");
    set N0, 80.43
    set S0, N0
    print S0
    print "\n"

    set N0, -1.111111
    set S0, N0
    print S0
    print "\n"
    end
CODE
80.43
-1.11111
OUTPUT

output_is(<<'CODE', <<OUTPUT, "string to int");
	set	S0, "123"
	set	I0, S0
	print	I0
	print	"\n"

	set	S0, " 1"
	set	I0, S0
	print	I0
	print	"\n"

	set	S0, "-1"
	set	I0, S0
	print	I0
	print	"\n"

        set     S0, "Not a number"
 	set	I0, S0
	print	I0
	print	"\n"

	set	S0, ""
	set	I0, S0
	print	I0
	print	"\n"

	end
CODE
123
1
-1
0
0
OUTPUT


output_is( <<'CODE', <<OUTPUT, "concat/substr (COW)" );
	set S0, "<JA"
	set S1, "PH>"
	set S2, ""
	concat S2, S2, S0
	concat S2, S2, S1
	print S2
	print "\n"
	substr S0, S2, 1, 4
	print S0
	print "\n"
	end
CODE
<JAPH>
JAPH
OUTPUT

output_is( <<'CODE', <<OUTPUT, "constant to cstring" );
  stringinfo I0, "\n", 2
  stringinfo I1, "\n", 2
  eq I1, I0, ok1
  print "N"
ok1:
  print "OK"
  print "\n"
  stringinfo I2, "\n", 2
  eq I2, I0, ok2
  print "N"
ok2:
  print "OK\n"
  end
CODE
OK
OK
OUTPUT

output_is( <<'CODE', <<OUTPUT, "COW with chopn leaving original untouched" );
  set S0, "ABCD"
  clone S1, S0
  chopn S0, 1
  print S0
  print "\n"
  print S1
  print "\n"
  end
CODE
ABC
ABCD
OUTPUT

output_is( <<'CODE', <<OUTPUT, "Check that bug #16874 was fixed" );
  set S0,  "foo     "
  set S1,  "bar     "
  set S2,  "quux    "
  set S15, ""
  concat S15, S0
  concat S15, S1
  concat S15, S2
  print "["
  print S15
  print "]\n"
  end
CODE
[foo     bar     quux    ]
OUTPUT

output_is( <<'CODE', "all ok\n", "stress concat" );
 set I0, 1000
 set S0, "michael"
LOOP:
 set S2, I0
 concat S1, S0, S2
 concat S3, "mic", "hael"
 concat S3, S3, S2
 eq S1, S3, BOTTOM
 print "Failed: "
 print S1
 print " ne "
 print S3
 print "\n"
 end
BOTTOM:
 sub I0, I0, 1
 ne I0, 0, LOOP
 print "all ok\n"
 end
CODE

output_is( <<'CODE', <<OUTPUT, "ord and substring (see #17035)" );
  set S0, "abcdef"
  substr S1, S0, 2, 3
  ord I0, S0, 2
  ord I1, S1, 0
  ne I0, I1, fail
  ord I0, S0, 3
  ord I1, S1, 1
  ne I0, I1, fail
  ord I0, S0, 4
  ord I1, S1, 2
  ne I0, I1, fail
  print "It's all good\n"
  end
fail:
  print "Not good: original string="
  print I0
  print ", substring="
  print I1
  print "\n"
  end
CODE
It's all good
OUTPUT

output_is(<<'CODE', <<OUTPUT, "sprintf");
    branch MAIN

NEWARYP:
    new P1, .PerlArray
    set P1[0], P0
    ret
NEWARYS:
    new P1, .PerlArray
    set P1[0], S0
    ret
NEWARYI:
    new P1, .PerlArray
    set P1[0], I0
    ret
NEWARYN:
    new P1, .PerlArray
    set P1[0], N0
    ret
PRINTF:
    sprintf S2, S1, P1
    print S2
    ret

MAIN:
    set S1, "Hello, %s\n"
    set S0, "Parrot!"
    bsr NEWARYS
    bsr PRINTF

    set S1, "PerlHash[0x%x]\n"
    set I0, 256
    bsr NEWARYI
    bsr PRINTF

    set S1, "PerlHash[0x%lx]\n"
    set I0, 256
    bsr NEWARYI
    bsr PRINTF

    set S1, "Hello, %.2s!\n"
    set S0, "Parrot"
    bsr NEWARYS
    bsr PRINTF

    set S1, "Hello, %Ss"
    set S0, S2
    bsr NEWARYS
    bsr PRINTF

    set S1, "1 == %Pd\n"
    new P0, .PerlInt
    set P0, 1
    bsr NEWARYP
    bsr PRINTF

    set S1, "-255 == %vd\n"
    set I0, -255
    bsr NEWARYI
    bsr PRINTF

    set S1, "+123 == %+vd\n"
    set I0, 123
    bsr NEWARYI
    bsr PRINTF

    set S1, "256 == %vu\n"
    set I0, 256
    bsr NEWARYI
    bsr PRINTF

    set S1, "+1 == %+vu\n"
    set I0, 1
    bsr NEWARYI
    bsr PRINTF

    set S1, "001 == %0.3u\n"
    set I0, 1
    bsr NEWARYI
    bsr PRINTF

    set S1, "+001 == %+0.3u\n"
    set I0, 1
    bsr NEWARYI
    bsr PRINTF

    set S1, "0.500000 == %f\n"
    set N0, 0.5
    bsr NEWARYN
    bsr PRINTF

    set S1, "0.500 == %5.3f\n"
    set N0, 0.5
    bsr NEWARYN
    bsr PRINTF

    set S1, "0.001 == %g\n"
    set N0, 0.001
    bsr NEWARYN
    bsr PRINTF

    set S1, "1e+06 == %g\n"
    set N0, 1.0e6
    bsr NEWARYN
    bsr PRINTF

    set S1, "0.5 == %3.3g\n"
    set N0, 0.5
    bsr NEWARYN
    bsr PRINTF

    set S1, "%% == %%\n"
    set I0, 0
    bsr NEWARYI
    bsr PRINTF

    set S1, "That's all, %s\n"
    set S0, "folks!"
    bsr NEWARYS
    bsr PRINTF

    end
CODE
Hello, Parrot!
PerlHash[0x100]
PerlHash[0x100]
Hello, Pa!
Hello, Hello, Pa!
1 == 1
-255 == -255
+123 == +123
256 == 256
+1 == +1
001 == 001
+001 == +001
0.500000 == 0.500000
0.500 == 0.500
0.001 == 0.001
1e+06 == 1e+06
0.5 == 0.5
% == %
That's all, folks!
OUTPUT

output_is(<<'CODE', <<OUTPUT, "other form of sprintf op");
    branch MAIN

PRINTF:
    sprintf P3, P2, P1
    print P3
    ret

MAIN:
    new P3, .PerlString

    new P2, .PerlString
    set P2, "15 is %b\n"
    new P1, .PerlArray
    set P1[0], 15
    bsr PRINTF

    new P2, .PerlString
    set P2, "128 is %o\n"
    new P1, .PerlArray
    set P1[0], 128
    bsr PRINTF

    end
CODE
15 is 1111
128 is 200
OUTPUT

output_is(<<'CODE', <<OUTPUT, "exchange");
    set S0, "String #0\n"
    set S1, "String #1\n"
    exchange S0, S1
    print S0
    print S1

    set S2, "String #2\n"
    exchange S2, S2
    print S2

    end
CODE
String #1
String #0
String #2
OUTPUT

output_is(<<'CODE', <<OUTPUT, "find_encoding");
      find_encoding I0, "singlebyte"
      print I0
      print "\n"
      find_encoding I0, "utf8"
      print I0
      print "\n"
      find_encoding I0, "utf16"
      print I0
      print "\n"
      find_encoding I0, "utf32"
      print I0
      print "\n"
      end
CODE
0
1
2
3
OUTPUT

output_is(<<'CODE', <<OUTPUT, "string_encoding");
      set I0, 0
      new S0, 0, I0
      string_encoding I1, S0
      eq I0, I1, OK1
      print "not "
OK1:  print "ok 1\n"

      set I0, 1
      new S0, 0, I0
      string_encoding I1, S0
      eq I0, I1, OK2
      print "not "
OK2:  print "ok 2\n"

      set I0, 2
      new S0, 0, I0
      string_encoding I1, S0
      eq I0, I1, OK3
      print "not "
OK3:  print "ok 3\n"

      set I0, 3
      new S0, 0, I0
      string_encoding I1, S0
      eq I0, I1, OK4
      print "not "
OK4:  print "ok 4\n"

      end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "substr_r_s_s|sc_i|ic_i|ic" );
	set	S4, "12345JAPH01"
	set	I4, 5
	set	I5, 4
	substr_r	S5, S4, I4, I5
	print	S5
	substr_r S5, S4, I4, 4
	print  S5
	substr_r S5, S4, 5, I5
	print  S5
	substr_r S5, S4, 5, 4
	print  S5
	substr_r S5, "12345JAPH01", I4, I5
	print  S5
	substr_r S5, "12345JAPH01", I4, 4
	print  S5
	substr_r S5, "12345JAPH01", 5, I5
	print  S5
	substr_r S5, "12345JAPH01", 5, 4
	print  S5
	print  "\n"
	end
CODE
JAPHJAPHJAPHJAPHJAPHJAPHJAPHJAPH
OUTPUT

output_is( <<'CODE', <<OUTPUT, "assign" );
	set	S4, "JAPH\n"
	assign  S5, S4
	print	S4
	print   S5
	end
CODE
JAPH
JAPH
OUTPUT

output_is( <<'CODE', <<OUTPUT, "assign & globber" );
	set	S4, "JAPH\n"
	assign  S5, S4
	assign  S4, "Parrot\n"
	print	S4
	print   S5
	end
CODE
Parrot
JAPH
OUTPUT

output_is( <<'CODE', <<OUTPUT, "assign & globber 2" );
	set	S4, "JAPH\n"
	set     S5, S4
	assign  S4, "Parrot\n"
	print	S4
	print   S5
	end
CODE
Parrot
Parrot
OUTPUT

output_is( <<'CODE', <<OUTPUT, "bands NULL string");
	null S1
	set S2, "abc"
	bands S1, S2
	null S3
	eq S1, S3, ok1
	print "not "
ok1:	print "ok 1\n"
	set S1, ""
	bands S1, S2
	unless S1, ok2
	print "not "
ok2:	print "ok 2\n"

	null S2
	set S1, "abc"
	bands S1, S2
	null S3
	eq S1, S3, ok3
	print "not "
ok3:	print "ok 3\n"
	set S2, ""
	bands S1, S2
	unless S1, ok4
	print "not "
ok4:	print "ok 4\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is( <<'CODE', <<OUTPUT, "bands 2");
	set S1, "abc"
	set S2, "EE"
	bands S1, S2
	print S1
	print "\n"
	print S2
	print "\n"
	end
CODE
A@
EE
OUTPUT

output_is( <<'CODE', <<OUTPUT, "bands 3");
	set S1, "abc"
	set S2, "EE"
	bands S0, S1, S2
	print S0
	print "\n"
	print S1
	print "\n"
	print S2
	print "\n"
	end
CODE
A@
abc
EE
OUTPUT

output_is( <<'CODE', <<OUTPUT, "bands COW");
  set S1, "foo"
  substr S2, S1, 0, 3
  bands S1, "bar"
  print S2
  print "\n"
  end
CODE
foo
OUTPUT

output_is( <<'CODE', <<OUTPUT, "bors NULL string");
     null S1
     null S2
     bors S1, S2
     null S3
     eq S1, S3, OK1
     print "not "
OK1: print "ok 1\n"

     null S1
     set S2, ""
     bors S1, S2
     null S3
     eq S1, S3, OK2
     print "not "
OK2: print "ok 2\n"
     bors S2, S1
     eq S2, S3, OK3
     print "not "
OK3: print "ok 3\n"

     null S1
     set S2, "def"
     bors S1, S2
     eq S1, "def", OK4
     print "not "
OK4: print "ok 4\n"
     null S2
     bors S1, S2
     eq S1, "def", OK5
     print "not "
OK5: print "ok 5\n"

     null S1
     null S2
     bors S3, S1, S2
     null S4
     eq S3, S4, OK6
     print "not "
OK6: print "ok 6\n"

     set S1, ""
     bors S3, S1, S2
     eq S3, S4, OK7
     print "not "
OK7: print "ok 7\n"
     bors S3, S2, S1
     eq S3, S4, OK8
     print "not "
OK8: print "ok 8\n"

     set S1, "def"
     bors S3, S1, S2
     eq S3, "def", OK9
     print "not "
OK9: print "ok 9\n"
     bors S3, S2, S1
     eq S3, "def", OK10
     print "not "
OK10: print "ok 10\n"
     end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
OUTPUT

output_is( <<'CODE', <<OUTPUT, "bors 2");
	set S1, "abc"
	set S2, "EE"
	bors S1, S2
	print S1
	print "\n"
	print S2
	print "\n"
	end
CODE
egc
EE
OUTPUT

output_is( <<'CODE', <<OUTPUT, "bors 3");
	set S1, "abc"
	set S2, "EE"
	bors S0, S1, S2
	print S0
	print "\n"
	print S1
	print "\n"
	print S2
	print "\n"
	end
CODE
egc
abc
EE
OUTPUT

output_is( <<'CODE', <<OUTPUT, "bors COW");
  set S1, "foo"
  substr S2, S1, 0, 3
  bors S1, "bar"
  print S2
  print "\n"
  end
CODE
foo
OUTPUT

output_is( <<'CODE', <<OUTPUT, "bxors NULL string");
     null S1
     null S2
     bxors S1, S2
     null S3
     eq S1, S3, OK1
     print "not "
OK1: print "ok 1\n"

     null S1
     set S2, ""
     bxors S1, S2
     null S3
     eq S1, S3, OK2
     print "not "
OK2: print "ok 2\n"
     bxors S2, S1
     eq S2, S3, OK3
     print "not "
OK3: print "ok 3\n"

     null S1
     set S2, "abc"
     bxors S1, S2
     eq S1, "abc", OK4
     print "not "
OK4: print "ok 4\n"
     null S2
     bxors S1, S2
     eq S1, "abc", OK5
     print "not "
OK5: print "ok 5\n"

     null S1
     null S2
     bxors S3, S1, S2
     null S4
     eq S3, S4, OK6
     print "not "
OK6: print "ok 6\n"

     set S1, ""
     bxors S3, S1, S2
     eq S3, S4, OK7
     print "not "
OK7: print "ok 7\n"
     bxors S3, S2, S1
     eq S3, S4, OK8
     print "not "
OK8: print "ok 8\n"

     set S1, "abc"
     bxors S3, S1, S2
     eq S3, "abc", OK9
     print "not "
OK9: print "ok 9\n"
     bxors S3, S2, S1
     eq S3, "abc", OK10
     print "not "
OK10: print "ok 10\n"
     end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
OUTPUT

output_is( <<'CODE', <<OUTPUT, "bxors 2");
 set S1, "a2c"
 set S2, "Dw"
 bxors S1, S2
 print S1
 print "\n"
 print S2
 print "\n"
    set S1, "abc"
    set S2, "   X"
    bxors S1, S2
    print S1
 print "\n"
 print S2
 print "\n"
 end
CODE
%Ec
Dw
ABCX
   X
OUTPUT

output_is( <<'CODE', <<OUTPUT, "bxors 3");
 set S1, "a2c"
 set S2, "Dw"
 bxors S0, S1, S2
 print S0
 print "\n"
 print S1
 print "\n"
 print S2
 print "\n"
    set S1, "abc"
    set S2, "   Y"
    bxors S0, S1, S2
 print S0
 print "\n"
    print S1
 print "\n"
 print S2
 print "\n"
 end
CODE
%Ec
a2c
Dw
ABCY
abc
   Y
OUTPUT

output_is( <<'CODE', <<OUTPUT, "bxors COW");
  set S1, "foo"
  substr S2, S1, 0, 3
  bxors S1, "bar"
  print S2
  print "\n"
  end
CODE
foo
OUTPUT

output_is( <<'CODE', <<OUTPUT, "transcode to utf8");
  set S1, "ASCII is the same as UTF8\n"
  find_encoding I1, "utf8"
  transcode S2, S1, I1
  print S1
  print S2
  end
CODE
ASCII is the same as UTF8
ASCII is the same as UTF8
OUTPUT

output_is(<<'CODE', <<OUTPUT, "string_chartype");
    set S0, "Test String"
    find_chartype I0, "usascii"
    set_chartype S0, I0
    string_chartype I1, S0
    eq I1, I0, OK
    print I0
    print "\n"
    print I1
    print "\n"
    print "not "
OK: print "ok\n"
    end
CODE
ok
OUTPUT

# Set all string registers to values given by &$_[0](reg num)
sub set_str_regs {
  my $code = shift;
  my $rt;
  for (0..31) {
    $rt .= "\tset S$_, \"".&$code($_)."\"\n";
  }
  return $rt;
}
# print string registers, no additional prints
sub print_str_regs {
  my $rt;
  for (0..31) {
    $rt .= "\tprint S$_\n";
  }
  return $rt;
}
# Generate code to compare each pair of strings in a list
sub compare_strings {
  my $const = shift;
  my $op = shift;
  my @strings = @_;
  my $i = 1;
  my $rt;
  while (@strings) {
    my $s1 = shift @strings;
    my $s2 = shift @strings;
    my $arg1;
    my $arg2;
    if ($const == 3) {
 $arg1 = "\"$s1\"";
 $arg2 = "\"$s2\"";
    }
    elsif ($const == 2) {
 $rt .= "    set S0, \"$s1\"\n";
 $arg1 = "S0";
 $arg2 = "\"$s2\"";
    }
    elsif ($const == 1) {
 $rt .= "    set S0, \"$s2\"\n";
 $arg1 = "\"$s1\"";
 $arg2 = "S0";
    }
    else {
 $rt .= "    set S0, \"$s1\"\n";
 $rt .= "    set S1, \"$s2\"\n";
 $arg1 = "S0";
 $arg2 = "S1";
    }
    if (eval "\"$s1\" $op \"$s2\"") {
      $rt .= "    $op $arg1, $arg2, OK$i\n";
      $rt .= "    branch ERROR\n";
    }
    else {
      $rt .= "    $op $arg1, $arg2, ERROR\n";
    }
    $rt .= "OK$i:\n";
    $i++;
  }
  return $rt;
}

1;

