#! perl
# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 38;

=head1 NAME

t/pmc/perlhash.t - testing the PerlHash PMC

=head1 SYNOPSIS

    % prove t/pmc/perlhash.t

=head1 DESCRIPTION

Tests the C<PerlHash> PMC. Checks key access with various types of
normal and potentially hazardous keys. Does a bit of stress testing as
well.

=cut

my $load_perl = <<'END_PASM';
    loadlib P20, 'perl_group'
    find_type I21, 'PerlArray'
    find_type I23, 'PerlHash'
    find_type I24, 'PerlInt'
    find_type I25, 'PerlNum'
    find_type I27, 'PerlString'
    find_type I28, 'PerlUndef'
END_PASM

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', 'Initial PerlHash tests');
    new    P0, I23

    set    P0["foo"], -7
    set    P0["bar"], 3.5
    set    P0["baz"], "value"

    set    I0, P0["foo"]
    set    N0, P0["bar"]
    set    S0, P0["baz"]

    eq    I0,-7,OK_1
    print    "not "
OK_1:    print    "ok 1\n"
    eq    N0,3.500000,OK_2
    print    N0
OK_2:    print    "ok 2\n"
    eq    S0,"value",OK_3
    print    S0
OK_3:    print    "ok 3\n"

    set    S1, "oof"
    set    S2, "rab"
    set    S3, "zab"

    set    P0[S1], 7
    set    P0[S2], -3.5
    set    P0[S3], "VALUE"

    set    I0, P0[S1]
    set    N0, P0[S2]
    set    S0, P0[S3]

    eq    I0,7,OK_4
    print    "not "
OK_4:    print    "ok 4\n"
    eq    N0,-3.500000,OK_5
    print    N0
OK_5:    print    "ok 5\n"
    eq    S0,"VALUE",OK_6
    print    S0
OK_6:    print    "ok 6\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', 'more than one PerlHash');
    new P0, I23
    set S0, "key"
    set P0[S0], 1

    new P1, I23
    set S1, "another_key"
    set P1[S1], 2

    set I0, P0[S0]
    set I1, P1[S1]

    print I0
    print "\n"
    print I1
    print "\n"
    end
CODE
1
2
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', 'hash keys with nulls in them');
    new P0, I23
    set S0, "parp\0me"
    set S1, "parp\0you"

    set P0[S0], 1    # $P0{parp\0me} = 1
    set P0[S1], 2    # $P0{parp\0you} = 2

    set I0, P0[S0]
    set I1, P0[S1]

    print I0
    print "\n"
    print I1
    print "\n"
    end
CODE
1
2
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', 'nearly the same hash keys');
    new P0, I23
    set S0, "a\0"
    set S1, "\0a"

    set P0[S0], 1
    set P0[S1], 2

    set I0, P0[S0]
    set I1, P0[S1]

    print I0
    print "\n"
    print I1
    print "\n"

    end
CODE
1
2
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', 'The same hash keys');
    new P0, I23
    set S0, "Happy"
    set S1, "Happy"

    set P0[S0], 1
    set I0, P0[S0]
    print I0
    print "\n"

    set P0[S1], 2
    set I1, P0[S1]

    print I1
    print "\n"

    end
CODE
1
2
OUTPUT

# NB Next test depends on "key2" hashing to zero, which it does with
# the current algorithm; if the algorithm changes, change the test!

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', 'key that hashes to zero');
    new P0, I23
    set S0, "key2"
    set P0[S0], 1
    set I0, P0[S0]
    print I0
    print "\n"
    end
CODE
1
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "size of the hash");
    new P0, I23

    set P0["0"], 1
    set I0, P0
    print I0
    print "\n"

    set P0["1"], 1
    set I0, P0
    print I0
    print "\n"

    set P0["0"], 1
    set I0, P0
    print I0
    print "\n"

    end
CODE
1
2
2
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "stress test: loop(set, check)");
    new    P0, I23

    set I0, 200
    set S0, "mikey"
    set P0[S0], "base"
    concat S1, S0, "s"
    set P0[S1], "bases"
    set S2, I0
    concat S1, S0, S2
    set P0[S1], "start"
    set S3, P0["mikey"]
    print S3
    print "\n"
    set S3, P0["mikeys"]
    print S3
    print "\n"
    set S3, P0["mikey200"]
    print S3
    print "\n"
