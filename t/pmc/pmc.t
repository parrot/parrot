#! perl -w

# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/pmc.t - Perl PMCs

=head1 SYNOPSIS

	% perl -Ilib t/pmc/pmc.t

=head1 DESCRIPTION

Contains a lot of Perl PMC related tests.

=cut

use Parrot::Test tests => 24;
use Test::More;
use Parrot::PMC qw(%pmc_types);
my $max_pmc = scalar(keys(%pmc_types)) + 1;

my $fp_equality_macro = <<'ENDOFMACRO';
.macro fp_eq (	J, K, L )
	save	N0
	save	N1
	save	N2

	set	N0, .J
	set	N1, .K
	sub	N2, N1,N0
	abs	N2, N2
	gt	N2, 0.000001, .$FPEQNOK

	restore N2
	restore	N1
	restore	N0
	branch	.L
.local $FPEQNOK:
	restore N2
	restore	N1
	restore	N0
.endm
.macro fp_ne(	J,K,L)
	save	N0
	save	N1
	save	N2

	set	N0, .J
	set	N1, .K
	sub	N2, N1,N0
	abs	N2, N2
	lt	N2, 0.000001, .$FPNENOK

	restore	N2
	restore	N1
	restore	N0
	branch	.L
.local $FPNENOK:
	restore	N2
	restore	N1
	restore	N0
.endm
ENDOFMACRO

output_is(<<'CODE', <<'OUTPUT', "newpmc");
	print "starting\n"
	new P0, .PerlInt
	print "ending\n"
	end
CODE
starting
ending
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "illegal min newpmc");
	new P0, 0
	end
CODE
Illegal PMC enum (0) in new
OUTPUT

output_is(<<"CODE", <<"OUTPUT", "illegal max newpmc");
	new P0, $max_pmc
	end
CODE
Illegal PMC enum ($max_pmc) in new
OUTPUT

output_is(<<CODE, <<OUTPUT, "typeof");
    new P0,.PerlInt
    typeof S0,P0
    eq     S0,"PerlInt",OK_1
    print  "not "
OK_1:
    print  "ok 1\\n"
    typeof I0,P0
    eq     I0,.PerlInt,OK_2
    print  "not "
OK_2:
    print  "ok 2\\n"
    end
CODE
ok 1
ok 2
OUTPUT

my $checkTypes;
while (my ($type, $id) = each %pmc_types) {
    next if $type eq "Null";
    next if $type eq "Iterator";   # these need an initializer
    next if $type eq "Enumerate";
    next if $type eq "Ref";
    next if $type eq "SharedRef";
    next if $type eq "ParrotObject";
    next if $type eq "deleg_pmc";
    next if $type eq "BigInt";
    my $set_ro = ($type =~ /^Const\w+/) ? <<EOPASM : '';
    new P10, .PerlInt
    inc P10
    setprop P0, "_ro", P10
EOPASM
    $checkTypes .= <<"CHECK";
    new P0, .$type
    $set_ro
    set S1, "$type"
    typeof S0, P0
    ne S0, S1, L_BadName
    set I1, $id
    typeof I0, P0
    ne I0, I1, L_BadId
CHECK
}

output_is(<<"CODE", <<OUTPUT, "PMC type check");
    new P10, .Hash # Type id hash
    new P11, .Hash # Type name hash
$checkTypes
    print "All names and ids ok.\\n"
    end
L_BadName:
    print S1
    print " PMCs have incorrect name \\""
    print S0
    print "\\"\\n"
    end
L_BadId:
    print S1
    print " PMCs should be type "
    print I1
    print " but have incorrect type "
    print I0
    print "\\n"
    end
# delegate calls these 2 functions
.namespace ["delegate"]
.pcc_sub __name:
   set S5, "delegate"
   set I0, 1
   set I1, 1	# 1 string retval
   set I3, 0	# no pmc
   returncc
.pcc_sub __type:
   find_type I5, "delegate"
   set I0, 1
   set I1, 1
   set I3, 0
   returncc
CODE
All names and ids ok.
OUTPUT

output_is(<<'CODE', <<OUTPUT, "assign Px,Py");
    new P0, .PerlInt
    new P1, .PerlNum
    new P2, .PerlString
    new P3, .PerlUndef
    set P0, 123
    set P1, 3.14
    set P2, "7.4x"
    set P3, 666

    new P10, .PerlInt
    new P11, .PerlNum
    new P12, .PerlString
    new P13, .PerlUndef

    assign P10, P0
    assign P11, P0
    assign P12, P0
    assign P13, P0
    print P10
    print ":"
    print P11
    print ":"
    print P12
    print ":"
    print P13
    print "\n"

    assign P10, P1
    assign P11, P1
    assign P12, P1
    assign P13, P1
    print P10
    print ":"
    print P11
    print ":"
    print P12
    print ":"
    print P13
    print "\n"

    assign P10, P2
    assign P11, P2
    assign P12, P2
    assign P13, P2
    print P10
    print ":"
    print P11
    print ":"
    print P12
    print ":"
    print P13
    print "\n"

    assign P10, P3
    assign P11, P3
    assign P12, P3
    assign P13, P3
    print P10
    print ":"
    print P11
    print ":"
    print P12
    print ":"
    print P13
    print "\n"

    end
CODE
123:123:123:123
3.140000:3.140000:3.140000:3.140000
7.4x:7.4x:7.4x:7.4x
666:666:666:666
OUTPUT

output_is(<<"CODE", <<OUTPUT, "exchange");
@{[ $fp_equality_macro ]}
	new P0, .PerlInt
        new P1, .PerlInt
	set P0, 123
	set P1, 246
        exchange P0, P1
        set I0, P0
        eq I0, 246, EQ1
        print "not "
