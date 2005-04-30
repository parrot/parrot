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
    plan tests => 22;
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
   set P0, "12345678987654321"
   set P1, "10000000000000000"
   add P2, P1, P0
   set S0, P2
   print S0
   print "\n"
   end
CODE
1999999
22345678987654321
OUT

output_is(<<'CODE', <<'OUT', "add_int");
   new P0, .BigInt
   set P0, 999999
   new P2, .BigInt
   add P2, P0, 1000000
   set S0, P2
   print S0
   print "\n"
   set P0, "100000000000000000000"
   add P2, P0, 1000000
   set S0, P2
   print S0
   print "\n"
   end
CODE
1999999
100000000000001000000
OUT

output_is(<<'CODE', <<'OUTPUT', "sub bigint");
     new P0, .BigInt
     set P0, 12345678
     new P1, .BigInt
     set P1, 5678
     new P2, .BigInt
     sub P2, P0, P1
     set I0, P2
     eq I0, 12340000, OK1
     print "not "
OK1: print "ok 1\n"
     set P0, "123456789012345678"
     sub P2, P0, P1
     new P3, .BigInt
     set P3, "123456789012340000"
     eq P2, P3, OK2
     print "not "
OK2: print "ok 2\n"
     set P1, "223456789012345678"
     sub P2, P0, P1
     set P3, "-100000000000000000"
     eq P2, P3, OK3
     print "not "
OK3: print "ok 3\n"
     end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub native int");
     new P0, .BigInt
     set P0, 12345678
     new P2, .BigInt
     sub P2, P0, 5678
     set I0, P2
     eq I0, 12340000, OK1
     print "not "
OK1: print "ok 1\n"
     set P0, "123456789012345678"
     sub P2, P0, 5678
     new P3, .BigInt
     set P3, "123456789012340000"
     eq P2, P3, OK2
     print "not "
OK2: print "ok 2\n"
     end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub other int");
     new P0, .BigInt
     set P0, 12345678
     new P1, .PerlInt
     set P1, 5678
     new P2, .BigInt
     sub P2, P0, P1
     set I0, P2
     eq I0, 12340000, OK1
     print "not "
OK1: print "ok 1\n"
     set P0, "123456789012345678"
     sub P2, P0, P1
     new P3, .BigInt
     set P3, "123456789012340000"
     eq P2, P3, OK2
     print "not "
OK2: print "ok 2\n"
     set P0, 9876543
     new P4, .Integer
     set P4, 44
     sub P2, P0, P4
     set I0, P2
     eq I0, 9876499, OK3
     print "not "
OK3: print "ok 3\n"
     set P0, "9876543219876543"
     sub P2, P0, P4
     set P3, "9876543219876499"
     eq P3, P2, OK4
     print "not "
OK4: print "ok 4\n"
     end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

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

output_is(<<'CODE', <<'OUT', "div bigint");
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

output_is(<<'CODE', <<'OUT', "div native int");
     new P0, .BigInt
     set P0, "100000000000000000000"
     new P1, .BigInt
     div P1, P0, 10
     new P2, .BigInt
     set P2, "10000000000000000000"
     eq P1, P2, OK1
     print "not "
OK1: print "ok 1\n"

     set P0, "100000000000000"
     div P1, P0, 10000000
     set P2, 10000000
     eq  P1, P2, OK2
     print "not "
OK2: print "ok 2\n"
     end
CODE
ok 1
ok 2
OUT

output_is(<<'CODE', <<'OUT', "div other int");
     new P0, .BigInt
     set P0, "100000000000000000000"
     new P1, .BigInt
     new P3, .PerlInt
     set P3, 10
     div P1, P0, P3
     new P2, .BigInt
     set P2, "10000000000000000000"
     eq P1, P2, OK1
     print "not "
OK1: print "ok 1\n"

     set P0, "100000000000000"
     new P4, .Integer
     set P4, 10000000
     div P1, P0, P4
     set P2, 10000000
     eq  P1, P2, OK2
     print "not "
OK2: print "ok 2\n"
     end
CODE
ok 1
ok 2
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