LOOP:
    eq I0, 0, DONE
    sub I0, I0, 1
    set S2, I0
    concat S1, S0, S2
    concat S4, S0, S2
    eq S1, S4, L1
    print "concat mismatch: "
    print S1
    print " vs "
    print S4
    print "\n"
L1:
    set P0[S1], I0
    set I1, P0[S1]
    eq I0, I1, L2
    print "lookup mismatch: "
    print I0
    print " vs "
    print I1
    print "\n"
L2:
    branch LOOP
DONE:
    set I0, P0["mikey199"]
    print I0
    print "\n"
    set I0, P0["mikey117"]
    print I0
    print "\n"
    set I0, P0["mikey1"]
    print I0
    print "\n"
    set I0, P0["mikey23"]
    print I0
    print "\n"
    set I0, P0["mikey832"]
    print I0
    print "\n"
    end
CODE
base
bases
start
199
117
1
23
0
OUTPUT

# Check all values after setting all of them
pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "stress test: loop(set), loop(check)");
    new    P0, I23

    set I0, 200
    set S0, "mikey"
SETLOOP:
    eq I0, 0, DONE
    sub I0, I0, 1
    set S2, I0
    concat S1, S0, S2
    set P0[S1], I0
    branch SETLOOP

    set I0, 200
GETLOOP:
    eq I0, 0, DONE
    sub I0, I0, 1
    set S2, I0
    concat S1, S0, S2
    set I1, P0[S1]
    eq I0, I1, L2
    print "lookup mismatch: "
    print I0
    print " vs "
    print I1
    print "\n"
L2:
    branch GETLOOP

DONE:
    print "done\n"
    end
CODE
done
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "Testing two hash indices with integers at a time");
    new P0, I23

    set P0["foo"],37
    set P0["bar"],-15

    set I0,P0["foo"]
    eq I0,37,OK_1
    print "not "
OK_1: print "ok 1\n"

    set I0,P0["bar"]
    eq I0,-15,OK_2
    print "not "
OK_2: print "ok 2\n"

    set S1,"foo"
    set I0,P0[S1]
    eq I0,37,OK_3
    print "not "
OK_3: print "ok 3\n"

    set S1,"bar"
    set I0,P0[S1]
    eq I0,-15,OK_4
    print "not "
OK_4: print "ok 4\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "Testing two hash indices with numbers at a time");
    new P0, I23

    set P0["foo"],37.100000
    set P0["bar"],-15.100000

    set N0,P0["foo"]
    eq N0,37.100000,OK_1
    print "not "
OK_1: print "ok 1\n"

    set N0,P0["bar"]
    eq N0,-15.100000,OK_2
    print "not "
OK_2: print "ok 2\n"

    set S1,"foo"
    set N0,P0[S1]
    eq N0,37.100000,OK_3
    print "not "
OK_3: print "ok 3\n"

    set S1,"bar"
    set N0,P0[S1]
    eq N0,-15.100000,OK_4
    print "not "
OK_4: print "ok 4\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "Testing two hash indices with strings at a time");
    new P0, I23

    set P0["foo"],"baz"
    set P0["bar"],"qux"

    set S0,P0["foo"]
    eq S0,"baz",OK_1
    print "not "
OK_1: print "ok 1\n"

    set S0,P0["bar"]
    eq S0,"qux",OK_2
    print "not "
OK_2: print "ok 2\n"

    set S1,"foo"
    set S0,P0[S1]
    eq S0,"baz",OK_3
    print "not "
OK_3: print "ok 3\n"

    set S1,"bar"
    set S0,P0[S1]
    eq S0,"qux",OK_4
    print "not "
OK_4: print "ok 4\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT


# So far, we have only used INTVALs, FLOATVALs and STRINGs as values
# and/or keys. Now we try PMCs.

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "Setting & getting scalar PMCs");
    new P0, I23
    new P1, I24
    new P2, I24

    set S0, "non-PMC key"

    set P1, 10
    set P0[S0], P1
    set P2, P0[S0]
    eq P2, P1, OK1
    print "not "
OK1:  print "ok 1\n"

    set P1, -1234.000000
    set P0[S0], P1
    set P2, P0[S0]
    eq P2, P1, OK2
    print "not "
OK2:  print "ok 2\n"

    set P1, "abcdefghijklmnopq"
    set P0[S0], P1
    set P2, P0[S0]
    eq P2, P1, OK3
    print "not "
OK3:  print "ok 3\n"

    new P1, I28
    set P0[S0], P1
    set P2, P0[S0]
    typeof S1, P2
    eq S1, "PerlUndef", OK4
    print "not "
