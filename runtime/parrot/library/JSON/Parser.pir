# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=pod

JSON::Parser

=head1 DESCRIPTION

This module uses a grammar designed to describe the syntax for B<JSON> files,
in order to enable the conversion of data in the B<JSON> format to a B<PMC>.

=cut

.namespace [ 'JSON::Parser' ]


.sub 'VERSION'
	.return( '0.01' )
.end


.sub '__onload' :load
	.local pmc p6rule_compile
	.local string json_grammar
	.local pmc rules

	load_bytecode 'PGE.pbc'
	p6rule_compile = find_global 'PGE', 'p6rule'

	json_grammar = <<"JSON_GRAMMAR"
grammar JSON;
rule object { \\{ <members>? \\} }
rule members { <string> \\: <value> [ \\, <string> \\: <value> ]* }
rule array { \\[ <elements>? \\] }
rule elements { <value> [ \\, <value> ]* }
rule value { <string> | <number> | <object> | <array> | true | false | null }
rule string { \\" <char>* \\" }
rule char { \\w | \\" | \\ | \\/ | \\010 | \\014 | <cntrl> | \\u <xdigit>**{4} }
rule number { <int> <frac>? <exp>? } 
rule int { \\-? \d+ }
rule frac { \\. \d+ }
rule exp { <e> \\d+ }
rule e :i { e <[\\-+]>? }
JSON_GRAMMAR

	rules = p6rule_compile( json_grammar )
	store_global 'rules', rules
.end


.sub 'parser'
	.param string json

	.local pmc rules
	rules = find_global 'rules'

	.local pmc match
	match = rules( json )

	unless match goto match_fail

	## add meat to this skeleton

MATCH_FAIL:
	.return( match )
.end


=head1 AUTHOR

Jerry Gay a.k.a. particle (E<jerry.gay@gmail.com>)

=cut
