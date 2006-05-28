# Copyright 2005-2006, The Perl Foundation.

=head1 NAME

TGE - A tree grammar engine.

=head1 SYNOPSIS

    # define a grammar leaf.tg
    transform min (Leaf) :language('PIR') { 
        $P1 = getattribute node, "value"
        .return ($P1)
    }
    ...
    # and elsewhere...

    .sub _main :main
        load_bytecode 'TGE.pir'

        # Compile a grammar from the source grammar file
        .local pmc grammar
        grammar = new 'TGE'
        grammar.agcompile(source)

        .local pmc tree
        # ... the tree to be manipulated

        # Apply the grammar to the tree
        .local pmc TGI
        TGI = grammar.apply(tree)

        # Return the result of a particular rule on a particular tree
        .local pmc result
        result = TGI.get('min')
        # ...
    .end

=head1 DESCRIPTION

TGE is a tool for transforming trees. Think of it as a good
old-fashioned substitution, but instead of taking and returning strings,
it takes and returns trees.

TGE is most heavily used in the compiler tools suite, where it
transforms the trees output by PGE into abstract syntax trees.

TGE has both a procedural interface and a syntax interface. The syntax
interface is easiest for humans to use when constructing grammars by
hand. The procedural interface is preferable for computer generated
grammars.

This is the syntax for tree grammar rules:

    transform name (pattern) {
        # action
    }

The I<name> is the name of the transform rule. The I<pattern> is the type of
node this particular transform applies to. You can have multiple transforms
with the same name, as long as they match different patterns. The I<action> is
a block of code that executes the transform. You can specify what language the
action code is written in with the C<:language> modifier. At the moment, the
only valid language is PIR. Within the block, two parameters are supplied for
you: C<node> is the current node considered, and C<tree> is the top-level node
for the entire tree.

The C<:applyto> modifier says which node the transform applies to. 

    transform name (pattern) :applyto('childname') {
        # action
    }

By default the transform applies to the current node (generally synthesized
attributes), but you can specify the name of a child node if the transform
applies to a child of the current node (generally inherited attributes).

=cut

.namespace [ 'TGE' ]

.sub '__onload' :load
    # use other modules
    load_bytecode 'PGE.pbc'
    load_bytecode 'compilers/tge/TGE/Rule.pbc'
    load_bytecode 'compilers/tge/TGE/Tree.pbc'
    load_bytecode 'compilers/tge/TGE/Parser.pbc'
    load_bytecode 'compilers/tge/TGE/Compiler.pbc'

    # define the class
    .local pmc base
    newclass base, 'TGE'
    addattribute base, 'rules' # the rules in the grammar (an array)
    .return ()
.end

=head2 new

Create a new grammar object. [Not implemented: Optionally pass it a
grammar specification in a string.] The grammar object holds a an array
of TGE::Rule objects, which are the semantics defined by the grammar.

=cut

.sub __init :method
    $P1 = new .ResizablePMCArray
    setattribute self, 'rules', $P1
.end

=head2 agrule

Add a rule to the current attribute grammar.

=cut

.sub 'agrule' :method
    .param pmc type
    .param pmc name
    .param pmc parent
    .param pmc action

    # create a new attribute grammar rule
    .local pmc rule
    rule = new 'TGE::Rule'
    setattribute rule, 'type', type
    setattribute rule, 'name', name
    setattribute rule, 'parent', parent
    setattribute rule, 'action', action

    # add the new rule to the grammar object
    $P3 = getattribute self, 'rules'
    push $P3, rule
.end

=head2 rule_install

Compile and install a rule in the current grammar.

=cut

.sub 'rule_install' :method
    .param pmc rule
    .local string code
    .local pmc action

    .local pmc compiler
    compiler = compreg "PIR"
    code = self.'rule_string'(rule)
    action = compiler(code)

    $P1 = rule["type"]
    $P2 = rule["name"]
    $P3 = rule["parent"]
    self.agrule($P1, $P2, $P3, action)
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

=head2 agcompile

Compile a grammar from a source string.

=cut

.sub 'agcompile' :method
    .param string source
    .param pmc outfh     :optional
    .param int fileoutput :opt_flag
    .local pmc agparse
    .local pmc rule_data
    .local string header_string

     agparse = find_global 'TGE::Compiler', 'agparse'
     rule_data = agparse(source)

    # Construct grammar rules from the data structure of rule info
    .local pmc rule
    .local pmc iter
    iter = new .Iterator, rule_data # loop over the rule info
    iter = 0 # start at the beginning
loop_start:
    unless iter goto loop_end
        rule = shift iter
        # If a filehandle was passed in, write the PIR code to it,
        # otherwise, compile the rule and install it immediately.
        if fileoutput goto write_pir
          self.rule_install(rule)
          goto loop_start
      write_pir:
          self.rule_emit(rule, outfh)
          $S1 = self.rule_header(rule)
          header_string .= $S1
    goto loop_start
loop_end:

    unless fileoutput goto noheader
       print outfh, "\n.sub __init :method\n"
       print outfh, header_string
       print outfh, "\n.end\n"
  noheader:
    .return ()
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
    output .= "'\nself.agrule('"
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

=head2 apply

Use a precompiled grammar on a data structure. This returns an
object on which you can call methods to fetch attributes on the 
I<top node> of the data structure.

=cut

.sub 'apply' :method
    .param pmc tree
    .local pmc newtree
    .local pmc visit
    newtree = new 'TGE::Tree'
    setattribute newtree, 'data', tree
    visit = getattribute newtree, 'visit' 
    # Build up the visit hash
    .local pmc rules
    .local int index
    .local pmc currule
    .local pmc cell
    .local pmc typename
    rules = getattribute self, 'rules'

    index = rules
loop:
    dec index
    if index < 0 goto end_loop
    currule = rules[index]
    typename = getattribute currule, 'type'
    $P2 = visit[typename]
    $I1 = does $P2, 'array'
    if $I1 goto array_exists
    $P2 = new .ResizablePMCArray
    visit[typename] = $P2
array_exists:
    push $P2, currule
    goto loop
end_loop:

    newtree._scan_node(tree, 'ROOT')
    .return (newtree)
.end

=head2 dump

Produce a data dump of the current contents of the grammar object.

=cut

.sub 'dump' :method
    $P0 = getattribute self, 'rules'
    $I1 = $P0

    print "VAR1 => { \n\t  'rules' =>\n"
LOOP:
    dec $I1
    $P1 = $P0[$I1]
    print "\t\t     [\n"
    $P1.dump()
    print "\t\t     ],\n"
    if $I1 > 0 goto LOOP


    print "\t}\n"
.end

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
