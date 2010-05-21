# Copyright (C) 2010, Parrot Foundation.
# $Id$

.sub 'onload' :anon :init :load
	$P0 = newclass ['PAST'; 'Walker']
.end

.namespace ['PAST'; 'Walker']

.sub 'walk' :multi(['PAST';'Walker'], ['PAST';'Node'])
	.param pmc walker
	.param pmc node
	.tailcall 'walkChildren'(walker, node)
.end

.sub 'walkChildren' :multi(['PAST';'Walker'], ['PAST';'Node'])
	.param pmc walker
	.param pmc node
	.local int max, curr
	.local pmc child
	max = elements node
	curr = 0

loop:
	ge curr, max, end
	child = node[curr]
	'walk'(walker, child)
	inc curr
	branch loop
end:
.end

.sub 'walk' :method
	.param pmc node
	.tailcall 'walk'(self, node)
.end

.sub 'walkChildren' :method
	.param pmc node
	.tailcall 'walkChildren'(self, node)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
