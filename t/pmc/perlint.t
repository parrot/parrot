#! perl -w

use Parrot::Test tests => 4;
use Test::More qw(skip);
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
    set P0, 7
    bor P0, 8
    set I0, P0
    eq I0,15,ok_1
    print "not("
    print I0
    print ") "
ok_1:
    print "ok 1\n"
    new P1, .PerlNum
    set P1, 47.11
    set P0, 7
    bor P1, P0, 8
    set I0, P1
    eq I0,15,ok_2
    print "not("
    print I0
    print ") "
ok_2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT
