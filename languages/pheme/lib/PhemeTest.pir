.sub _load :load
	load_bytecode 'library/Test/More.pir'

	.local pmc plan
	.local pmc is
	.local pmc ok
	.local pmc diag
	.local pmc is_deeply

	plan      = find_global 'Test::More', 'plan'
	is        = find_global 'Test::More', 'is'
	ok        = find_global 'Test::More', 'ok'
	diag      = find_global 'Test::More', 'diag'
	is_deeply = find_global 'Test::More', 'is_deeply'

	store_global 'Pheme', 'plan', plan
	store_global 'Pheme', 'is', is
	store_global 'Pheme', 'ok', ok
	store_global 'Pheme', 'diag', diag
	store_global 'Pheme', 'is_deeply', is_deeply
.end

=cut

.namespace[ 'Pheme' ]

.sub _is :multi( ResizablePMCArray, ResizablePMCArray )
	.param pmc    l_list
	.param pmc    r_list
	.param string diagnostic :optional

	.local int l_count
	.local int r_count
	l_count = l_list
	r_count = r_list

	.local string explanation
	.local string num_to_s

	if l_count == r_count goto check_items

	explanation  = 'Expected has '
	num_to_s     = l_count
	explanation .= num_to_s
	explanation .= ' elements, Received has '
	num_to_s     = r_count
	explanation .= num_to_s
	explanation .= ' elements'

	ok( 0, diagnostic )
	diag( explanation )
	.return()

  check_items:
  	.local int i
	i = 0

	.local pmc l_elem
	.local pmc r_elem

  loop_start:
	if i == l_count goto loop_end
	l_elem = l_list[i]
	r_elem = r_list[i]
	eq l_elem, r_elem, pass_this_index
	ok( 0, diagnostic )

	explanation  = 'Elements mismatched at index '
	num_to_s   = i
	explanation .= num_to_s
	explanation .= ', ('
	num_to_s   = l_elem
	explanation .= num_to_s
	explanation .= '), ('
	num_to_s   = r_elem
	explanation .= num_to_s
	explanation .= ')'
	diag( explanation )
	.return()

  pass_this_index:
  	inc i
  	goto loop_start

  loop_end:
  	ok( 1, diagnostic )
	.return()
.end

=cut
