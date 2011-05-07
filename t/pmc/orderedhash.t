#! perl
# Copyright (C) 2001-2006, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 32;

=head1 NAME

t/pmc/orderedhash.t - Ordered Hash

=head1 SYNOPSIS

    % prove t/pmc/orderedhash.t

=head1 DESCRIPTION

Tests the C<OrderedHash> PMC.

=cut

pasm_output_is( <<'CODE', <<OUT, "init" );
.pcc_sub :main main:
    new P0, ['OrderedHash']
    print "ok 1\n"
    set I0, P0
    eq I0, 0, ok2
    print "not "
ok2:print "ok 2\n"
    end
CODE
ok 1
ok 2
OUT

pasm_output_is( <<'CODE', <<OUT, "set keys, get idx" );
.pcc_sub :main main:
    new P0, ['OrderedHash']
    new P1, ['String']
    set P1, "ok 1\n"
    set P0["x"], P1
    new P1, ['String']
    set P1, "ok 2\n"
    set P0["a"], P1
    new P1, ['String']
    set P1, "ok 3\n"
    set P0["j"], P1

    set I0, P0
    eq I0, 3, ok
    print "not "
ok: print "ok\n"

    set P3, P0[0]
    print P3
    set P3, P0[1]
    print P3
    set P3, P0[2]
    print P3

    set P3, P0["j"]
    print P3
    set P3, P0["x"]
    print P3
    set P3, P0["a"]
    print P3
    end
CODE
ok
ok 1
ok 2
ok 3
ok 3
ok 1
ok 2
OUT

pasm_output_is( <<'CODE', <<OUT, "iterate" );
.pcc_sub :main main:
    .include "iterator.pasm"
    new P0, ['OrderedHash']
    new P1, ['String']
    set P1, "ok 1\n"
    set P0["x"], P1
    new P1, ['String']
    set P1, "ok 2\n"
    set P0["a"], P1
    new P1, ['String']
    set P1, "ok 3\n"
    set P0["j"], P1

    iter P2, P0
    set P2, .ITERATE_FROM_START
iter_loop:
    unless P2, end_iter
    shift P3, P2
    set P4, P0[P3]
    print P4
    branch iter_loop
end_iter:

    set P2, .ITERATE_FROM_END
iter_loop2:
    unless P2, end_iter2
    pop P3, P2
    set P4, P0[P3]
    print P4
    branch iter_loop2
end_iter2:
    end
CODE
ok 1
ok 2
ok 3
ok 3
ok 2
ok 1
OUT

pasm_output_is( <<'CODE', <<OUT, "idx only" );
.pcc_sub :main main:
    new P0, ['OrderedHash']
    new P1, ['String']
    set P1, "ok 1\n"
    set P0[0], P1
    new P1, ['String']
    set P1, "ok 2\n"
    set P0[1], P1

    set P2, P0[0]
    print P2
    set P2, P0[1]
    print P2
    end
CODE
ok 1
ok 2
OUT

pasm_output_is( <<'CODE', <<OUT, "set keys, get idx - cloned" );
.pcc_sub :main main:
    new P10, ['OrderedHash']
    new P1, ['String']
    set P1, "ok 1\n"
    set P10["x"], P1
    new P1, ['String']
    set P1, "ok 2\n"
    set P10["a"], P1
    new P1, ['String']
    set P1, "ok 3\n"
    set P10["j"], P1

    clone P0, P10

    set I0, P0
    eq I0, 3, ok
    print "not "
ok: print "ok\n"

    set P3, P0[0]
    print P3
    set P3, P0[1]
    print P3
    set P3, P0[2]
    print P3

    set P3, P0["j"]
    print P3
    set P3, P0["x"]
    print P3
    set P3, P0["a"]
    print P3

    set P3, P0[-1]
    print P3
    set P3, P0[-2]
    print P3
    set P3, P0[-3]
    print P3
    end

CODE
ok
ok 1
ok 2
ok 3
ok 3
ok 1
ok 2
ok 3
ok 2
ok 1
OUT

