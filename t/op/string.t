#! perl -w

use Parrot::Test tests => 82;
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
A string of lengt
** nothing **
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

output_is( <<'CODE', '<><', "concat_s_s|sc, null onto null" );
 print "<>"
 concat S0, S0
 concat S1, ""
 print "<"
 end
CODE

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

output_is(<<CODE, <<OUTPUT, "eq_s|sc_s|sc");

	set	S0, "Spartacus"
	bsr	TEST1
	print	"ok 1\\n"
	bsr	TEST2
	print	"ok 2\\n"
	bsr TEST3
	print "ok 3\\n"
	bsr TEST4
	print "ok 4\\n"
	end

TEST1:	eq	"Spartacus", S0
	print	"not "
	ret

TEST2: eq S0, "Spartacus"
 print "not "
 ret

TEST3: eq S0, S0
 print "not "
 ret

TEST4: eq "Spartacus", "Spartacus"
	print	"not "
	ret

CODE
ok 1
ok 2
ok 3
ok 4
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

	set	S0, "\0"
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

output_is(<<'CODE','Cannot repeat with negative arg','repeat OOB');
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

      end
CODE
-1
-1
-1
-1
-1
-1
OUTPUT

SKIP: { skip("Nulls need to be patched for the new assembler. Many pardons.", 1);
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
};

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

