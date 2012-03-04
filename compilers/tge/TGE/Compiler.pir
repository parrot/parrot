# Copyright (C) 2005-2009, Parrot Foundation.

=head1 NAME

TGE::Compiler - A compiler for the grammar syntax of TGE.

=head1 DESCRIPTION

=cut

.namespace [ 'TGE'; 'Compiler' ]

.sub __onload :tag('load')
    $P0 = get_class [ 'TGE'; 'Grammar' ]
    $P1 = subclass $P0, [ 'TGE'; 'Compiler' ]
.end

=head2 parse_grammar

Take the source string for a tree grammar, and return a sensible data
structure.

=cut

.sub parse_grammar :method
    .param string source

    # Parse the source string and build a match tree
    .local pmc match
    .local pmc start_rule
    start_rule = get_hll_global ['TGE';'Parser'], "start"
    match = start_rule(source, 'grammar'=>'TGE::Parser')
    # Verify the parse
    unless match goto err_parse    # if parse fails, stop
#        say 'parse succeeded'
#        say 'Match tree dump:'
#        load_bytecode "dumper.pbc"
#        load_bytecode "PGE/Dumper.pbc"
#        '_dumper'(match, "match")

    # Transform the parse tree and return the result
    .local pmc tree_match
    tree_match = self.'apply'(match)
    $P5 = tree_match.'get'('result')
#        say 'Data structure dump:'
#        '_dumper'($P5, "syntax tree")
    .return($P5)

  err_parse:
    print "Unable to parse the tree grammar.\n"
    exit 1
    end
.end

.sub init :vtable :method
    self.'add_rule'("ROOT",       "result", ".", "ROOT_result")
    self.'add_rule'("statements", "result", ".", "statements_result")
    self.'add_rule'("statement",  "result", ".", "statement_result")
    self.'add_rule'("transrule",  "result", ".", "transrule_result")
    self.'add_rule'("grammardec", "result", ".", "grammardec_result")
    self.'add_rule'("type",       "value",  ".", "type_value")
    self.'add_rule'("inherit",    "value",  ".", "inherit_value")
    self.'add_rule'("name",       "value",  ".", "name_value")
    self.'add_rule'("parent",     "value",  ".", "parent_value")
    self.'add_rule'("action",     "value",  ".", "action_value")
    self.'add_rule'("language",   "value",  ".", "language_value")
.end

.sub ROOT_result :method
    .param pmc tree
    .param pmc node
    $I0 = exists node["TGE::Parser::statements"]
    unless $I0 goto err_no_tree
    $P0 = node["TGE::Parser::statements"]
    $P2 = tree.'get'('result', $P0, 'statements')
    .return ($P2)

err_no_tree:
   print "Top-level rule did not match.\n"
   .return ()
.end

.sub statements_result :method
    .param pmc tree
    .param pmc node
    .local pmc statements
    statements = new 'ResizablePMCArray'

    # Iterate over the list of statements, and generate a processed tree for
    # each statement.  Return an array of all the processed statements.
    .local pmc it
    it = iter node # loop over the array
loop_start:
    unless it goto loop_end
    $P1 = shift it
    $P2 = tree.'get'('result', $P1, 'statement')
    push statements, $P2
    goto loop_start
loop_end:
    .return (statements)

err_no_tree:
    print "This grammar contained no statements.\n"
    .return (statements)
.end

.sub statement_result :method
    .param pmc tree
    .param pmc node
    .local pmc result

    .local pmc it
    $P0 = node.'hash'()
    it  = iter $P0    # setup iterator for node
  iter_loop:
    unless it, iter_end         # while (entries) ...
      shift $S1, it           # get the key of the iterator
      $P2 = it[$S1]

      result = tree.'get'('result', $P2, $S1)

      goto iter_loop
  iter_end:

    .return (result)
.end

.sub transrule_result :method
    .param pmc tree
    .param pmc node
    .local pmc rule
    rule = new 'Hash'

    .local pmc it
    $P0 = node.'hash'()
    it  = iter $P0    # setup iterator for node
  iter_loop:
    unless it, iter_end         # while (entries) ...
      $P3 = new 'Undef'
      shift $S1, it           # get the key of the iterator
      $P2 = it[$S1]

      $P3 = tree.'get'('value', $P2, $S1)

      rule[$S1] = $P3
      goto iter_loop
  iter_end:

    $I0 = defined rule["parent"]
    if $I0 goto parent_defined
    rule["parent"] = "."
  parent_defined:
    rule["build"] = "rule"
    .return (rule)

err_no_rule:
    print "Unable to find all the components of a rule definition\n"
    exit 1
    .return ()
.end

.sub grammardec_result :method
    .param pmc tree
    .param pmc node
    .local pmc decl
    decl = new 'Hash'

    .local pmc it
    $P0 = node.'hash'()
    it  = iter $P0    # setup iterator for node
  iter_loop:
    unless it, iter_end         # while (entries) ...
      $P3 = new 'Undef'
      shift $S1, it           # get the key of the iterator
      $P2 = it[$S1]

      $P3 = tree.'get'('value', $P2, $S1)

      decl[$S1] = $P3
      goto iter_loop
  iter_end:
    decl["build"] = "grammar"
    .return (decl)
.end

# The attribute 'value' on nodes of type 'inherit'.
.sub inherit_value :method
    .param pmc tree
    .param pmc node
    $P1 = node[0]
    $P2 = $P1['type']
    .local pmc value
    value = tree.'get'('value', $P2, 'type')
    .return (value)
.end

# The attribute 'value' on nodes of type 'type'.
.sub type_value :method
    .param pmc tree
    .param pmc node
    .local pmc value
    value = new 'String'
    $S2 = node
    value = $S2
    .return (value)
.end

