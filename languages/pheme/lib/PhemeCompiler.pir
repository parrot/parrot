.sub __onload :load
	load_bytecode 'PGE.pbc'
	load_bytecode 'PGE/Text.pbc'
.end

.sub compile_pheme
	.param pmc source

	.local pmc parse_tree
	parse_tree = get_parse_tree( source )
	unless parse_tree goto err_parse_fail

	# dump_parse_tree( parse_tree )

	.local pmc past_tree
	past_tree = get_past_tree( parse_tree )
	unless past_tree goto err_past_fail

	# dump_it( past_tree )

	.local pmc post_tree
	post_tree = get_post_tree( past_tree )
	unless post_tree goto err_post_fail

 	# dump_it( post_tree )

	.local pmc pir
	pir = get_pir( post_tree )
	unless pir goto err_pir_fail

	.local pmc pir_compiled
	pir_compiled = compile_pir( pir )
	unless pir_compiled goto err_no_pir_compiled

	pir_compiled()
	end

  err_parse_fail:
  	print "Parse failed\n"

  err_past_fail:
	print "Unable to construct AST.\n"

  err_post_fail:
	print "Unable to construct OST.\n"

  err_pir_fail:
	print "Unable to construct PIR.\n"

  err_no_pir_compiled:
	print "Unable to compile PIR.\n"

  cleanup:
  	.return()
.end

.sub get_parse_tree
	.param pmc source

	.local pmc start_rule
	.local pmc newfrom
	.local pmc match

	start_rule = find_global 'Pheme::Grammar', 'prog'
	newfrom    = find_global 'PGE::Match', 'newfrom'
	source     = newfrom(source, 0, 'Pheme::Grammar')
	match      = start_rule( source )

	.return( match )
.end

.sub get_past_tree
	.param pmc parse_tree

	load_bytecode 'TGE.pbc'
	load_bytecode 'Node.pbc'
	load_bytecode 'PAST.pbc'

	.local pmc compiled_symbols
	compiled_symbols = new .Hash

	store_global 'PhemeCompiler', 'symbols', compiled_symbols

	.local string tg_source
	tg_source = _slurp_file( 'lib/pge2past.tg' )

	.local pmc tree_grammar
	tree_grammar = new 'TGE'
	tree_grammar.agcompile( tg_source )

	.local pmc ast_builder
	ast_builder = tree_grammar.apply( parse_tree )

	.local pmc past_tree
	past_tree = ast_builder.get( 'result' )
	.return( past_tree )
.end

.sub get_post_tree
	.param pmc past_tree

	load_bytecode 'lib/POST.pbc'
	load_bytecode 'lib/PhemeSymbols.pbc'

	.local string tg_source
	tg_source = _slurp_file( 'lib/past2post.tg' )

	.local pmc post_grammar
	post_grammar = new 'TGE'
	post_grammar.agcompile( tg_source )

	.local pmc post_builder
	post_builder = post_grammar.apply( past_tree )

	.local pmc post_tree
	post_tree = post_builder.get( 'result' )
	.return( post_tree )
.end

.sub get_pir
	.param pmc post_tree

	.local string tg_source
	tg_source = _slurp_file( 'lib/post2pir.tg' )

	.local pmc pir_grammar
	pir_grammar = new 'TGE'
	pir_grammar.agcompile( tg_source )

	.local pmc pir_builder
	pir_builder = pir_grammar.apply( post_tree )

	.local pmc pir
	pir = pir_builder.get( 'result' )
	.return( pir )
.end

.sub compile_pir
	.param pmc pir

	.local pmc pir_compiler
	.local pmc pir_compiled
	pir_compiler = compreg "PIR" 
	pir_compiled = pir_compiler( pir )
	.return( pir_compiled )
.end

.sub dump_parse_tree
	.param pmc match
	load_bytecode 'dumper.pbc'
	load_bytecode 'PGE/Dumper.pbc'

	.local pmc dumper
	dumper = find_global '_dumper'
	dumper( match, '$/' )
	.return()
.end

.sub dump_it
	.param pmc tree
	tree.'dump'()
	end
.end
