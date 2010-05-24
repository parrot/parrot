# Copyright (C) 2010, Parrot Foundation.
# $Id$

.sub 'set_up'
    load_bytecode 'PCT.pbc'
    load_bytecode 'PAST/Walker.pbc'
    load_bytecode 'PAST/Transformer.pbc'
    load_bytecode 'Data/Dumper.pbc'
    load_bytecode 'nqp-rx.pbc'
    $P1 = get_class ['PAST'; 'Transformer']
    $P0 = subclass $P1, ['PAST'; 'Transformer'; 'FoldConstants']
.end

.sub main :main
    'set_up'()
    .local pmc dumper, folder, nqp, past, result
    nqp = compreg 'NQP-rx'
    dumper = new ['Data'; 'Dumper']
    past = 'build_past'(nqp)
    folder = new ['PAST'; 'Transformer'; 'FoldConstants']
    
    dumper.'dumper'(past)
    $P0 = nqp.'post'(past)
    $P0 = nqp.'pir'($P0)
    say $P0
    
    say "\nFolding:\n"
    result = folder.'walk'(past)
    dumper.'dumper'(result)
    $P0 = nqp.'post'(result)
    $P0 = nqp.'pir'($P0)
    say $P0
.end

.sub 'build_past'
    .param pmc nqp
    .local pmc result
    .local string source
    source = "say(1+2);"
    result = nqp.'compile'(source, 'target' => 'past')
    .return (result)
.end

.namespace ['PAST'; 'Walker']

.sub 'walk' :multi(['PAST';'Transformer';'FoldConstants'], ['PAST';'Op'])
    .param pmc walker
    .param pmc node
    .local pmc result
    $P0 = node.'pirop'()
    if null $P0 goto end
    unless $P0 == 'add' goto end
    .local int foldable
    $P0 = node[0]
    $P1 = node[1]
    $P2 = $P0.'value'()
    $P3 = $P1.'value'()
    $I0 = isa $P2, 'Integer'
    $I1 = isa $P3, 'Integer'
    foldable = and $I0, $I1
    unless foldable goto end
    result = new ['PAST'; 'Val']
    $I0 = $P2
    $I1 = $P3
    $I2 = $I0 + $I1
    result.'value'($I2)
    .return (result)
end:
    result = node
    $P0 = 'walkChildren'(walker, node)
    'replaceChildren'(result, $P0)
    .return (result)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
