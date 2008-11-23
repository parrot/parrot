#! perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 16;

=head1 NAME

t/pmc/array.t - Array PMC

=head1 SYNOPSIS

    % prove t/pmc/array.t

=head1 DESCRIPTION

Tests C<Array> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting array size" );
    new P0, 'Array'

    set I0,P0
    eq I0,0,OK_1
    print "not "
OK_1:    print "ok 1\n"

    set P0,1
    set I0,P0
    eq I0,1,OK_2
    print "not "
OK_2:    print "ok 2\n"

    set P0,2
    set I0,P0
    eq I0,2,OK_3
    print "not "
OK_3:    print "ok 3\n"

    new P1, 'Integer'
    set P1, 3
    set P0,P1
    set I0,P0
    eq I0,3,OK_4
    print "not "
OK_4:    print "ok 4\n"


        end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting first element" );
    new P0, 'Array'
    set P0, 1

    set P0[0],-7
    set I0,P0[0]
    eq I0,-7,OK_1
    print "not "
OK_1:    print "ok 1\n"

    set P0[0],3.7
    set N0,P0[0]
    eq N0,3.7,OK_2
    print "not "
OK_2:    print "ok 2\n"

    set P0[0],"Buckaroo"
    set S0,P0[0]
    eq S0,"Buckaroo",OK_3
    print "not "
OK_3:    print "ok 3\n"

    end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting second element" );
    new P0, 'Array'
    set P0, 2

    set P0[1], -7
    set I0, P0[1]
    eq I0,-7,OK_1
    print "not "
OK_1:    print "ok 1\n"

    set P0[1], 3.7
    set N0, P0[1]
    eq N0,3.7,OK_2
    print "not "
OK_2:    print "ok 2\n"

    set P0[1],"Buckaroo"
    set S0, P0[1]
    eq S0,"Buckaroo",OK_3
    print "not "
OK_3:    print "ok 3\n"

    end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "Setting out-of-bounds elements" );
    new P0, 'Array'
    set P0, 1

    set P0[1], -7

    end
CODE
/^Array index out of bounds!
current instr/
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "Getting out-of-bounds elements" );
    new P0, 'Array'
    set P0, 1

    set I0, P0[1]
    end
CODE
/^Array index out of bounds!
current instr/
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "defined" );
    new P0, 'Array'
    defined I0, P0
    print I0
    print "\n"
    defined I0, P1
    print I0
    print "\n"
    set P0, 5
    set P0[0], 1
    defined I0, P0[0]
    print I0
    print "\n"
    defined I0, P0[1]
    print I0
    print "\n"
    defined I0, P0[100]
    print I0
    print "\n"
    new P1, 'Undef'
    set P0[2], P1
    defined I0, P0[2]
    print I0
    print "\n"
    new P2, 'Key'
    set P2, 3
    set P0[3], 4
    defined I0, P0[P2]
    print I0
    print "\n"
    set P2, 4
    defined I0, P0[P2]
    print I0
    print "\n"
    end
CODE
1
0
1
0
0
0
1
0
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "exists" );
    new P0, 'Array'
    set P0, 5
    set P0[0], 1
    exists I0, P0[0]
    print I0
    print "\n"
    exists I0, P0[1]
    print I0
    print "\n"
    exists I0, P0[100]
    print I0
    print "\n"
    new P1, 'Undef'
    set P0[2], P1
    exists I0, P0[2]
    print I0
    print "\n"
    new P2, 'Key'
    set P2, 3
    set P0[3], 4
    exists I0, P0[P2]
    print I0
    print "\n"
    set P2, 4
    exists I0, P0[P2]
    print I0
    print "\n"
    end
CODE
1
0
0
1
1
0
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "Set via PMC keys, access via INTs" );
     .include 'include/fp_equality.pasm'
     new P0, 'Array'
     set P0, 4
     new P1, 'Key'

     set P1, 0
     set P0[P1], 25

     set P1, 1
     set P0[P1], 2.5

     set P1, 2
     set P0[P1], "Squeek"

     set P1, 3
     new P2, 'Hash'
     set P2["a"], "apple"
     set P0[P1], P2

     set I0, P0[0]
     eq I0, 25, OK1
     print "not "
OK1: print "ok 1\\n"

     set N0, P0[1]
     .fp_eq_pasm(N0, 2.5, OK2)
     print "not "
OK2: print "ok 2\\n"

     set S0, P0[2]
     eq S0, "Squeek", OK3
     print "not "
OK3: print "ok 3\\n"

     set P3, P0[3]
     set S1, P3["a"]
     eq S1, "apple", OK4
     print "not "
