#! perl -w

use Parrot::Test tests => 6;
use Parrot::PMC '%pmc_types';
my $perlint = $pmc_types{'PerlInt'};
my $ok = '"ok 1\n"';

output_is(<<"CODE", <<'OUTPUT', "type");
    new P0,.PerlInt
# type
    typeof I0,P0
    eq I0,$perlint,ok_1
    print "not "
ok_1:
    print $ok
    end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "inheritance");
    new P0,.PerlInt
# clone
    set P0, 10
    clone P1, P0
    set P1, 20
    set I0, P0
    eq I0,10,ok_1
    print "not "
ok_1:
    print "ok 1\n"
    set I0, P1
    eq I0,20,ok_2
    print "not "
ok_2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

SKIP: { skip("add_keyed: not yet", 1);
output_is(<<'CODE', <<'OUTPUT', "add_keyed");
# add keyed
    new P2, .PerlArray
    set P2[10], 10
    set P0, 20
    new P11, .Key
    new P12, .Key
    new P13, .Key
    set P12,10
    add P1[P11],P2[P12],P0[P13]
    set I1,P1
    eq I1,30,ok_3
    print "not "
ok_3:
    print "ok 1\n"

    end
CODE
ok 1
OUTPUT
}

output_is(<<'CODE', <<'OUTPUT', "bor");
    new P0, .PerlInt
    set P0, 0b11110000
    bor P0, 0b00001111
    print P0
    print "\n"

    new P1, .PerlInt
    set P0, 0
    set P1, 12
    bor P0, P1
    print P0
    print "\n"

    new P1, .PerlNum
    set P1, 47.11
    set P0, 7
    bor P1, P0, 8
    print P1
    print "\n"

    new P2, .PerlString
    set P2, "String"
    set P0, 128
    set P1, 1
    bor P2, P0, P1
    print P2
    print "\n"

    new P4, .PerlUndef
    set P0, 12
    set P1, 24
    bor P4, P0, P1
    print P4
    print "\n"
    end
CODE
255
12
15
129
28
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "band");
    new P0, .PerlInt
    set P0, 0b10101010
    band P0, 0b10011001
    print P0
    print "\n"

    new P1, .PerlInt
    new P2, .PerlInt
    set P1, 255
    set P2, 29
    band P1, P2
    print P1
    print "\n"

    new P3, .PerlNum
    set P3, 3.14
    set P1, 0b00001111
    set P2, 0b00001100
    band P3, P1, P2
    print P3
    print "\n"

    new P3, .PerlString
    set P3, "Foo"
    band P3, P1, 0b00001100
    print P3
    print "\n"

    new P3, .PerlUndef
    set P1, 100
    set P2, 100
    band P3, P1, P2
    print P3
    print "\n"
    end
CODE
136
29
12
12
100
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "inc/dec a PerlUndef");
    new P0, .PerlUndef
    new P1, .PerlUndef
    inc P0
    print P0
    inc P0
    print P0
    dec P1
    print P1
    dec P1
    print P1
    print "\n"
    end
CODE
12-1-2
OUTPUT

