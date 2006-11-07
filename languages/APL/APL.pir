=head1 NAME

APL -- APL compiler/interpreter

=head1 SYNOPSIS

Run from the command line:

    $ parrot APL.pbc file.apl                      # execute stmts in file.apl
    $ parrot APL.pbc                               # interactive mode

    $ parrot APL.pbc --target=paarse [file.apl]    # display parse tree
    $ parrot APL.pbc --target=PAST [file.apl]      # display AST

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
parser is implemented using a PGE grammar (lib/APLGrammar.pg),
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
    load_bytecode 'TGE.pbc'
    load_bytecode 'PGE/Util.pbc'

    # A hash for storing APL variables
    $P0 = new .Hash
    store_global 'APL', '%var', $P0

    # parser
    .local pmc p6rule
    p6rule = compreg 'PGE::P6Regex'
    $P2 = p6rule('^<APL::Grammar::statement_list>')
    store_global 'APL', '&parse', $P2

    # tge transformer classes
    .local pmc tge
    tge = getclass 'TGE::Grammar'
    $P1 = subclass tge, 'ASTGrammar'
    $P1 = subclass tge, 'EvalGrammar'
    $P1 = subclass tge, 'PIRGrammar'

    # register the compiler
    $P0 = find_global 'APL', 'compile'
    compreg 'APL', $P0
.end

=item C<compile(STR code [, 'target' => target])>

Compile the APL program given by C<code>.  The C<target>
named parameter allows the caller to specify the degree of
compilation to be performed; a value of C<parse> returns
the parse tree, C<PAST> returns the abstract syntax tree,
C<PIR> returns the generated PIR code, and all other values 
cause the program or statements to be executed.

=cut

.sub 'compile'
    .param pmc code
    .param string target       :named('target') :optional
    .param int has_target      :opt_flag

    if has_target goto parse
    target = 'pbc'

  parse:
    .local pmc parse
    .local pmc match
    parse = find_global 'APL', '&parse'
    match = parse(code)

    unless match goto return_match
    if target == 'parse' goto return_match

  build_ast:
    match = match['APL::Grammar::statement_list']
    .local pmc astgrammar, astbuilder, ast
    astgrammar = new 'ASTGrammar'
    astbuilder = astgrammar.apply(match)
    ast = astbuilder.get('result')

    if target == 'PAST' goto return_ast
    if target == 'eval' goto eval_ast

  build_pir:
    .local pmc pirgrammar, pirbuilder
    .local string pir
    pirgrammar = new 'PIRGrammar'
    pirbuilder = pirgrammar.'apply'(ast)
    pir = pirbuilder.get('pir')
    if target == 'PIR' goto return_pir

  compile_pir:
    $P0 = compreg "PIR"
    $P1 = $P0(pir)
    .return ($P1)

  eval_ast:
    .local pmc evalgrammar, evalbuilder, eval
    evalgrammar = new 'EvalGrammar'
    evalbuilder = evalgrammar.'apply'(ast)
    eval = evalbuilder.get('eval')
    goto return_ast

  return_match:
    .return (match)
  return_ast:
    .return (ast)
  return_pir:
    .return (pir)
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

    .local pmc getopts, opts
    .local string arg0
    arg0 = shift args
    getopts = new 'Getopt::Obj'
    getopts.'notOptStop'(1)
    push getopts, 'target=s'
    opts = getopts.'get_options'(args)

    .local string target
    target = opts['target']

    .local pmc apl
    apl = compreg 'APL'

    $I0 = elements args
    if $I0 > 0 goto file_arg

    .local pmc stdin, stdout
    stdin  = getstdin
    stdout = getstdout
    push stdin, 'utf8'

  stmt_loop:
    .local string stmt
    print '    '  #prompt
    stdout.'flush'()
    stmt = readline stdin
    unless stmt goto end
    bsr apl_eval
    goto stmt_loop

  file_arg:
    .local string filename
    filename = args[1]
    $P0 = open filename, '<'
    unless $P0 goto err_no_file
    push $P0, 'utf8'
    stmt = read $P0, 65535
    close $P0
    bsr apl_eval
    goto end

  apl_eval:
    $P0 = apl(stmt, 'target' => target)
    if target == 'PIR' goto dump_pir
    if target goto dump_object
    push_eh trap
      $P0()
    clear_eh
    ret
  dump_pir:
    print $P0
    ret
  dump_object:
    '_dumper'($P0, target)
    ret

  err_no_file:
    print 'Cannot open file '
    say filename
    end

  trap:
    get_results '(0,0)', $P0, $S0
    print $S0
    exit 1

  end:
.end

# Load the APL grammar
.namespace [ 'APL::Grammar' ]
.include 'lib/APLGrammar.pir'

# include the abstract syntax tree
.include 'lib/PAST.pir'

# Include the parse tree -> AST transformation rules from TGE
.namespace [ 'ASTGrammar' ]
.include 'lib/pge2past.pir'

# Include the AST -> PIR transformation rules from TGE
.namespace [ 'PIRGrammar' ]
.include 'lib/past2pir.pir'

# Include the AST evaluation rules from TGE
.namespace [ 'EvalGrammar' ]
.include 'lib/pasteval.pir'

# include the built-in functions and operators
.include 'lib/APLFunctions.pir'

=back

=head1 LICENSE

Copyright (C) 2006, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=cut
