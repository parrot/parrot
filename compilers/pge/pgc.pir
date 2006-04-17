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

Processes command line arguments, reads input files, dispatches
to appropriate PIR-generating subroutines, and then sends
the output to the correct output file.

=cut

.namespace [ 'PGE::PGC' ]

.include "stat.pasm"

.sub 'main' :main
    .param pmc args
    'pgc_init'()

    ## create an option parser
    .local pmc getopts
    getopts = new 'Getopt::Obj'
    getopts.'notOptStop'(1)

    ## configure with cmdline options
    push getopts, 'output|o=s'
    push getopts, 'encoding|e=s'
    push getopts, 'help'

    ## process cmdline options
    .local pmc arg0, opts
    arg0 = shift args
    opts = getopts.'get_options'(args)
    $I0 = elements args
    if $I0 < 1 goto usage

    ## produce a help message for --help
    .local string help
    help = opts['help']
    if help goto usage

    ## get the encoding used to read the input file(s)
    .local string encoding
    encoding = opts['encoding']

    ## get the output file
    .local string outfile
    outfile = opts['output']
    if outfile > '' goto read_files
    outfile = '-'

  read_files:
    ## read the input files into C<code>
    .local pmc iter, infh
    .local string code, infile
    code = ''
    iter = new .Iterator, args
    iter = 0
  read_loop:
    unless iter goto read_end
    infile = shift iter
    infh = open infile, '<'
    unless infh goto err_no_infile
    if encoding == '' goto read_loop_1
    push infh, encoding
  read_loop_1:
    $I0 = stat infile, .STAT_FILESIZE
    $S0 = read infh, $I0
    code .= $S0
    close infh
    goto read_loop
  read_end:

    ## parse the grammar into statements
    .local pmc p6rule, stmts
    p6rule = compreg "PGE::P6Rule"
    $P1 = p6rule('^<PGE::PGC::grammar>')
    stmts = $P1(code)
    stmts = stmts['PGE::PGC::grammar']
    stmts = stmts[0]

    ## iterate through each statement and
    ## call the appropriate "_stmt" sub to generate
    ## its pir into nsptable
    .local pmc iter, stmt, namespace, nsptable
    namespace = new .String
    nsptable = new .Hash
    $P0 = new .Hash
    nsptable[''] = $P0
    $P1 = new 'PGE::CodeString'
    $P0['onload'] = $P1
    $P1 = new 'PGE::CodeString'
    $P0['rulepir'] = $P1

    iter = new .Iterator, stmts
    iter = 0
  stmt_loop:
    unless iter goto stmt_end
    stmt = shift iter
    $S0 = stmt['cmd']
    concat $S0, '_stmt'
    $P0 = find_name $S0
    $P0(stmt, namespace, nsptable)
    goto stmt_loop
  stmt_end:

    ## loop through nsptable and generate any onload
    ## code needed, as well as relevant rules
    .local pmc onload, rulepir
    .local int nspcount
    onload = new 'PGE::CodeString'
    rulepir = new 'PGE::CodeString'
    iter = new .Iterator, nsptable
    iter = 0
    nspcount = 0
  nsptable_loop:
    unless iter goto nsptable_end
    inc nspcount
    namespace = shift iter
    if namespace == 'PGE::Rule' goto nsptable_optable
    if namespace == '' goto nsptable_optable
    onload.emit("\n    ## namespace %0", namespace)
    onload.emit("    $I0 = find_type '%0'", namespace)
    onload.emit("    if $I0 != 0 goto onload_%0", nspcount)
    onload.emit("    $P0 = getclass 'PGE::Rule'")
    onload.emit("    $P0 = subclass $P0, '%0'", namespace)
    onload.emit("  onload_%0:", nspcount)
  nsptable_optable:
    $P0 = iter[namespace]
    $P1 = $P0['optable']
    if $P1 == '' goto nsptable_rule
    onload.emit("    optable = new 'PGE::OPTable'")
    onload.emit("    store_global '%0', '$optable', optable", namespace)
    onload .= $P1
  nsptable_rule:
    $P1 = $P0['rulepir']
    rulepir .= $P1
    goto nsptable_loop
  nsptable_end:

    ## open the output file, output resulting PIR
    .local pmc outfh
    outfh = getstdout
    if outfile == '-' goto output_onload
    outfh = open outfile, '>'
    unless outfh goto err_no_outfile

  output_onload:
    if onload == '' goto output_rulepir
    print outfh, ".sub '__onload' :load\n"
    print outfh, "    .local pmc optable\n"
    print outfh, onload
    print outfh, "    .return ()\n.end\n"
  output_rulepir:
    print outfh, rulepir
    close outfh
    goto end

  err_no_infile:
    printerr "Error: file cannot be read: "
    printerr infile
    printerr "\n\n"
    goto usage

  err_no_outfile:
    printerr "Error: file cannot be written: "
    printerr outfile
    printerr "\n\n"
    goto usage

  usage:
    printerr "usage: "
    printerr arg0
    printerr <<"OPTIONS"
  Options:
    --output=OUTFILE   send output to OUTFILE
    --encoding=xyz     encoding to use (default "ascii")
    --help             prints this message
OPTIONS
    exit 1

  end:
    .return () 
.end


=item C<pgc_init()>

Initializes the parser grammar compiler.  Loads the
needed libraries and creates the custom classes and
rules needed to parse the input.

=cut

