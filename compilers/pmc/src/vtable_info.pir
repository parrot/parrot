# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 C<PMC::VTableInfo>

Holds information about single VTable method.

=cut

.namespace ['PMC';'VTableInfo']

.sub '' :load :init
    .local pmc p6meta

    p6meta = new 'P6metaclass'

    p6meta.'new_class'('PMC::VTableInfo', 'parent' => 'Capture')

.end

=item new([attr1=>val1, attr2=>val2, ...])

Create a new VTable of initialized with the given
attributes.  Returns the newly created node.

=cut

.sub 'new' :method
    .param pmc adverbs :slurpy :named

    .local pmc res
    $P0 = self.'HOW'()
    $P0 = getattribute $P0, 'parrotclass'
    res = new $P0
    
    res.'init'(adverbs :flat :named)

    .return (res)
.end

=item init([attr1=>val1, attr2=>val2, ... ])

Initializes VTableInfo 

=cut

.sub 'init' :method
    .param pmc adverbs         :slurpy :named

    .local pmc iter

    iter = new 'Iterator', adverbs
  adverbs_loop:
    unless iter goto adverbs_end
    $S0 = shift iter
    $P0 = iter[$S0]
    $P1 = find_method self, $S0
    self.$P1($P0)
    goto adverbs_loop
  adverbs_end:
  end:
    .return (self)
.end


=item name

Get/Set name.

=cut

.sub 'name' :method
    .param string name      :optional
    .param int    has_name
    .tailcall self.'attr'('name', name, has_name)
.end

=item ret_type

Get/Set ret_type of method.

=cut

.sub 'ret_type' :method
    .param string type      :optional
    .param int    has_type
    .tailcall self.'attr'('ret_type', type, has_type)
.end

=item parameters

Get/Set "C" parameters.

=cut

.sub 'parameters' :method
    .param string parameters    :optional
    .param int    has_parameters
    .tailcall self.'attr'('parameters', parameters, has_parameters)
.end

=item is_write

Get/set that vtable method updates PMC.

=cut

.sub 'is_write' :method
    .param int is_write     :optional
    .param int has_is_write
    .tailcall self.'attr'('is_write', is_write, has_is_write)
.end

=item attr(STR attrname, PMC value, INT has_value)

Helper method for accessors.  If C<has_value> is true then set
the invocant's value of C<attrname> to C<value>.  Returns the
(resulting) value of C<attrname> in the invocant.

=cut

.sub 'attr' :method
    .param string attrname
    .param pmc value
    .param int has_value
    if has_value goto setattr
    value = self[attrname]
    unless null value goto value_done
    value = new 'Undef'
  value_done:
    .return (value)
  setattr:
    self[attrname] = value
    .return (value)
.end



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