output_is(<<CODE, <<OUT, "add overflow Integer");
   new P0, .Integer
   set P0, $a
   new P1, .Integer
   set P1, $b
   new P2, .Integer
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
$c Integer
$d BigInt
$e BigInt
ok
OUT

output_is(<<CODE, <<OUT, "add overflow PerlInt");
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

pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");

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

output_is(<<"CODE", <<'OUTPUT', "Truth");
     new P0, .BigInt
     set P0, "123456789123456789"
     if P0, OK1
     print "not "
OK1: print "ok 1\\n"
     set P0, 0
     unless P0, OK2
     print "not "
OK2: print "ok 2\\n"
     end
CODE
ok 1
ok 2
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "neg");
     new P0, .BigInt
     new P1, .BigInt
     set P0, "123456789123456789"
     neg P0
     set P1, "-123456789123456789"
     eq P0, P1, OK1
     print "not "
OK1: print "ok 1\\n"
     end
CODE
ok 1
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "pi() generator");
.sub PI
    .local pmc k, a, b, a1, b1
    k = new Integer
    k = 2
    a = new Integer
    a = 4
    b = new Integer
    b = 1
    a1 = new Integer
    a1 = 12
    b1 = new Integer
    b1 = 4
forever:
    .local pmc p, q
    p = n_mul k, k
    q = n_mul k, 2
    inc q
    inc k
    .local pmc ta, tb, ta1, tb1
    ta = clone a1
    tb = clone b1
    $P0 = n_mul p, a
    $P1 = n_mul q, a1
    ta1 =  n_add $P0, $P1
    $P2 = n_mul p, b
    $P3 = n_mul q, b1
    tb1 =  n_add $P2, $P3
    a = ta
    b = tb
    a1 = ta1
    b1 = tb1
    .local pmc d, d1
    d = n_fdiv a, b
    d1 = n_fdiv a1, b1
yield_loop:
    unless d == d1 goto end_yield
	.yield(d)
	$P4 = n_mod a, b
	a = n_mul $P4, 10
	$P5 = n_mod a1, b1
	a1 = n_mul $P5, 10
	d = n_fdiv a, b
	d1 = n_fdiv a1, b1
	goto yield_loop
end_yield:
    goto forever
.end

.sub main @MAIN
    .local int i
    .local pmc d
loop:
    d = PI()
    print d
    inc i
    $I0 = i % 50
    if $I0 goto no_nl
	print "\n"
no_nl:
    if i < 1000 goto loop
    print "\n"
.end

=pod
class PI(object):
    def __iter__(self):
        k, a, b, a1, b1 = 2, 4, 1, 12, 4
        while 1:
            p, q, k = k*k, 2*k+1, k+1
            a, b, a1, b1 = a1, b1, p*a+q*a1, p*b+q*b1
            d, d1 = a//b, a1//b1
            while d == d1:
                yield d
                a, a1 = 10*(a%b), 10*(a1%b1)
                d, d1 = a//b, a1//b1

pi = iter(PI())
ds = ""
for i in xrange(1, 1001):
    d = pi.next()
    ds += str(d)
    im = i % 50
    if im == 0:
        print ds
        ds = ""

print ds

=cut
CODE
31415926535897932384626433832795028841971693993751
05820974944592307816406286208998628034825342117067
98214808651328230664709384460955058223172535940812
84811174502841027019385211055596446229489549303819
64428810975665933446128475648233786783165271201909
14564856692346034861045432664821339360726024914127
37245870066063155881748815209209628292540917153643
67892590360011330530548820466521384146951941511609
43305727036575959195309218611738193261179310511854
80744623799627495673518857527248912279381830119491
29833673362440656643086021394946395224737190702179
86094370277053921717629317675238467481846766940513
20005681271452635608277857713427577896091736371787
21468440901224953430146549585371050792279689258923
54201995611212902196086403441815981362977477130996
05187072113499999983729780499510597317328160963185
95024459455346908302642522308253344685035261931188
17101000313783875288658753320838142061717766914730
35982534904287554687311595628638823537875937519577
81857780532171226806613001927876611195909216420198

OUTPUT
