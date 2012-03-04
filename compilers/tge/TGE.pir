# Copyright (C) 2005-2009, Parrot Foundation.

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
        load_bytecode 'TGE.pbc'

        # Compile a grammar from the source grammar file
        .local pmc compiler
        compiler = new ['TGE';'Compiler']

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

.sub '__load_bytecode' :anon
    .param string pbc_name
    .param string tag
    $P0 = load_bytecode pbc_name
    $I0 = $P0.'is_initialized'(tag)
    if $I0 goto done_initialization

    $P1 = $P0.'subs_by_tag'(tag)
    $P2 = iter $P1
  loop_top:
    unless $P2 goto loop_bottom
    $P3 = shift $P2
    $P3()
    goto loop_top
  loop_bottom:

    $P0.'mark_initialized'(tag)
  done_initialization:
.end

.sub '__onload_first' :tag('load')
    # use other modules
    '__load_bytecode'('P6object.pbc', 'load')
    '__load_bytecode'('PGE.pbc', 'load')
    '__load_bytecode'('PGE/Util.pbc', 'load')
.end

.include "compilers/tge/TGE/Parser.pir"
.include "compilers/tge/TGE/Rule.pir"
.include "compilers/tge/TGE/Tree.pir"
.include "compilers/tge/TGE/Grammar.pir"
.include "compilers/tge/TGE/Compiler.pir"

.sub '__onload_last' :tag('load')
    # make sure we execute this sub only once
    $P0 = get_global '$!tge_loaded'
    unless null $P0 goto end
    $P0 = new 'Integer'
    assign $P0, 1
    set_global '$!tge_loaded', $P0

    # import <die> and <line_number> rules from PGE::Util
    $P0 = get_class ['TGE';'Parser']
    $P1 = get_hll_global ['PGE';'Util'], 'die'
    $P0.'add_method'('die', $P1)
    $P1 = get_hll_global ['PGE';'Util'], 'line_number'
    $P0.'add_method'('line_number', $P1)

  end:
    .return ()
.end


.namespace [ 'PGE';'Match' ]

=over 4

=item C<find_key([ key1, key2, ... ])>

Find the first of C<key1>, C<key2>, etc. in the current
Match object, and return it.  Returns '' if none of
the specified keys are found.  If no keys are specified,
then simply return the first key found.

=back

=cut

.sub 'find_key' :method
    .param pmc keys            :slurpy
    if null keys goto first_key
    unless keys goto first_key
  loop:
    unless keys goto not_found
    $S0 = shift keys
    $I0 = exists self[$S0]
    unless $I0 goto loop
    .return ($S0)
  first_key:
    $P0 = self.'hash'()
    $P1 = iter $P0
    unless $P1 goto not_found
  next:
    $S0 = shift $P1
    $P2 = $P0[$S0]
    $I0 = isa $P2, 'Capture'
    unless $I0 goto next
    .return ($S0)
  not_found:
    .return ('')
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
