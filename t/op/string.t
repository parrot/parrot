#! perl -w

use Parrot::Test tests => 5;

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

SKIP: {
    skip "I'm unable to write it!", 1;
output_is( <<'CODE', 'JAPH', "substr_s_s_i_i" );
	set	S4, "12345JAPH01"
	set	I4, 5
	set	I5, 4
	substr	S5, S4, I4, I5
	print	S5
	end
CODE
}

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
