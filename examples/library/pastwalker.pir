# Copyright (C) 2010, Parrot Foundation.
# $Id$

.namespace ['PAST';'Walker']

.sub 'onload' :anon :init :load
    load_bytecode 'PCT.pbc'
    load_bytecode 'PAST/Transformer.pbc'
    load_bytecode 'PAST/Walker.pbc'
    $P0 = subclass ['PAST'; 'Walker'], ['PAST'; 'Walker'; 'Dumper']
    $P0 = subclass ['PAST'; 'Transformer'], ['PAST'; 'Transformer'; 'Changer']
.end

.sub 'walk' :multi(['PAST';'Walker';'Dumper'], ['PAST'; 'Val'])
    .param pmc walker
    .param pmc node
    say "Val {"
    $P0 = node.'value'()
    print "  value => "
    say $P0
    'walkChildren'(walker, node)
    say "} laV"
.end

.sub 'walk' :multi(['PAST';'Walker';'Dumper'], ['PAST';'Var'])
    .param pmc walker
    .param pmc node
    say "Var {"
    'walkChildren'(walker, node)
    say "} raV"
.end

.sub 'walk' :multi(['PAST';'Transformer';'Changer'], ['PAST';'Val'])
    .param pmc walker
    .param pmc node
    $I0 = node.'value'()
    if $I0 == 1 goto is_one
    .local pmc result
    result = clone node
    result.'value'(5)
    $P0 = result.'value'()
    .return (result)
is_one:
    $P0 = null
    .return ($P0)
.end

.namespace []

.sub 'main' :main
    .local pmc past, dumper, changer, changed
    past = new ['PAST';'Var']
    $P0 = new ['PAST';'Val']
    $P0.'value'(0)
    push past, $P0
    $P0 = new ['PAST';'Val']
    $P0.'value'(1)
    push past, $P0
    $P0 = new ['PAST';'Var']
    push past, $P0

    dumper = new ['PAST';'Walker';'Dumper']
    dumper.'walk'(past)

    say "\n\nChanging:\n"

    changer = new ['PAST';'Transformer';'Changer']
    changed = changer.'walk'(past)

    dumper.'walk'(changed)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