OK4:  print "ok 4\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "Setting scalar PMCs & getting scalar values");
    new P0, I23
    new P1, I24

    set S0, "A rather large key"

    set I0, 10
    set P1, I0
    set P0[S0], P1
    set I1, P0[S0]
    eq I1, I0, OK1
    print "not "
OK1:  print "ok 1\n"

    set N0, -1234.000000
    set P1, N0
    set P0[S0], P1
    set N1, P0[S0]
    eq N1, N0, OK2
    print "not "
OK2:  print "ok 2\n"

    set S1, "abcdefghijklmnopq"
    set P1, S1
    set P0[S0], P1
    set S2, P0[S0]
    eq S2, S1, OK3
    print "not "
OK3:  print "ok 3\n"

    end
CODE
ok 1
ok 2
ok 3
OUTPUT

pir_output_is(<<"CODE", <<'OUTPUT', "Getting values from undefined keys");

.HLL 'Perl', ''

.sub test :main
$load_perl

    new P2, I23

    set I0, P2["qwerty"]
    set N0, P2["asdfgh"]
    set S0, P2["zxcvbn"]
    set P0, P2["123456"]

    eq I0, 0, OK1
    print "not "
OK1:  print "ok 1\\n"

    eq N0, 0.0, OK2
    print "not "
OK2:  print "ok 2\\n"

    eq S0, "", OK3
    print "not "
OK3:  print "ok 3\\n"

    typeof S1, P0
    eq S1, "PerlUndef", OK4
    print S1
    print "not "
OK4:  print "ok 4\\n"
.end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "Setting & getting non-scalar PMCs");
    new P0, I23
    new P1, I21
    new P2, I21
    set P1[4],"string"
    set P0["one"],P1
    set P2,P0["one"]
    set S0,P2[4]
    print S0
    print "\n"
    end
CODE
string
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "Testing clone");
    new P0, I23
    set S0, "a"
    set P0[S0], S0
    new P2, I21
    set P2, 2
    set P0["b"], P2

    # P0 = { a => "a", b => [undef, undef] }

    clone P1, P0
    set P0["c"], 4
    set P3, P0["b"]
    set P3, 3
    set P0["b"], P3
    set P1["a"], "A"

    # P0 = { a => "a", b => [undef, undef, undef], c => 4 }
    # P1 = { a => "A", b => [undef, undef] }

    set S0, P0["a"]
    eq S0, "a", ok1
    print "not "
ok1:
    print "ok 1\n"

    set P5, P0["b"]
    set I0, P5
    eq I0, 3, ok2
    print "not "
ok2:
    print "ok 2\n"

    set I0, P0["c"]
    eq I0, 4, ok3
    print "not "
ok3:
    print "ok 3\n"

    set S0, P1["a"]
    eq S0, "A", ok4
    print "not "
ok4:
    print "ok 4\n"

    set P5, P1["b"]
    set I0, P5
    eq I0, 2, ok5
    print "not ("
    print I0
    print ") "
ok5:
    print "ok 5\n"

# XXX: this should return undef or something, but it dies instead.
#    set P3, P0["c"]
#    unless P3, ok6
#    print "not "
# ok6:
#    print "ok 6\n"
    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "Compound keys");
    new P0, I23
    new P1, I23
    new P2, I21
    set P1["b"], "ab"
    set P0["a"], P1
    set S0, P0["a";"b"]
    eq S0, "ab", ok1
    print "not "
ok1:
    print "ok 1\n"
    set P2[20], 77
    set P1["n"], P2
    set I0, P0["a";"n";20]
    eq I0, 77, ok2
    print "not "
ok2:
    print "ok 2\n"
    set S0, "a"
    set S1, "n"
    set I0, 20
    set I0, P0[S0;S1;I0]
    eq I0, 77, ok3
    print "not "
ok3:
    print "ok 3\n"
    set P0["c"], P2
    set P2[33], P1
    set S0, P0["c";33;"b"]
    eq S0, "ab", ok4
    print "not "
ok4:
    print "ok 4\n"
    set S0, "c"
    set I1, 33
    set S2, "b"
    set S0, P0[S0;I1;S2]
    eq S0, "ab", ok5
    print "not "
ok5:
    print "ok 5\n"
    set P1["b"], 47.11
    set N0, P0["c";I1;S2]
    eq N0, 47.11, ok6
    print "not "
