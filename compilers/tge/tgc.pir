=head1 TITLE

tgc.pir - The TGE rules compiler

=head1 SYNOPSIS

    > ./parrot compilers/tge/tgc.pir [OPTIONS] FILE

=head2 DESCRIPTION

This program takes a tree grammar, specified in B<FILE>, and compiles it
into the PIR code needed to execute that grammar. This PIR code is then
suitable for inclusion or compilation into other larger programs.

=head2 OPTIONS

=over 4

=item --output OUTFILE

Send the output to OUTFILE. By default, output is directed to STDOUT.

=cut

.sub "main" :main
    .param pmc args
    .local string prog
    .local string infile, outfile

    load_bytecode "TGE.pbc"
    load_bytecode "Getopt/Obj.pir"

    # Grab program name for error reporting
    prog = shift args

    # Sanity check parameters
    $I0 = args
    unless $I0 >= 1 goto ERR_TOO_FEW_ARGS

    # Grab the final argument
    infile = pop args


    # Process command line options
    .local pmc getopts
    getopts = new "Getopt::Obj"
    getopts."notOptStop"(1)
    push getopts, "output|o=s"
    push getopts, "help|h"
    .local pmc opts
    opts = getopts."get_options"( args )

    .local string help
    help = opts['help']
    if help goto USAGE

    .local pmc outfh

    .local int ck_output
    ck_output = exists opts['output']
    if ck_output goto OUTPUT_FILE

  OUTPUT_STDOUT:
    outfh = getstdout
    goto OUTPUT_DONE

  OUTPUT_FILE:
    outfile = opts['output']
    outfh = open outfile, '>'
    unless outfh goto ERR_NO_OUTFILE

  OUTPUT_DONE:

    # Read grammar file and compile here
    .local pmc infh
    infh = open infile, "<"
    unless infh goto ERR_NO_INFILE

    .local string source
    source = read infh, 65535
    close infh

    .local pmc grammar
    grammar = new 'TGE::Compiler'

    .local string compiled_source
    compiled_source = grammar.'precompile'(source)
    print outfh, compiled_source

  goto END

  USAGE:
    printerr "Usage: "
    printerr prog
    printerr " [OPTIONS] FILE\n"
    printerr <<"OPTIONS"
 Options:
  --output=OUTFILE  -- redirect output to OUTFILE
  --help            -- print this message
OPTIONS
    exit 1

  ERR_TOO_FEW_ARGS:
    printerr "Error: too few arguments\n\n"
    goto USAGE

  ERR_NO_INFILE:
    printerr "Error: file not found: "
    printerr infile
    printerr "\n\n"
    goto USAGE

  ERR_NO_OUTFILE:
    printerr "Error: file not found: "
    printerr outfile
    printerr "\n\n"
    goto USAGE

  END:
.end
