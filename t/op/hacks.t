#! perl -w

use Parrot::Test tests => 1;

# It would be very embarrassing if these didn't work...
open FOO, ">temp.file";
print FOO "2\n1\n";
close FOO;
output_is(<<'CODE', <<'OUTPUT', "open and readline");
	open I0, "temp.file"
	set S0, ""
	set S1, ""
	readline S0, I0
	readline S1, I0
	print S1
	print S0
	end
CODE
1
2
OUTPUT
unlink("temp.file");
1; # HONK