.sub 'pgc_init'
    load_bytecode 'PGE.pbc'
    load_bytecode 'Getopt/Obj.pbc'

    .local pmc p6rule

    # first, let's create the PGC class
    $P0 = getclass 'PGE::Rule'
    $P0 = subclass $P0, 'PGE::PGC'

    # get the p6rule compiler from PGE
    p6rule = compreg 'PGE::P6Rule'

    ## let's load up some parsing rules
    ## first, a custom <?ws> rule  (PGE::PGC::ws)
    $S0 = '[ \# \N+ | \s+ ]* :::'
    p6rule($S0, 'PGE::PGC', 'ws')

    ## a rule for matching arguments (PGE::PGC::arg)
    $S0 = <<'END_ARG_RULE'
           ' (<-[']>*:) '
        |  " (<-["]>*:) "
        | \( (<-[)]>*:) \)
        | \< (<-[>]>*:) \>
        | (\S+)
END_ARG_RULE
    p6rule($S0, 'PGE::PGC', 'arg')

    ## the main rule for parsing a grammar
    $S0 = <<'END_GRAMMAR'
:w ( $<cmd>:=(grammar) $<name>:=<arg> ;?
   | $<cmd>:=(rule) $<name>:=<arg> \{ <p6rule> \}
   | [multi]? $<cmd>:=(sub|proto) $<name>:=<arg>
      ( is $<trait>:=[\w+]<arg>? )*
      [ \{ <-[}]>*: \} | ; ]
   )*
END_GRAMMAR
    p6rule($S0, 'PGE::PGC', 'grammar')
.end


=item C<grammar_stmt(PMC stmt, PMC namespace, PMC nsptable)>

Processes a "grammar" statement.  Essentially this just
sets the value of C<namespace> and creates a new entry 
in C<nsptable> if needed.

=cut

.sub 'grammar_stmt'
    .param pmc stmt                                # grammar statment
    .param pmc namespace                           # current namespace
    .param pmc nsptable                            # nsptable

    .local string name
    $P0 = stmt['name']
    name = $P0[0]

    ## remove any trailing ';'
    $S0 = substr name, -1
    if $S0 != ';' goto grammar_1
    chopn name, 1

  grammar_1:
    assign namespace, name
    $I0 = exists nsptable[name]
    if $I0 goto end
    $P0 = new .Hash
    $S0 = namespace
    $S0 = clone $S0
    nsptable[$S0] = $P0
    $P1 = new 'PGE::CodeString'
    $P0['optable'] = $P1
    $P1 = new 'PGE::CodeString'
    $P0['rulepir'] = $P1
  end:
.end


=item C<rule_stmt(PMC stmt, PMC namespace, PMC nsptable)>

Processes a (perl 6) 'rule' statement.  This compiles the rule
into PIR, and appends that PIR to the current namespace's
"rulepir" entry.

=cut

.sub 'rule_stmt'
    .param pmc stmt                                # grammar statment
    .param pmc namespace                           # current namespace
    .param pmc nsptable                            # nsptable

    .local string name
    $P0 = stmt['name']
    name = $P0[0]

    .local pmc p6rule, rule
    p6rule = compreg "PGE::P6Rule"
    rule = stmt['p6rule']
    ($P0, $P1) = p6rule(rule, namespace, name)
    $P0 = nsptable[namespace]
    $P0 = $P0['rulepir']
    $P0.emit("\n## <%0::%1>", namespace, name)
    $P0 .= $P1
.end


=item C<sub_stmt(PMC stmt, PMC namespace, PMC nsptable)>

Processes a "sub" or "multi sub" statement for the operator
precedence parser.  Analyzes the sub for appropriate traits,
and appends an "optable.newtok" call to the current namespace's
"onload" entry.

=cut

.sub 'sub_stmt'
    .param pmc stmt                                # grammar statment
    .param pmc namespace                           # current namespace
    .param pmc nsptable                            # nsptable

    .local string name
    $P0 = stmt['name']
    name = $P0[0]

    .local pmc initcode, traits, iter, t
    .local string traitlist
    initcode = new 'PGE::CodeString'
    traitlist = ''
    traits = stmt[0]
    iter = new .Iterator, traits
    iter = 0
  trait_loop:
    unless iter goto trait_end
    t = shift iter
    .local string trait, arg
    trait = t['trait']
    $P0 = t['arg']
    unless $P0 goto trait_arg_1
    $P0 = $P0[0]
    arg = $P0[0]
    if trait != 'parsed' goto trait_arg
  trait_parsed:
    $S0 = substr arg, 0, 1
    if $S0 != '&' goto trait_parsed_1
    arg = substr arg, 1
  trait_parsed_1:
    initcode.emit("    $P0 = find_global '%0', '%1'", namespace, arg)
    arg = '$P0'
  trait_arg:
    if arg > '' goto trait_arg_2
  trait_arg_1:
    arg = '1'
  trait_arg_2:
    concat traitlist, ", '"
    concat traitlist, trait
    concat traitlist, "'=>"
    concat traitlist, arg
    goto trait_loop
  trait_end:
    initcode.emit("    optable.newtok('%0'%1)", name, traitlist)

    $P0 = nsptable[namespace]
    $P0 = $P0['optable']
    $P0 .= initcode
.end

.sub 'proto_stmt'
    .param pmc stmt                                # grammar statment
    .param pmc namespace                           # current namespace
    .param pmc nsptable                            # nsptable
    .return sub_stmt(stmt, namespace, nsptable)
.end
