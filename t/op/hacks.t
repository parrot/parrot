#! perl -w

use Parrot::Test tests => 10;
use Test::More;

# It would be very embarrassing if these didn't work...
open FOO, ">temp.file";
print FOO "2\n1\n";
close FOO;
output_is(<<'CODE', <<'OUTPUT', "open and readline");
	open P0, "temp.file"
	set S0, ""
	set S1, ""
	readline S0, P0
	readline S1, P0
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

       open P1, "temp.file"
       print P1, I0
       print P1, N0
       print P1, S0
       print P1, P0
       close P1

       open P2, "temp.file"
       readline S1, P2
       close P2

       print S1
       end
CODE
-122.200000FooBar
OUTPUT

open FOO, ">temp.file";  # Clobber previous contents
close FOO;

# This one passes, but for the wrong reason
output_is(<<'CODE', <<'OUTPUT', "3-arg open");
       open P1, "temp.file", "<"
       print "Foobar\n"
       close P1

       open P3, "temp.file", "<"
       readline S1, P3
       close P3

       print S1
       end
CODE
Foobar
OUTPUT

unlink("temp.file");

output_is(<<'CODE', <<'OUTPUT', 'open and close');
       open P1, "temp.file"
       print P1, "Hello, World!\n"
       close P1
       print "done\n"
       end
CODE
done
OUTPUT

$/=undef; # slurp mode
open FOO, "temp.file";

is(<FOO>, <<'OUTPUT', 'file contents');
Hello, World!
OUTPUT

close FOO;

output_is(<<'CODE', '', 'append');
       open P1, "temp.file", ">>"
       print P1, "Parrot flies\n"
       close P1
       end
CODE

open FOO, "temp.file";

is(<FOO>, <<'OUTPUT', 'append file contents');
Hello, World!
Parrot flies
OUTPUT

close FOO;

output_is(<<'CODE', '', 'write to file');
       open P1, "temp.file", ">"
       print P1, "Parrot overwrites\n"
       close P1
       end
CODE

open FOO, "temp.file";

is(<FOO>, <<'OUTPUT', 'file contents');
Parrot overwrites
OUTPUT
         
unlink("temp.file");

output_is(<<'CODE', '012', 'standard file descriptors');
       getstdin P0
       getfd I0, P0
       print I0
       getstdout P1
       getfd I1, P1
       print I1
       getstderr P2
       getfd I2, P2
       print I2
       end
CODE

1; # HONK
