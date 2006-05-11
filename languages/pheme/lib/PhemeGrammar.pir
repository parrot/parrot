.namespace [ 'PhemeGrammar' ]

.sub _load :load
	load_bytecode 'PGE.pbc'

	.local pmc pge_rule_class
	.local pmc pheme_grammar_class

	pge_rule_class      = getclass 'PGE::Grammar'
	pheme_grammar_class = subclass pge_rule_class, 'PhemeGrammar'
.end

.include "languages/pheme/lib/pheme_grammar_gen.pir"
