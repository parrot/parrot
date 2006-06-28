.namespace [ 'PhemeCompiler' ]

.sub __onload :load
	.local pmc symbols
	symbols = new .Hash

	symbols['car']               = 1
	symbols['cdr']               = 1
	symbols['cons']              = 1
	symbols['include_file']      = 1
	symbols['write']             = 1

	store_global 'PhemeCompiler', 'symbols', symbols
	.return()
.end

.namespace [ 'Pheme' ]

.sub __resolve_at_runtime :multi( [ 'Pheme'; 'Cons' ] )
	.param pmc args :slurpy

	.local pmc result
	result = __list_to_cons( args :flat ) 
	.return( result )
.end

.sub __resolve_at_runtime :multi( string )
	.param string symbol_name
	.param pmc    args :slurpy

	.local pmc function
	push_eh return_list
	function = find_global symbol_name
	unless function goto return_list
	clear_eh

	.local pmc    result
	result = function( args :flat )

	.return( result )

  return_list:

	result = __list_to_cons( symbol_name, args :flat )
  	.return( result )
.end

.sub __list_to_cons
	.param pmc args :slurpy

	.local int cons_type
	cons_type = find_type [ 'Pheme'; 'Cons' ]

	.local pmc result
	result = new cons_type

	.local int args_count
	.local pmc arg

  loop_start:
	args_count = args
	unless args_count goto loop_end
	arg        = pop args
	result     = cons( arg, result )
	goto loop_start

  loop_end:
  	.return( result )
.end

.sub car
	.param pmc cons

	.local pmc head
	head = cons.'head'()

	.local int defined_head
	defined_head = defined head

	unless defined_head goto return_nil
	.return( head )

  return_nil:
	.return( 'nil' )
.end

.sub cdr
	.param pmc cons

	.local pmc tail
	tail = cons.'tail'()

	.return( tail )
.end

.sub include_file
	.param pmc file_path

	.local string filename
	filename = file_path

	load_bytecode filename
	.return()
.end

.sub cons
	.param pmc l
	.param pmc r

	.local int cons_type
	cons_type = find_type [ 'Pheme'; 'Cons' ]

	.local pmc result
	result = new cons_type

	result.'head'( l )
	result.'tail'( r )

	.return( result )
.end

.sub 'write' :multi()
	.param pmc messages :slurpy

	.local string message
	.local pmc iter
	iter = new .Iterator, messages
	iter = 0

  iter_loop:
	unless iter goto iter_end
	message = shift iter
	print message
	goto iter_loop

  iter_end:
	.return()
.end

.sub 'eqlist?'
	.param pmc l_cons
	.param pmc r_cons

	.local int l_count
	.local int r_count
	l_count = l_cons
	r_count = r_cons

	unless l_count == 0 goto not_empty
	unless r_count == 0 goto not_empty
	.return( 1 )

  not_empty:
	if l_count == r_count goto compare_head
	.return( 0 )

  compare_head:
	.local pmc l_head
	.local pmc r_head

	l_head = l_cons.'head'()
	r_head = r_cons.'head'()

	.local int head_equal
	head_equal = 'eq?'( l_head, r_head ) 

	if head_equal goto compare_tail
	.return( 0 )

  compare_tail:
	.local pmc l_tail
	.local pmc r_tail

	l_tail = l_cons.'tail'()
	r_tail = r_cons.'tail'()

	.local int tail_equal
	tail_equal = 'eqlist?'( l_head, r_head ) 
	.return( tail_equal )
.end

.sub 'eq?' :multi( pmc, pmc )
	.param pmc l_atom
	.param pmc r_atom

	eq l_atom, r_atom, return_true
	.return( 0 )

  return_true:
	.return( 1 )
.end

.sub 'eq?' :multi( [ 'Pheme'; 'Cons' ], [ 'Pheme'; 'Cons' ] )
	.param pmc l_cons
	.param pmc r_cons

	.local int result
	result = 'eqlist?'( l_cons, r_cons )
	.return( result )
.end

# XXX - return #t
.sub 'atom?' :multi( [ 'Pheme'; 'Atom' ] )
	.param pmc atom

	.return( 1 )
.end

# XXX - return #f
.sub 'atom?' :multi( [ 'Pheme'; 'Cons' ] )
	.param pmc cons

	.return( 0 )
.end

# XXX - a cheat for now
.sub 'atom?' :multi( String )
	.param pmc val
	.return( 1 )
.end

.sub 'null?' :multi( [ 'Pheme'; 'Cons' ] )
	.param pmc cons
	.local int count
	count = cons

	eq count, 0, indeed_empty
	.return( 0 )

  indeed_empty:
	.return( 1 )
.end

.sub '+' :multi( String, String )
	.param String first
	.param pmc    rest   :slurpy

	.local int result
	result   = first

	.local pmc add_iter
	add_iter = new .Iterator, rest

	.local String next
	.local int    next_int

  loop:
 	unless add_iter goto end_loop
	next     = shift add_iter
	next_int = next
	result  += next_int
	goto loop

  end_loop:
	.return( result )
.end

.sub 'null?' :multi( _ )
	.param pmc dummy
	.return( 0 )
.end

.sub 'write' :multi( string )
	.param string message_string

	print message_string
	.return()
.end

.sub __make_empty_cons
	.local pmc result

	.local int cons_type
	cons_type = find_type [ 'Pheme'; 'Cons' ]

	.local pmc result
	result = new cons_type
	.return( result )
.end