# The attribute 'value' on nodes of type 'name'.
.sub name_value :method
    .param pmc tree
    .param pmc node
    .local pmc name
    name = new 'String'
    $P2 = node
    $S1 = $P2
    name = $S1
    .return (name)
.end

# The attribute 'value' on nodes of type 'parent'.
.sub parent_value :method
    .param pmc tree
    .param pmc node
    .local pmc value
    value = new 'String'
    $P2 = node[0]
    $P3 = $P2[0]
    $S1 = $P3
    value = $S1
    .return (value)
.end

# The attribute 'value' on nodes of type 'action'.
.sub action_value :method
    .param pmc tree
    .param pmc node
    .local pmc value, infile
    .local int lineno
    value = new 'StringBuilder'
    infile = get_global '$!infile'
    $P2 = node[0]
    (lineno) = $P2.'line_number'()
    push value, '#line '
    $S0 = lineno
    push value, $S0
    push value, ' '
    push value, infile
    push value, "\n"
    push value, $P2
    .return (value)
.end

# The attribute 'value' on nodes of type 'language'.
# (This will be refactored out to a general syntax for modifiers.)
.sub language_value :method
    .param pmc tree
    .param pmc node
    .local pmc value
    value = new 'String'
    $P2 = node[0]
    $P3 = $P2[0]
    $S1 = $P3
    value = $S1
    .return (value)
.end

=head2 precompile

Compile a grammar from a source string.

=cut

.sub 'precompile' :method
    .param string source
    .param string infile          :optional
    .param int has_infile      :opt_flag
    .local pmc rule_data
    .local string outstring
    .local string header_string

    if has_infile goto quote_infile
    infile = ''
    goto have_infile
  quote_infile:
    infile = concat '"', infile
    infile = concat infile, '"'
  have_infile:
    $P0 = new 'String'
    $P0 = infile
    set_global '$!infile', $P0

    # Unnamed grammars are class 'AnonGrammar'
    .local string grammarname
    grammarname = 'AnonGrammar'
    rule_data = self.'parse_grammar'(source)

    # Construct grammar rules from the data structure of rule info
    .local pmc statement
    .local pmc it
    it = iter rule_data # loop over the rule info
loop_start:
    unless it goto loop_end
        statement = shift it
        $S0 = statement['build']
      unless $S0 == 'rule' goto grammar_build
          $S1 = self.'rule_string'(statement)
          outstring .= $S1
          $S2 = self.'rule_header'(statement)
          header_string .= $S2
          goto loop_start
      grammar_build:
          $S1 = self.'grammar_string'(statement)
          outstring .= $S1
          grammarname = statement['type']
          goto loop_start
loop_end:

    outstring .= "\n.sub init :vtable :method\n"
    outstring .= header_string
    outstring .= "\n.end\n"

    .return (outstring, grammarname)
.end

.sub 'compile' :method
    .param string source

    .local pmc compiler
    compiler = compreg "PIR"

    .local string code
    .local string grammarname
    .local pmc libloader
    .local pmc new_grammar

    (code, grammarname) = self.'precompile'(source)

    unless grammarname == 'AnonGrammar' goto named_grammar
    $P2 = new 'Hash'
    $P2['type'] = 'AnonGrammar'
    $P2['inherit'] = 'TGE::Grammar'
    $S1 = self.'grammar_string'($P2)
    code = $S1 . code
  named_grammar:
    libloader = compiler(code)
    libloader()

    new_grammar = new grammarname
    .return (new_grammar)
.end

.sub 'rule_header' :method
    .param pmc rule
    .local string output
    .local string type
    .local string name
    .local string parent
    type = rule["type"]
    name = rule["name"]
    parent = rule["parent"]
    output = "    self.'add_rule'('"
    output .= type
    output .= "', '"
    output .= name
    output .= "', '"
    output .= parent
    output .= "',  '_"
    output .= type
    output .= "_"
    output .= name
    output .= "')\n"
    .return (output)
.end

.sub 'rule_string' :method
    .param pmc rule
    .local string code
    code = "\n.sub '_"
    $S1 = rule["type"]
    code .= $S1
    code .= "_"
    $S2 = rule["name"]
    code .= $S2
    code .= "' :method\n"
    code .= "    .param pmc tree\n"
    code .= "    .param pmc node\n"
    $S3 = rule["action"]
    code .= $S3
    code .= "\n.end\n\n"
    .return (code)
.end

# NOTE - this code assumes that a type of '' is impossible
#        (in older versions of Parrot, it was)

.sub 'grammar_string' :method
    .param pmc grammar
    .local string code
    .local string type
    .local string inherit
    type    = grammar["type"]
    inherit = grammar["inherit"]
    .local string inherit_key, type_key
    inherit_key = self.'classname_key'(inherit)
    type_key    = self.'classname_key'(type)

    code  = "\n.namespace"
    code .= type_key
  no_type:
    code .= "\n\n"
    code .= ".sub '__onload' :tag('load') :tag('init')\n"
    code .= "    load_bytecode 'TGE.pbc'\n"
    code .= "    push_eh class_loaded\n"
    code .= "    $P1 = subclass "
    code .= inherit_key
    code .= ", "
    code .= type_key
    code .= "\n"
    code .= "  class_loaded:\n"
    code .= "    pop_eh\n"
    code .= "\n.end\n\n"
    .return (code)
.end

.sub 'classname_key' :method
    .param string name
    .local string key
    .local pmc parts
    parts = split '::', name

    # If splitting on '::' doesn't break down name, try splitting on ';'.
    $I0 = elements parts
    if $I0 > 1 goto build_key
    parts = split ';', name

  build_key:
    key = " [ '"
    $S0  = join "'; '", parts
    key .= $S0
    key .= "' ]"
    .return (key)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
