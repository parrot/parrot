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

    p6meta.'new_class'('PMC::Class', 'parent'=>'PAST::Node')

    .return ()
.end

=head1 NODES

=head2 C<PMC::Class>

PMC class by it self.

=cut

.namespace [ 'PMC';'Class' ]

.sub 'new' :method
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named

    .local pmc res
    $P0 = self.'HOW'()
    $P0 = getattribute $P0, 'parrotclass'
    res = new $P0
    res.'init'(children :flat, adverbs :flat :named)

    # Initialize various attributes
    $P3 = new 'ResizableStringArray'
    res.'attr'('parents', $P3, $I0)

    $P4 = new 'Hash'
    res.'attr'('vtables', $P4, $I0)

    $P5 = new 'Hash'
    res.'attr'('methods', $P5, $I0)

    $P6 = new 'ResizableStringArray'
    res.'attr'('provides', $P6, $I0)

    .return (res)
.end

=item C<parents>

Get PMC parents.

=cut

.sub 'parents' :method
    .tailcall self.'attr'('parents',0,0)
.end

=item C<vtables>

Get PMC vtable methods.

=cut

.sub 'vtables' :method
    .tailcall self.'attr'('vtables',0,0)
.end

=item C<methods>

Get PMC methods.

=cut

.sub 'methods' :method
    .tailcall self.'attr'('methods',0,0)
.end

=item C<provides>

Get PMC provided interfaces.

=cut

.sub 'provides' :method
    .tailcall self.'attr'('provides',0,0)
.end


=item C<set_trait>

Set boolean trait

=cut

.sub 'trait' :method
    .param string name
    .param int value        :optional
    .param int has_value    :opt_flag
    .tailcall self.'attr'(name, value, has_value)
.end

=item C<add_vtable>

Add VTABLE method to PMC.

=cut

.sub 'add_vtable' :method
    .param string name
    .param pmc method

    $P0 = self.'attr'('vtables', 0, 0)
    $P0[name] = method
    .return ()
.end

=head1 COPYRIGHT

Copyright (C) 2009, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