pasm_output_is( <<'CODE', <<OUT, "exists_keyed" );
.pcc_sub :main main:
    new P0, ['OrderedHash']
    new P1, ['Integer']
    set P0["key"], P1
    exists I0, P0["key"]
    print I0
    exists I0, P0[0]
    print I0
    exists I0, P0["nokey"]
    print I0
    exists I0, P0[1]
    print I0
    new P1, ['Key']
    set P1, 0
    exists I0, P0[P1]
    print I0
    set P1, 1
    exists I0, P0[P1]
    print I0
    print "\n"
    end
CODE
110010
OUT

pasm_output_is( <<'CODE', <<OUT, "defined_keyed" );
.pcc_sub :main main:
    new P0, ['OrderedHash']
    new P1, ['Undef']
    set P0["key"], P1
    defined I0, P0["key"]
    print I0
    defined I0, P0[0]
    print I0
    defined I0, P0["nokey"]
    print I0
    defined I0, P0[1]
    print I0
    new P2, ['Key']
    set P2, 0
    defined I0, P0[P2]
    print I0
    set P2, 1
    defined I0, P0[P2]
    print I0

    set P1, 0
    defined I0, P0["key"]
    print I0
    defined I0, P0[0]
    print I0
    new P3, ['Key']
    set P3, 0
    defined I0, P0[P3]
    print I0
    set P3, 1
    defined I0, P0[P3]
    print I0

    null P1
    set P0[1], P1
    defined I0, P0[1]
    print I0

    print "\n"
    end
CODE
00000011100
OUT

pasm_output_is( <<'CODE', <<OUT, "delete" );
.pcc_sub :main main:
    .include "iterator.pasm"
    new P0, ['OrderedHash']
    new P1, ['String']
    set P1, "ok 1\n"
    set P0["x"], P1
    new P1, ['String']
    set P1, "ok 2\n"
    set P0["a"], P1
    new P1, ['String']
    set P1, "ok 3\n"
    set P0["j"], P1

    delete P0["a"]

    delete P0["idontexist"]

    iter P2, P0
    set P2, .ITERATE_FROM_START_KEYS
iter_loop:
    unless P2, end_iter
    shift S3, P2
    set P3, P2[S3]
    print P3
    branch iter_loop
end_iter:

    delete P0[0]

    set P2, .ITERATE_FROM_START_KEYS
iter_loop2:
    unless P2, end_iter2
    shift S3, P2
    set P3, P2[S3]
    print P3
    branch iter_loop2
end_iter2:
    end

CODE
ok 1
ok 3
ok 3
OUT

pasm_output_is( <<'CODE', <<'OUTPUT', "delete with int keys" );
.pcc_sub :main main:
    new P0, ['OrderedHash']
    set P0["abc"], "Foo"
    set P0["def"], 12.6
    set P0["ghi"], 5
    new P1, ['Key']
    set P1, 1
    delete P0[P1]
    exists I0, P0["abc"]
    print I0
    exists I0, P0["def"]
    print I0
    exists I0, P0["ghi"]
    print I0
    print "\n"
    end
CODE
101
OUTPUT

pasm_output_like( <<'CODE', '/[axj]/', "iterate over keys" );
.pcc_sub :main main:
    .include "iterator.pasm"
    new P0, ['OrderedHash']
    new P1, ['String']
    set P1, "ok 1\n"
    set P0["x"], P1
    new P1, ['String']
    set P1, "ok 2\n"
    set P0["a"], P1
    new P1, ['String']
    set P1, "ok 3\n"
    set P0["j"], P1

    iter P2, P0
    set P2, .ITERATE_FROM_START_KEYS
iter_loop:
    unless P2, end_iter
    shift S3, P2
    print S3
    branch iter_loop
end_iter:
    end
CODE

pasm_output_like( <<'CODE', <<'OUT', "iterate over keys, get value" );
.pcc_sub :main main:
    .include "iterator.pasm"
    new P0, ['OrderedHash']
    new P1, ['String']
    set P1, "ok 1\n"
    set P0["x"], P1
    new P1, ['String']
    set P1, "ok 2\n"
    set P0["a"], P1
    new P1, ['String']
    set P1, "ok 3\n"
    set P0["j"], P1

    iter P2, P0
    set P2, .ITERATE_FROM_START_KEYS
iter_loop:
    unless P2, end_iter
    shift S3, P2
    set P3, P2[S3]
    print P3
    branch iter_loop
end_iter:
    end
