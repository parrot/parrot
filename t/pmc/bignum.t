#! perl
# Copyright (C) 2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test;
use Parrot::Config;

=head1 NAME

t/pmc/bignum.t - BigNum PMC

=head1 SYNOPSIS

    % prove t/pmc/bignum.t

=head1 DESCRIPTION

Tests the BigNum PMC.

=cut

if ( $PConfig{gmp} ) {
    plan tests => 32;
}
else {
    plan skip_all => "No BigNum PMC enabled";
}

my $vers_check = <<'EOP';
.sub main :main
    .local pmc b, ar
    .local string v
    .local int ma, mi, pa
    b = new ['BigNum']
    v = b.'version'()
    ar = split '.', v
    ma = ar[0]
    mi = ar[1]
    pa = ar[2]
    if ma >= 4 goto ge_4
warn:
    print 'GMP version '
    print v
    say " is buggy with huge digit multiply - please upgrade"
    end
ge_4:
   if mi >= 2 goto ok
   if mi == 0 goto warn
   # test 4.1.x
   if pa >= 4 goto ok
   goto warn
   end
ok:
.end
EOP

if ( $PConfig{gmp} ) {

    # argh
    my $parrot = '.' . $PConfig{slash} . 'parrot' . $PConfig{exe};
    my $test   = 'temp_gmp_vers.pir';
    open my $O, '>', "$test" or die "can't open $test: $!";
    print $O $vers_check;
    close $O;
    my $warn = `$parrot $test`;
    diag $warn if $warn;
    unlink $test;
}

pasm_output_is( <<'CODE', <<'OUT', "create" );
   new P0, ['BigNum']
   say "ok"
   end
CODE
ok
OUT

pasm_output_is( <<'CODE', <<'OUT', "set/get int" );
   new P0, ['BigNum']
   set P0, 999999
   set I1, P0
   say I1
   get_repr S0, P0
   say S0
   end
CODE
999999
999999N
OUT

pasm_output_is( <<"CODE", <<'OUT', "set int, get double" );
     .include 'fp_equality.pasm'
     new P0, ['BigNum']
     set P0, 999999
     set N1, P0
     .fp_eq_pasm(N1, 999999.0, OK1)
     print "not "
OK1: say "ok 1"

     set P0, -999999
     set N1, P0
     .fp_eq_pasm(N1, -999999.0, OK2)
     print "not "
OK2: say "ok 2"

     set P0, 2147483646
     set N1, P0
     .fp_eq_pasm(N1, 2.147483646e9, OK3)
     print "not "
OK3: say "ok 3"

     set P0, -2147483646
     set N1, P0
     .fp_eq_pasm(N1, -2.147483646e9, OK4)
     print "not "
OK4: say "ok 4"
     end
CODE
ok 1
ok 2
ok 3
ok 4
OUT

my @todo_str = ( todo => "bignum strings");
pasm_output_is( <<'CODE', <<'OUT', "set double, get str", @todo_str );
   new P0, ['BigNum']
   set P0, 1.23e12
   say P0
   set P0, "1230000000000.0000000000000000122"
   say P0
   end
CODE
1230000000000
1230000000000.0000000000000000122
OUT

pasm_output_is( <<'CODE', <<'OUT', "add", @todo_str);
   new P0, ['BigNum']
   set P0, 999999.5
   new P1, ['BigNum']
   set P1, 1000000.5
   new P2, ['BigNum']
   add P2, P0, P1
   set S0, P2
   say S0
   set P0, "12345678987654321"
   set P1, "10000000000000000"
   add P2, P1, P0
   set S0, P2
   say S0
   end
CODE
2000000
22345678987654321
OUT

pasm_output_is( <<'CODE', <<'OUT', "add_int", @todo_str );
   new P0, ['BigNum']
   set P0, 999999
   new P2, ['BigNum']
   add P2, P0, 1000000
   set S0, P2
   say S0
   set P0, "100000000000000000000.01"
   add P2, P0, 1000000
   set S0, P2
   say S0
   end
CODE
1999999
100000000000001000000.01
OUT

pasm_output_is( <<'CODE', <<'OUTPUT', "sub bignum" );
     new P0, ['BigNum']
     set P0, 12345678
     new P1, ['BigNum']
     set P1, 5678
     new P2, ['BigNum']
     sub P2, P0, P1
     set I0, P2
     eq I0, 12340000, OK1
     print "not "
OK1: say "ok 1"
     set P0, "123456789012345678"
     sub P2, P0, P1
     new P3, ['BigNum']
     set P3, "123456789012340000"
     eq P2, P3, OK2
     print "not "
OK2: say "ok 2"
     set P1, "223456789012345678"
     sub P2, P0, P1
     set P3, "-100000000000000000"
     eq P2, P3, OK3
     print "not "
