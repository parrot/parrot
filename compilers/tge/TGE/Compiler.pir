# Copyright (C) 2005-2006, The Perl Foundation.

=head1 NAME

TGE::Compiler - A compiler for the grammar syntax of TGE.

=head1 DESCRIPTION

=cut

.namespace [ 'TGE::Compiler' ]

.sub _load :load
    load_bytecode 'TGE.pbc'

    $P0 = getclass 'TGE::Grammar'
    $P1 = subclass $P0, 'TGE::Compiler'
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
    start_rule = find_global "TGE::Parser", "start"
    match = start_rule(source)
    # Verify the parse
    $I0 = match.__get_bool()
    unless $I0 goto err_parse    # if parse fails, stop
#        print "parse succeeded\n"
#        print "Match tree dump:\n"
#        load_bytecode "dumper.pbc"
#        load_bytecode "PGE/Dumper.pbc"
#        '_dumper'(match, "match")

    # Transform the parse tree and return the result
    .local pmc tree_match
    tree_match = self.apply(match)
    $P5 = tree_match.get('result')
    .return($P5)

  err_parse:
    print "Unable to parse the tree grammar.\n"
    exit 1
    end
.end

.sub __init :method
    # Construct a tree grammar for manipulating the parse tree
    $P1 = new .ResizablePMCArray
    setattribute self, 'rules', $P1
    $P3 = find_global "TGE::Compiler", "ROOT_result"
    self.add_rule("ROOT", "result", ".", $P3)
    $P3 = find_global "TGE::Compiler", "statements_result"
    self.add_rule("statements", "result", ".", $P3)
    $P3 = find_global "TGE::Compiler", "transrule_result"
    self.add_rule("transrule", "result", ".", $P3)
    $P3 = find_global "TGE::Compiler", "type_value"
    self.add_rule("type", "value", ".", $P3)
    $P3 = find_global "TGE::Compiler", "name_value"
    self.add_rule("name", "value", ".", $P3)
    $P3 = find_global "TGE::Compiler", "parent_value"
    self.add_rule("parent", "value", ".", $P3)
    $P3 = find_global "TGE::Compiler", "action_value"
    self.add_rule("action", "value", ".", $P3)
    $P3 = find_global "TGE::Compiler", "language_value"
    self.add_rule("language", "value", ".", $P3)
.end

.sub ROOT_result
    .param pmc tree
    .param pmc node
    $I0 = exists node["TGE::Parser::statements"]
    unless $I0 goto err_no_tree
    $P0 = node["TGE::Parser::statements"]
    $P2 = tree.get('result', $P0, 'statements')
    .return ($P2)

err_no_tree:
   print "Top-level rule did not match.\n"
   .return ()
.end

.sub statements_result
    .param pmc tree
    .param pmc node
    .local pmc rules
    rules = new .ResizablePMCArray
    $I0 = defined node["TGE::Parser::transrule"]
    unless $I0 goto err_no_tree
    $P0 = node["TGE::Parser::transrule"]

    # Iterate over the list of rules, and generate a processed tree for
    # each rule.  Return an array of all the processed rules.
    .local pmc iter
    iter = new .Iterator, $P0 # loop over the array
    iter = 0 # start at the beginning
loop_start:
    unless iter goto loop_end
    $P1 = shift iter
    $P2 = tree.get('result', $P1, 'transrule')
    push rules, $P2
    goto loop_start
loop_end:
    .return (rules)

err_no_tree:
    print "This grammar contained no rules.\n"
    .return (rules)
.end

.sub transrule_result
    .param pmc tree
    .param pmc node
    .local pmc rule
    rule = new .Hash

    .local pmc iter
    iter = new Iterator, node    # setup iterator for node
    iter = 0
  iter_loop:
    unless iter, iter_end         # while (entries) ...
      shift $S1, iter           # get the key of the iterator
      $P2 = iter[$S1]
      $S2 = substr $S1, 13

      $P2 = tree.get('value', $P2, $S2)

      rule[$S2] = $P2
      goto iter_loop
  iter_end:

    $I0 = defined rule["parent"]
    if $I0 goto parent_defined
    rule["parent"] = "."
  parent_defined:
    .return (rule)
   
