# Copyright 2005, The Perl Foundation.

=head1 NAME

TGE - A tree grammar engine.

=head1 SYNOPSIS

    # define a grammar leaf.g
    Leaf:   min(.) = { 
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

    type: name(parent) = {
        # action
    }

The I<type> is the type of node this particular rule applies to. The
I<name> is the name of the attribute the rule defines a value for. The
I<parent> says which node the attribute applies to: '.' if the attribute
applies to the current node (generally synthesized attributes),
'.childname' if the attribute applies to a child of the current node
(generally inherited attributes). The I<action> is a block of PIR code
run to get the value of the attribute. Within the block, two parameters
are supplied for you: C<node> is the current node considered, and
C<tree> is the top-level node for the entire tree.

=cut

.namespace [ 'TGE' ]

.sub '__onload' :load
    # use other modules
    load_bytecode 'compilers/tge/TGE/Rule.pir'
    load_bytecode 'compilers/tge/TGE/Instance.pir'
    load_bytecode "compilers/tge/TGE/Parser.pir"

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

.sub __init method
    $P1 = new PerlArray
    setattribute self, 'rules', $P1
.end

=head2 agrule

Add a rule to the current attribute grammar.

=cut

.sub 'agrule' method
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

=head2 agcompile

Compile a grammar from a source string.

=cut

.sub 'agcompile' method
    .param string source
    .local pmc agparse
    .local pmc rule_data

     agparse = find_global 'TGE::Parser', 'agparse'
     rule_data = agparse(source)

    # Construct grammar rules from the data structure of rule info
    .local pmc rule
    .local pmc code
    .local pmc iter
    iter = new Iterator, rule_data # loop over the rule info
    iter = 0 # start at the beginning
loop_start:
    unless iter goto loop_end
        rule = shift iter
        $P1 = rule["type"]
        $P2 = rule["name"]
        $P3 = rule["parent"]
        $P4 = rule["action"]
        code = new PerlString
        code = ".sub _anon :anon\n"
        code .= "   .param pmc tree\n"
        code .= "   .param pmc node\n"
        code .= $P4
        code .= "\n.end"
        $P5 = compreg "PIR"
        $P6 = $P5(code)
        self.agrule($P1, $P2, $P3, $P6)
    goto loop_start
loop_end:
    .return ()
.end

=head2 apply

Use a precompiled grammar on a data structure. This returns an
object on which you can call methods to fetch attributes on the 
I<top node> of the data structure.

=cut

.sub 'apply' method
    .param pmc tree
    .local pmc newtree
    .local pmc visit
    newtree = new 'TGE::Instance'
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
    $S1 = typeof $P2
    if $S1 == 'PerlArray' goto array_exists
    $P2 = new PerlArray
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

.sub 'dump' method
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
