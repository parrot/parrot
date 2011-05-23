class PAST::Op is PAST::Node;

=NAME PAST::Op

=for DESCRIPTION
C<PAST::Op> nodes represent the operations in an abstract syntax
tree.  The primary function of the node is given by its C<pasttype>,
secondary functions may be given by the node's C<name>, C<pirop>,
or other attributes.

=begin item
pasttype([type])

A C<PAST::Op> node's C<pasttype> determines the type of operation to
be performed.  Predefined values of C<pasttype> are:

=defn assign
Copy the value of the node's second child into the variable expression
given by its first child.

=defn bind
Bind the variable given by the node's first child to the value given by its
second child.

=defn if
Evaluate the first child; if the first child is true then evaluate the
second child (if any) otherwise evaluate the third child (if any).  If
either the second or third child are missing, then they evaluate as the
result of the first child.

=defn unless
Same as 'if' above, but reverse the evaluation of the second and third
children nodes.

=defn while
Evaluate the first child, if the result is true then evaluate the second
child and repeat.

=defn until
Evaluate the first child, if the result is false then evaluate the second
child and repeat.

=defn for
Iterate over the first child. For each element, invoke the sub in the
second child, passing the element as the only parameter.

=defn call
Call a subroutine, passing the results of any child nodes as arguments.
The subroutine to be called is given by the node's C<name> attribute, if
the node has no C<name> attribute then the first child is assumed to
evaluate to a callable sub.

=defn pirop
Execute the named PIR opcode, passing the results of any children nodes as
arguments.

=defn inline
Execute the sequence of PIR statements given by the node's C<inline>
attribute (a string).  See the C<inline> method below for details.

=defn callmethod
Invokes a method on an object, using children nodes as arguments.  If the
node has a C<name> attribute, then the first child is the invocant and any
remaining children are arguments.  If the node doesn't have a C<name>
attribute, then the first child evaluates to the method to be called, the
second child is the invocant, and the remaining children are arguments to
the method call.

=defn try
(preliminary) Execute the code given by the first child, and if any
exceptions occur then handle them using the code given by the second child.

If a node doesn't have a value set for C<pasttype>, then it
assumes "pirop" if its C<pirop> attribute is set, otherwise it
assumes "call".

=end item

method pasttype($value?) {
    self.attr('pasttype', $value, pir::defined($value));
}


=item pirop([opcode])
Get/set the PIR opcode to be executed for this node.  The PAST
implementation knows about the argument types for many of the
PIR opcodes, and will try to automatically convert the results
of any children nodes into the correct types if needed.  (In
general, the implementation tries to convert things to PMCs
whenever it isn't certain what else to do.)  The table of
PIR opcodes that PAST "knows" about is in F<POST.pir>.

method pirop($value?) {
    self.attr('pirop', $value, pir::defined($value));
}


=item lvalue([flag])
Get/set whether this node is an lvalue, or treats its first
child as an lvalue (e.g., for assignment).

=begin item
inline([STRING code])

Get/set the code to be used for inline PIR when C<pasttype> is
"inline".  The C<code> argument is PIR text to be inserted in
the final generated code sequence.  Sequences of "%0", "%1",
"%2", ... "%9" in C<code> are replaced with the evaluated
results of the first, second, third, ..., tenth children nodes.
(If you need more than ten arguments to your inline PIR, consider
making it a subroutine call instead.)

The register to hold the result of the inline PIR operation is
given by "%r", "%t", or "%u" in the C<code> string:

  %r   - Generate a unique PMC register for the result.
  %t   - Generate a unique PMC register for the result,
         and initialize it with an object of type C<returns>
         before the execution of the inline PIR.
  %u   - Re-use the first child's PMC (%0) if it's a temporary
         result, otherwise same as %t above.
  %v   - (void) Re-use the first child's PMC (%0) as the result
         of this operation.

=end item

method inline($value?) {
    self.attr('inline', $value, pir::defined($value));
}


=item opattr(hash)
Set a variety of C<PAST::Op> attributes based on entries
in C<hash>.  Typically C<hash> is an entry in the operator
precedence table, and the attributes being set correspond
to traits in the grammar.

method opattr(%hash) {
    Q:PIR {
        .local pmc hash
        find_lex hash, '%hash'

        $P0 = split ' ', "pasttype pirop inline lvalue"
        $P1 = iter $P0
      iter_loop:
        unless $P1 goto iter_end
        $S0 = shift $P1
        $P2 = hash[$S0]
        if null $P2 goto iter_loop
        $P3 = find_method self, $S0
        self.$P3($P2)
        goto iter_loop
      iter_end:
    }
}

=begin head1
AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=end head1

=begin head1
HISTORY

2011-05-23  Brian Gernhardt converted to NQP
2006-11-20  Patrick Michaud added first draft of POD documentation.
2007-11-21  Re-implementation with pdd26 compliance, compiler toolkit

=end head1

=begin head1
COPYRIGHT

Copyright (C) 2006-2011, Parrot Foundation.

=end head1

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6

