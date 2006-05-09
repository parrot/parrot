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

.namespace [ 'PGE::P6Grammar' ]

.include "stat.pasm"

.sub 'main' :main
    .param pmc args
    load_bytecode 'Getopt/Obj.pbc'
    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    '__onload'()

    ##   create an option parser
    .local pmc getopts
    getopts = new 'Getopt::Obj'
    getopts.'notOptStop'(1)

    ##   configure with cmdline options
    push getopts, 'output|o=s'
    push getopts, 'encoding|e=s'
    push getopts, 'target=s'
    push getopts, 'help'

    ##   process cmdline options
    .local pmc arg0, opts
    arg0 = shift args
    opts = getopts.'get_options'(args)
    $I0 = elements args
    if $I0 < 1 goto usage

    ##   produce a help message for --help
    .local string help
    help = opts['help']
    if help goto usage

    ##   get the encoding used to read the input file(s)
    .local string encoding
    encoding = opts['encoding']

    ##   get the output file
    .local string outfile
    outfile = opts['output']
    if outfile > '' goto read_files
    outfile = '-'

  read_files:
    ##   read the input files into C<code>
    .local pmc iter, infh
    .local string code, infile
    code = ''
    iter = new .Iterator, args
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

    .local pmc out
    $P1 = compreg 'PGE::P6Grammar'
    out = $P1(code)

    if out == '' goto end
    ## open the output file, output resulting PIR
    .local pmc outfh
    outfh = getstdout
    if outfile == '-' goto print_out
    outfh = open outfile, '>'
    unless outfh goto err_no_outfile

  print_out:
    print outfh, out
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


.sub '__onload' :load
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'

    .local pmc p6regex
    p6regex = compreg 'PGE::P6Regex'

    $S0 = "<?ident> [ \:\: <?ident> ]*"
    p6regex($S0, 'grammar'=>'PGE::P6Grammar', 'name'=>'name')

    $S0 = '[ \# \N+ | \s+ ]* :::'
    p6regex($S0, 'grammar'=>'PGE::P6Grammar', 'name'=>'ws')

   $S0 = <<'      END_ARG_RULE'
         ' (<-[']>*:) '
      |  " (<-["]>*:) "
      | \( (<-[)]>*:) \)
      | \< (<-[>]>*:) \>
      | (\S+)
      END_ARG_RULE
    p6regex($S0, 'grammar'=>'PGE::P6Grammar', 'name'=>'arg')

    $S0 = <<'      STMT_PARSE'
        $<cmd>:=(grammar) $<name>:=<arg> ;?
      | $<cmd>:=(regex|token|rule) 
          $<name>:=<arg>
          \{ <regex> \}
      | [multi]? $<cmd>:=(proto)
          $<name>:=<arg>
          ( is $<trait>:=[\w+]<arg>? )*
          [ \{ <-[}]>*: \} | ; | <PGE::Util::die: missing proto/sub body> ]
      | [$|<PGE::Util::die: unrecognized statement>]
      STMT_PARSE
    $P0 = p6regex($S0, 'grammar'=>'PGE::P6Grammar', 'name'=>'statement', 'w'=>1)

    $P0 = find_global 'compile_p6grammar'
    compreg 'PGE::P6Grammar', $P0
.end


.sub 'compile_p6grammar'
    .param pmc source
    .param pmc adverbs         :slurpy :named

    .local pmc nstable, namespace
    nstable = new .Hash
    namespace = new .String
    $P0 = new .Hash
    $P1 = new 'PGE::CodeString'
    $P0['optable'] = $P1
    $P1 = new 'PGE::CodeString'
    $P0['rule'] = $P1
    nstable[''] = $P0

    # get our initial match object
    .local pmc match 
    $P0 = find_global 'PGE::Match', 'newfrom'
    match = $P0(source, 0, 'PGE::P6Grammar')

    .local pmc stmtrule
    stmtrule = find_global 'statement'

  stmt_loop:
    match = stmtrule(match)
    unless match goto stmt_end
    unless match > '' goto stmt_end
    $S0 = match['cmd']
    concat $S0, '_stmt'
    $P0 = find_name $S0
    $P0(match, namespace, nstable)
    goto stmt_loop
  stmt_end:

    .local pmc initpir, rulepir, iter, ns
    .local string namespace
    initpir = new 'PGE::CodeString'
    rulepir = new 'PGE::CodeString'
    iter = new .Iterator, nstable
  iter_loop:
    unless iter goto iter_end
    namespace = shift iter
    ns = iter[namespace]
    $P0 = ns['rule']
    rulepir .= $P0
    if namespace == 'PGE::Regex' goto ns_optable
    if namespace == '' goto ns_optable
    $S0 = initpir.unique('onload_')
    initpir.emit(<<'        CODE', namespace, $S0)
          ## namespace %0
          $I0 = find_type '%0'
          if $I0 != 0 goto %1
          $P0 = subclass 'PGE::Regex', '%0'
        %1:
        CODE
  ns_optable:
    $P0 = ns['optable']
    if $P0 == '' goto iter_loop
    initpir.emit("          optable = new 'PGE::OPTable'")
    initpir.emit("          store_global '%0', '$optable', optable", namespace)
    initpir .= $P0
    goto iter_loop
  iter_end:

    .local pmc out
    out = new 'PGE::CodeString'
    if initpir == '' goto out_rule
    out.emit("      .sub '__onload' :load")
    out.emit("          .local pmc optable")
    out .= initpir
    out.emit("          .return ()")
    out.emit("      .end")
  out_rule:
    out .= rulepir
    .return (out)
