.namespace[ 'Test::More' ]

.sub is :multi( Pheme::Cons, Pheme::Cons )
	.param pmc    l_cons
	.param pmc    r_cons
	.param string description :optional

	.local pmc eqlist
	eqlist = find_global 'Pheme', 'eqlist?'

	.local int equal
	equal = eqlist( l_cons, r_cons )

	.local pmc test
	find_global test, 'Test::More', '_test'

	test.'ok'( equal, description )
	.return( equal )
.end

.sub is_deeply :multi( Pheme::Cons, Pheme::Cons )
	.param pmc    l_cons
	.param pmc    r_cons
	.param string description :optional

	.local pmc eqlist
	eqlist = find_global 'Pheme', 'eqlist?'

	.local int equal
	equal = eqlist( l_cons, r_cons )

	.local pmc test
	find_global test, 'Test::More', '_test'

	test.'ok'( equal, description )
	.return( equal )
.end

.namespace [ 'Pheme' ]

.sub _load :load
	load_bytecode 'library/Test/More.pir'
	_export()
.end

.sub _export
	.local pmc plan
	.local pmc is
	.local pmc ok
	.local pmc diag
	.local pmc is_deeply
	.local pmc pheme_is
	.local pmc is_sub

	plan      = find_global 'Test::More', 'plan'
	is        = find_global 'Test::More', 'is'
	ok        = find_global 'Test::More', 'ok'
	diag      = find_global 'Test::More', 'diag'
	is_deeply = find_global 'Test::More', 'is_deeply'

	store_global 'Pheme', 'plan',      plan
	store_global 'Pheme', 'is',        is
	store_global 'Pheme', 'ok',        ok
	store_global 'Pheme', 'diag',      diag
	store_global 'Pheme', 'is_deeply', is_deeply
.end
