#! perl -w

use Parrot::Test tests => 43;

output_is( <<'CODE', <<OUTPUT, "set_s_sc" );
	set	S4, "JAPH\n"
	print	S4
	end
CODE
JAPH
OUTPUT

output_is( <<'CODE', '4', "length_i_s" );
	set	I4, 0
	set	S4, "JAPH"
	length	I4, S4
	print	I4
	end
CODE

output_is( <<'CODE', <<OUTPUT, "chopn_s_ic" );
	set	S4, "JAPHxyzw"
	set	S5, "japhXYZW"
	set	S3, "\n"
	chopn	S4, 3
	chopn	S4, 1
	chopn	S5, 4
	print	S4
	print	S3
	print	S5
	print	S3
	end
CODE
JAPH
japh
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

output_is( <<'CODE', 'JAPH', "substr_s_s_i_i" );
	set	S4, "12345JAPH01"
	set	I4, 5
	set	I5, 4
	substr	S5, S4, I4, I5
	print	S5
	end
CODE

# negative offsets
output_is(<<'CODE', <<'OUTPUT', "neg substr offset");
	set	S0, "A string of length 21"
	set I0, -9
	set I1, 6
	substr_s_s_i S1, S0, I0, I1
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
output_is(<<'CODE', 'Cannot take substr outside string', "sub err:OOR");
	set	S0, "A string of length 21"
	set I0, -99
	set I1, 6
	substr_s_s_i S1, S0, I0, I1
	print S0
	print "\n"
	print S1
	print "\n"
	end
CODE

# This asks for substring much greater than length of original string
output_is(<<'CODE', <<'OUTPUT', "len>strlen");
	set	S0, "A string of length 21"
	set I0, 12
	set I1, 1000
	substr_s_s_i S1, S0, I0, I1
	print S0
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
	substr_s_s_i S1, S0, I0, I1
	print S0
	print "\n"
	print S1
	print "\n"
	end
CODE
A string of length 21
length 21
OUTPUT

output_is( <<'CODE', '<><', "2-param concat, null onto null" );
    print "<>"
    concat S0,S0
    print "<"
    end
CODE

output_is( <<'CODE', <<OUTPUT, '2-param concat, "foo1" onto null' );
    concat S0,"foo1"
    print S0
    print "\n"
    end
CODE
foo1
OUTPUT

output_is( <<'CODE', <<OUTPUT, '2-param concat, "foo2" onto null' );
    set S1,"foo2"
    concat S0,S1
    print S0
    print "\n"
    end
CODE
foo2
OUTPUT

output_is( <<'CODE', <<OUTPUT, "concat" );
    set S1, "fish"
    set S2, "bone"
    concat S1, S2
    print S1
    set S2, "\n"
    print S2
    end
CODE
fishbone
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

output_is(<<CODE, <<OUTPUT, "eq_s_sc_ic");
@{[ compare_strings( 1, "eq", @strings ) ]}
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

output_is(<<CODE, <<OUTPUT, "ne_s_sc_ic");
@{[ compare_strings( 1, "ne", @strings ) ]}
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

output_is(<<CODE, <<OUTPUT, "lt_s_sc_ic");
@{[ compare_strings( 1, "lt", @strings ) ]}
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

output_is(<<CODE, <<OUTPUT, "le_s_sc_ic");
@{[ compare_strings( 1, "le", @strings ) ]}
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

output_is(<<CODE, <<OUTPUT, "gt_s_sc_ic");
@{[ compare_strings( 1, "gt", @strings ) ]}
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

output_is(<<CODE, <<OUTPUT, "ge_s_sc_ic");
@{[ compare_strings( 1, "ge", @strings ) ]}
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
    my $arg;
    $rt .= "    set S0, \"$s1\"\n";
    if ($const) {
      $arg = "\"$s2\"";
    }
    else {
      $rt .= "    set S1, \"$s2\"\n";
      $arg = "S1";
    }
    if (eval "\"$s1\" $op \"$s2\"") {
      $rt .= "    $op S0, $arg, OK$i\n";
      $rt .= "    branch ERROR\n";
    }
    else {
      $rt .= "    $op S0, $arg, ERROR\n";
    }
    $rt .= "OK$i:\n";
    $i++;
  }
  return $rt;
}

1;
