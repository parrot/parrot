#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib ../../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Test::PGE;


=head1 NAME

t/p6rules/context.t - PGE return value tests

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>,
ver. 8, in the B<'Return values from matches'> section

=head1 SYNOPSIS

	% prove t/p6rules/context.t

=cut


my $PRE = <<PRE;
.sub 'main' :main
    load_bytecode "PGE.pbc"
    load_bytecode "dumper.pir"
    load_bytecode "PGE/Dumper.pir"
    load_bytecode "PGE/Glob.pir"
    load_bytecode "PGE/Text.pir"
    load_bytecode "PGE/Util.pir"
    .local string target, pattern
    .local pmc p6rule, rulesub, pir, exp, match
    p6rule = compreg 'PGE::P6Rule'
    null match
    null rulesub
PRE
my $POST = <<'POST';
    goto OK
NOK:
    print "not "
OK:
    print "ok"
END:
	print "\n"
.end
POST


## binary context
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'binary context (true)');
	rulesub = p6rule('abc')
	match = rulesub('abc')
	if match goto OK
	goto NOK
CODE
ok
OUT
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'binary context (false)');
	rulesub = p6rule('xxx')
	match = rulesub('abc')
	unless match goto OK
CODE
ok
OUT


## numeric context
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'numeric context (1abc => 1)');
	rulesub = p6rule('1abc')
	match = rulesub('1abc')
	$I0 = match
	print $I0
	goto END
CODE
1
OUT
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'numeric context ((1)(2)(b)(c) => 12)');
	rulesub = p6rule('(1)(2)(b)(c)')
	match = rulesub('12bc')
	$I0 = match
	print $I0
	goto END
CODE
12
OUT
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'numeric context (0abc => 0)');
	rulesub = p6rule('0abc')
	match = rulesub('abc')
	$I0 = match
	print $I0
	goto END
CODE
0
OUT
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'numeric context (xxx => 0)');
	rulesub = p6rule('xxx')
	match = rulesub('abc')
	$I0 = match
	print $I0
	goto END
CODE
0
OUT
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'numeric context (a1bc => 0)');
	rulesub = p6rule('a1bc')
	match = rulesub('a1bc')
	$I0 = match
	print $I0
	goto END
CODE
0
OUT
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'numeric context (1E5)');
	rulesub = p6rule('1E5abc')
	match = rulesub('1E5abc')
	print match
	goto END
CODE
1E5abc
OUT


## string context
## NOTE: this behavior varies from the doc, but it is in a soon-to-be-released
## version of the new specification
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'string context (match => full match)');
	rulesub = p6rule('abc')
	match = rulesub('abc')
	.local string res, exp
	res = match
	exp = 'abc'
	eq exp, res, OK
	goto NOK
CODE
ok
OUT
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'string context (with captures => full match)');
	rulesub = p6rule('(a)(b)(c)')
	match = rulesub('abc')
	.local string res, exp
	res = match
	exp = 'abc'
	eq exp, res, OK
	goto NOK
CODE
ok
OUT
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'string context (false match => "")');
	rulesub = p6rule('xxx')
	match = rulesub('abc')
	.local string res, exp
	res = match
	exp = ''
	eq exp, res, OK
CODE
ok
OUT


## as array
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'as array ([2,1,0] => "cba")');
	rulesub = p6rule('(a)(b)(c)')
	match = rulesub('abc')
	.local string res
	$P0 = match[2]
	res = $P0
	print res
	$P0 = match[1]
	res = $P0
	print res
	$P0 = match[0]
	res = $P0
	print res
	goto END
CODE
cba
OUT
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'as array ([2,1,0] => "cba")');
	rulesub = p6rule('(a)(b)(c)')
	match = rulesub('abc')
	.local string res
	res = match[2]
	print res
	res = match[1]
	print res
	res = match[0]
	print res
	goto END
CODE
cba
OUT
## TODO: more


## as hash
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'as hash (A => "a")');
	rulesub = p6rule('$<A>:=(.)b$<C>:=(c)')
	match = rulesub('abc')
	.local string res
	res = match['A']
	print res
	res = match['C']
	print res
	goto END
CODE
ac
OUT
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'mixed, array & hash');
	rulesub = p6rule('$<A>:=(.)(b)$<C>:=(c)')
	match = rulesub('abc')
	.local string res
	res = match['A']
	print res
	$P0 = match[0]
	res = $P0
	print res
	res = match['C']
	print res
	goto END
CODE
abc
OUT


## numbered captures treated as named
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'numbered as named ($2 => $/[1])', todo => 'not yet implemented');
	rulesub = p6rule('(a)(b)(c)')
	match = rulesub('abc')
	.local string res, exp
	$P0 = match[1]
	res = $P0
	print res
	res = match['2']
	print res
	goto END
CODE
bb
OUT


## additional methods
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'additional match methods');
	rulesub = p6rule('abc')
	match = rulesub('abc')
	.local string from, to
	from = match.'from'()
	to = match.'to'()
	print from
	print " "
	print to
	goto END
CODE
0 3
OUT
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'additional match methods');
	rulesub = p6rule('(a)(b)(c)')
	match = rulesub('abc')
	.local string from, to
	$P0 = match[1]
	from = $P0.'from'()
	to = $P0.'to'()
	print from
	print " "
	print to
	goto END
CODE
1 2
OUT


## object isa 'PGE::Match'
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'isa PGE::Match (success)');
	rulesub = p6rule('(a)(b)(c)')
	match = rulesub('abc')

	.local int isa_match

	$S0 = match
	print $S0
	print "\n"

	isa_match = isa match, 'PGE::Match'
	if isa_match goto OK1
	print "not "
OK1:print "ok 1\n"

	$P0 = match[1]

	$S0 = $P0
	print $S0
	print "\n"

	isa_match = isa $P0, 'PGE::Match'
	if isa_match goto OK2
	print "not "
OK2:print "ok 2\n"
	goto END
CODE
abc
ok 1
b
ok 2

OUT
pir_output_is($PRE.<<'CODE'.$POST,<<OUT,'isa PGE::Match (failure)');
	rulesub = p6rule('(a)(b)(c)')
	match = rulesub('xxx')

	.local int isa_match

	$S0 = match
	print $S0
	print "\n"

	isa_match = isa match, 'PGE::Match'
	if isa_match goto OK1
	print "not "
OK1:print "ok 1\n"
	goto END
CODE

ok 1

OUT


# remember to change the number of tests :-)
BEGIN { plan tests => 20; }
