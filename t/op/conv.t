#! perl -w

use Parrot::Test tests => 5;
use Test::More;

output_is(<<'CODE', <<OUTPUT, "conv_i1_i");
    set I0, 127
    conv_i1 I0
    print I0
    print "\n"
    inc I0
    conv_i1 I0
    print I0
    print "\n"
    inc I0
    conv_i1 I0
    print I0
    print "\n"
    end
CODE
127
-128
-127
OUTPUT

output_is(<<'CODE', <<OUTPUT, "conv_u1_i");
    set I0, 127
    conv_u1 I0
    print I0
    print "\n"
    inc I0
    conv_u1 I0
    print I0
    print "\n"
    set I0, 255
    conv_u1 I0
    print I0
    print "\n"
    inc I0
    conv_u1 I0
    print I0
    print "\n"
    end
CODE
127
128
255
0
OUTPUT

output_is(<<'CODE', <<OUTPUT, "conv_i2_i");
    set I0, 32767
    conv_i2 I0
    print I0
    print "\n"
    inc I0
    conv_i2 I0
    print I0
    print "\n"
    inc I0
    conv_i2 I0
    print I0
    print "\n"
    end
CODE
32767
-32768
-32767
OUTPUT

output_is(<<'CODE', <<OUTPUT, "conv_u2_i");
    set I0, 32767
    conv_u2 I0
    print I0
    print "\n"
    inc I0
    conv_u2 I0
    print I0
    print "\n"
    set I0, 65535
    conv_u2 I0
    print I0
    print "\n"
    inc I0
    conv_u2 I0
    print I0
    print "\n"
    end
CODE
32767
32768
65535
0
OUTPUT


output_is(<<'CODE', <<OUTPUT, "conv_i1_ofv_i");
    set I0, 128
    conv_i1_ovf I0
    print I0
    print "\n"
    end
CODE
Overflow exception for conv_i1_ovf
OUTPUT

1;