CODE
/ok \d
ok \d
ok \d/
OUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash in PIR with PMC value" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']
    .local pmc val_in
    val_in = new ['String']
    val_in = "U"
    hash1["X"] = val_in

    .local pmc val_out
    val_out = hash1['X']
    print val_out
    print "\n"

    end
.end
CODE
U
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash set_integer_keyed" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']
    hash1["X"] = 14

    .local pmc val_out
    val_out = hash1['X']
    print val_out
    print "\n"

    end
.end
CODE
14
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash set_string_keyed" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']
    .local string val1
    val1 = 'U'
    set hash1["X"], val1

    .local pmc val_out
    val_out = hash1['X']
    print val_out
    print "\n"

    end
.end
CODE
U
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash set_string_keyed" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']
    hash1["X"] = '14'

    .local pmc val_out
    val_out = hash1['X']
    print val_out
    print "\n"

    end
.end
CODE
14
OUTPUT

# actually Parrot_OrderedHash_set_string_keyed is used, why ?
pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash set_string_keyed_str" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']
    .local string key1
    key1 = 'X'

    hash1[key1] = '15'

    .local pmc val_out
    val_out = hash1[key1]
    print val_out
    print "\n"

    end
.end
CODE
15
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash set_number_keyed" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']
    .local string key1
    key1 = 'X'

    hash1[key1] = -16.16

    .local pmc val_out
    val_out = hash1[key1]
    print val_out
    print "\n"

    end
.end
CODE
-16.16
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash get_integer" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']

    .local int hash_size
    hash_size = hash1
    print hash_size
    print "\n"

    hash1['X'] = 'U'
    hash_size = hash1
    print hash_size
    print "\n"

    hash1['Y'] = 'V'
    hash_size = hash1
    print hash_size
    print "\n"

    hash1['size'] = hash_size
    hash_size = hash1
    print hash_size
    print "\n"

    end
.end
CODE
0
1
2
3
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "delete and access remaining" );
.pcc_sub :main main:
    new P0, ['OrderedHash']
    new P1, ['String']
    set P1, "A"
    set P0["a"], P1
    new P1, ['String']
    set P1, "B"
    set P0["b"], P1

    set P3, P0["b"]
    print 'P0["b"]: '
    print P3
    print "\n"
    delete P0["a"]
    set P4, P0["b"]
    print 'P0["b"]: '
    print P4
    print "\n"

    end
CODE
P0["b"]: B
P0["b"]: B
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash set_string_keyed_int" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']

    $S0 = 'hello'
    hash1[0] = $S0

    $S1 = hash1[0]

    print $S1
    print "\n"
    end
.end
CODE
hello
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash set_number_keyed_int" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']

    $N0 = 35.5
    hash1[0] = $N0

    $N1 = hash1[0]

    print $N1
    print "\n"
    end
.end
CODE
35.5
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash set_pmc_keyed_int (negative index)" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']

    push hash1, 999 # hash[0]
    push hash1, 1   # hash[1]
    push hash1, 999 # hash[2]

    .local pmc integer0, integer2
    integer0 = new ['Integer']
    integer0 = 0

    hash1[-4] = integer0 # modify hash[0] to 0

    integer2 = new ['Integer']
    integer2 = 2

    hash1[-1] = integer2 # modify hash[2] to 2

    $P0 = hash1[-4]
    print $P0
    $P0 = hash1[0]
    print $P0
    $P0 = hash1[1]
    print $P0
    $P0 = hash1[2]
    print $P0
    print "\n"
    end
.end
CODE
0012
OUTPUT

# actually Parrot_OrderedHash_delete_keyed is used
pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash delete_keyed_str" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']

    hash1["one"] = 2
    hash1["two"] = 5
    hash1["three"] = 7

    delete hash1["three"]

    $I0 = elements hash1

    print $I0
    print "\n"
    end
.end
CODE
2
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash push_string" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']

    $N0 = 21.5
    hash1[0] = $N0

    push hash1, "alpha"
    $S0 = hash1[1]

    print $S0
    print "\n"
    end
.end
CODE
alpha
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash push_float" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']

    $N0 = 21.5
    hash1[0] = $N0

    push hash1, 72.2
    $N0 = hash1[1]

    print $N0
    print "\n"
    end
