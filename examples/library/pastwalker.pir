# Copyright (C) 2010, Parrot Foundation.
# $Id$

.namespace ['PAST';'Walker']

.sub 'onload' :anon :init :load
	load_bytecode 'PCT.pbc'
	load_bytecode 'PAST/Walker.pbc'
	$P0 = subclass ['PAST'; 'Walker'], ['PAST'; 'Walker'; 'Dumper']
	$P0 = subclass ['PAST'; 'Walker'], ['PAST'; 'Walker'; 'Changer']
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

.sub 'walk' :multi(['PAST';'Walker';'Changer'], ['PAST';'Val'])
	.param pmc walker
	.param pmc node
	node.'value'(5)
.end

.namespace []

.sub 'main' :main
	.local pmc past, dumper, changer, walk
	past = new ['PAST';'Var']
	$P0 = new ['PAST';'Val']
	$P0.'value'(0)
	push past, $P0
	$P0 = new ['PAST';'Var']
	push past, $P0

	walk = get_hll_global ['PAST';'Walker'], 'walk'

	dumper = new ['PAST';'Walker';'Dumper']
	walk(dumper, past)

	say "\n\nChanging:\n"
	
	changer = new ['PAST';'Walker';'Changer']
	walk(changer, past)

	walk(dumper, past)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
