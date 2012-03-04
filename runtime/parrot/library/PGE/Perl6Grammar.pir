# Copyright (C) 2006-2009, Parrot Foundation.

=head1 TITLE

Perl6Grammar - compiler for Perl 6 grammars

=head1 SYNOPSIS

Command-line:

    parrot Perl6Grammar.pir [options] file ...

From PIR:

    .local string grammar_source
    .local pmc pgc

    pgc = compreg 'PGE::Perl6Grammar'

    # Compile grammar_source to PIR
    $P1 = pgc(grammar_source, 'target' => 'PIR')

    # Compile and install grammar_source
    $P1 = pgc(grammar_source)

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

=item C<main(PMC args)>

Processes command line arguments, reads input files, dispatches
to appropriate PIR-generating subroutines, and then sends
the output to the correct output file.

=cut

.namespace [ 'PGE';'Perl6Grammar';'Compiler' ]

.sub 'main' :main
    .param pmc args
    .local pmc pgc

    pgc = compreg 'PGE::Perl6Grammar'
    pgc.'command_line'(args, 'target'=>'PIR', 'combine'=>1, 'transcode'=>'iso-8859-1')
    .return ()
.end


.sub '__onload' :tag('load') :tag('init')
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'PCT/HLLCompiler.pbc'

    .local pmc p6regex
    p6regex = compreg 'PGE::Perl6Regex'

    $S0 = "<.ident> [ '::' <.ident> ]*"
    p6regex($S0, 'grammar'=>'PGE::Perl6Grammar', 'name'=>'name')

    $S0 = "[ '#' \\N* | \\s+ | <.pod_comment> ]* :::"
    p6regex($S0, 'grammar'=>'PGE::Perl6Grammar', 'name'=>'ws')

    $S0 = <<'      END_POD_COMMENT_RULE'
      ^^ '=' [ [ cut \h*: | end [\h\N*]? ]
           | for [ \h\N+: ] \n [ \N+\n ]*:
           | \w\N*: \n .*? \n '=' [ cut \h*: | end [\h\N*:]? ]
           ]
           [\n|$]
      END_POD_COMMENT_RULE
    p6regex($S0, 'grammar'=>'PGE::Perl6Grammar', 'name'=>'pod_comment')

    $S0 = <<'      END_ARG_RULE'
      $<category>:=[\w+\:]?
      [  \' (<-[']>*:) \'
      | '"' (<-["]>*:) '"'
      | '(' (<-[)]>*:) ')'
      | '<' (<-[>]>*:) '>'
      | \xc2\xab (.*?) \xc2\xbb
      | \xab (<-[\xbb]>*:) \xbb
      | ( 'sym<' <-[>]>*: '>' )
      | (\S+)
      ]
      END_ARG_RULE
    p6regex($S0, 'grammar'=>'PGE::Perl6Grammar', 'name'=>'arg')

    $S0 = <<'      STMT_PARSE'
        $<cmd>:=(grammar) <name> [ 'is' $<inherit>:=<name> ]? ';'?
      | $<cmd>:=(regex|token|rule)
          $<name>:=<arg>
          $<optable>:=(is optable)?
          [ \{<regex>\} | <?PGE::Util::die: 'unable to parse regex'> ]
      | [multi]? $<cmd>:=(proto)
          $<name>:=<arg>
          ( is $<trait>:=[\w+]['('<arg>')']? )*
          [ \{ <-[}]>*: \} | ';' | <?PGE::Util::die: 'missing proto/sub body'> ]
      | [$|<PGE::Util::die: unrecognized statement>]
      STMT_PARSE
    $P0 = p6regex($S0, 'grammar'=>'PGE::Perl6Grammar', 'name'=>'statement', 'w'=>1)

    ##  Add the PGE::Perl6Regex's regex method to PGE::Perl6Grammar
    $P0 = get_hll_global ['PGE';'Perl6Regex'], 'regex'
    $P1 = get_class ['PGE';'Perl6Grammar']
    $P1.'add_method'('regex', $P0)

    ##   create the PGE::Perl6Grammar compiler object
    .local pmc pgc, p6meta
    p6meta = get_hll_global 'P6metaclass'
    p6meta.'new_class'('PGE::Perl6Grammar::Compiler', 'parent'=>'PCT::HLLCompiler')
    pgc = new [ 'PGE';'Perl6Grammar';'Compiler' ]
    pgc.'language'('PGE::Perl6Grammar')