.end
CODE
72.2
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash get_string_keyed" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']

    .local pmc integer1
    integer1 = new ['Integer']
    integer1 = 5

    hash1[integer1] = "hello"
    $S0 = hash1[integer1]

    print $S0
    print "\n"
    end
.end
CODE
hello
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "OrderedHash get_number" );

.sub _main :main
    .local pmc hash1
    hash1 = new ['OrderedHash']

    push hash1, 5
    push hash1, "alpha"

    $N0 = hash1

    print $N0
    print "\n"
    end
.end
CODE
2
OUTPUT

SKIP: {
    skip( "odd, tightly-coupled, defacto behaviour is not worth testing", 1 );

    pir_output_is( << 'CODE', << 'OUTPUT', "set, get, exists compound keys" );

.sub _main :main
    .local pmc hash, hash_inside
    hash = new ['OrderedHash']
    hash_inside = new ['OrderedHash']

    hash_inside["aa"] = "aa"
    hash["a"] = hash_inside
    hash["a";"ab"] = "ab"
    hash["a";"ac"] = "ac"
    hash["a";"ad"] = "ad"
    hash["b"] = "b"
    hash["c"] = "c"
    hash["d"] = "d"
    print "ok - set\n"

    print "elements: "
    $I0 = elements hash
    print $I0
    print "\n"

    print "get: "
    $P2 = hash["a";"aa"]
    print $P2
    $P2 = hash["a";"ab"]
    print $P2
    print "\n"

    print "exists: "
    exists $I0, hash[0;0]
    print $I0
    exists $I0, hash[2]
    print $I0
    exists $I0, hash["a"; "ab"]
    print $I0
    exists $I0, hash["a"; "ac"]
    print $I0
    exists $I0, hash["a"; 0]
    print $I0
    exists $I0, hash["a"; 1]
    print $I0

    exists $I0, hash["zzzz"; "zzzz"]
    print $I0
    exists $I0, hash[99]
    print $I0
    exists $I0, hash[0;99]
    print $I0
    print "\n"

    delete hash[0;0]
    print "ok - delete\n"

    print "exists: "
    exists $I0, hash[0;0]
    print $I0
    print "\n"

    delete hash["b"]
    delete hash["c"]

    print "elements: "
    $I0 = elements hash
    print $I0
    print "\n"

    end
.end
CODE
ok - set
elements: 4
get: 11
exists: 111111000
ok - delete
exists: 0
elements: 2
OUTPUT
}

pir_output_is( << 'CODE', << 'OUTPUT', "check whether interface is done" );

.sub _main :main
    .local pmc pmc1
    pmc1 = new ['OrderedHash']
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\n"
    does bool1, pmc1, "hash"
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
1
0
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "get_integer_keyed" );
.pcc_sub :main main:
    new P0, ['OrderedHash']
    set P0["Foo"], 10
    set P0["Bar"], 20
    set I0, P0["Bar"]
    print I0
    print "\n"
    set I1, P0["Foo"]
    print I1
    print "\n"
    set I2, P0[0]
    print I2
    print "\n"
    set I3, P0[1]
    print I3
    print "\n"
    end
CODE
20
10
10
20
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "get_number_keyed" );
.pcc_sub :main main:
     new P0, ['OrderedHash']
     set N0, 12.3
     set N1, 45.1
     set P0["Foo"], N0
     set P0["ooF"], N1
     set N2, P0["ooF"]
     eq N1, N2, OK1
     print "not "
OK1: print "ok 1\n"
     set N3, P0["Foo"]
     eq N0, N3, OK2
     print "not "
OK2: print "ok 2\n"
     set N4, P0[0]
     eq N4, N0, OK3
     print "not "
OK3: print "ok 3\n"
     set N5, P0[1]
     eq N5, N1, OK4
     print "not "
OK4: print "ok 4\n"
     end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "freeze/thaw 1" );
.pcc_sub :main main:
    new P0, ['OrderedHash']
    set P0["a"], "Foo\n"
    set P0["b"], "Bar\n"

    freeze S0, P0
    thaw P1, S0
    set P2, P1["a"]
    print P2
    set P2, P1[0]
    print P2
    set P2, P1["b"]
    print P2
    set P2, P1[1]
    print P2

    end
CODE
Foo
Foo
Bar
Bar
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
