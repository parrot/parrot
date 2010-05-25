# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

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
    load_bytecode "Getopt/Obj.pbc"

    # Grab program name for error reporting
    prog = shift args

    # Sanity check parameters
    $I0 = args
    unless $I0 >= 1 goto ERR_TOO_FEW_ARGS

    # Grab the final argument
    infile = pop args


    # Process command line options
    .local pmc getopts
    getopts = new ["Getopt";"Obj"]
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
    $P0 = getinterp
    outfh = $P0.'stdhandle'(1)
    goto OUTPUT_DONE

  OUTPUT_FILE:
    outfile = opts['output']
    outfh = new ['FileHandle']
    outfh.'open'(outfile, 'w')
    unless outfh goto ERR_NO_OUTFILE

  OUTPUT_DONE:

    # Read grammar file and compile here
    .local pmc infh
    infh = new ['FileHandle']
    infh.'open'(infile, 'r')
    unless infh goto ERR_NO_INFILE

    .local string source
    source = infh.'read'(65535)
    infh.'close'()

    .local pmc grammar
    grammar = new ['TGE';'Compiler']

    .local string compiled_source
    compiled_source = grammar.'precompile'(source, infile)
    print outfh, compiled_source
    unless ck_output goto END

    # Close the output file and check result
    $I0 = outfh.'close'()
    unless $I0 goto END
    die 'Error: close output failed'

  goto END

  USAGE:
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(2)
    $P1.'print'("Usage: ")
    $P1.'print'(prog)
    $P1.'print'(" [OPTIONS] FILE\n")
    $P1.'print'(<<"OPTIONS")
 Options:
  --output=OUTFILE  -- redirect output to OUTFILE
  --help            -- print this message
OPTIONS
    exit 1

  ERR_TOO_FEW_ARGS:
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(2)
    $P1.'print'("Error: too few arguments\n\n")
    goto USAGE

  ERR_NO_INFILE:
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(2)
    $P1.'print'("Error: file not found: ")
    $P1.'print'(infile)
    $P1.'print'("\n\n")
    goto USAGE

  ERR_NO_OUTFILE:
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(2)
    $P1.'print'("Error: file not found: ")
    $P1.'print'(outfile)
    $P1.'print'("\n\n")
    goto USAGE

  END:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
