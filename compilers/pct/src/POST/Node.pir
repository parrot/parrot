# $Id$

=head1 NAME

POST - Parrot opcode syntax tree

=head1 DESCRIPTION

This file implements the various opcode syntax tree nodes
for compiling programs in Parrot.

=cut

.namespace [ 'POST' ]

.sub '__onload' :load :init
    .local pmc p6meta, base

    ##  create POST classes
    p6meta = new 'P6metaclass'
    base = p6meta.'new_class'('POST::Node', 'parent'=>'PCT::Node')
    p6meta.'new_class'('POST::Op', 'parent'=>base)
    p6meta.'new_class'('POST::Ops', 'parent'=>base)
    p6meta.'new_class'('POST::Label', 'parent'=>base)
    p6meta.'new_class'('POST::Sub', 'parent'=>base)

    $P0 = new 'ResizableStringArray'
    $P0[0] = "    .param pmc %0\n"
    $P0[1] = "    .param pmc %0 :optional\n    .param int has_%0 :opt_flag\n"
    $P0[2] = "    .param pmc %0 :slurpy\n"
    $P0[4] = "    .param pmc %0 :named(%1)\n"
    $P0[5] = "    .param pmc %0 :optional :named(%1)\n    .param int has_%0 :opt_flag\n"
    $P0[6] = "    .param pmc %0 :slurpy :named\n"
    $P0[8] = "    .param pmc %0 :call_sig\n"
    set_hll_global ['POST';'Sub'], '%!paramfmt', $P0
    .return ()
.end


=head1 POST Node types

=head2 POST::Node

C<POST::Node> is the base class for all POST nodes.  It's derived from class
C<PCT::Node> (see F<compilers/pct/src/PCT/Node.pir>).

=over 4

=item result([value])

Get/set

=cut

.namespace [ 'POST';'Node' ]

=item result([value])

Get or set the result value of this node.  If the result value
is set to another POST node, then that node's result is used
as the result of the current node.

=cut

.sub 'result' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag

    if has_value == 1 goto set_value
    value = self['result']
    if null value goto result_null
    $I0 = isa value, ['POST';'Node']
    if $I0 goto result_node
    .return (value)
  result_node:
    .tailcall value.'result'()
  result_null:
    .return ('')
  set_value:
    self['result'] = value
    .return (value)
.end


=item get_string()

Returns the result of the current node as a string.

=cut

.sub 'get_string' :vtable :method
    $S0 = self.'result'()
    .return ($S0)
.end


=item push_pirop(pirop [,arglist :slurpy] [,adverbs :slurpy :named])

Shortcut for creating and adding a new POST::Op node with opcode
C<pirop> and any supplied arguments or options.  Returns the
newly created node.

=cut

.sub 'push_pirop' :method
    .param pmc pirop
    .param pmc arglist         :slurpy
    .param pmc adverbs         :slurpy :named
    adverbs['pirop'] = pirop
    $P0 = get_hll_global ['POST'], 'Op'
    $P1 = $P0.'new'(arglist :flat, adverbs :flat :named)
    self.'push'($P1)
    .return ($P1)
.end


=item escape(str)

Return C<str> as a PIR constant string.  (Deprecated in favor of
C<POST::Compiler.escape>.)

=cut

.sub 'escape' :method
    .param string str
    $P0 = get_hll_global ['PAST'], 'Compiler'
    str = $P0.'escape'(str)
    .return (str)
.end

=back

=head2 POST::Op

C<POST::Op> nodes represents any PIR opcodes.

=over 4

=item pirop([opcode])

Get/set the opcode type for this node.

=cut

.namespace [ 'POST';'Op' ]

.sub 'pirop' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('pirop', value, has_value)
.end

.sub 'inline' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('inline', value, has_value)
.end


.namespace [ 'POST';'Label' ]

.sub 'result' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    if has_value goto set_value
    value = self['result']
    unless null value goto end
    .local string name
    name = self.'name'()
    value = self.'unique'(name)
  set_value:
    self['result'] = value
  end:
    .return (value)
.end


.namespace [ 'POST';'Sub' ]

.sub 'blocktype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('blocktype', value, has_value)
.end


.sub 'namespace' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('namespace', value, has_value)
.end


.sub 'hll' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('hll', value, has_value)
.end


.sub 'outer' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('outer', value, has_value)
.end

.sub 'multi' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('multi', value, has_value)
.end


.sub 'subid' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    if has_value goto getset_value
    $I0 = exists self['subid']
    if $I0 goto getset_value
    value = self.'unique'('post')
    has_value = 1
  getset_value:
    .tailcall self.'attr'('subid', value, has_value)
.end


.sub 'pirflags' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('pirflags', value, has_value)
.end


.sub 'compiler' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('compiler', value, has_value)
.end


.sub 'compiler_args' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('compiler_args', value, has_value)
.end


.sub 'add_param' :method
    .param pmc pname
    .param pmc adverbs         :slurpy :named

    .local int optional, slurpy, call_sig
    .local string named
    optional = adverbs['optional']
    slurpy = adverbs['slurpy']
    named = adverbs['named']
    call_sig = adverbs['call_sig']

    .local int paramseq
    paramseq = isne optional, 0
    unless slurpy goto slurpy_done
    paramseq += 2
  slurpy_done:
    unless named goto named_done
    paramseq += 4
  named_done:
    unless call_sig goto call_sig_done
    paramseq += 8
  call_sig_done:

    .local pmc paramlist
    paramlist = self['paramlist']
    unless null paramlist goto have_paramlist
    paramlist = new 'ResizablePMCArray'
    self['paramlist'] = paramlist
  have_paramlist:

    .local pmc code
    code = paramlist[paramseq]
    unless null code goto have_code
    code = new 'StringBuilder'
    paramlist[paramseq] = code
  have_code:

    .local pmc paramfmt
    paramfmt = get_hll_global ['POST';'Sub'], '%!paramfmt'
    $S0 = paramfmt[paramseq]
    named = self.'escape'(named)
    code.'append_format'($S0, pname, named)

    .return ()
.end

=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=head1 HISTORY

2007-11-21  Significant refactor as part of Parrot Compiler Toolkit

=head1 COPYRIGHT

Copyright (C) 2006-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
