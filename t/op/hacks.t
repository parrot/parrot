#! perl -w

use Parrot::Test tests => 3;

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

open FOO, ">temp.file";  # Clobber previous contents
close FOO;

output_is(<<'CODE', <<'OUTPUT', "open & print");
       set I0, -12
       set N0, 2.2
       set S0, "Foo"
       new P0, .PerlString
       set P0, "Bar\n"

       open I1, "temp.file"
       print I1, I0
       print I1, N0
       print I1, S0
       print I1, P0
       close I1

       open I2, "temp.file"
       readline S1, I2
       close I2

       print S1
       end
CODE
-122.200000FooBar
OUTPUT

open FOO, ">temp.file";  # Clobber previous contents
close FOO;

output_is(<<'CODE', <<'OUTPUT', "3-arg open");
       open I1, "temp.file", "w"
       print "Foobar\n"
       close I1

       open I3, "temp.file", "r"
       readline S1, I3
       close I3

       print S1
       end
CODE
Foobar
OUTPUT
unlink("temp.file");
1; # HONK
