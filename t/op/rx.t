use Parrot::Test tests => 27;
use Test::More;

sub gentest($$;$$) {
	$_[2] ||= "";
	$_[3] ||= 0;

	return <<"END";
		set S0, "$_[0]"
		rx_allocinfo P0, S0
		bsr RX_0
		rx_info_successful P0, I0
		if I0, YUP
		print "no match\\n"
		end
	YUP:
		rx_info_getstartindex P0, I1
		rx_info_getindex P0, I2
		length I3, S0
		
		rx_freeinfo P0

		substr S1, S0,  0, I1
		sub I4, I2, I1
		substr S2, S0, I1, I4
		sub I4, I3, I2
		substr S3, S0, I2, I4	

		print "<"
		print S1
		print "><"
		print S2
		print "><"
		print S3
		print ">\\n"
		
		end

	RX_0:
		rx_setprops P0, "$_[2]", $_[3]
		branch START
	ADVANCE:
		rx_advance P0, FAIL
	START:
		$_[1]

		rx_succeed P0
		ret
	FAIL:
		rx_fail P0
		ret
END
}

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'A is A');
		rx_literal P0, "a", ADVANCE
CODE
<><a><>
OUTPUT

output_is(gentest('b', <<'CODE'), <<'OUTPUT', 'A is not B');
		rx_literal P0, "a", ADVANCE
CODE
no match
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'Pattern longer than string');
		rx_literal P0, "aa", ADVANCE
CODE
no match
OUTPUT

output_is(gentest('ba', <<'CODE'), <<'OUTPUT', 'inching through the string');
		rx_literal P0, "a", ADVANCE
CODE
<b><a><>
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'character classes (successful)');
		rx_oneof P0, "aeiou", ADVANCE
CODE
<><a><>
OUTPUT

output_is(gentest('b', <<'CODE'), <<'OUTPUT', 'character classes (failure)');
		rx_oneof P0, "aeiou", ADVANCE
CODE
no match
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'dot (success)');
		rx_dot P0, ADVANCE
CODE
<><a><>
OUTPUT

output_is(gentest('\n', <<'CODE'), <<'OUTPUT', 'dot (failure)');
		rx_dot P0, ADVANCE
CODE
no match
OUTPUT

output_is(gentest('aA9_', <<'CODE'), <<'OUTPUT', '\w (success)');
		rx_is_w P0, ADVANCE
		rx_is_w P0, ADVANCE
		rx_is_w P0, ADVANCE
		rx_is_w P0, ADVANCE
CODE
<><aA9_><>
OUTPUT

output_is(gentest('?', <<'CODE'), <<'OUTPUT', '\w (failure)');
		rx_is_w P0, ADVANCE
CODE
no match
OUTPUT

output_is(gentest('0123456789', <<'CODE'), <<'OUTPUT', '\d (success)');
		rx_is_d P0, ADVANCE
		rx_is_d P0, ADVANCE
		rx_is_d P0, ADVANCE
		rx_is_d P0, ADVANCE
		rx_is_d P0, ADVANCE
		rx_is_d P0, ADVANCE
		rx_is_d P0, ADVANCE
		rx_is_d P0, ADVANCE
		rx_is_d P0, ADVANCE
		rx_is_d P0, ADVANCE
CODE
<><0123456789><>
OUTPUT

output_is(gentest('@?#', <<'CODE'), <<'OUTPUT', '\d (failure)');
		rx_is_d P0, ADVANCE
		rx_is_d P0, ADVANCE
		rx_is_d P0, ADVANCE
CODE
no match
OUTPUT

output_is(gentest(' ', <<'CODE'), <<'OUTPUT', '\s (success)');
		rx_is_s P0, ADVANCE
CODE
<>< ><>
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', '\s (failure)');
		rx_is_s P0, ADVANCE
CODE
no match
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'stack (pushindex/popindex)');
		rx_pushindex P0
		rx_literal P0, "a", ADVANCE
		rx_popindex P0, ADVANCE
CODE
<><><a>
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'stack (pushmark)');
		rx_pushmark P0
		rx_pushindex P0
		rx_literal P0, "a", ADVANCE
		rx_popindex P0, ADVANCE
		rx_popindex P0, ADVANCE
CODE
no match
OUTPUT

SKIP: { skip("Arrays are still wacky", 1);
output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'groups');
		rx_startgroup P0, 0
		rx_literal P0, "a", ADVANCE
		rx_endgroup P0, 0
		
		rx_info_getgroup P0, I1, I2, 0
		sub I2, I2, I1
		substr S1, S0, I1, I2
		print "("
		print S1
		print ")\n"
CODE
(a)
<><a><>
OUTPUT
}

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'ZWA: ^ (success)');
		rx_zwa_atbeginning P0, ADVANCE
		rx_literal P0, "a", ADVANCE
CODE
<><a><>
OUTPUT

output_is(gentest('b', <<'CODE'), <<'OUTPUT', 'ZWA: ^ (failure)');
		rx_zwa_atbeginning P0, ADVANCE
		rx_literal P0, "a", ADVANCE
CODE
no match
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'ZWA: $ (success)');
		rx_literal P0, "a", ADVANCE
		rx_zwa_atend P0, ADVANCE
CODE
<><a><>
OUTPUT

output_is(gentest('ab', <<'CODE'), <<'OUTPUT', 'ZWA: $ (failure)');
		rx_literal P0, "a", ADVANCE
		rx_zwa_atend P0, ADVANCE
CODE
no match
OUTPUT

output_is(gentest('a?', <<'CODE'), <<'OUTPUT', 'ZWA: \b (success)');
		rx_literal P0, "a", ADVANCE
		rx_zwa_boundary P0, ADVANCE
CODE
<><a><?>
OUTPUT

output_is(gentest('ab', <<'CODE'), <<'OUTPUT', 'ZWA: \b (failure)');
		rx_literal P0, "a", ADVANCE
		rx_zwa_boundary P0, ADVANCE
CODE
no match
OUTPUT


output_is(gentest('ba', <<'CODE', 'r'), <<'OUTPUT', 'reversed regexen (/r)');
		rx_dot P0, ADVANCE
CODE
<b><a><>
OUTPUT

output_is(gentest('\n', <<'CODE', 's'), <<'OUTPUT', 'single-line regexen (/s)');
		rx_dot P0, ADVANCE
CODE
<><
><>
OUTPUT

SKIP: {
skip("Failing under new assembler for unknown reason.",1);
output_is(gentest('\n\n', <<'CODE', 'm'), <<'OUTPUT', 'multiline regexen (/m)');
		rx_literal P0, "\n", ADVANCE
		rx_zwa_atbeginning P0, ADVANCE
		rx_zwa_atend P0, ADVANCE
CODE
<><
><
>
OUTPUT
};

SKIP: {
	skip("Pending some sort of lowercasing op",1);
	output_is(gentest('HeLlO', <<'CODE', 'i'), <<'OUTPUT', 'case-insensitive regexen (/i)');
		rx_literal P0, "hel", ADVANCE
		rx_oneof P0, "lmno", ADVANCE
		rx_oneof P0, "lmno", ADVANCE
CODE
<><HeLlO><>
OUTPUT
warn "# Don't worry about above warning--the test in question is a TODO\n";
};


1;
