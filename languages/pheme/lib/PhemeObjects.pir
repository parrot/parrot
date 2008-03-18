.namespace [ 'Pheme'; 'Cons' ]

.sub _initialize :anon :load :init
    .local pmc cons_class
    cons_class = get_class [ 'Pheme'; 'Cons' ]
    $I0 = defined cons_class
    unless $I0 goto register
    .return()

  register:
    newclass cons_class, [ 'Pheme'; 'Cons' ]

    addattribute cons_class, 'head'
    addattribute cons_class, 'tail'
.end

.sub 'get_bool' :vtable
	.return( 1 )
.end

.sub 'get_string' :vtable :method
	.local pmc    head
	.local string output
	head    = self.'head'()

	.local int head_defined
	head_defined = defined head
	unless head_defined goto return_it
	output  = head

	.local pmc tail
	tail = self.'tail'()

	.local string tail_output
	tail_output = tail
	unless tail_output goto return_it

	output .= ':'
	output .= tail_output

  return_it:
	.return( output )
.end

.sub 'head' :method
    .param pmc new_head  :optional
    .param int have_head :opt_flag

    unless have_head goto return_head
    setattribute self, 'head', new_head
    .return( new_head )

  return_head:
    .local pmc head
    head = getattribute self, 'head'
    .return( head )
.end

.sub get_integer :vtable :method
	.local pmc elem
	elem  = self.'head'()

	.local int elem_defined
	elem_defined = defined elem

	if elem_defined goto count_tail
	.return( 0 )

  count_tail:
	.local int count
	count = 0
	elem  = self

  loop_start:
	inc count
	elem         = elem.'tail'()
	elem_defined = defined elem
	if elem_defined goto loop_start

  loop_end:
	.return( count )
.end

.sub 'tail' :method
    .param pmc new_tail  :optional
    .param int have_tail :opt_flag

    unless have_tail goto return_tail
    setattribute self, 'tail', new_tail
    .return( new_tail )

  return_tail:
    .local pmc tail
    tail = getattribute self, 'tail'
    .return( tail )
.end

.namespace [ 'Pheme'; 'Atom' ]

.sub _initialize :anon :load :init
	.local pmc atom_class
	newclass atom_class, [ 'Pheme'; 'Atom' ]

	addattribute atom_class, 'value'
.end

.namespace [ 'Pheme'; 'Atom'; 'Symbol' ]

.sub _initialize :anon :load :init
	.local pmc symbol_class
	subclass symbol_class, [ 'Pheme'; 'Atom' ], [ 'Pheme'; 'Atom'; 'Symbol' ]
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
