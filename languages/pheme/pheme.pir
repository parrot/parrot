.include 'errors.pasm'

.sub _main :main
	.param pmc args

	errorson .PARROT_ERRORS_PARAM_COUNT_FLAG

	load_bytecode 'languages/pheme/lib/PhemeCompiler.pbc'
	load_bytecode 'languages/pheme/lib/PhemeSymbols.pbc'
	load_bytecode 'languages/pheme/lib/pheme_grammar_gen.pir'

	.local string source
	source     = _get_source( args )

	.local pmc compile_pheme
	compile_pheme = find_global 'PhemeCompiler', 'compile_pheme'

	.local pmc ast
	ast = compile_pheme( source )
	end
.end

.sub _get_source
    .param pmc argv
    .local string filename

	.local int arg_count

    arg_count = argv
    unless arg_count == 2 goto err_no_file

    # Read in the source file
    filename = argv[1]

	.local string file_source
    file_source = _slurp_file(filename)
    .return( file_source )

  err_no_file:
    print "You must supply a Pheme file to parse.\n"
    end
.end

.sub _slurp_file
    .param string filename
    .local pmc filehandle
    filehandle = open filename, "<"
    unless filehandle goto err_no_file
    $S1 = read filehandle, 65535
    close filehandle
    .return ($S1)

  err_no_file:
    print "Unable to open file "
    print filename
    print "\n"
    end
.end

=head1 LICENSE

Copyright (c) 2006 The Perl Foundation

This is free software; you may redistribute it and/or modify it under the same
terms as Parrot.

=head1 AUTHOR

chromatic <chromatic@wgz.org>

=cut
