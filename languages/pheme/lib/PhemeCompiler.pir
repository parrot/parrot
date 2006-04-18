.sub __onload :load
	load_bytecode 'PGE.pbc'
	load_bytecode 'PGE/Text.pbc'
.end

.sub compile_pheme
	.param pmc source

	.local pmc match
	.local pmc start_rule
	.local pmc newfrom
	start_rule = find_global 'Pheme::Grammar', 'prog'
	newfrom    = find_global 'PGE::Match', 'newfrom'
	source     = newfrom(source, 0, 'Pheme::Grammar')
	match      = start_rule( source )
	# dump_match( match )

	.local pmc compiled_symbols
	compiled_symbols = new .Hash
	store_global 'PhemeCompiler', 'symbols', compiled_symbols

	unless match goto err_match_fail

	.local string tg_source
	tg_source = _slurp_file( 'lib/pge2past.tg' )

	load_bytecode 'TGE.pbc'
	.local pmc tree_grammar
	tree_grammar = new 'TGE'
	tree_grammar.agcompile( tg_source )

	.local pmc ast_builder
	ast_builder = tree_grammar.apply( match )

	load_bytecode 'lib/PAST.pbc'
	.local pmc ast
	ast = ast_builder.get( 'result' )
	$I0 = defined ast
	unless $I0 goto err_no_ast

	# dump_it( ast )

	tg_source = _slurp_file( 'lib/past2post.tg' )
	.local pmc post_grammar
	post_grammar = new 'TGE'
	post_grammar.agcompile( tg_source )

	.local pmc post_builder
	post_builder = post_grammar.apply( ast )

	load_bytecode 'lib/POST.pbc'
	load_bytecode 'lib/PhemeSymbols.pbc'
	.local pmc post
	post = post_builder.get( 'result' )
	$I0 = defined post
	unless $I0 goto err_no_post

 	# dump_it( post )

	tg_source = _slurp_file( 'lib/post2pir.tg' )
	.local pmc pir_grammar
	pir_grammar = new 'TGE'
	pir_grammar.agcompile( tg_source )

	.local pmc pir_builder
	pir_builder = pir_grammar.apply( post )

	.local pmc pir
	pir = pir_builder.get( 'result' )
	$I0 = defined pir
	unless $I0 goto err_no_pir

	.local pmc pir_compiler
	.local pmc pir_compiled
	pir_compiler = compreg "PIR" 
	pir_compiled = pir_compiler( pir )

	pir_compiled()

	end


  err_match_fail:
  	print "Parse failed\n"

  err_no_ast:
	print "Unable to construct AST.\n"

  err_no_post:
	print "Unable to construct OST.\n"

  err_no_pir:
	print "Unable to construct PIR.\n"

  cleanup:
  	.return()
.end

.sub dump_match
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
