=head1 TITLE

Parrot::Coroutine - A pure PIR implementation of coroutines

=head1 VERSION

 $Id:$

=head1 SYNOPSIS

	.sub __onload :load
		load_bytecode 'Parrot/Coroutine.pir'
	.end

	## Recursive coroutine to enumerate tree elements.  Each element that is
	## not a FixedPMCArray is yielded in turn.
	.sub enumerate_tree
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
		print "[leaf "
		print tree_node
		print "]\n"
		coro.'yield'(tree_node)
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
		enumerate_tree(coro, $P1, depth)
		inc i
		goto again
	done:
		.return ()
	.end

	.sub print_tree
		.param pmc tree

		.local int coro_class, idx
		coro_class = find_type 'Parrot::Coroutine'
		.local pmc coro
		.const .Sub coro_sub = "enumerate_tree"
		coro = new coro_class, coro_sub
		($P0 :optional, $I0 :opt_flag) = coro.'resume'(coro, tree)
		idx = 0

	loop:
		unless $I0 goto done
		print 'print_tree:  '
		print idx
		print ' => '
		print $P0
		print "\n"
		($P0 :optional, $I0 :opt_flag) = coro.'resume'()
		goto loop
	done:
	.end

=head1 DESCRIPTION

This object class provides an implementation of coroutines that is written
in pure PIR using continuations.

=cut

.const int slot_state       = 0 ## State:  1 is new/valid, 0 is dead.
.const int slot_initial_sub = 1 ## Initial sub.
.const int slot_yield_cont  = 2 ## Continuation to for yielding.
.const int slot_resume_cont = 3 ## Continuation from which to resume.

.sub __loadtime_create_class :load
	find_type $I0, "Parrot::Coroutine"
	if $I0 > 1 goto END
	newclass $P0, "Parrot::Coroutine"
	addattribute $P0, "state"
	addattribute $P0, "initial_sub"
	addattribute $P0, "yield_cont"
	addattribute $P0, "resume_cont"
END:
	.return ()
.end

.namespace ["Parrot::Coroutine"]

.include "interpinfo.pasm"

=head2 METHODS

=head3 B<__init(sub)>

This method is normally called via the C<new> op:

	.local int coro_class
	coro_class = find_type 'Parrot::Coroutine'
	.local pmc coro
	.const .Sub coro_sub = "enumerate_tree"
	coro = new coro_class, coro_sub

Given a sub, it initializes a new C<Parrot::Coroutine> object.

=cut

.sub __init :method
	.param pmc sub

	## [should complain if sub is not a sub or closure.  -- rgr, 8-Oct-06.]
	.local pmc state
	state = new .Undef
	state = 1
	setattribute self, slot_state, state
	setattribute self, slot_initial_sub, sub
.end

## [it would be nice to include a pointer value.  -- rgr, 8-Oct-06.]
.sub __get_string :method
	$S0 = '<Parrot::Coroutine ?>'
	.return ($S0)
.end

=head3 B<coro.resume(args...)>

Invoke the coroutine.  The first time this is called on a new coroutine,
the initial sub is invoked with the passed arguments.  The second and
subsequent times, the args are delivered as the result of the previous
C<yield> operation.

If the coroutine subsequently yields, the values passed to the C<yield>
method are returned as the values from C<resume>.

If the coroutine returns normally (i.e. from the original sub), then those
values are passed returned from the C<resume> method, and the coroutine is
marked as dead, in which case it is an error to attempt to resume it again.

=cut

.sub resume :method
	.param pmc args :slurpy

	## Decide whether we're dead.
	.local pmc state
	state = getattribute self, slot_state
	unless state goto dead

	## Decide where to go.  If we've never been invoked before, we need to
	## call the sub.
	.local pmc entry
	entry = getattribute self, slot_resume_cont
	unless null entry goto doit
	entry = getattribute self, slot_initial_sub

doit:
	## Remember where to return when we yield.
	.local pmc cc
	cc = interpinfo .INTERPINFO_CURRENT_CONT
	setattribute self, slot_yield_cont, cc

	## Call the entry with our args.  Most of the time, it will yield (by
	## calling our continuation for us) instead of returning directly.
	.local pmc result
	(result :slurpy) = entry(args :flat)
	## If we returned normally, then the coroutine is dead.
	state = 0
	## Note that the value of the yield_cont slot will normally have been
	## changed magically behind our backs by a subsequent yield/resume, so
	## we can't just return directly.
	cc = getattribute self, slot_yield_cont
	.return cc(result :flat)

dead:
	## Complain about attempted zombie creation.
	.local pmc error
	error = new .Exception
	error['_message'] = "Can't reanimate a dead coroutine.\n"
	throw error
.end

=head3 B<coro.yield(args...)>

Within the coroutine, C<yield> returns arbitrary values back to the
caller, making it look like the values came from the last C<resume> call.

The next time the caller decides to resume the coroutine, the arguments
passed to C<resume> are returned as the values from C<yield>.

=cut

## Return values to the calling thread.
.sub yield :method
	.param pmc args :slurpy

	## Remember where to go when we are resumed.
	.local pmc cc
	cc = interpinfo .INTERPINFO_CURRENT_CONT
	setattribute self, slot_resume_cont, cc

	## Return to the coro caller.
	cc = getattribute self, slot_yield_cont
	.return cc(args :flat)
.end

=head1 BUGS

=over 4

=item 1.

We should really keep more state details.  The only legal state
transitions should be 'new' to 'resumed' to 'yielded' to 'resumed'
to 'yielded' ..., except that one might at any time transition to
'dead', which is (not surprisingly) the terminal state.

=back

Please report any others you find to C<E<lt>parrot-porters@perl.orgE<gt>>.

=head1 SEE ALSO

L<http://en.wikipedia.org/wiki/Coroutine> -- coroutines defined.

C<t/library/coroutine.t> -- "same fringe" test case.

C<src/pmc/coroutine.pmc> -- the C<pmclass> implementation.

L<http://www.lua.org/manual/5.1/manual.html#2.11> -- definition of the
coroutine API for the Lua programming language, upon which the
C<Parrot::Coroutine> API is based.

L<http://gd.tuwien.ac.at/languages/scheme/tutorial-dsitaram/t-y-scheme-Z-H-14.html>
-- Scheme tutorial chapter that introduces call/cc and uses it to solve
"same fringe" via coroutines.

=head1 AUTHOR

Bob Rogers C<E<lt>rogers-perl6@rgrjr.dyndns.orgE<gt>>

=head1 COPYRIGHT

Copyright (C) 2006, The Perl Foundation.
This program is free software. It is subject to the same
license as The Parrot Interpreter.

=for vim

" vim: ts=8 expandtab

=cut
