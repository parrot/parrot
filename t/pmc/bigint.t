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
   plan tests => 4;
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

