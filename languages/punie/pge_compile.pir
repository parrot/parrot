.sub _main :main
    .param pmc args
    .local string source
    source = _get_source(args)

    load_bytecode "PGE.pbc"
    load_bytecode "PGE/Util.pir"
    load_bytecode "PGE/Text.pir"
    $P0 = compreg "PGE::P6Grammar"
    $S1 = $P0(source)
    print $S1
.end

# Read in the source from a file
.sub _get_source
    .param pmc argv
    .local string filename

    $I0 = argv
    if $I0 != 2 goto err_no_file

    # Read in the source file
    filename = argv[1]
    $S1 = _slurp_file(filename)
    .return ($S1)

  err_no_file:
    print "You must supply a grammar file to parse.\n"
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
