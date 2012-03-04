# Copyright (C) 2006-2008, Parrot Foundation.

=head1 TITLE

Iter -- A PIR-based Iterator Object

=head1 DESCRIPTION

An iterator with an object-oriented interface, written in PIR.
Currently implemented only for Array type PMCs. Expect Hash support shortly.

=head1 SYNOPSIS

    load_bytecode 'Iter.pir'
    .local pmc iter
               iter = new 'Iter'

    ## initialize the iterator
    iter.'start'(your_aggregate)

    ## advance to the next item in the iterator
    iter.'next'()

    ## check for exhaustion
    $I0 = iter.'exhausted'()
    if $I0 goto done

    ## get the value from the iterator
    $P0 = iter.'value'()

    ## alternate interface to advance and get the value
    $P0 = iter.'nextval'()

=cut

.namespace ['Iter']

.sub '__onload' :tag('load')
    $P0 = get_class 'Undef'
    $P1 = subclass $P0, 'Iter'
    addattribute $P1, 'aggregate'
    addattribute $P1, 'exhausted'
    addattribute $P1, 'index'
    addattribute $P1, 'value'
.end


=head2 C<Iter> Methods

=over 4

=item C<.'start'(PMC aggregate)>

Initialize the iterator. Must pass a PMC aggregate, or an exception is thrown.

=cut

.sub 'start' :method
    .param pmc agg
    $P0 = clone agg
    setattribute self, 'aggregate', $P0
    $P99 = new 'Integer'
    $P99 = 0
    setattribute self, 'exhausted', $P99
    null $P99
    setattribute self, 'index', $P99
    setattribute self, 'value', $P99
.end


=item C<.'next'()>

Sets the internal C<value> attribute to the value of the
next item from the iterator. Sets the internal C<exhausted>
attribute if the iterator is exhausted.

=cut

.sub 'next' :method
    .local pmc agg
    .local pmc index
    .local pmc value
    agg = getattribute self, 'aggregate'
    index = getattribute self, 'index'
    $I0 = isnull index
    if $I0 goto first_time
    inc index
    $I1 = index
    goto test_limit
  first_time:
    $I1 = 0
    index = new 'Integer'
    index = 0
    goto test_limit
  test_limit:
    $I0 = agg
    if $I1 >= $I0 goto exhausted

    ## TODO better handling for exhaustion
    push_eh eh_exhausted
    value = agg[index]
    pop_eh

    setattribute self, 'value', value
    setattribute self, 'index', index
    goto return

  eh_exhausted:
    .get_results ($P0)
    pop_eh
  exhausted:
    $P99 = getattribute self, 'exhausted'
    inc $P99
    setattribute self, 'exhausted', $P99
    null $P99
    setattribute self, 'value', $P99
  return:
    .return ()
.end


=item C<.'exhausted'()>

Returns true (1) if the iterator is exhausted. Returns false (0) otherwise.

=cut

.sub 'exhausted' :method
    $P0 = getattribute self, 'exhausted'
    .return ($P0)
.end


=item C<.'value'()>

Returns the current value from the iterator. Returns PMCNULL if exhausted.

=cut

.sub 'value' :method
    $P0 = getattribute self, 'value'
    .return ($P0)
.end


=item C<.'nextval'()>

Executes C<.'next'()>, and returns C<.'value'()>.

=cut

.sub 'nextval' :method
    self.'next'()
    .tailcall self.'value'()
.end

=back

=head1 AUTHOR

Jerry Gay a.k.a. particle

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
