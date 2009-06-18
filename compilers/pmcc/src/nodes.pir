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
    $P1 = new 'ResizableStringArray'
    res.'attr'('parents', $P1, 1)

    $P1 = new 'Hash'
    res.'attr'('vtables', $P1, 1)

    $P1 = new 'Hash'
    res.'attr'('methods', $P1, 1)

    # Multis are Hash of Arrays. name -> implementation*
    $P1 = new 'Hash'
    res.'attr'('multis', $P1, 1)

    $P1 = new 'ResizablePMCArray'
    res.'attr'('attrs', $P1, 1)

    $P1 = new 'ResizableStringArray'
    res.'attr'('provides', $P1, 1)

    $P1 = new 'Hash'
    res.'attr'('traits', $P1, 1)

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

=item C<multis>

Get PMC MULTIs.

=cut

.sub 'multis' :method
    .tailcall self.'attr'('multis',0,0)
.end

=item C<provides>

Get PMC provided interfaces.

=cut

.sub 'provides' :method
    .tailcall self.'attr'('provides',0,0)
.end

=item C<attrs>

Get PMC ATTRs.

=cut

.sub 'attrs' :method
    .tailcall self.'attr'('attrs',0,0)
.end

=item C<traits>

Get PMC traits.

=cut

.sub 'traits' :method
    .tailcall self.'attr'('traits',0,0)
.end


=item C<unfreeze_attrs>

unserialize a PMC's frozen ATTRs and add them to this PMC.

=cut

.sub 'unfreeze_pmc_attrs' :method

    .param string pmcname

    .local pmc pmc_path, attrs, fh, it, filename
    .local string dumpname

    #search through all dirs in @pmc_path, looking for a file
    #named lc(pmcname) ~".dump"

    pmc_path = get_hll_global ['PMC';'Emitter'], '@?pmc_path'
    dumpname = pmcname
    dumpname = downcase dumpname
    dumpname = concat dumpname,  '.dump'
    #print "looking for "
    #say dumpname

    fh = new ['FileHandle']
    it = iter pmc_path

  path_loop:
    unless it goto dump_not_found
    filename = shift it
    concat filename, "/"
    concat filename, dumpname
    push_eh iter_next
    #print "trying to open "
    #print filename
    #print " ..."
    fh.'open'(filename)
    goto dump_found

  iter_next:
    pop_eh
    #say "failed"
    goto path_loop

  dump_found:
    pop_eh
    #say "succeeded"

    $S0 = fh.'readall'()
    close fh

    .local pmc attr
    .local string type, name
    .local int is_fp

    attrs = thaw $S0
    it = iter attrs

  iter_loop:
    unless it goto iter_done
    attr = shift it
    name  = attr['name']
    type  = attr['type']
    is_fp = attr['is_fp']
    self.'add_attr'(name, type, is_fp)
    goto iter_loop

  iter_done:
    .return ()

  dump_not_found:
    printerr "WARNING: couldn't read .dump for "
    printerr pmcname
    printerr ".pmc\n"
    .return ()
.end


=item C<add_class_init>

Add a class_init function to PMC.

=cut

.sub 'add_class_init' :method
    .param pmc method

    .local string name
    name = 'class_init'

    $I0 = exists self['class_init']
    unless $I0 goto add_method
    $S0 = "Duplicate class_init function: "
    die $S0
  add_method:
    self['class_init'] = method
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
    $S0 = concat "Duplicate VTABLE function: ", name
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

=item C<add_multi>

Add MULTI to PMC.

=cut

.sub 'add_multi' :method
    .param string name
    .param pmc    multi

    .local pmc    list

    $P0 = self.'attr'('multis', 0, 0)
    list = $P0[name]
    unless null list goto vivify
    list = new ['ResizablePMCArray']
    $P0[name] = list
  vivify:
    push list, multi
    .return ()
.end

=item C<add_attr>

Add an ATTR to PMC.

=cut

.sub 'add_attr' :method
    .param string name
    .param string type
    .param int is_fp

    .local pmc it, attrs, attr

    attrs = self.'attr'('attrs', 0, 0)
    it = iter attrs
  iter_start:
    unless it goto add_method
    $P0 = shift it
    $S0 = $P0['name']
    $I0 = cmp $S0, name
    if $I0 goto iter_start

    $S0 = concat "Duplicate ATTR: ", name
    die $S0

  add_method:
    attr = new 'Hash'
    attr['type'] = type
    attr['name'] = name
    attr['is_fp'] = is_fp
    push attrs, attr
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
