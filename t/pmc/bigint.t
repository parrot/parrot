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
   plan tests => 10;
}
else {
   plan skip_all => "No BigInt Lib configured";
}

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
   end
CODE
999999
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

output_is(<<'CODE', <<'OUT', "add overflow");
   new P0, .PerlInt
   set P0, 2000000000
   new P1, .PerlInt
   set P1, 100000000
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
   print "\n"
   add P1, 100000000
   dec I3
   if I3, lp
   print "ok\n"
ex:
   end
CODE
2100000000 PerlInt
2200000000 BigInt
2300000000 BigInt
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
