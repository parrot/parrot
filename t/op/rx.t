use Parrot::Test tests => 22;

sub gentest($$;$$) {
	$_[2] ||= "";
	$_[3] ||= 0;

	return <<"END";
		set S0, "$_[0]"
		rx_allocinfo P0, S0
		bsr RX_0
		rx_info_successful P0, I0
		if I0, \$yup
		print "no match\\n"
		end
	\$yup:
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
		branch \$start
	\$advance:
		rx_advance P0, \$fail
	\$start:
		$_[1]

		rx_succeed P0
		ret
	\$fail:
		rx_fail P0
		ret
END
}

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'A is A');
		rx_literal P0, "a", $advance
CODE
<><a><>
OUTPUT

output_is(gentest('b', <<'CODE'), <<'OUTPUT', 'A is not B');
		rx_literal P0, "a", $advance
CODE
no match
OUTPUT

output_is(gentest('ba', <<'CODE'), <<'OUTPUT', 'inching through the string');
		rx_literal P0, "a", $advance
CODE
<b><a><>
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'character classes (successful)');
		rx_oneof P0, "aeiou", $advance
CODE
<><a><>
OUTPUT

output_is(gentest('b', <<'CODE'), <<'OUTPUT', 'character classes (failure)');
		rx_oneof P0, "aeiou", $advance
CODE
no match
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'dot (success)');
		rx_dot P0, $advance
CODE
<><a><>
OUTPUT

output_is(gentest('\n', <<'CODE'), <<'OUTPUT', 'dot (failure)');
		rx_dot P0, $advance
CODE
no match
OUTPUT

output_is(gentest('aA9_', <<'CODE'), <<'OUTPUT', '\w (success)');
		rx_is_w P0, $advance
		rx_is_w P0, $advance
		rx_is_w P0, $advance
		rx_is_w P0, $advance
CODE
<><aA9_><>
OUTPUT

output_is(gentest('?', <<'CODE'), <<'OUTPUT', '\w (failure)');
		rx_is_w P0, $advance
CODE
no match
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'stack (pushindex/popindex)');
		rx_pushindex P0
		rx_literal P0, "a", $advance
		rx_popindex P0, $advance
CODE
<><><a>
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'stack (pushmark)');
		rx_pushmark P0
		rx_pushindex P0
		rx_literal P0, "a", $advance
		rx_popindex P0, $advance
		rx_popindex P0, $advance
CODE
no match
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'groups');
		rx_startgroup P0, 0
		rx_literal P0, "a", $advance
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

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'ZWA: ^ (success)');
		rx_zwa_atbeginning P0, $advance
		rx_literal P0, "a", $advance
CODE
<><a><>
OUTPUT

output_is(gentest('b', <<'CODE'), <<'OUTPUT', 'ZWA: ^ (failure)');
		rx_zwa_atbeginning P0, $advance
		rx_literal P0, "a", $advance
CODE
no match
OUTPUT

output_is(gentest('a', <<'CODE'), <<'OUTPUT', 'ZWA: $ (success)');
		rx_literal P0, "a", $advance
		rx_zwa_atend P0, $advance
CODE
<><a><>
OUTPUT

output_is(gentest('ab', <<'CODE'), <<'OUTPUT', 'ZWA: $ (failure)');
		rx_literal P0, "a", $advance
		rx_zwa_atend P0, $advance
CODE
no match
OUTPUT

output_is(gentest('a?', <<'CODE'), <<'OUTPUT', 'ZWA: \b (success)');
		rx_literal P0, "a", $advance
		rx_zwa_boundary P0, $advance
CODE
<><a><?>
OUTPUT

output_is(gentest('ab', <<'CODE'), <<'OUTPUT', 'ZWA: \b (failure)');
		rx_literal P0, "a", $advance
		rx_zwa_boundary P0, $advance
CODE
no match
OUTPUT


output_is(gentest('ba', <<'CODE', 'r'), <<'OUTPUT', 'reversed regexen (/r)');
		rx_dot P0, $advance
CODE
<b><a><>
OUTPUT

output_is(gentest('\n', <<'CODE', 's'), <<'OUTPUT', 'single-line regexen (/s)');
		rx_dot P0, $advance
CODE
<><
><>
OUTPUT

output_is(gentest('\n\n', <<'CODE', 'm'), <<'OUTPUT', 'multiline regexen (/m)');
		rx_literal P0, "\n", $advance
		rx_zwa_atbeginning P0, $advance
		rx_zwa_atend P0, $advance
CODE
<><
><
>
OUTPUT

TODO: {
	local $TODO="Pending some sort of lowercasing op";
	output_is(gentest('HeLlO', <<'CODE', 'i'), <<'OUTPUT', 'case-insensitive regexen (/i)');
		rx_literal P0, "hel", $advance
		rx_oneof P0, "lmno", $advance
		rx_oneof P0, "lmno", $advance
CODE
<><HeLlO><>
OUTPUT
warn "# Don't worry about above warning--the test in question is a TODO\n";
}


1;
