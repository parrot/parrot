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

        # compile and evaluate source
        apl(source)
    .end

=head1 Description

APL.pbc is an interpreter for the APL language.  Its
parser is implemented using a PGE grammar (lib/APLGrammar.lib),
and compilation is performed as a TGE tree transformation from 
the match object returned by the grammar into an abstract syntax tree.
At the moment, the abstract syntax tree is evaluated directly,
but in the future the AST will be used to generate Parrot
subroutines directly.

=head1 Functions

=head2 APL Namespace

=cut

.namespace [ 'APL' ]

=over 4

=item C<__onload()>

Initializes the compiling subsystem.

=cut

.sub __onload :load
    load_bytecode 'PGE.pbc'
    load_bytecode 'TGE.pbc'

    # A hash for storing APL variables
    $P0 = new .Hash
    store_global 'APL', '%var', $P0

    # parser
    .local pmc p6rule
    p6rule = compreg 'PGE::P6Rule'
    $P2 = p6rule('^<APL::Grammar::statement_list>')
    store_global 'APL', '&parse', $P2

    # tge transformer classes
    .local pmc tge
    tge = getclass 'TGE'
    $P1 = subclass tge, 'ASTGrammar'
    $P1 = subclass tge, 'EvalGrammar'

    # register the compiler
    $P0 = find_global 'APL', 'compile'
    compreg 'APL', $P0
.end

=item C<compile(STR code [, 'target' => target])>

Compile the APL program given by C<code>.  The C<target>
named parameter allows the caller to specify the degree of
compilation to be performed; a value of C<parse> returns
the parse tree, C<PAST> returns the abstract syntax tree,
and all other values evaluate the abstract syntax tree.
(Note:  This will change in future releases, when the
default will be to return the translated program as a 
compiled subroutine, and C<PIR> will be available to
return the resulting PIR code.)

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
    $P0 = find_global 'APL', '__onload'
    $P0()
    $P0 = find_global 'PAST', '__onload'
    $P0()
    $P0 = getclass 'PGE::Rule'
    $P0 = subclass $P0, 'APL::Grammar'

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

    .local pmc stdin
    stdin = getstdin
    push stdin, 'utf8'

  stmt_loop:
    .local string stmt
    stmt = readline stdin
    unless stmt goto end
    $P0 = apl(stmt, 'target' => target)
    unless target goto stmt_loop
    '_dumper'($P0, target)
    goto stmt_loop

  file_arg:
    .local string filename
    filename = args[1]
    $P0 = open filename, '<'
    unless $P0 goto err_no_file
    push $P0, 'utf8'
    stmt = read $P0, 65535
    close $P0
    $P0 = apl(stmt, 'target' => target)
    unless target goto end
    '_dumper'($P0, target)
    goto end

  err_no_file:
    print 'Cannot open file '
    print filename
    print "\n"
    end

  end:
.end

# Load the APL grammar
.include 'lib/APLGrammar.pir'

=back

=head2 C<APL::Grammar> namespace

=over 4

=item C<die(PMC mob, string message)>

The C<die> subroutine implements a special-purpose
<die> subrule.  The <die> subrule outputs a C<message>
indicating why the parse failed, displays the line
number and context of the failure, and returns a
PGE_CUT_MATCH result to abandon the parse altogether.

=cut

.include 'cclass.pasm'

.sub 'die'
    .param pmc mob
    .param string message      # XXX: TODO: :optional
    .local pmc newfrom
    .local string target
    .local pmc mfrom, mpos
    .local int pos, len, newline, lines
    newfrom = find_global 'PGE::Match', 'newfrom'
    (mob, target, mfrom, mpos) = newfrom(mob, 0)

    pos = mfrom
    newline = 0
    lines = 1
  newline_loop:
    $I0 = find_cclass .CCLASS_NEWLINE, target, newline, pos
    if $I0 >= pos goto print_message
    newline = $I0 + 1
    inc lines
    goto newline_loop

  print_message:
    print message
    print ' at line '
    print lines
    print ", near \""
    $I0 = length target
    $I0 -= pos
    if $I0 < 10 goto print_message_1
    $I0 = 10
  print_message_1:
    $S0 = substr target, pos, $I0
    $S0 = escape $S0
    print $S0
    print "\"\n"
    mpos = -3
    .return (mob)
.end


# include the abstract syntax tree
.include 'lib/PAST.pir'

# Include the parse tree -> AST transformation rules from TGE
.namespace [ 'ASTGrammar' ]
.include 'lib/pge2past.pir'

# Include the AST evaluation rules from TGE
.namespace [ 'EvalGrammar' ]
.include 'lib/pasteval.pir'

# include the built-in functions and operators
.include 'lib/APLFunctions.pir'

=back

=head1 LICENSE

Copyright (c) 2006 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=cut
