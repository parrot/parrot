use Parrot::Test tests => 1;

output_is(<<'CODE', <<'OUTPUT', "integer literals");
        print 0x2A
        print "\n"
        print 0X2A
        print "\n"
        print 0b101010
        print "\n"
        print 0B101010
        print "\n"
        end
CODE
42
42
42
42
OUTPUT
