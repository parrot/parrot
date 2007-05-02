=head1 NAME

APL -- APL compiler/interpreter

=head1 SYNOPSIS

Run from the command line:

    $ parrot APL.pbc file.apl                      # execute stmts in file.apl
    $ parrot APL.pbc                               # interactive mode

    $ parrot APL.pbc --target=parse [file.apl]     # display parse tree
    $ parrot APL.pbc --target=PAST  [file.apl]     # display AST

Run from another Parrot program:

    .sub main :main
        # load the compiler
        load_bytecode 'APL.pbc'

        # get the compiler
        .local pmc apl
        apl = compreg 'APL'

        # APL source code
        source = unicode:"FOO←1 2"

        # compile source
        $P0 = apl(source)
        # execute code
        $P0()

        # other compile options:
        $P0 = apl(source, target=>'parse')         # get parse tree
        $P0 = apl(source, target=>'PAST')          # get abstract syn tree
        $P0 = apl(source, target=>'PIR')           # get PIR code
    .end

=head1 Description

APL.pbc is an interpreter for the APL language.  Its
parser is implemented using a PGE grammar (src/APLGrammar.pg),
and compilation is performed as a TGE tree transformation from 
the match object returned by the grammar into an abstract syntax tree.
Then the abstract syntax tree is converted to PIR code, and the
PIR code is compiled to return an executable Eval PMC.

=head1 Functions

=head2 APL Namespace

=cut

.namespace [ 'APL' ]

=over 4

=item C<__onload()>

Initializes the compiling subsystem.

=cut

.sub __onload :load :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'TGE.pbc'
    load_bytecode 'Parrot/HLLCompiler.pbc'
    load_bytecode 'PAST-pm.pbc'

    $P0 = getclass 'TGE::Grammar'
    $P1 = subclass $P0, 'APL::PAST::Grammar'

    $P0 = new [ 'HLLCompiler' ]
    $P0.'language'('APL')
    $P0.'parsegrammar'('APL::Grammar')
    $P0.'astgrammar'('APL::PAST::Grammar')
.end

=item C<main(PMC args)>

Handles program control when the AST.pbc file is executed
directly from the Parrot command line.  It calls all of
the submodule :load routines, then processes commands from
the file specified on the command line or standard input.

The --target= command line option allows the compilation
to display a parse tree or abstract syntax tree in lieu of
executing program statements.

=cut

.sub 'main' :main
    .param pmc args

    # Load the pmc library
    $P1 = loadlib 'apl_group'
    if $P1 goto pmcs_ok
    $P2 = new .Exception
    $P2[0] = "unable to load APL's dynpmc library"
    throw $P2
pmcs_ok:

    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'Getopt/Obj.pbc'

    $P0 = compreg 'APL'
    .return $P0.'command_line'(args, 'encoding'=>'utf8')
.end

# Load the APL grammar
.namespace [ 'APL::Grammar' ]
.include 'src/APLGrammar.pir'

.namespace [ 'APL::PAST::Grammar' ]
.include 'src/parse2past.pir'

# include the built-in functions and operators
.include 'src/APLFunctions.pir'

=back

=head1 LICENSE

Copyright (C) 2006, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