OK4: print "ok 4\\n"

     end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "Set via INTs, access via PMC Keys" );
     .include 'include/fp_equality.pasm'
     new P0, 'Array'
     set P0, 1024

     set P0[25], 125
     set P0[128], -9.9
     set P0[513], "qwertyuiopasdfghjklzxcvbnm"
     new P1, 'Integer'
     set P1, 123456
     set P0[1023], P1

     new P2, 'Key'
     set P2, 25
     set I0, P0[P2]
     eq I0, 125, OK1
     print "not "
OK1: print "ok 1\\n"

     set P2, 128
     set N0, P0[P2]
     .fp_eq_pasm(N0, -9.9, OK2)
     print "not "
OK2: print "ok 2\\n"

     set P2, 513
     set S0, P0[P2]
     eq S0, "qwertyuiopasdfghjklzxcvbnm", OK3
     print "not "
OK3: print "ok 3\\n"

     set P2, 1023
     set P3, P0[P2]
     set I1, P3
     eq I1, 123456, OK4
     print "not "
OK4: print "ok 4\\n"

     end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is( <<'CODE', <<OUT, "multikeyed access I arg" );
    new P0, 'Array'
    set P0, 1
    new P1, 'Array'
    set P1, 1
    set P0[0], P1
    set P0[0;0], 20
    set P2, P0[0]
    typeof S0, P2
    print S0
    print "\n"
    set I2, P0[0;0]
    print I2
    set I3, 0
    set I2, P0[I3;0]
    print I2
    set I2, P0[0;I3]
    print I2
    set I2, P0[I3;I3]
    print I2
    print "\n"
    end
CODE
Array
20202020
OUT

pasm_output_is( <<'CODE', <<OUT, "multikeyed access P arg" );
    new P0, 'Array'
    set P0, 1
    new P1, 'Array'
    set P1, 1
    new P3, 'Integer'
    set P3, 20
    set P0[0], P1
    set P0[0;0], P3
    set P2, P0[0]
    typeof S0, P2
    print S0
    print "\n"
    set I2, P0[0;0]
    print I2
    set I3, 0
    set I2, P0[I3;0]
    print I2
    set I2, P0[0;I3]
    print I2
    set I2, P0[I3;I3]
    print I2
    print "\n"
    end
CODE
Array
20202020
OUT

pasm_output_is( <<'CODE', <<OUT, "delete" );
    new P0, 'Array'
    set P0, 3
    set P0[0], 10
    set P0[1], 20
    set P0[2], 30

    delete P0[1]
    set I0, P0
    print I0

    set I0, P0[0]
    print I0
    set I0, P0[1]
    print I0
    print "\n"
    end
CODE
21030
OUT

pir_output_is( << 'CODE', << 'OUTPUT', "check whether interface is done" );

.sub _main
    .local pmc pmc1
    pmc1 = new 'Array'
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\n"
    does bool1, pmc1, "array"
    print bool1
    print "\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
0
1
0
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', "get_bool" );

.sub _main
    .local pmc p
    .local int i
    p = new 'Array'

    if p goto L1
    print "not "
L1: say "true"

    p = 4

    if p goto L2
    print "is not "
L2: say "true"


    p[0] = 2
    if p goto L3
    print "not "
L3: say "true"

    p = new 'Array'
    p = 0
    if p goto L4
    print "not "
L4: say "true"

.end
CODE
not true
true
true
not true
OUTPUT

TODO: {
    local $TODO = "freeze/thaw known to be broken";
pir_output_is( << 'CODE', << 'OUTPUT', "freeze/thaw" );
.sub main
    .local pmc p, it, val
    .local string s

    p = new 'Array'

    unshift p, 2
    unshift p, "foo"
    unshift p, 9999
    unshift p, -3
    unshift p, "p"

    s = freeze p
    p = thaw s

    it = iter p

iter_loop:
    unless it goto iter_end
    val = shift it
    print val
    print "\n"
    goto iter_loop

iter_end:

.end
CODE
p
-3
9999
foo
2
OUTPUT
}

pir_output_is( << 'CODE', << 'OUTPUT', "array comparison" );
.sub main
    .local pmc a1, a2
    .local int i

    a1 = new 'Array'
    a2 = new 'Array'

    if a1 == a2 goto L1
    print "not "
L1: say "equal"

    a1 = 4

    if a1 == a2 goto L2
    print "not "
L2: say "equal"

    a2 = 4

    a1[0] = "foo"
    a2[0] = "foo"

    if a1 == a2 goto L3
    print "not "
L3: say "equal"

    a1[1] = 234
    a2[1] = 234
    a1[3] = "bar"
    a2[3] = "bar"

    if a1 == a2 goto L4
    print "not "
L4: say "equal"

.end
CODE
equal
not equal
equal
equal
OUTPUT

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
