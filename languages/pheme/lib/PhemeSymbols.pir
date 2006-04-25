.namespace [ 'Pheme' ]

.sub __onload :load
	.local pmc symbols
	symbols = new .Hash

	symbols['car']               = 1
	symbols['cdr']               = 1
	symbols['cons']              = 1
	symbols['include_file']      = 1
	symbols['write']             = 1
	symbols['__make_empty_cons'] = 1

	store_global 'PhemeCompiler', 'symbols', symbols
	.return()
.end

.sub __resolve_at_runtime
	.param string symbol_name
	.param pmc    args :slurpy

	.local pmc function
	push_eh return_list
	function = find_global symbol_name
	unless function goto return_list
	clear_eh

	.local pmc result
	result = function( args :flat )
	.return( result )

  return_list:
	unshift args, symbol_name
  	.return( args )
.end

.sub car
	.param pmc list

	.local int count
	count = list

	if count > 0 goto really_car
	.return( list )

  really_car:
	.local pmc first_item
	first_item = new .String
	first_item = list[0]

	.return( first_item )
.end

.sub cdr
	.param pmc list

	.local pmc iter
	iter = new .Iterator, list
	iter = 0

	.local pmc result
	result = new .ResizablePMCArray

	# skip the first element
	.local pmc elem
	elem = shift iter

  iter_loop:
	unless iter goto iter_end
	elem = shift iter
	push result, elem
	goto iter_loop

  iter_end:
	.return( result )
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

	unshift r, l

	.return( r )
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

.sub 'write' :multi( string )
	.param string message_string

	print message_string
	.return()
.end

.sub __make_empty_cons
	.local pmc result
	result = new .ResizableStringArray
	.return( result )
.end
