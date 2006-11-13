=head1 TITLE

abc.pir - A basic calculator.

=head2 Description

This is the base file for the basic calculator.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'ABC'.

=head2 Functions

=over 4

=item C<__onload()>

Loads the PGE libraries needed for running the parser,
and registers the "compile" subroutine as the "ABC" compiler.

=cut

.namespace [ 'ABC' ]

.sub '__onload' :load :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'TGE.pbc'
    load_bytecode 'Parrot/HLLCompiler.pbc'
    load_bytecode 'PAST-pm.pbc'

    $P0 = getclass 'TGE::Grammar'
    $P1 = subclass $P0, 'ABC::PAST::Grammar'

    $P0 = get_hll_global ['ABC'], 'compile'
    $P1 = new [ 'HLLCompiler' ]
    $P1.'register'('ABC', $P0)
.end


=item C<compile(STR code [, 'target' => target])>

Compile the ABC C<code>.  The C<target> named parameter
allows the caller to specify the degree of compilation to
be performed; a value of C<parse> returns the parse tree,
C<PAST> returns the abstract syntax tree, C<PIR> returns
the generated PIR code, and other values return the
compiled code as a PMC.

=cut

.sub 'compile'
    .param pmc code
    .param pmc adverbs         :slurpy :named

    .local string target
    target = adverbs['target']
    target = downcase target

  parse:
    .local pmc parse
    .local pmc match
    parse = find_global 'ABC::Grammar', 'statement'
    match = parse(code, 'grammar'=>'ABC::Grammar', 'pos'=>0)

    unless match goto return_match
    if target == 'parse' goto return_match

  build_ast:
    .local pmc astgrammar, astbuilder, ast
    astgrammar = new 'ABC::PAST::Grammar'
    astbuilder = astgrammar.apply(match)
    ast = astbuilder.get('root')
    .return ast.'compile'(adverbs :flat :named)

  return_match:
    .return (match)
.end


.sub 'main' :main
    .param pmc args

    load_bytecode 'PGE/Dumper.pbc'
    $P0 = compreg 'ABC'
    .return $P0.'command_line'(args)
.end


.namespace [ 'ABC::Grammar' ]
.include 'src/abc_gen.pir'

.namespace [ 'ABC::PAST::Grammar' ]
.include 'src/parse2past_gen.pir'

=back

=cut