.end


.sub 'compile' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named

    .local pmc nstable, ns
    nstable = new 'Hash'
    ns = new 'String'
    $P0 = new 'Hash'
    $P1 = new 'StringBuilder'
    $P0['optable'] = $P1
    $P1 = new 'StringBuilder'
    $P0['rule'] = $P1
    nstable[''] = $P0

    # get our initial match object
    .local pmc match
    $P0 = get_hll_global ['PGE'], 'Match'
    match = $P0.'new'(source, 'grammar'=>'PGE::Perl6Grammar')

    .local pmc stmtrule
    stmtrule = get_hll_global ['PGE';'Perl6Grammar'], 'statement'

  stmt_loop:
    match = stmtrule(match)
    unless match goto stmt_end
    unless match > '' goto stmt_end
    $S0 = match['cmd']
    $S0 = concat $S0, '_stmt'
    $P0 = find_name $S0
    $P0(match, ns, nstable)
    goto stmt_loop
  stmt_end:

    .local pmc initpir, rulepir, it, ns
    .local string namespace
    initpir = new 'StringBuilder'
    rulepir = new 'StringBuilder'
    it = iter nstable
  iter_loop:
    unless it goto iter_end
    namespace = shift it
    ns  = it[namespace]
    $P0 = ns['rule']
    rulepir .= $P0
    if namespace == 'PGE::Grammar' goto ns_optable
    if namespace == '' goto ns_optable
    .local string inherit
    inherit = ns['inherit']
    $P0 = get_root_global ['parrot';'PGE';'Util'], 'unique'
    $S0 = $P0('onload_')
    initpir.'append_format'(<<'        CODE', namespace, inherit, $S0)
          ## namespace %0
          .local pmc p6meta
          p6meta = get_root_global ['parrot'], 'P6metaclass'
          $P0 = p6meta.'get_proto'('%0')
          unless null $P0 goto %2
          p6meta.'new_class'('%0', 'parent'=>'%1')
        %2:
        CODE
  ns_optable:
    $P0 = ns['optable']
    if $P0 == '' goto iter_loop
    initpir.'append_format'("          optable = root_new ['parrot';'PGE';'OPTable']\n")
    $S0 = namespace
    $P1 = split '::', $S0
    $P2 = get_root_global ['parrot';'PGE';'Util'], 'pir_key_escape'
    $P1 = $P2($P1 :flat)
    initpir.'append_format'("          set_hll_global %0, '$optable', optable\n", $P1)
    initpir .= $P0
    goto iter_loop
  iter_end:

    .local pmc out
    out = new 'StringBuilder'
    if initpir == '' goto out_rule
    out.'append_format'("      .sub '__onload' :tag('load') :tag('init')\n")
    out.'append_format'("          .local pmc optable\n")
    out .= initpir
    out.'append_format'("          .return ()\n")
    out.'append_format'("      .end\n")
  out_rule:
    out .= rulepir

    .local string target
    target = adverbs['target']
    target = downcase target
    if target != 'pir' goto compile_pir
    .return (out)

  compile_pir:
    $P0 = compreg 'PIR'
    .tailcall $P0(out)
.end


