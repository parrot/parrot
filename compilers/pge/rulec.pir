=head1 TITLE

rulec.pir - The PGE rules compiler

=head1 SYNOPSIS

    > ./parrot compilers/pge/rulec.pir [OPTIONS] --compiler=COMPILER FILE

=head2 DESCRIPTION

This program takes a set of rules and/or a grammar, specified in B<FILE>,
and compiles it using B<COMPILER> into the PIR code needed to execute
that grammar. This PIR code is then suitable for inclusion or compilation
into other larger programs.

=head2 COMPILERS

Choose the compiler from one of the registered PGE front-ends.

=over 4

=item p6rules -- Perl 6 Rules

=item p5regexp -- Perl 5 Regular Expression *TODO*

=item bnf -- Backus-Naur Form *TODO*

=back

=head2 OPTIONS

=over 4

=item --help

Print a friendly help message.

=back

=cut


.include 'hllmacros.pir'
.include 'iterator.pasm'


.sub "main" :main
    .param pmc args
    .local string prog
    .local string file
    .local pmc compilers

    load_bytecode "PGE.pbc"
    load_bytecode "PGE/Text.pir"
    load_bytecode "PGE/Util.pir"
    load_bytecode "Getopt/Obj.pir"

    ## register compilers
    compilers = new .Hash
    compilers['p6rules'] = 'PGE::P6Grammar'
## TODO not yet implemented
#    compilers['p5regexp'] = 'PGE::P5Regexp'
#    compilers['bnf'] = 'PGE::BNFGrammar'
    prog = shift args

    ## sanity check cmdline parameters, capture required arg
    $I0 = args
    unless $I0 >= 2 goto ERR_TOO_FEW_ARGS

    file = pop args

    ## create option parser
    .local pmc getopts
    getopts = new "Getopt::Obj"
    getopts."notOptStop"(1)

    ## config with cmdline options
    push getopts, "compiler|c=s"
    push getopts, "help|h"

    ## process cmdline options
    .local pmc opts
    opts = getopts."get_options"( args )

    .local string help
    help = opts['help']
    if help goto USAGE

    .local string compiler
    compiler = opts['compiler']
    unless compiler goto ERR_NO_COMPILER

    .local string comp_module
    comp_module = compilers[compiler]
    unless comp_module goto ERR_COMPILER_NOT_REGISTERED

    .local pmc fh
    fh = open file, "<"
    unless fh goto ERR_NO_FILE

    .local string source
    source = read fh, 65535
    close fh

    .local string pir, onload
    $P0 = compreg comp_module
    (pir, onload) = $P0(source)
    print onload
    print pir
    goto END

  USAGE:
    print "Usage: "
    print prog
    print " [OPTIONS] --compiler=COMPILER FILE\n"

    .local pmc it_comp
    .local string comp
    it_comp = new .Iterator, compilers
    it_comp = .ITERATE_FROM_START

    print " Registered Compilers:\n"
  IT_NEXT:

    unless it_comp goto IT_DONE
    shift comp, it_comp
    print "  * "
    print comp
    print "\n"
    goto IT_NEXT

  IT_DONE:
    print <<"OPTIONS"
 Options:
  --help         -- print this message
OPTIONS
    goto END

  ERR_TOO_FEW_ARGS:
    print "Error: too few arguments\n\n"
    goto USAGE

  ERR_NO_COMPILER:
    print "Error: no compiler specified\n\n"
    goto USAGE

  ERR_COMPILER_NOT_REGISTERED:
    print "Error: not a registered compiler: "
    print compiler
    print "\n\n"
    goto USAGE

  ERR_NO_FILE:
    print "Error: file not found: "
    print file
    print "\n\n"
    goto USAGE

  END:
.end

