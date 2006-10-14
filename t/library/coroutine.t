#!./parrot 
# Copyright (C) 2006, The Perl Foundation.
# $Id:$

=head1 NAME

t/library/coroutine.t -- Test the Parrot::Coroutine class

=head1 SYNOPSIS

  ./parrot t/library/coroutine.t

=head1 DESCRIPTION

This script tests the C<Parrot::Coroutine> class using an implementation of the
"same fringe" problem.

Note:  In order to see how coroutine calling works in detail, insert
C<trace 4> before and C<trace 0> after one of the C<same_fringe> calls
in the body of the main program.

=head1 SEE ALSO

L<http://swiss.csail.mit.edu/classes/symbolic/spring06/psets/ps6/samefringe.scm>
-- a collection of "same fringe" implementations in Scheme.

=cut

.const int N_TESTS = 6

## Build an N-ary tree (where N is passed as node_width) of the specified depth,
## with the leaves being consecutive integer PMCs from start but less than N.
## The tree will be complete iff end-start+1 == node_width^depth.
.sub make_nary_tree
	.param int start
	.param int end
	.param int node_width
	.param int depth

	.local pmc result
	if depth goto deeper
	result = new .Undef
	result = start
	inc start
	goto done
deeper:
	result = new .ResizablePMCArray
	dec depth
	.local int i
	i = 0
next:
	if i >= node_width goto done
	if start > end goto done
	($P0, start) = make_nary_tree(start, end, node_width, depth)
	push result, $P0
	inc i
	goto next
done:
	.return (result, start)
.end

## non-coroutine traversal, for debugging.
.sub enumerate_tree
	.param pmc tree_node
	.param int depth :optional
	.param int depth_p :opt_flag

	if depth_p goto have_depth
	depth = 0
have_depth:
	inc depth

	$I0 = isa tree_node, 'ResizablePMCArray'
	if $I0 goto recur
	print "[leaf "
	print tree_node
	print "]\n"
done:
	.return ()

recur:
	## Loop through array elements, recurring on each.
	.local int size, i
	i = 0
	size = tree_node
again:
	if i >= size goto done
	print "[recur: depth "
	print depth
	print ' elt '
	print i
	print "]\n"
	$P1 = tree_node[i]
	enumerate_tree($P1, depth)
	inc i
	goto again
.end

## Recursive coroutine to enumerate tree elements.  Each element that is not a
## FixedPMCArray is yielded in turn.
.sub coro_enumerate_tree
	.param pmc coro
	.param pmc tree_node
	.param int depth :optional
	.param int depth_p :opt_flag

	if depth_p goto have_depth
	depth = 0
have_depth:
	inc depth

	$I0 = isa tree_node, 'FixedPMCArray'
	if $I0 goto recur
	## print "[leaf "
	## print tree_node
	## print "]\n"
	coro.'yield'(tree_node)
	.return ()

recur:
	## Loop through array elements, recurring on each.
	.local int size, i
	i = 0
	size = tree_node
again:
	if i >= size goto done
	## print "[coro recur: depth "
	## print depth
	## print ' elt '
	## print i
	## print "]\n"
	$P1 = tree_node[i]
	coro_enumerate_tree(coro, $P1, depth)
	inc i
	goto again
done:
	.return ()
.end

## Solution to the "same fringe" problem that uses coroutines to enumerate each
## of two passed trees of numbers.  Returns 1 if the trees have the same fringe,
## else 0.
.sub same_fringe
	.param pmc tree1
	.param pmc tree2

	.local int coro_class
	coro_class = find_type 'Parrot::Coroutine'
	if coro_class goto found
	printerr "Bug:  Can't find 'Parrot::Coroutine' class.\n"
	die 5, 1
found:
	.local pmc coro1, coro2
	.const .Sub coro_sub = "coro_enumerate_tree"
	coro1 = new coro_class, coro_sub
	coro2 = new coro_class, coro_sub
	($P0 :optional, $I0 :opt_flag) = coro1.'resume'(coro1, tree1)
	($P1 :optional, $I1 :opt_flag) = coro2.'resume'(coro2, tree2)

loop:
	if $I0 goto got_first
	if $I1 goto not_equal
	goto equal
got_first:
	unless $I1 goto not_equal

	## now have results from both.
	## print "[got "
	## print $P0
	## print ' and '
	## print $P1
	## print "]\n"
	if $P0 != $P1 goto not_equal
	## set up for the next iteration.
	($P0 :optional, $I0 :opt_flag) = coro1.'resume'()
	($P1 :optional, $I1 :opt_flag) = coro2.'resume'()
	goto loop
not_equal:
	.return (0)
equal:
	.return (1)
.end

.sub main :main
	load_bytecode 'Test/Builder.pir'
	.local pmc test	   
	test = new 'Test::Builder'
	test.'plan'(N_TESTS)

	push_eh cant_load
	load_bytecode 'Parrot/Coroutine.pir'
	clear_eh
	test.'ok'(1, 'loaded bytecode')

	## grow some trees for traversal.
	.local pmc binary, binary_4, ternary, ternary_2
	binary = make_nary_tree(1, 8, 2, 3)
	ternary = make_nary_tree(1, 8, 3, 2)
	binary_4 = make_nary_tree(1, 16, 2, 4)
	## now make a "damaged" one that will be different.
	ternary_2 = make_nary_tree(1, 8, 3, 2)
	$P0 = ternary_2[1]
	$P0 = $P0[0]
	ternary_2[1] = $P0
	## enumerate_tree(ternary_2)
	test.'ok'(1, 'made test trees.')

	$I0 = same_fringe(binary, binary)
	test.'ok'($I0, 'binary [[[1,2],[3,4]],[[5,6],[7,8]]] vs. itself')
	$I0 = same_fringe(binary, binary_4)
	$I0 = 1 - $I0
	test.'ok'($I0, 'binary 1..8 vs. binary 1..16')
	$I0 = same_fringe(binary, ternary)
	test.'ok'($I0, 'binary 1..8 vs. ternary [[1,2,3],[4,5,6],[7,8]]')
	$I0 = same_fringe(binary, ternary_2)
	$I0 = 1 - $I0
	test.'ok'($I0, 'binary 1..8 vs. ternary [[1,2,3],4,[7,8]]')
	test.'finish'()
	end
cant_load:
	test.'ok'(0, 'Load failed')
	test.'finish'()
.end