OK3: say "ok 3"
     end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "sub native int" );
     new P0, ['BigNum']
     set P0, 12345678
     new P2, ['BigNum']
     sub P2, P0, 5678
     set I0, P2
     eq I0, 12340000, OK1
     print "not "
OK1: say "ok 1"
     set P0, "123456789012345678"
     sub P2, P0, 5678
     new P3, ['BigNum']
     set P3, "123456789012340000"
     eq P2, P3, OK2
     print "not "
OK2: say "ok 2"
     end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "sub other int" );
     new P0, ['BigNum']
     set P0, 12345678
     new P1, ['Integer']
     set P1, 5678
     new P2, ['BigNum']
     sub P2, P0, P1
     set I0, P2
     eq I0, 12340000, OK1
     print "not "
OK1: say "ok 1"
     set P0, "123456789012345678"
     sub P2, P0, P1
     new P3, ['BigNum']
     set P3, "123456789012340000"
     eq P2, P3, OK2
     print "not "
OK2: say "ok 2"
     set P0, 9876543
     new P4, ['Integer']
     set P4, 44
     sub P2, P0, P4
     set I0, P2
     eq I0, 9876499, OK3
     print "not "
OK3: say "ok 3"
     set P0, "9876543219876543"
     sub P2, P0, P4
     set P3, "9876543219876499"
     eq P3, P2, OK4
     print "not "
OK4: say "ok 4"
     end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is( <<'CODE', <<'OUT', "mul", @todo_str );
   new P0, ['BigNum']
   set P0, 999.999
   new P1, ['BigNum']
   set P1, 10.000005
   new P2, ['BigNum']
   mul P2, P0, P1
   set S0, P2
   say S0
   end
CODE
9999.994999995
OUT

pasm_output_is( <<'CODE', <<'OUT', "mul_float", @todo_str);
   new P0, ['BigNum']
   set P0, 999.999
   mul P2, P0, 10.000005
   say P2
   end
CODE
9999.994999995
OUT

pasm_output_is( <<'CODE', <<'OUT', "div bignum" );
     new P0, ['BigNum']
     set P0, "100000000000000000000"
     new P1, ['BigNum']
     set P1, "100000000000000000000"
     new P2, ['BigNum']
     div P2, P0, P1
     set I0, P2
     eq I0, 1, OK1
     print "not "
OK1: say "ok 1"

     new P3, ['BigNum']
     set P3, "10000000000000"
     set P1, 10000000
     div P2, P0, P1
     eq  P2, P3, OK2
     print "not "
OK2: say "ok 2"

     set P1, 10
     set P3, "10000000000000000000"
     div P2, P0, P1
     eq  P2, P3, OK3
     print "not "
OK3: say "ok 3"

     set P1, -1
     set P3, "-100000000000000000000"
     div P2, P0, P1
     eq  P2, P3, OK4
     print "not "
OK4: say "ok 4"
     end
CODE
ok 1
ok 2
ok 3
ok 4
OUT

pasm_output_is( <<'CODE', <<'OUT', "div native int" );
     new P0, ['BigNum']
     set P0, "100000000000000000000"
     new P1, ['BigNum']
     div P1, P0, 10
     new P2, ['BigNum']
     set P2, "10000000000000000000"
     eq P1, P2, OK1
     print "not "
OK1: say "ok 1"

     set P0, "100000000000000"
     div P1, P0, 10000000
     set P2, 10000000
     eq  P1, P2, OK2
     print "not "
OK2: say "ok 2"
     end
CODE
ok 1
ok 2
OUT

pasm_output_is( <<'CODE', <<'OUT', "div other int" );
     new P0, ['BigNum']
     set P0, "100000000000000000000"
     new P1, ['BigNum']
     new P3, ['Integer']
     set P3, 10
     div P1, P0, P3
     new P2, ['BigNum']
     set P2, "10000000000000000000"
     eq P1, P2, OK1
     print "not "
OK1: say "ok 1"

     set P0, "100000000000000"
     new P4, ['Integer']
     set P4, 10000000
     div P1, P0, P4
     set P2, 10000000
     eq  P1, P2, OK2
     print "not "
OK2: say "ok 2"
     end
CODE
ok 1
ok 2
OUT

my @todo_sig = ( todo => "missing signature" );
for my $op ( "/", "%" ) {
    for my $type ( "BigNum", "BigInt", "Integer" ) {
        pir_output_is( <<"CODE", <<OUTPUT, "bignum $op by zero $type", ($op eq '/' and $type ne 'BigInt') ? () : @todo_sig );
.sub _main :main
    \$P0 = new ['BigNum']
    set \$P0, "1000000000000000000000.123"
    \$P1 = new ['BigNum']
    ## divide by a zero $type
    \$P2 = new ['$type']
    set \$P2, 0
    push_eh OK
    \$P1 = \$P0 $op \$P2
    say "fail"
    pop_eh
OK:
    get_results '0', \$P0
    \$S0 = \$P0
    say "ok"
    say \$S0
.end
CODE
ok
Divide by zero
OUTPUT
    }
}

