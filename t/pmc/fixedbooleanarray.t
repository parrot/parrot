#! perl
# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 13;

=head1 NAME

t/pmc/fixedbooleanarray.t - FixedBooleanArray PMC

=head1 SYNOPSIS

    % prove t/pmc/FixedBooleanArray.t

=head1 DESCRIPTION

Tests C<FixedBooleanArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting array size" );
    new P0, ['FixedBooleanArray']

    set I0,P0
    eq I0,0,OK_1
    print "not "
OK_1:    print "ok 1\n"

    set P0,1
    set I0,P0
    eq I0,1,OK_2
    print "not "
OK_2:    print "ok 2\n"

        end
CODE
ok 1
ok 2
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "Resetting array size (and getting an exception)" );
    new P0, ['FixedBooleanArray']

    set I0,P0
    set P0,1
    set P0,2
    print "Should have gotten an exception\n"


        end
CODE
/FixedBooleanArray: Can't resize!
current instr\.:/
OUTPUT

#VIM's syntax highlighter needs this line

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting first element" );
    new P0, ['FixedBooleanArray']
    set P0, 1

    set P0[0],-7
    set I0,P0[0]
    eq I0,1,OK_1
    print "not "
OK_1:    print "ok 1\n"

    set P0[0],3.7
    set N0,P0[0]
    eq N0,1.0,OK_2
    print "not "
OK_2:    print "ok 2\n"

    set P0[0],"17"
    set S0,P0[0]
    eq S0,"1",OK_3
    print "not "
OK_3:    print "ok 3\n"

    end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting second element" );
    new P0, ['FixedBooleanArray']
    set P0, 2

    set P0[1], -7
    set I0, P0[1]
    eq I0,1,OK_1
    print "not "
OK_1:    print "ok 1\n"

       set P0[1], 3.7
    set N0, P0[1]
    eq N0,1.0,OK_2
    print "not "
OK_2:    print "ok 2\n"

    set P0[1],"17"
    set S0, P0[1]
    eq S0,"1",OK_3
    print "not "
OK_3:    print "ok 3\n"

    end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "Setting out-of-bounds elements" );
    new P0, ['FixedBooleanArray']
    set P0, 1

    set P0[1], -7

    end
CODE
/FixedBooleanArray: index out of bounds!
current instr\.:/
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "Getting out-of-bounds elements" );
    new P0, ['FixedBooleanArray']
    set P0, 1

    set I0, P0[1]
    end
CODE
/FixedBooleanArray: index out of bounds!
current instr\.:/
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "Set via PMC keys, access via INTs" );
     .include 'include/fp_equality.pasm'
     new P0, ['FixedBooleanArray']
     set P0, 3
     new P1, ['Key']

     set P1, 0
     set P0[P1], 25

     set P1, 1
     set P0[P1], 2.5

     set P1, 2
     set P0[P1], "17"

     set I0, P0[0]
     eq I0, 1, OK1
     print "not "
OK1: print "ok 1\\n"

     set N0, P0[1]
     .fp_eq_pasm(N0, 1.0, OK2)
     print "not "
OK2: print "ok 2\\n"

     set S0, P0[2]
     eq S0, "1", OK3
     print "not "
OK3: print "ok 3\\n"

     end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "Set via INTs, access via PMC Keys" );
     .include 'include/fp_equality.pasm'
     new P0, ['FixedBooleanArray']
     set P0, 1024

     set P0[25], 125
     set P0[128], 10.2
     set P0[513], "17"
     new P1, ['Integer']
     set P1, 123456
     set P0[1023], P1

     new P2, ['Key']
     set P2, 25
     set I0, P0[P2]
     eq I0, 1, OK1
     print "not "
OK1: print "ok 1\\n"

     set P2, 128
     set N0, P0[P2]
     .fp_eq_pasm(N0, 1.0, OK2)
     print "not "
OK2: print "ok 2\\n"

     set P2, 513
     set S0, P0[P2]
     eq S0, "1", OK3
     print "not "
OK3: print "ok 3\\n"

     set P2, 1023
     set P3, P0[P2]
     set I1, P3
     eq I1, 1, OK4
     print "not "
OK4: print "ok 4\\n"

     end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "check whether interface is done" );

.sub _main
    .local pmc pmc1
    pmc1 = new ['FixedBooleanArray']
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

pasm_output_is( << 'CODE', << 'OUTPUT', "Truth" );
     new P0, ['FixedBooleanArray']
     unless P0, OK1
     print "not "
OK1: print "ok 1\n"
     set P0, 1
     if P0, OK2
     print "not "
OK2: print "ok 2\n"
     set P0[0], 0
     if P0, OK3
     print "not "
OK3: print "ok 3\n"
     end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is( << 'CODE', << 'OUTPUT', "PMC keys & values" );
     new P0, ['FixedBooleanArray']
     set P0, 2
     new P1, ['Key']
     set P1, 1
     new P2, ['Integer']
     set P2, 1
     set P0[P1], P2
     set I0, P0[P1]
     print I0
     print "\n"
     end
CODE
1
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "freeze/thaw" );
.sub main :main
    .local pmc fba
    .local int i
    .local string s

    fba = new ['FixedBooleanArray']
    fba = 17

    fba[1]  = 1
    fba[4]  = 1
    fba[8]  = 1
    fba[12] = 1
    fba[15] = 1

    say fba
    s = freeze fba
    fba.'fill'(0)
    fba = thaw s
    say fba

.end

CODE
01001000100010010
01001000100010010
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "clone" );
.sub main :main
    .local pmc fba1, fba2
    .local int i
    .local string s

    fba1 = new ['FixedBooleanArray']
    fba1 = 17

    fba1[1]  = 1
    fba1[4]  = 1
    fba1[8]  = 1
    fba1[12] = 1
    fba1[15] = 1

    say fba1
    fba2 = clone fba1
    say fba2

.end

CODE
01001000100010010
01001000100010010
OUTPUT

1;


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
