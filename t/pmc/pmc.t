#!perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 20;
use Parrot::PMC qw(%pmc_types);

=head1 NAME

t/pmc/pmc.t - PMCs

=head1 SYNOPSIS

    % prove t/pmc/pmc.t

=head1 DESCRIPTION

Contains a lot of PMC related tests.

=cut

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

pasm_output_is(<<'CODE', <<'OUTPUT', "newpmc");
	print "starting\n"
	new P0, .Integer
	print "ending\n"
	end
CODE
starting
ending
OUTPUT

pasm_output_like(<<'CODE', <<'OUTPUT', "illegal min newpmc");
	new P0, 0
	end
CODE
/Illegal PMC enum \(0\) in new/
OUTPUT

pasm_output_like(<<"CODE", <<'OUTPUT', "illegal max newpmc");
	new P0, $max_pmc
	end
CODE
/Illegal PMC enum \(\d+\) in new/
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', 'typeof');
    new P0,.Integer
    typeof S0,P0
    eq     S0, "Integer", OK_1
    print  "not "
OK_1:
    print  "ok 1\n"
    typeof I0,P0
    eq     I0, .Integer, OK_2
    print  "not "
OK_2:
    print  "ok 2\n"
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
    next if $type eq "STMRef";
    next if $type eq "SharedRef";
    next if $type eq "ParrotObject";
    next if $type eq "ParrotThread";
    next if $type eq "deleg_pmc";
    next if $type eq "BigInt";
    next if $type eq "LexInfo";
    next if $type eq "LexPad";
    next if $type eq "Slice";
    my $set_ro = ($type =~ /^Const\w+/) ? <<EOPASM : '';
    new P10, .Integer
    set P10, 1
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

pasm_output_is(<<"CODE", <<OUTPUT, "PMC type check");
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
   get_params '(0)', P2
   set_returns '(0)', "delegate"
   returncc
.pcc_sub __type:
   get_params '(0)', P2
   find_type I5, "delegate"
   set_returns '(0)', I5
   returncc
CODE
All names and ids ok.
OUTPUT

pasm_output_like(<<'CODE', <<'OUTPUT', 'find_method');
	new P1, .Integer
	find_method P0, P1, "no_such_meth"
	end
CODE
/Method 'no_such_meth' not found/
OUTPUT

pasm_output_like(<<'CODE', <<'OUTPUT', "new with a native type");
        new P1, .INTVAL
	print "never\n"
	end
CODE
/(unknown macro|unexpected DOT)/
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "eq_addr same");
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

pasm_output_is(<<'CODE', <<'OUTPUT', "eq_addr diff");
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

pasm_output_is(<<'CODE', <<'OUTPUT', "if_null");
      null P0
      if_null P0, OK1
      print "not "
OK1:  print "ok 1\n"
      new P0, .Integer
      if_null P0, BAD2
      branch OK2
BAD2: print "not "
OK2:  print "ok 2\n"
      end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "Random PMCs are singletons");
    new P0, .Random
    new P1, .Random
    eq_addr P0, P1, ok
    print "not the same "
ok: print "ok\n"
    end
CODE
ok
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "issame");
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

SKIP: { skip("no instantiate", 1);
pasm_output_is(<<'CODE', <<'OUTPUT', "instantiate - no args");
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
}

pasm_output_is(<<'CODE', <<'OUT', ".const - Sub constant");
.pcc_sub :main main:
    print "ok 1\n"
    .const .Sub P0 = "foo"
    invokecc P0
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

pir_output_is(<<'CODE', <<'OUT', "pmc constant 1");
.sub main :main
    .const Integer i = "42"
    print i
    print "\n"
.end
CODE
42
OUT

pir_output_is(<<'CODE', <<'OUT', "pmc constant 2");
.sub main :main
    .const .Integer i = "42"
    print i
    print "\n"
.end
CODE
42
OUT

pasm_output_is(<<'CODE', <<'OUT', "pmc constant PASM");
    .const .Integer P0 = "42"
    print P0
    print "\n"
    end
CODE
42
OUT

pasm_output_is(<<'CODE', <<'OUT', "logical or, and, xor");
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

pasm_output_is(<<'CODE', <<'OUTPUT', "new_p_i_s");
    new P3, .Integer, "42"
    typeof S0, P3
    print S0
    print "\n"
    set I0, P3
    print I0
    print "\n"
    end
CODE
Integer
42
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "pmcinfo_i_p_ic");
.include "pmcinfo.pasm"
    new P0, .Integer
    pmcinfo I0, P0, .PMCINFO_FLAGS
    shl I2, 1, 9	# PObj_is_PMC_FLAG s. pobj.h
    band I1, I0, I2
    if I1, ok
    print "PMC flag not set\n"
    end
ok:
    print "ok\n"
    end
CODE
ok
OUTPUT
