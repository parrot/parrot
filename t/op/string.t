#! perl -w

use Parrot::Test tests => 11;

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

SKIP: { skip("TODO: printing empty string reg segfaults",1);
output_is(<<"CODE", <<'OUTPUT', "clear_s");
@{[ set_str_regs( sub {"BOO $_[0]\\n"} ) ]}
	clear_s
@{[ print_str_regs() ]}
	print "done\\n"
	end
CODE
done
OUTPUT
}

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

1;
