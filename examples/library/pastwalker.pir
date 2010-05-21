# Copyright (C) 2010, Parrot Foundation.
# $Id$

.namespace ['PAST';'Walker']

.sub 'onload' :anon :init :load
	load_bytecode 'PCT.pbc'
	load_bytecode 'PAST/Walker.pbc'
	$P0 = subclass ['PAST'; 'Walker'], ['PAST'; 'Walker'; 'Dumper']
.end

.sub 'walk' :multi(['PAST';'Walker';'Dumper'], ['PAST'; 'Val'])
	.param pmc walker
	.param pmc node
	say "Val {"
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

.namespace []

.sub 'main' :main
	.local pmc past, walker
	past = new ['PAST';'Var']
	$P0 = new ['PAST';'Val']
	push past, $P0
	$P0 = new ['PAST';'Var']
	push past, $P0

	walker = new ['PAST';'Walker';'Dumper']
	$P1 = get_hll_global ['PAST';'Walker'], 'walk'
	$P1(walker, past)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