.end


.sub 'grammar_stmt'
    .param pmc stmt
    .param pmc namespace
    .param pmc nstable

    ##   get the grammar name
    .local string name
    $P0 = stmt['name']
    name = $P0[0]

    ##   remove any trailing semicolon
    $S0 = substr name, -1
    if $S0 != ';' goto grammar_1
    chopn name, 1

  grammar_1:
    ##   set the new namespace, and create any nstable entries
    ##   if needed.
    assign namespace, name
    name = clone name
    $I0 = exists nstable[name]
    if $I0 goto end
    $P0 = new .Hash
    $P1 = new 'PGE::CodeString'
    $P0['optable'] = $P1
    $P1 = new 'PGE::CodeString'
    $P0['rule'] = $P1
    nstable[name] = $P0

  end:
    .return ()
.end
   
.sub 'regex_stmt'
    .param pmc stmt
    .param pmc namespace
    .param pmc nstable

    ##   get the regex name
    .local string name
    $P0 = stmt['name']
    name = $P0[0]

    ##   compile the rule to pir
    .local pmc p6regex, regex, rulepir
    p6regex = compreg 'PGE::P6Regex'
    regex = stmt['regex']

    ##   set compile adverbs
    .local pmc adverbs
    adverbs = new .Hash
    adverbs['grammar'] = namespace
    adverbs['name'] = name

    ##   handle options for 'token' and 'rule' commands
    $S0 = stmt['cmd']
    if $S0 == 'regex' goto with_adverbs
    adverbs['ratchet'] = 1
    if $S0 == 'token' goto with_adverbs
    adverbs['words'] = 1
  with_adverbs:

    rulepir = p6regex(regex, 'target'=>'PIR', adverbs :flat :named)

    ##   add to set of rules
    .local pmc code
    $P0 = nstable[namespace]
    code = $P0['rule']
    code.emit("\n## <%0::%1>\n", namespace, name)
    code .= rulepir
    .return ()
.end

.sub 'token_stmt'
    .param pmc stmt
    .param pmc namespace
    .param pmc nstable
    .return 'regex_stmt'(stmt, namespace, nstable)
.end

.sub 'rule_stmt'
    .param pmc stmt
    .param pmc namespace
    .param pmc nstable
    .return 'regex_stmt'(stmt, namespace, nstable)
.end


.sub 'proto_stmt'
    .param pmc stmt
    .param pmc namespace
    .param pmc nstable

    .local string name
    $P0 = stmt['name']
    name = $P0[0]

    .local pmc optable
    $P0 = nstable[namespace]
    optable = $P0['optable']

    ##   build the list of traits
    .local pmc iter
    .local string traitlist
    $P0 = stmt[0]
    iter = new .Iterator, $P0
    traitlist = ''
  trait_loop:
    unless iter goto trait_end
    .local pmc t
    t = shift iter
    .local string trait, arg
    trait = t['trait']
    $P0 = t['arg']
    unless $P0 goto trait_arg_1
    $P0 = $P0[0]
    arg = $P0[0]
    if trait != 'parsed' goto trait_arg
  trait_parsed:
    ##   handle "is parsed" specially by removing any '&'
    $S0 = substr arg, 0, 1
    if $S0 != '&' goto trait_parsed_1
    arg = substr arg, 1
  trait_parsed_1:
    optable.emit("          $P0 = find_global '%0', '%1'", namespace, arg)
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
    optable.emit("          optable.newtok('%0'%1)", name, traitlist)
  .return ()
.end
