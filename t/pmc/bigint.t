#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/bigint.t - BigInt

=head1 SYNOPSIS

	% perl -Ilib t/pmc/bigint.t

=head1 DESCRIPTION

Tests the BigInt PMC. Checks Perl-specific integer behaviour.

=cut

use Parrot::Test;
use Test::More;
use Parrot::Config;

if ($PConfig{gmp}) {
   plan tests => 13;
}
else {
   plan skip_all => "No BigInt Lib configured";
}

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

output_is(<<'CODE', <<'OUT', "create");
   new P0, .BigInt
   print "ok\n"
   end
CODE
ok
OUT

output_is(<<'CODE', <<'OUT', "set/get int");
   new P0, .BigInt
   set P0, 999999
   set I1, P0
   print I1
   print "\n"
   get_repr S0, P0
   print S0
   print "\n"
   end
CODE
999999
999999L
OUT

output_is(<<"CODE", <<'OUT', "set int, get double");
@{[ $fp_equality_macro ]}
     new P0, .BigInt
     set P0, 999999
     set N1, P0
     .fp_eq(N1, 999999.0, OK1)
     print "not "
OK1: print "ok 1\\n"

     set P0, -999999
     set N1, P0
     .fp_eq(N1, -999999.0, OK2)
     print "not "
OK2: print "ok 2\\n"

     set P0, 2147483646
     set N1, P0
     .fp_eq(N1, 2.147483646e9, OK3)
     print "not "
OK3: print "ok 3\\n"

     set P0, -2147483646
     set N1, P0
     .fp_eq(N1, -2.147483646e9, OK4)
     print "not "
OK4: print "ok 4\\n"
     end
CODE
ok 1
ok 2
ok 3
ok 4
OUT

output_is(<<'CODE', <<'OUT', "set double, get str");
   new P0, .BigInt
   set P0, 1.23e12
   print P0
   print "\n"
   end
CODE
1230000000000
OUT

output_is(<<'CODE', <<'OUT', "set str, get str");
   new P0, .BigInt
   set P0, "1230000000000"
   print P0
   print "\n"
   end
CODE
1230000000000
OUT

output_is(<<'CODE', <<'OUT', "add");
   new P0, .BigInt
   set P0, 999999
   new P1, .BigInt
   set P1, 1000000
   new P2, .BigInt
   add P2, P0, P1
   set S0, P2
   print S0
   print "\n"
   end
CODE
1999999
OUT

output_is(<<'CODE', <<'OUT', "add_int");
   new P0, .BigInt
   set P0, 999999
   new P2, .BigInt
   add P2, P0, 1000000
   set S0, P2
   print S0
   print "\n"
   end
CODE
1999999
OUT

output_is(<<'CODE', <<'OUT', "mul");
   new P0, .BigInt
   set P0, 999999
   new P1, .BigInt
   set P1, 1000000
   new P2, .BigInt
   mul P2, P0, P1
   set S0, P2
   print S0
   print "\n"
   end
CODE
999999000000
OUT

output_is(<<'CODE', <<'OUT', "mul_int");
   new P0, .BigInt
   set P0, 999999
   new P2, .BigInt
   mul P2, P0, 1000000
   print P2
   print "\n"
   end
CODE
999999000000
OUT

output_is(<<'CODE', <<'OUT', "div");
     new P0, .BigInt
     set P0, "100000000000000000000"
     new P1, .BigInt
     set P1, "100000000000000000000"
     new P2, .BigInt
     div P2, P0, P1
     set I0, P2
     eq I0, 1, OK1
     print "not "
OK1: print "ok 1\n"

     new P3, .BigInt
     set P3, "10000000000000"
     set P1, 10000000
     div P2, P0, P1
     eq  P2, P3, OK2
     print "not "
OK2: print "ok 2\n"

     set P1, 10
     set P3, "10000000000000000000"
     div P2, P0, P1
     eq  P2, P3, OK3
     print "not "
OK3: print "ok 3\n"

     set P1, -1
     set P3, "-100000000000000000000"
     div P2, P0, P1
     eq  P2, P3, OK4
     print "not "
OK4: print "ok 4\n"
     end
CODE
ok 1
ok 2
ok 3
ok 4
OUT

use Parrot::Config;

my ($a, $b, $c, $d, $e);
if ($PConfig{intvalsize} == 8) {
    $a = '9223372036854775806';	# 2**63-2
    $b =                   '1';
    $c = '9223372036854775807'; # still PerlInt
    $d = '9223372036854775808'; # no more PerlInt
    $e = '9223372036854775809'; # still no more PerlInt
} elsif ($PConfig{intvalsize} == 4) {
    $a = '2147483646';		# 2**31-2
    $b =          '1';
    $c = '2147483647';		# still PerlInt
    $d = '2147483648';		# no more PerlInt
    $e = '2147483649';		# still no more PerlInt
} else {
    die "\$PConfig{intvalsize} == $PConfig{intvalsize}?\n";
}
output_is(<<CODE, <<OUT, "add overflow");
   new P0, .PerlInt
   set P0, $a
   new P1, .PerlInt
   set P1, $b
   new P2, .PerlInt
   new P3, .BigInt
   set I3, 3
lp:
   add P2, P0, P1
   set S0, P2
   print S0
   print " "
   typeof S1, P2
   print S1
   print "\\n"
   add P1, $b
   dec I3
   if I3, lp
   print "ok\\n"
ex:
   end
CODE
$c PerlInt
$d BigInt
$e BigInt
ok
OUT

output_is(<<'CODE', <<'OUT', "abs");
   new P0, .BigInt
   set P0, "-1230000000000"
   new P1, .Undef
   abs P1, P0
   print P1
   print "\n"
   print P0
   print "\n"
   abs P0
   print P0
   print "\n"
   end
CODE
1230000000000
-1230000000000
1230000000000
OUT

output_is(<< 'CODE', << 'OUTPUT', "check wether interface is done");
##PIR##
.sub _main
    .local pmc pmc1
    pmc1 = new BigInt
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
1
0
OUTPUT