ok6:
    print "ok 6\n"
    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "Getting PMCs from compound keys");
    new P0, I23
    new P1, I23
    new P2, I24
    set P2, 12
    set P1["b"], P2
    set P0["a"], P1
    set P3, P0["a";"b"]
    print P3
    print "\n"
    end
CODE
12
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "Getting PMCs from string;int compound keys");
    new P0, I23
    new P1, I23
    new P2, I24
    set P2, 4
    set P1[9], P2
    set I0, P1[9]
    print I0
    print "\n"
    set P0["a"], P1
    set I0, P0["a";9]
    print "Four is "
    print I0
    print "\n"
    end
CODE
4
Four is 4
OUTPUT

# A hash is only false if it has size 0

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "if (PerlHash)");
    new P0, I23

    if P0, BAD1
    print "ok 1\n"
    branch OK1
BAD1: print "not ok 1\n"
OK1:

    set P0["key"], "value"
    if P0, OK2
    print "not "
OK2:  print "ok 2\n"

    set P0["key"], ""
    if P0, OK3
    print "not "
OK3:  print "ok 3\n"

    new P1, I28
    set P0["key"], P1
    if P0, OK4
    print "not "
OK4:  print "ok 4\n"

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "unless (PerlHash)");
    new P0, I23

    unless P0, OK1
    print "not "
OK1:  print "ok 1\n"

    set P0["key"], "value"
    unless P0, BAD2
    print "ok 2\n"
    branch OK2
BAD2: print "not ok 2"
OK2:

    set P0["key"], "\0"
    unless P0, BAD3
    print "ok 3\n"
    branch OK3
BAD3: print "not ok 3"
OK3:

    new P1, I28
    set P0["key"], P1
    unless P0, BAD4
    print "ok 4\n"
    branch OK4
BAD4: print "not ok 4"
OK4:

    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "defined");
    new P0, I23
    defined I0, P0
    print I0
    print "\n"
    defined I0, P1
    print I0
    print "\n"
    set P0["a"], 1
    defined I0, P0["a"]
    print I0
    print "\n"
    defined I0, P0["b"]
    print I0
    print "\n"
    new P1, I28
    set P0["c"], P1
    defined I0, P0["c"]
    print I0
    print "\n"
    end

CODE
1
0
1
0
0
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "exists");
    new P0, I23
    set P0["a"], 1
    exists I0, P0["a"]
    print I0
    print "\n"
    exists I0, P0["b"]
    print I0
    print "\n"
    new P1, I28
    set P0["c"], P1
    exists I0, P0["c"]
    print I0
    print "\n"
    end

CODE
1
0
1
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "delete");
    new P0, I23
    set P0["a"], 1
    exists I0, P0["a"]
    print I0
    print "\n"
    delete P0["a"]
    exists I0, P0["a"]
    print I0
    print "\n"
    end
CODE
1
0
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "Cloning keys");
    new P10, I23
    new P1, .Key

    set P1, "Bar"
    set P10[P1], "Food\n"
    clone P2, P1
    set S0, P10[P2]
    print S0

    set S1, "Baa"
    set P10[S1], "Sheep\n"
    clone S2, S1
    set S0, P10[S2]
    print S0

    end
CODE
Food
Sheep
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "Cloning PMC vals");
    new P10, I23
    new P1, I28
    set P1, "value\n"
    set P10["str"], P1
    new P1, I28
    set P1, 42
    set P10["int"], P1
    clone P2, P10
    set P0, P2["int"]
    print P0
    set P0, P2["str"]
    print P0
    end
CODE
42value
OUTPUT

pir_output_is(<<"CODE", <<'OUTPUT', "entry types - type_keyed");

# no need to load a lib, as Perl* PMCs are still static
.HLL 'Perl', ''    

.include "pmctypes.pasm"

.sub test :main
$load_perl
    new P1, I23
    new P2, I24
    set P1["PerlInt"], P2
    typeof I0, P1["PerlInt"]
    eq I0, I24, ok1
    print "not "
ok1:print "PerlInt\\n"

    new P3, .Integer
    set P1["Integer"], P3
    typeof I0, P1["Integer"]
    eq I0, .Integer, ok2
    print "not "
ok2:print "Integer\\n"

    set P1["native int"], -123456
    typeof I0, P1["native int"]
    eq I0, I24, ok3
    print "not "
ok3:print "PerlInt\\n"

    set P1["native float"], -123.456
    typeof I0, P1["native float"]
    eq I0, I25, ok4
    print "not "
ok4:print "PerlNum\\n"

    set P1["native string"], "hello world\\n"
    typeof I0, P1["native string"]
    eq I0, I27, ok5
    print "not "
