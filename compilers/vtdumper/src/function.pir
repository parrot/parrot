# $Id$

=head1 NAME

PAST - Parrot abstract syntax tree for PMC.

=head1 DESCRIPTION

PAST nodes for PMC.

=cut

.sub '' :anon :load :init
    ##   create the classes
    .local pmc p6meta
    p6meta = new 'P6metaclass'

    p6meta.'new_class'('VTable::Function', 'parent'=>'PAST::Node')

    .return ()
.end

=head1 NODES

=head2 C<VTable::Function>

PAST node representing one VTABLE function

=cut

.namespace [ 'VTable';'Function' ]

.sub 'new' :method
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named

    .local pmc res
    $P0 = self.'HOW'()
    $P0 = getattribute $P0, 'parrotclass'
    res = new $P0
    res.'init'(children :flat, adverbs :flat :named)

    # Initialize various attributes
    $P1 = new 'ResizablePMCArray'
    res.'attr'('parameters', $P1, 1)

    $P1 = new 'String'
    res.'attr'('parameter_list', $P1, 1)

    $P1 = new 'ResizableStringArray'
    res.'attr'('attributes', $P1, 1)

    $P1 = new 'String'
    res.'attr'('section', $P1, 1)

    .return (res)
.end

=item C<add_parameter>

Add a function parameter to PMC.

=cut

.sub 'add_parameter' :method
    .param pmc parameter

    $P0 = self.'attr'('parameters', 0, 0)
    push $P0, parameter
  done:
    .return ()
.end

=item C<add_attribute>

Add an attribute to this VTABLE function, checking for duplicates.

=cut

.sub 'add_attribute' :method
    .param string name

    .local pmc it, key
    .local string s_key

    $P0 = self.'attr'('attributes', 0, 0)
    it = iter $P0
  iter_loop:
    unless it goto iter_done
    key = shift it
    s_key = key
    eq name, s_key, done
    unless $I0 goto done
    goto iter_loop
  iter_done:
    push $P0, name
  done:
    .return ()
.end

=item C<set_section>

Set the section where this VTABLE function lives.

=cut

.sub 'set_section' :method
    .param string name

    $P0 = self.'attr'('section', 0, 0)
    $P0 = name
  done:
    .return ()
.end

=item C<set_parameter_list>

Set the string representing all of this function's parameters.

=cut

.sub 'set_parameter_list' :method
    .param string list

    $P0 = self.'attr'('parameter_list', 0, 0)
    $P0 = list
  done:
    .return ()
.end

=item C<has_attribute>

Return 1 if this function has the speficied attribute.

=cut

.sub 'has_attribute' :method
    .param string name

    .local int elems, i

    $P0 = self.'attr'('attributes', 0, 0)
    elems = elements $P0
    i = 0
  loop_start:
    if i == elems goto not_found
    $S0 = $P0[i]
    if $S0 == name goto found
    i += 1
    goto loop_start
  not_found:
    .return (0) 
  found:
    .return (1)
.end

=head1 COPYRIGHT

Copyright (C) 2009, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
