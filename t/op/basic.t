#! perl -w

use Parrot::Test tests => 7;

# It would be very embarrassing if these didn't work...
output_is(<<'CODE', '', "noop, end");
	noop
	end
CODE

output_is(<<'CODE', '1', "print 1");
	print	1
	end
CODE

output_is(<<'CODE', 'Parrot flies', "print string");
	print 'Parrot flies'
	end
CODE

output_is(<<'CODE', 'Parrot flies', "print double-quoted string");
       print "Parrot flies"
       end
CODE

output_is(<<'CODE', 'Parrot	flies', "print double-quoted string, tabs");
       print "Parrot\tflies"
       end
CODE

output_is( <<'CODE', '42', "branch_ic" );
	set	I4, 42
	branch	HERE
	set	I4, 1234
HERE:
	print	I4
	end
CODE

output_is( <<'CODE', <<OUTPUT, "jump" );
neg         macro   R
            set     I0, R
            set     R, 0
            sub     R, R, I0
endm

call        macro   R, D
            set     R, [D - @ - 3]
            jump    R
endm

return      macro   R, D
            neg     R
            inc     R, [D - @ - 1]
            jump    R
endm

MAIN:       set     I1, 42
            call    I31, PRINTIT
            set     I1, 1234
            call    I31, PRINTIT
            end

PRINTIT:    print        I1
            print   "\n"
            return  I31, PRINTIT
CODE
42
1234
OUTPUT
