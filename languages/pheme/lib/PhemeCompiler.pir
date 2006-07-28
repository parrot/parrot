.namespace [ 'PhemeCompiler' ]

.sub __onload :load
	load_bytecode 'PGE.pbc'
	load_bytecode 'PGE/Text.pbc'

	.local pmc compiler
	compiler = newclass 'PhemeCompiler'
	addattribute compiler, 'ast'
	addattribute compiler, 'ost'
	addattribute compiler, 'pir'

	.return()
.end

.sub init :method
	.param pmc ast :named('ast')
	.param pmc ost :named('ost')
	.param pmc pir :named('pir')

	setattribute self, 'ast',  ast
	setattribute self, 'ost', ost
	setattribute self, 'pir',  pir
.end

.sub 'compile' :method
	.param pmc source

	.local pmc parse_tree
	parse_tree = self.'get_parse_tree'( source )
	unless parse_tree goto err_parse_fail

	# self.dump_parse_tree( parse_tree )

	.local pmc past_tree
	past_tree = self.get_past_tree( parse_tree )
	unless past_tree goto err_past_fail

	# self.dump_it( past_tree )

	.local pmc post_tree
	post_tree = self.get_post_tree( past_tree )
	unless post_tree goto err_post_fail

 	# self.dump_it( post_tree )

	.local pmc pir
	pir = self.get_pir( post_tree )
	unless pir goto err_pir_fail
	# print pir
	# end

	.local pmc pir_compiled
	pir_compiled = self.compile_pir( pir )
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

.sub get_parse_tree :method
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

.sub get_past_tree :method
	.param pmc parse_tree

	load_bytecode 'TGE.pbc'
	load_bytecode 'Node.pbc'
	load_bytecode 'PAST.pbc'

	.local pmc compiled_symbols
	compiled_symbols = new .Hash

	store_global 'PhemeCompiler', 'symbols', compiled_symbols

	.local pmc tge_past
	tge_past = getattribute self, 'ast'

	.local pmc compiler
	compiler = new 'TGE::Compiler'

	.local pmc ast_builder
	ast_builder = tge_past.apply( parse_tree )

	.local pmc past_tree
	past_tree = ast_builder.get( 'result' )
	.return( past_tree )
.end

.sub get_post_tree :method
	.param pmc past_tree

	load_bytecode 'lib/POST.pir'

	.local pmc tge_ost
	tge_ost = getattribute self, 'ost'

	.local pmc post_builder
	post_builder = tge_ost.apply( past_tree )

	.local pmc post_tree
	post_tree = post_builder.get( 'result' )
	.return( post_tree )
.end

.sub get_pir :method
	.param pmc post_tree

	.local pmc tge_pir
	tge_pir = getattribute self, 'pir'

	.local pmc pir_builder
	pir_builder = tge_pir.apply( post_tree )

	.local pmc pir
	pir = pir_builder.get( 'result' )
	.return( pir )
.end

.sub compile_pir :method
	.param pmc pir

	.local pmc pir_compiler
	.local pmc pir_compiled
	pir_compiler = compreg "PIR" 
	pir_compiled = pir_compiler( pir )
	.return( pir_compiled )
.end

.sub dump_parse_tree :method
	.param pmc match
	load_bytecode 'dumper.pbc'
	load_bytecode 'PGE/Dumper.pbc'

	.local pmc dumper
	dumper = find_global '_dumper'
	dumper( match, '$/' )
	.return()
.end

.sub dump_it :method
	.param pmc tree
	tree.'dump'()
	end
.end