err_no_rule:
    print "Unable to find all the components of a rule definition\n"
    exit 1
    .return ()
.end

# The attribute 'value' on nodes of type 'type'.
.sub type_value
    .param pmc tree
    .param pmc node
    .local pmc value
    value = new .String
    $S2 = node
    value = $S2
    .return (value)
.end

# The attribute 'value' on nodes of type 'name'.
.sub name_value
    .param pmc tree
    .param pmc node
    .local pmc name
    name = new .String
    $P2 = node
    $S1 = $P2
    name = $S1
    .return (name)
.end

# The attribute 'value' on nodes of type 'parent'.
.sub parent_value
    .param pmc tree
    .param pmc node
    .local pmc value
    value = new .String
    $P2 = node[0]
    $P3 = $P2[0]
    $S1 = $P3
    value = $S1
    .return (value)
.end

# The attribute 'value' on nodes of type 'action'.
.sub action_value
    .param pmc tree
    .param pmc node
    .local pmc value
    value = new .String
    $P2 = node[0]
    $S1 = $P2
    value = $S1
    .return (value)
.end

# The attribute 'value' on nodes of type 'language'.
# (This will be refactored out to a general syntax for modifiers.)
.sub language_value
    .param pmc tree
    .param pmc node
    .local pmc value
    value = new .String
    $P2 = node[0]
    $S1 = $P2
    value = $S1
    .return (value)
.end

=head2 rule_emit

Generate the PIR code for a rule, and emit it to a file.

=cut

.sub 'rule_emit' :method
    .param pmc rule
    .param pmc outfh

    $S1 = self.'rule_string'(rule)
    print outfh, $S1

.end

=head2 precompile

Compile a grammar from a source string.

=cut

.sub 'precompile' :method
    .param string source
    .param pmc outfh     :optional
    .param int fileoutput :opt_flag
    .local pmc rule_data
    .local string header_string

    # If a filehandle was passed in, write the PIR code to it,
    # otherwise, write it to standard output.
    if fileoutput goto got_fh
        outfh = getstdout
  got_fh:

     rule_data = self.'parse_grammar'(source)

    # Construct grammar rules from the data structure of rule info
    .local pmc rule
    .local pmc iter
    iter = new .Iterator, rule_data # loop over the rule info
    iter = 0 # start at the beginning
loop_start:
    unless iter goto loop_end
        rule = shift iter
        self.rule_emit(rule, outfh)
        $S1 = self.rule_header(rule)
        header_string .= $S1
    goto loop_start
loop_end:

    print outfh, "\n.sub __init :method\n"
    print outfh, header_string
    print outfh, "\n.end\n"
    .return ()
.end

.sub 'compile' :method
    .param string source

    .local pmc compiler
    compiler = compreg "PIR"

    .local pmc rule_data
    rule_data = self.'parse_grammar'(source)

    .local pmc new_grammar
    new_grammar = new 'TGE::Grammar'

    # Construct grammar rules from the data structure of rule info
    .local pmc rule
    .local string code
    .local pmc action

    .local pmc iter
    iter = new .Iterator, rule_data # loop over the rule info
    iter = 0 # start at the beginning
loop_start:
    unless iter goto loop_end
        rule = shift iter
        # Compile the rule and install it immediately.
        code = self.'rule_string'(rule)
        action = compiler(code)
        $P1 = rule["type"]
        $P2 = rule["name"]
        $P3 = rule["parent"]
        new_grammar.add_rule($P1, $P2, $P3, action)
      goto loop_start
loop_end:

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
    output = "$P1 = find_global '_" . type
    output .= "_"
    output .= name
    output .= "'\nself.add_rule('"
    output .= type
    output .= "', '"
    output .= name
    output .= "', '"
    output .= parent
    output .= "', $P1)\n"
    .return (output)
.end

.sub 'rule_string' :method
    .param pmc rule
    .local string code
    $S1 = rule["type"]
    $S2 = rule["name"]
    $S3 = rule["action"]
    code = "\n.sub '_"
    code .= $S1
    code .= "_"
    code .= $S2
    code .= "'\n"
    code .= "   .param pmc tree\n"
    code .= "   .param pmc node\n"
    code .= $S3
    code .= "\n.end\n\n"
    .return (code)
.end

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