ok5:print "PerlString\\n"

.end
CODE
PerlInt
Integer
PerlInt
PerlNum
PerlString
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "delete and free_list");
    set I2, 10
    set I1, 1
    new P0, .SArray
    set P0, 1
    new P1, I23
outer:
    set P0[0], I1
    sprintf S0, "ok %vd\n", P0
    set P1[S0], S0
    set I0, 100
lp:
    set P1["key"], 1
    delete P1["key"]
    dec I0
    if I0, lp

    set S1, P1[S0]
    print S1
    inc I1
    le I1, I2, outer
    set I0, P1
    print I0
    print "\n"
    end

CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
10
OUTPUT

pir_output_is(<<"CODE", '', 'entry types - type_keyed');

# perl_group.so is loaded in 'test'
.HLL 'Perl', ''    

.sub test :main
$load_perl
    new P0, I23
    set P1, P0["no"]
    print P1
    set P1, "one"
    set P2, P0["nada"]
    print P2
.end
CODE

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "exists with constant string key");
    new P16, I23
    set P16["key1"], "value for key1\n"
    set S16, P16["key1"]
    print S16
    set I16, 777777777
    print I16
    print "\n"
    exists I17, P16["key1"]
    print I17
    print "\n"
    exists I17, P16["no such"]
    print I17
    print "\n"
    end

CODE
value for key1
777777777
1
0
OUTPUT

SKIP: {
skip("no more chartype", 1);
pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "compare keys with different type");
    set S0, "\xA4"    # currency/euro depending on type
    clone S1, S0
    find_chartype I0, "8859-1"
    set_chartype S0, I0
    find_chartype I0, "8859-15"
    set_chartype S1, I0

    ord I0, S0    # both have the same ord
    print I0
    print "\n"
    ord I0, S1
    print I0
    print "\n"

    eq S0, S1, equal    # but are not equal
    print "not "
equal:
    print "equal\n"

    new P0, I23
    set P0[S0], "currency"
    set P0[S1], "euro"
    set S2, P0[S0]
    print S2
    print "\n"
    set S2, P0[S1]
    print S2
    print "\n"
    end
CODE
164
164
not equal
currency
euro
OUTPUT
}

pir_output_is(<<"CODE", <<'OUTPUT', "PerlHash in PIR");

.sub 'test' :main
$load_perl
    .local pmc hash1
    hash1 = new I23
    hash1['X'] = 'U'
    .local string val1
    val1 = hash1['X']
    print val1
    print "\\n"
    end
.end
CODE
U
OUTPUT

pir_output_is(<<"CODE", <<'OUTPUT', 'Setting with compound keys');