{
    my ( $a, $b, $c, $d, $e );
    if ( $PConfig{intvalsize} == 8 ) {
        $a = '9223372036854775806';    # 2**63-2
        $b = '1';
        $c = '9223372036854775807';    # still Integer
        $d = '9223372036854775808';    # no more Integer
        $e = '9223372036854775809';    # still no more Integer
    }
    elsif ( $PConfig{intvalsize} == 4 ) {
        $a = '2147483646';             # 2**31-2
        $b = '1';
        $c = '2147483647';             # still Integer
        $d = '2147483648';             # no more PerlInt
        $e = '2147483649';             # still no more PerlInt
    }
    else {
        die "\$PConfig{intvalsize} == $PConfig{intvalsize}?\n";
    }

    pasm_output_is( <<CODE, <<OUT, "add overflow Integer" );
   new P0, ['Integer']
   set P0, $a
   new P1, ['Integer']
   set P1, $b
   new P2, ['Integer']
   new P3, ['BigNum']
   set I3, 3
lp:
   add P2, P0, P1
   set S0, P2
   print S0
   print " "
   typeof S1, P2
   say S1
   add P1, $b
   dec I3
   if I3, lp
   say "ok"
ex:
   end
CODE
$c Integer
$d BigInt
$e BigInt
ok
OUT

    pasm_output_is( <<CODE, <<OUT, "add overflow Integer" );
   new P0, ['Integer']
   set P0, $a
   new P1, ['Integer']
   set P1, $b
   new P2, ['Integer']
   new P3, ['BigNum']
   set I3, 3.0
lp:
   add P2, P0, P1
   set S0, P2
   print S0
   print " "
   typeof S1, P2
   say S1
   add P1, $b
   dec I3
   if I3, lp
   say "ok"
ex:
   end
CODE
$c Integer
$d BigInt
$e BigInt
ok
OUT
}

pasm_output_is( <<'CODE', <<'OUT', "abs", @todo_str );
   new P0, ['BigNum']
   set P0, "-1230000000000"
   new P1, ['Undef']
   abs P1, P0
   say P1
   say P0
   abs P0
   say P0
   end
CODE
1230000000000
-1230000000000
1230000000000
OUT

pir_output_is( << 'CODE', << 'OUTPUT', "check whether interface is done" );

.sub _main
    .local pmc pmc1
    pmc1 = new ['BigNum']
    .local int bool1
    does bool1, pmc1, "scalar"
    say bool1
    does bool1, pmc1, "no_interface"
    say bool1
    end
.end
CODE
1
0
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "Truth" );
     new P0, ['BigNum']
     set P0, "123456789123456789"
     if P0, OK1
     print "not "
OK1: say "ok 1"
     set P0, 0
     unless P0, OK2
     print "not "
OK2: say "ok 2"
     end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "neg" );
     new P0, ['BigNum']
     new P1, ['BigNum']
     set P0, "123456789123456789"
     neg P0
     set P1, "-123456789123456789"
     eq P0, P1, OK1
     print "not "
OK1: say "ok 1"
     end
CODE
ok 1
OUTPUT

pir_output_is( <<'CODE', <<'OUT', "BUG #34949 gt" );
.sub main :main
    .local pmc b
    b = new ['BigNum']
    b = 1e10
    if b > 4 goto ok
    say "never"
    end
ok:
    say "ok"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "BUG #34949 ge" );
.sub main :main
    .local pmc b
    b = new ['BigNum']
    b = 1e10
    if b >= 4 goto ok
    say "never"
    end
ok:
    say "ok"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "BUG #34949 ne" );
.sub main :main
    .local pmc b
    b = new ['BigNum']
    b = 1e10
    if b != 4 goto ok
    say "never"
    end
ok:
    say "ok"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "BUG #34949 eq" );
.sub main :main
    .local pmc b
    b = new ['BigNum']
    b = 1e10
    if b == 4 goto nok
    say "ok"
    end
nok:
    say "nok"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "BUG #34949 le" );
.sub main :main
    .local pmc b
    b = new ['BigNum']
    b = 1e10
    if b <= 4 goto nok
    say "ok"
    end
nok:
    say "nok"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "BUG #34949 lt" );
.sub main :main
    .local pmc b
    b = new ['BigNum']
    b = 1e10
    if b < 4 goto nok
    say "ok"
    end
nok:
    say "nok"
.end
CODE
ok
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
