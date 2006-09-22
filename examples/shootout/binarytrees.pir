#!./parrot -C
#
# binarytrees.pir N         (N = 16 for shootout)
# by Joshua Isom, modified by Leopold Toetsch
# modified by karl : default value of N=10 to match shootout output

.sub itemcheck
	.param pmc node
	$I0 = exists node[0]
	unless $I0 goto final
	.local pmc tmp
	tmp = node[0]
	unless_null tmp, else
	$I0 = node[2]
	.return($I0)
else:
	# tmp = node[0]
	$I0 = itemcheck(tmp)
	tmp = node[1]
	$I1 = itemcheck(tmp)
	$I0 -= $I1
	$I1 = node[2]
	$I0 += $I1
final:
	.return($I0)
.end

.sub bottomuptree
	.param int item
	.param int dep
	.local pmc left, right, tree
        .local int item2
	unless dep > 0 goto else
	item2 = item * 2
	$I0 = item2 - 1
	dec dep
	left = bottomuptree($I0, dep)
	right = bottomuptree(item2, dep)
	goto endif
else:
	null left
	null right
endif:
	tree = new .FixedPMCArray
	tree = 3
	tree[0] = left
	tree[1] = right
	tree[2] = item
	.return(tree)
.end

.sub main :main
	.param pmc argv
	.local int argc
	.local int N, dep, mindepth, maxdepth, stretchdepth
	.local pmc stretchtree, longlivedtree, tmptree

	argc = elements argv
	N = 10
	if argc == 1 goto default
	$S0 = argv[1]
	N = $S0
default:
	mindepth = 4
	unless N < 6 goto else
	maxdepth = mindepth + 2
	goto endif
else:
	maxdepth = N
endif:
	stretchdepth = maxdepth + 1
	$I0 = 0
	stretchtree = bottomuptree($I0, stretchdepth)
	$I0 = itemcheck(stretchtree)

	print "stretch tree of depth "
	print stretchdepth
	print "\t check: "
	print $I0 
	print "\n"

	null stretchtree
	$I0 = 0
	longlivedtree = bottomuptree($I0, maxdepth)

	dep = mindepth
beginfor_1:

	.local int i, iterations, check

	$N0 = maxdepth - dep
	$N0 += mindepth
	$N1 = 2
	$N2 = pow $N1, $N0
	iterations = $N2
	
	check = 0

	i = 1
	beginfor_2:
       noop

			tmptree = bottomuptree(i, dep)
			$I0 = itemcheck(tmptree)
			check += $I0
			$I0 = 0 - i
			tmptree = bottomuptree($I0, dep)
			$I0 = itemcheck(tmptree)
			check += $I0
		
	inc i
	if i <= iterations goto beginfor_2
	$I0 = iterations * 2
	print $I0 
	print "\t trees of depth "
	print dep
	print "\t check: " 
	print check
	print "\n"


	dep += 2
	if dep <= maxdepth goto beginfor_1

	$I0 = itemcheck(longlivedtree)
	print "long lived tree of depth "
	print maxdepth
	print "\t check: "
	print $I0 
	print "\n"

.end
