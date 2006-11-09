=head1 TITLE

pgc.pir - The parser grammar compiler

=head1 SYNOPSIS

    > ./parrot compilers/pge/pgc.pir [OPTIONS] FILE [...]

=head1 DESCRIPTION

This program takes a set of parser rules (i.e., a parser grammar)
specified in the input C<FILE>s, and compiles it into the PIR code
needed to execute the grammar.  This PIR code is then suitable for
inclusion or compilation into other larger programs. 

=head2 Options

=over 4

=item --output=OUTFILE

Send the output to OUTFILE.  By default, output is directed to
the standard output.

=item --encoding=ENCODING

Encoding to use when reading input files.  Defaults to 'ascii', but
can also be set to 'iso-8859-1' or 'utf8'.

=back

=head2 Functions

=over 4

=item C<main()>

We just load the P6Grammar module, and then pass control
to it's 'main' routine.
Processes command line arguments, reads input files, dispatches
to appropriate PIR-generating subroutines, and then sends
the output to the correct output file.

=cut

.sub 'main' :main
    .param pmc args
    load_bytecode 'PGE/P6Grammar.pbc'
    $P0 = get_hll_global [ 'PGE::P6Grammar' ], 'main'
    .return $P0(args)
.end