.sub 'grammar_stmt'
    .param pmc stmt
    .param pmc namespace
    .param pmc nstable

    ##   get the grammar name
    .local string name, inherit
    name = stmt['name']
    inherit = 'PGE::Grammar'
    $P0 = stmt['inherit']
    if null $P0 goto have_inherit
    inherit = $P0[0]
  have_inherit:

    ##   set the new namespace, and create any nstable entries
    ##   if needed.
    assign namespace, name
    name = clone name
    $I0 = exists nstable[name]
    if $I0 goto end
    .local pmc ns
    ns = new 'Hash'
    ns['inherit'] = inherit
    $P1 = new 'StringBuilder'
    ns['optable'] = $P1
    $P1 = new 'StringBuilder'
    ns['rule'] = $P1
    nstable[name] = ns

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
    $S0 = $P0['category']
    $S1 = $P0[0]
    name = concat $S0, $S1

    ##   set compile adverbs
    .local pmc adverbs
    adverbs = new 'Hash'
    adverbs['grammar'] = namespace
    adverbs['name'] = name

    ##   handle options for 'token' and 'rule' commands
    $S0 = stmt['cmd']
    if $S0 == 'regex' goto with_adverbs
    adverbs['ratchet'] = 1
    if $S0 == 'token' goto with_adverbs
    adverbs['words'] = 1
  with_adverbs:

    $I0 = exists stmt['optable']
    if $I0 goto rulepir_optable
    ##   compile the rule to pir
    .local pmc p6regex, regex, rulepir
    p6regex = compreg 'PGE::Perl6Regex'
    regex = stmt['regex']
    rulepir = p6regex(regex, 'target'=>'PIR', adverbs :flat :named)
    goto with_rulepir
  rulepir_optable:
    ##   this is a special rule generated via the 'is optable' trait
    rulepir = new 'StringBuilder'
    $S0 = namespace
    $P0 = split '::', $S0
    $P1 = get_root_global ['parrot';'PGE';'Util'], 'pir_key_escape'
    $P0 = $P1($P0 :flat)
    rulepir.'append_format'(<<'      END', $P0, name)
      .namespace %0
      .sub "%1"
        .param pmc mob
        .param pmc adverbs :named :slurpy
        $P0 = get_hll_global %0, "$optable"
        .tailcall $P0.'parse'(mob, 'rulename'=>"%1", adverbs :named :flat)
      .end
      END
  with_rulepir:

    ##   add to set of rules
    .local pmc code
    $P0 = nstable[namespace]
    code = $P0['rule']
    code.'append_format'("\n## <%0::%1>\n", namespace, name)
    code .= rulepir
    .return ()
.end

.sub 'token_stmt'
    .param pmc stmt
    .param pmc namespace
    .param pmc nstable
    .tailcall 'regex_stmt'(stmt, namespace, nstable)
.end

.sub 'rule_stmt'
    .param pmc stmt
    .param pmc namespace
    .param pmc nstable
    .tailcall 'regex_stmt'(stmt, namespace, nstable)
.end


.sub 'proto_stmt'
    .param pmc stmt
    .param pmc namespace
    .param pmc nstable

    .local string name
    $P0 = stmt['name']
    $S0 = $P0['category']
    $S1 = $P0[0]
    name = concat $S0, $S1

    .local pmc optable
    $P0 = nstable[namespace]
    optable = $P0['optable']

    ##   build the list of traits
    .local pmc it
    .local string traitlist
    $P0 = stmt[0]
    it = iter $P0
    traitlist = ''
  trait_loop:
    unless it goto trait_end
    .local pmc t
    t = shift it
    .local string trait, arg
    trait = t['trait']
    $P0 = t['arg']
    if null $P0 goto trait_arg_null
    ##   convert parsed arg to single string
    $P0 = $P0[0]
    $S0 = $P0['category']
    $S1 = $P0[0]
    arg = concat $S0, $S1
    if arg == '' goto trait_arg_null
    ##   args starting with & are symbol lookups
    $S0 = substr arg, 0, 1
    if $S0 != '&' goto trait_arg
    arg = substr arg, 1
    goto trait_sub
  trait_arg:
    if trait == 'parsed' goto trait_sub
    $P0 = get_root_global ['parrot';'PGE';'Util'], 'pir_str_escape'
    arg = $P0(arg)
    goto trait_arg_done
  trait_sub:
    $S0 = namespace
    $P0 = split '::', $S0
    $P1 = get_root_global ['parrot';'PGE';'Util'], 'pir_key_escape'
    $P0 = $P1($P0 :flat)
    optable.'append_format'("          $P0 = get_hll_global %0, '%1'\n", $P0, arg)
    arg = '$P0'
    goto trait_arg_done
  trait_arg_null:
    arg = '1'
  trait_arg_done:
    traitlist = concat traitlist, ", '"
    traitlist = concat traitlist, trait
    traitlist = concat traitlist, "'=>"
    traitlist = concat traitlist, arg
    goto trait_loop
  trait_end:
    $P0 = get_root_global ['parrot';'PGE';'Util'], 'pir_str_escape'
    name = $P0(name)
    optable.'append_format'("          optable.'newtok'(%0%1)\n", name, traitlist)
  .return ()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
