# Copyright (C) 2005-2006, The Perl Foundation.

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
        .local pmc compiler
        compiler = new 'TGE::Compiler'

        .local pmc grammar
        grammar = compiler.'compile'(source)

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
    load_bytecode 'compilers/tge/TGE/Grammar.pbc'
    load_bytecode 'compilers/tge/TGE/Compiler.pbc'

    .return ()
.end



=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
