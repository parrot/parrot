#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/rx.t - Regex Ops

=head1 SYNOPSIS

	% perl -Ilib t/op/rx.t

=head1 DESCRIPTION

Tests regular expression operations.

=cut

use Parrot::Test tests => 23;
use Test::More;

sub gentest($$;$$) {

	return <<"END";
		set S0, "$_[0]"
		set I0, 0

	START:	
		$_[1]
		
	SUCCEED:
		length I2, S0

		substr S1, S0,  0, I0
		sub I4, I1, I0
		substr S2, S0, I0, I4
		sub I4, I2, I1
		substr S3, S0, I1, I4	

		print "<"
		print S1
		print "><"
		print S2
		print "><"
		print S3
		print ">\\n"
		
		end

	FAIL:	print "no match\\n"
		end

END
}

sub gentest_advance($$;$$) {

	# inserts the generic advance mecahnism

	return <<"END";
		set S0, "$_[0]"
		set I0, 0

	START:  
		set I1, I0
		$_[1]
		
	SUCCEED:
		length I2, S0

		substr S1, S0,  0, I0
		sub I4, I1, I0
		substr S2, S0, I0, I4
		sub I4, I2, I1
		substr S3, S0, I1, I4	

		print "<"
		print S1
		print "><"
		print S2
		print "><"
		print S3
		print ">\\n"
		
		end

	FAIL:	print "no match\\n"
		end

	ADVANCE:
		rx_advance S0, I0, FAIL
		branch START

END
}


output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'A is A');
		rx_search S0, I1, I0, "a", FAIL
CODE
<><a><>
OUTPUT

output_is(gentest('b', <<'CODE'), <<'OUTPUT', 'A is not B');
		rx_search S0, I1, I0, "a", FAIL
CODE
no match
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'Pattern longer than string');
		rx_search S0, I1, I0, "aa", FAIL
CODE
no match
OUTPUT

output_is(gentest('ba', <<'CODE'), <<'OUTPUT', 'inching through the string');
		rx_search S0, I1, I0, "a", FAIL
CODE
<b><a><>
OUTPUT

output_is(gentest_advance('a', <<'CODE'), <<'OUTPUT', 'character classes (successful)');
		rx_oneof S0, I1, "aeiou", ADVANCE
CODE
<><a><>
OUTPUT

output_is(gentest_advance('b', <<'CODE'), <<'OUTPUT', 'character classes (failure)');
		rx_oneof S0, I1, "aeiou", ADVANCE
CODE
no match
OUTPUT

output_is(gentest_advance('a', <<'CODE'), <<'OUTPUT', 'dot (success)');

		rx_dot S0, I1, ADVANCE
CODE
<><a><>
OUTPUT

output_is(gentest_advance('aA9_', <<'CODE'), <<'OUTPUT', '\w (success)');
		rx_is_w S0, I1, ADVANCE
		rx_is_w S0, I1, ADVANCE
		rx_is_w S0, I1, ADVANCE
		rx_is_w S0, I1, ADVANCE
CODE
<><aA9_><>
OUTPUT

output_is(gentest_advance('?', <<'CODE'), <<'OUTPUT', '\w (failure)');
		rx_is_w S0, I1, ADVANCE
CODE
no match
OUTPUT

output_is(gentest_advance('0123456789', <<'CODE'), <<'OUTPUT', '\d (success)');
		rx_is_d S0, I1, ADVANCE
		rx_is_d S0, I1, ADVANCE
		rx_is_d S0, I1, ADVANCE
		rx_is_d S0, I1, ADVANCE
		rx_is_d S0, I1, ADVANCE
		rx_is_d S0, I1, ADVANCE
		rx_is_d S0, I1, ADVANCE
		rx_is_d S0, I1, ADVANCE
		rx_is_d S0, I1, ADVANCE
		rx_is_d S0, I1, ADVANCE
CODE
<><0123456789><>
OUTPUT

output_is(gentest_advance('@?#', <<'CODE'), <<'OUTPUT', '\d (failure)');
		rx_is_d S0, I1, ADVANCE
		rx_is_d S0, I1, ADVANCE
		rx_is_d S0, I1, ADVANCE
CODE
no match
OUTPUT

output_is(gentest_advance(' ', <<'CODE'), <<'OUTPUT', '\s (success)');
		rx_is_s S0, I1, ADVANCE
CODE
<>< ><>
OUTPUT

output_is(gentest_advance('a', <<'CODE'), <<'OUTPUT', '\s (failure)');
		rx_is_s S0, I1, ADVANCE
CODE
no match
OUTPUT

output_is(gentest_advance('a', <<'CODE'), <<'OUTPUT', 'stack (pushindex/popindex)');
		rx_initstack
		rx_pushindex I1
		rx_literal S0, I1, "a", ADVANCE
		rx_popindex I1, ADVANCE
CODE
<><><a>
OUTPUT

output_is(gentest_advance('a', <<'CODE'), <<'OUTPUT', 'stack (pushmark)');
		rx_pushmark
		rx_pushindex I1
		rx_literal S0, I1, "a", ADVANCE
		rx_popindex I1, ADVANCE
		rx_popindex I1, ADVANCE
CODE
no match
OUTPUT

output_is(gentest_advance('a', <<'CODE'), <<'OUTPUT', 'groups');
		set I2, I1
		rx_literal S0, I1, "a", ADVANCE
		set I3, I1
		
		sub I3, I3, I2
		substr S1, S0, I2, I3
		print "("
		print S1
		print ")\n"
CODE
(a)
<><a><>
OUTPUT

output_is(gentest_advance('a', <<'CODE'), <<'OUTPUT', 'ZWA: ^ (success)');
		rx_literal S0, I1, "a", ADVANCE
CODE
<><a><>
OUTPUT

output_is(gentest_advance('b', <<'CODE'), <<'OUTPUT', 'ZWA: ^ (failure)');
		rx_literal S0, I1, "a", ADVANCE
CODE
no match
OUTPUT

output_is(gentest_advance('a', <<'CODE'), <<'OUTPUT', 'ZWA: $ (success)');
		rx_literal S0, I1, "a", ADVANCE
		rx_zwa_atend S0, I1, ADVANCE
CODE
<><a><>
OUTPUT

output_is(gentest_advance('ab', <<'CODE'), <<'OUTPUT', 'ZWA: $ (failure)');
		rx_literal S0, I1, "a", ADVANCE
		rx_zwa_atend S0, I1, ADVANCE
CODE
no match
OUTPUT

output_is(gentest_advance('a?', <<'CODE'), <<'OUTPUT', 'ZWA: \b (success)');
		rx_literal S0, I1, "a", ADVANCE
		rx_zwa_boundary S0, I1, ADVANCE
CODE
<><a><?>
OUTPUT

output_is(gentest_advance('ab', <<'CODE'), <<'OUTPUT', 'ZWA: \b (failure)');
		rx_literal S0, I1, "a", ADVANCE
		rx_zwa_boundary S0, I1, ADVANCE		
CODE
no match
OUTPUT

SKIP: {
	skip("Pending some sort of lowercasing op",1);
	output_is(gentest_advance('HeLlO', <<'CODE', 'i'), <<'OUTPUT', 'case-insensitive regexen (/i)');
		rx_literal P0, "hel", ADVANCE
		rx_oneof P0, "lmno", ADVANCE
		rx_oneof P0, "lmno", ADVANCE
CODE
<><HeLlO><>
OUTPUT
warn "# Don't worry about above warning--the test in question is a TODO\n";
};


1;