EQ1:    print "ok 1\\n"
        set I1, P1
        eq I1, 123, EQ2
        print "not "
EQ2:    print "ok 2\\n"
        new P2, .PerlNum
        new P3, .PerlString
        set P2, 1234.567890
        set P3, "Themistocles"
        exchange P2, P3
        set S2, P2
        eq S2, "Themistocles", EQ3
        print "not "
EQ3:    print "ok 3\\n"
        set S2, "1234.567890"
        set S3, P3
        eq S2, S3, EQ4
        print "not "
EQ4:    print "ok 4\\n"
        new P4, .PerlArray
        new P5, .Hash
        new P6, .PerlString
        set P4[2], "Array"
        set P5["2"], "Hash"
        exchange P4, P5
        set S0, P4["2"]
        eq S0, "Hash", EQ5
        print "not "
EQ5:    print "ok 5\\n"
        set S0, P5[2]
        eq S0, "Array", EQ6
        print "not "
EQ6:    print "ok 6\\n"
	end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_like(<<"CODE", <<'OUTPUT', "find_method");
	new P1, .PerlInt
	find_method P0, P1, "no_such_meth"
	end
CODE
/Method 'no_such_meth' not found/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "new with a native type");
        new P1, .INTVAL
	print "never\n"
	end
CODE
/(unknown macro|unexpected DOT)/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "bxor undef");
    new P0, .PerlUndef
    bxor P0, 0b00001111
    print  P0
    print "\n"

    new P0, .PerlUndef
    new P1, .PerlInt
    set P1, 0b11110000
    bxor P0, P1
    print P0
    print "\n"
    end
CODE
15
240
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "band undef");
    new P0, .PerlUndef
    band P0, 0b00001111
    print  P0
    print "\n"

    new P0, .PerlUndef
    new P1, .PerlInt
    set P1, 0b11110000
    band P0, P1
    print P0
    print "\n"
    end
CODE
0
0
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "eq_addr same");
      new P0, .Integer
      set P1, P0
      eq_addr P0, P1, OK1
      print "not "
OK1:  print "ok 1\n"
      ne_addr P0, P1, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
      end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "eq_addr diff");
      new P0, .Integer
      new P1, .Integer
      ne_addr P0, P1, OK1
      print "not "
OK1:  print "ok 1\n"
      eq_addr P0, P1, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
      end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "isnull");
      null P0
      isnull P0, OK1
      print "not "
OK1:  print "ok 1\n"
      new P0, .PerlInt
      isnull P0, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
      end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Random PMCs are singletons");
    new P0, .Random
    new P1, .Random
    eq_addr P0, P1, ok
    print "not the same "
ok: print "ok\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "issame");
    new P0, .Undef
    new P1, .Undef
    set P1, P0
    issame I0, P0, P1
    print I0
    isntsame I0, P0, P1
    print I0
    new P2, .Undef
    issame I0, P0, P2
    print I0
    isntsame I0, P0, P2
    print I0
    print "\n"
    end
CODE
1001
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "instantiate - no args");
    getclass P2, "Integer"
    set I0, 0	# unproto
    set I3, 0	# no P args
    instantiate P3
    typeof S0, P3
    print S0
    print "\n"
    set I0, P3
    print I0
    print "\n"
    end
CODE
Integer
0
OUTPUT

output_is(<<'CODE', '1foo23', "set_p_pc - Sub constant");
.pcc_sub foo:      # be sure, this is constant #0
    print 2
    returncc
.pcc_sub @MAIN main:
    print 1
    set_p_pc P0, 0
    print P0
    invokecc
    print 3
    end
CODE

output_is(<<'CODE', <<'OUT', ".const - Sub constant");
.pcc_sub @MAIN main:
    print "ok 1\n"
    .const .Sub P0 = "foo"
    invokecc
    print "ok 3\n"
    end
.pcc_sub foo:
    print "ok 2\n"
    returncc
CODE
ok 1
ok 2
ok 3
OUT

output_is(<<'CODE', <<'OUT', "get_mro");
    new P0, .PerlInt
    get_mro P1, P0
    print "ok 1\n"
    elements I1, P1
    null I0
loop:
    set P2, P1[I0]
    classname S0, P2
    print S0
    print "\n"
    inc I0
    lt I0, I1, loop
    end
CODE
ok 1
PerlInt
Integer
OUT

pir_output_is(<<'CODE', <<'OUT', "pmc constant 1");
.sub main @MAIN
    .const Integer i = "42"
    print i
    print "\n"
.end
CODE
42
OUT

pir_output_is(<<'CODE', <<'OUT', "pmc constant 2");
.sub main @MAIN
    .const .Integer i = "42"
    print i
    print "\n"
.end
CODE
42
OUT

output_is(<<'CODE', <<'OUT', "pmc constant PASM");
    .const .Integer P0 = "42"
    print P0
    print "\n"
    end
CODE
42
OUT

output_is(<<'CODE', <<'OUT', "logical or, and, xor");
    new P0, .Integer
    set P0, 2
    new P1, .Undef
    or P2, P0, P1
    eq_addr P2, P0, ok1
    print "not "
ok1:
    print "ok 1\n"
    and P2, P0, P1
    eq_addr P2, P1, ok2
    print "not "
ok2:
    print "ok 2\n"
    xor P2, P0, P1
    eq_addr P2, P0, ok3
    print "not "
ok3:
    print "ok 3\n"
    end
CODE
ok 1
ok 2
ok 3
OUT
