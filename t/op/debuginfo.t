#! perl -w

use Parrot::Test tests => 4;

output_is( <<'CODE', <<OUTPUT, "set/getline" );
	setline 1
	setline 2
	getline I0
	print I0
	print "\n"
	setline 1
	getline I0
	print I0
	print "\n"
	end
CODE
2
1
OUTPUT

output_is( <<'CODE', <<OUTPUT, "set/getpackage" );
	setpackage "foo"
	setpackage "bar"
	getpackage S0
	print S0
	print "\n"
	setpackage "foo"
	getpackage S0
	print S0
	print "\n"
	end
CODE
bar
foo
OUTPUT

output_is( <<'CODE', <<OUTPUT, "set/getfile" );
	setfile "foo"
	setfile "bar"
	getfile S0
	print S0
	print "\n"
	setfile "foo"
	getfile S0
	print S0
	print "\n"
	end
CODE
bar
foo
OUTPUT

output_is( <<'CODE', <<OUTPUT, "set/getpackage with regs" );
	set S0, "foo"
	set S1, "bar"
	set I0, 1
	set I1, 2
	setpackage S0
	setfile S1
	setline I0
	getfile S2
	setline I1
	print S2
	print "\n"
	getline I2
	print I2
	print "\n"
	setline I0
	setfile S1
	getpackage S2
	print S2
	print "\n"
	getfile S2
	getline I2
	print I2
	print "\n"
	print S2
	print "\n"
	end
CODE
bar
2
foo
1
bar
OUTPUT


1; # HONK