.sub 'test' :main
$load_perl
    .local pmc outer_hash
    outer_hash = new I23
    .local pmc inner_hash
    inner_hash = new I23
    .local pmc inner_array
    inner_array = new I21
    .local string elem_string
    .local int    elem_int
    .local pmc    elem_pmc
    .local num    elem_num

    # setting and retrieving strings in an inner PerlArray
    inner_array[128] = 'inner_array:128'
    outer_hash['inner_array'] = inner_array
    elem_string = outer_hash['inner_array';128]
    print elem_string
    print "\\n"
    outer_hash['inner_array';128] = 'changed inner_array:128'
    elem_string = outer_hash['inner_array';128]
    print elem_string
    print "\\n"

    # setting and retrieving strings in an inner PerlHash
    inner_hash['129'] = 'inner_hash:129'
    outer_hash['inner_hash'] = inner_hash
    elem_string = outer_hash['inner_hash';'129']
    print elem_string
    print "\\n"
    outer_hash['inner_hash';'129'] = 'changed inner_hash:129'
    elem_string = outer_hash['inner_hash';'129']
    print elem_string
    print "\\n"

    # setting and retrieving integer in an inner PerlArray
    inner_array[130] = 130
    outer_hash['inner_array'] = inner_array
    elem_int = outer_hash['inner_array';130]
    print elem_int
    print "\\n"
    outer_hash['inner_array';130] = -130
    elem_int = outer_hash['inner_array';130]
    print elem_int
    print "\\n"

    # setting and retrieving integer in an inner PerlHash
    inner_hash['131'] = 131
    outer_hash['inner_hash'] = inner_hash
    elem_int = outer_hash['inner_hash';'131']
    print elem_int
    print "\\n"
    outer_hash['inner_hash';'131'] = -131
    elem_int = outer_hash['inner_hash';'131']
    print elem_int
    print "\\n"

    # setting and retrieving a PMC in an inner PerlArray
    .local pmc in_pmc
    in_pmc = new I27
    in_pmc = 'inner_array:132'
    inner_array[132] = in_pmc
    outer_hash['inner_array'] = inner_array
    elem_pmc = outer_hash['inner_array';132]
    print elem_pmc
    print "\\n"
    in_pmc = 'changed inner_array:132'
    outer_hash['inner_array';132] = in_pmc
    elem_pmc = outer_hash['inner_array';132]
    print elem_pmc
    print "\\n"

    # setting and retrieving a PMC in an inner PerlHash
    in_pmc = 'inner_array:133'
    inner_hash['133'] = in_pmc
    outer_hash['inner_hash'] = inner_hash
    elem_string = outer_hash['inner_hash';'133']
    print elem_string
    print "\\n"
    in_pmc = 'changed inner_hash:133'
    outer_hash['inner_hash';'133'] = in_pmc
    elem_string = outer_hash['inner_hash';'133']
    print elem_string
    print "\\n"

    # setting and retrieving a float in an inner PerlArray
    inner_array[134] = 134.134
    outer_hash['inner_array'] = inner_array
    elem_num = outer_hash['inner_array';134]
    print elem_num
    print "\\n"
    outer_hash['inner_array';134] = -134.134
    elem_num = outer_hash['inner_array';134]
    print elem_num
    print "\\n"

    # setting and retrieving a float in an inner PerlHash
    inner_hash['135'] = 135.135
    outer_hash['inner_hash'] = inner_hash
    elem_num = outer_hash['inner_hash';'135']
    print elem_num
    print "\\n"
    outer_hash['inner_hash';'135'] = -135.135
    elem_num = outer_hash['inner_hash';'135']
    print elem_num
    print "\\n"
    
.end
CODE
inner_array:128
changed inner_array:128
inner_hash:129
changed inner_hash:129
130
-130
131
-131
inner_array:132
changed inner_array:132
inner_array:133
changed inner_hash:133
134.134000
-134.134000
135.135000
-135.135000
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "mutating the lookup string");
    new P0, I23
    set P0["a"], "one"
    set P0["ab"], "two"
    set P0["abc"], "three"

    set S0, "a"
    set S1, P0[S0]
    print S1
    print "\n"

    concat S0, "b"
    set S1, P0[S0]
    print S1
    print "\n"

    concat S0, "c"
    set S1, P0[S0]
    print S1
    print "\n"

    end
CODE
one
two
three
OUTPUT

pir_output_is(<<"CODE", <<'OUTPUT', 'check whether interface is done');

.sub 'test' :main
$load_perl

    .local pmc pmc1
    pmc1 = new I23
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\\n"
    does bool1, pmc1, "hash"
    print bool1
    print "\\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\\n"
    end
.end
CODE
0
1
0
OUTPUT

pir_output_is(<<"CODE", <<'OUTPUT', 'iter');

.sub 'test' :main
$load_perl
    new P0, I23
    set P0['a'], 'x'
    iter P1, P0
    if P1 goto ok1
    print "Not empty?\\n"
    shift P2, P1
    print P2
    print "\\n"
ok1:
    iter P1, P0
    shift P2, P1
    print P2
    print "\\n"
    unless P1 goto ok2
    print "Surprise!\\n"
ok2:
    end
.end
CODE
a
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', 'PerlHash iterator');
    .include "iterator.pasm"
	new P0, I23	# Hash for iteration
	new P2, I23	# for test

	set I0, 65
	set I1, 35
	set I10, I1
fill:
	chr S0, I0
	set P0[S0], I0
	# XXX
	# swapping the next two lines breaks JIT/i386
	# the reason is the if/unless optimization: When the
	# previous opcode sets flags, these are used - but
	# there is no check, that the same register is used in the "if".
	inc I0
	dec I1
	if I1, fill

	new P1, .Iterator, P0
	set I0, P1
	eq I0, I10, ok1
	print "not "
ok1:
	print "ok 1\n"
	set P1, .ITERATE_FROM_START
get:
	unless P1, done
        shift S3, P1		# get hash.key
	set I0, P0[S3]		# and value
	set P2[S3], I0
	branch get

done:
	set I0, P2
	eq I0, I10, ok2
	print "not "
ok2:
	print "ok 2\n"
	end
CODE
ok 1
ok 2
OUTPUT

1;
