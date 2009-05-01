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
    res.'attr'('class_init', $P4, 0)

    $P5 = new 'Hash'
    res.'attr'('vtables', $P5, $I0)

    $P6 = new 'Hash'
    res.'attr'('methods', $P6, $I0)

    $P7 = new 'ResizableStringArray'
    res.'attr'('provides', $P7, $I0)

    .return (res)
.end

=item C<parents>

Get PMC parents.

=cut

.sub 'parents' :method
    .tailcall self.'attr'('parents',0,0)
.end

=item C<class_init>

Get PMC vtable class_init, if any.

=cut

.sub 'class_init' :method
    .tailcall self.'attr'('class_init',0,0)
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

=item C<add_class_init>

Add a class_init function to PMC.

=cut

.sub 'add_class_init' :method
    .param pmc method

    .local string name
    name = 'class_init'

    $P0 = self.'attr'('class_init', 0, 0)
    $I0 = exists $P0[name]
    unless $I0 goto add_method
    $S0 = "Duplicate class_init function: "
    die $S0
  add_method:
    $P0[name] = method
    .return ()
.end

=item C<add_vtable>

Add VTABLE method to PMC.

=cut

.sub 'add_vtable' :method
    .param string name
    .param pmc method

    $P0 = self.'attr'('vtables', 0, 0)
    $I0 = exists $P0[name]
    unless $I0 goto add_method
    $S0 = concat "Duplicate VTABLE method: ", name
    die $S0
  add_method:
    $P0[name] = method
    .return ()
.end

=item C<add_method>

Add METHOD to PMC.

=cut

.sub 'add_method' :method
    .param string name
    .param pmc method

    $P0 = self.'attr'('methods', 0, 0)
    $I0 = exists $P0[name]
    unless $I0 goto add_method
    $S0 = concat "Duplicate METHOD: ", name
    die $S0
  add_method:
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
