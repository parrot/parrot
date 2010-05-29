# Copyright (C) 2010, Parrot Foundation.
# $Id$

.namespace ['PAST'; 'Node']

.sub 'is_equal' :vtable :method
    .param pmc value
    .tailcall 'compare_node_attrs'(self, value)
.end

.sub 'compare_node_attrs'
    .param pmc an
    .param pmc other
    $P0 = an.'returns'()
    $P1 = other.'returns'()
    unless $P0 == $P1 goto no
    $P0 = an.'arity'()
    $P1 = other.'arity'()
    unless $P0 == $P1 goto no
    $P0 = an.'name'()
    $P1 = other.'name'()
    unless $P0 == $P1 goto no
    $P0 = an.'named'()
    $P1 = other.'named'()
    unless $P0 == $P1 goto no
    $P0 = an.'flat'()
    $P1 = other.'flat'()
    unless $P0 == $P1 goto no
    $P0 = an.'lvalue'()
    $P1 = other.'lvalue'()
    unless $P0 == $P1 goto no
    .local int lan, lother, i
    lan = elements an
    lother = elements other
    unless lan == lother goto no
    i = 0
    unless i < lan goto yes
elt_cmp_loop:
    $P0 = an[i]
    $P1 = other[i]
    unless $P0 == $P1 goto no
    inc i
    if i < lan goto elt_cmp_loop
yes:
    .return (1)
no:
    .return (0)
.end

.namespace ['PAST';'Val']

.sub 'is_equal' :vtable :method
    .param pmc value
    $P0 = class self
    $I0 = isa value, $P0
    if $I0 == 0 goto no
    $P0 = self.'value'()
    $P1 = value.'value'()
    unless $P0 == $P1 goto no
    $P0 = get_hll_global ['PAST'; 'Node'], 'compare_node_attrs'
    .tailcall $P0(self, value)
no:
    .return (0)
.end

.namespace ['PAST';'Var']

.sub 'is_equal' :vtable :method
    .param pmc value
    $P0 = class self
    $I0 = isa value, $P0
    if $I0 == 0 goto no
    $P0 = self.'scope'()
    $P1 = value.'scope'()
    unless $P0 == $P1 goto no
    $P0 = self.'isdecl'()
    $P1 = value.'isdecl'()
    unless $P0 == $P1 goto no
    $P0 = self.'namespace'()
    $P1 = value.'namespace'()
    unless $P0 == $P1 goto no
    $P0 = self.'slurpy'()
    $P1 = value.'slurpy'()
    unless $P0 == $P1 goto no
    $P0 = self.'call_sig'()
    $P1 = value.'call_sig'()
    unless $P0 == $P1 goto no
    $P0 = self.'viviself'()
    $P1 = value.'viviself'()
    unless $P0 == $P1 goto no
    $P0 = self.'vivibase'()
    $P1 = value.'vivibase'()
    unless $P0 == $P1 goto no
    $P0 = self.'multitype'()
    $P1 = value.'multitype'()
    unless $P0 == $P1 goto no
    $P0 = get_hll_global ['PAST'; 'Node'], 'compare_node_attrs'
    .tailcall $P0(self, value)
no:
    .return (0)
.end

.namespace ['PAST'; 'Op']

.sub 'is_equal' :vtable :method
    .param pmc value
    $P0 = class self
    $I0 = isa value, $P0
    if $I0 == 0 goto no
    $P0 = self.'pasttype'()
    $P1 = value.'pasttype'()
    unless $P0 == $P1 goto no
    $P0 = self.'pirop'()
    $P1 = value.'pirop'()
    unless $P0 == $P1 goto no
    $P0 = self.'inline'()
    $P1 = value.'inline'()
    unless $P0 == $P1 goto no
    $P0 = get_hll_global ['PAST'; 'Node'], 'compare_node_attrs'
    .tailcall $P0(self, value)
no:
    .return (0)
.end

.namespace ['PAST'; 'Block']

.sub 'is_equal' :vtable :method
    .param pmc value
    $P0 = class self
    $I0 = isa value, $P0
    if $I0 == 0 goto no
    $P0 = self.'blocktype'()
    $P1 = value.'blocktype'()
    unless $P0 == $P1 goto no
    $P0 = self.'closure'()
    $P1 = value.'closure'()
    unless $P0 == $P1 goto no
    $P0 = self.'control'()
    $P1 = value.'control'()
    unless $P0 == $P1 goto no
    $P0 = self.'loadinit'()
    $P1 = value.'loadinit'()
    unless $P0 == $P1 goto no
    $P0 = self.'namespace'()
    $P1 = value.'namespace'()
    unless $P0 == $P1 goto no
    $P0 = self.'multi'()
    $P1 = value.'multi'()
    unless $P0 == $P1 goto no
    $P0 = self.'hll'()
    $P1 = value.'hll'()
    unless $P0 == $P1 goto no
    $P0 = self.'nsentry'()
    $P1 = value.'nsentry'()
    unless $P0 == $P1 goto no
    $P0 = self.'symtable'()
    $P1 = value.'symtable'()
    unless $P0 == $P1 goto no
    $P0 = self.'lexical'()
    $P1 = value.'lexical'()
    unless $P0 == $P1 goto no
    $P0 = self.'compiler'()
    $P1 = value.'compiler'()
    unless $P0 == $P1 goto no
    $P0 = self.'compiler_args'()
    $P1 = value.'compiler_args'()
    unless $P0 == $P1 goto no
#    $P0 = self.'subid'()
#    $P1 = value.'subid'()
    unless $P0 == $P1 goto no
    $P0 = self.'pirflags'()
    $P1 = value.'pirflags'()
    unless $P0 == $P1 goto no
    $P0 = get_hll_global ['PAST'; 'Node'], 'compare_node_attrs'
    .tailcall $P0(self, value)
no:
    .return (0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
