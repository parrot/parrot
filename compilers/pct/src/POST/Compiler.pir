
=head1 NAME

POST::Compiler - Compiler for POST trees

=head1 DESCRIPTION

POST::Compiler defines a compiler that converts a POST tree into
PIR or an Eval PMC (bytecode).

=head1 METHODS

=over

=cut

.namespace [ 'POST';'Compiler' ]

.sub '__onload' :load :init
    .local pmc p6meta, cproto
    p6meta = new 'P6metaclass'
    cproto = p6meta.'new_class'('POST::Compiler', 'parent'=>'PCT::HLLCompiler')
    cproto.'language'('POST')
    $P1 = split ' ', 'pir evalpmc'
    cproto.'stages'($P1)

    $P0 = new 'String'
    set_global '$?HLL', $P0
    null $P0
    set_global '$?NAMESPACE', $P0
    .return ()
.end



=item pir(POST::Sub node)

Generate PIR for C<node>, storing the result into the compiler's
C<$!code> attribute and returning any code needed to look up
the sub.

=cut

.sub 'pir' :method :multi(_, ['POST';'Sub'])
    .param pmc node

    .local pmc subpir, subline, innerpir
    subpir = new 'StringBuilder'
    .lex '$SUBPIR', subpir
    subline = box -1
    .lex '$SUBLINE', subline
    innerpir = new 'StringBuilder'
    .lex '$CODE', innerpir

    .local string name, pirflags
    name = node.'name'()
    pirflags = node.'pirflags'()

  pirflags_subid:
    $I0 = index pirflags, ':subid('
    if $I0 >= 0 goto pirflags_subid_done
    .local string subid
    subid = node.'subid'()
    pirflags = concat pirflags, ' :subid("'
    pirflags .= subid
    pirflags .= '")'
  pirflags_subid_done:

  pirflags_method:
    $I0 = index pirflags, ':method'
    if $I0 >= 0 goto pirflags_method_done
    $S0 = node.'blocktype'()
    if $S0 != 'method' goto pirflags_method_done
    pirflags = concat pirflags, ' :method'
  pirflags_method_done:

    .local pmc outerpost, outername
    outername = new 'Undef'
    outerpost = node.'outer'()
    if null outerpost goto pirflags_done
    unless outerpost goto pirflags_done
    outername = outerpost.'subid'()
    $S0 = self.'escape'(outername)
    pirflags = concat pirflags, ' :outer('
    pirflags = concat pirflags, $S0
    pirflags = concat pirflags, ')'
  pirflags_done:

    .local pmc outerhll, hll
    outerhll = get_global '$?HLL'
    hll = node.'hll'()
    if hll goto have_hll
    hll = outerhll
  have_hll:
    set_global '$?HLL', hll

    .local pmc outerns, ns, nskey
    outerns = get_global '$?NAMESPACE'
    ns = outerns
    $P0 = node.'namespace'()
    unless $P0 goto have_ns
    ns = $P0
  have_ns:
    set_global '$?NAMESPACE', ns
    nskey = self.'key_pir'(ns)

    .local pmc multi
    multi = node.'multi'()
    unless multi goto no_multi

    .local pmc parts, m_iter
    parts  = new ['ResizableStringArray']
    m_iter = iter multi
  multi_iter:
    unless m_iter goto multi_iter_done
    $P0 = shift m_iter
    $S0 = $P0
    if $S0 == "_" goto push_part
    $S0 = self.'key_pir'($P0)
  push_part:
    push parts, $S0
    goto multi_iter

  multi_iter_done:
    pirflags = concat pirflags, ' :multi('
    $S0 = join ',', parts
    pirflags = concat pirflags, $S0
    pirflags = concat pirflags, ')'
  no_multi:

  subpir_start:
    $P0 = node['loadinit']
    if null $P0 goto loadinit_done
    self.'pir'($P0)
  loadinit_done:

    $P0 = node.'compiler'()
    unless $P0 goto subpir_post
  subpir_compiler:
    $P0 = node.'compiler_args'()
    if $P0 goto have_compiler_args
    $P0 = new 'Hash'
  have_compiler_args:
    $P0 = self.'hll_pir'(node, 'name'=>name, 'namespace'=>ns, 'pirflags'=>pirflags, $P0 :named :flat)
    subpir .= $P0
    goto subpir_done

  subpir_post:
    unless hll goto subpir_loadlibs
    $P0 = self.'escape'(hll)
    subpir.'append_format'("\n.HLL %0\n", $P0)
  subpir_loadlibs:
    $P0 = node.'loadlibs'()
    if null $P0 goto subpir_ns
    unless $P0 goto subpir_ns
    $P1 = iter $P0
  subpir_loadlibs_loop:
    unless $P1 goto subpir_ns
    $P2 = shift $P1
    $P2 = self.'escape'($P2)
    subpir.'append_format'("\n.loadlib %0\n", $P2)
    goto subpir_loadlibs_loop
  subpir_ns:
    subpir.'append_format'("\n.namespace %0\n", nskey)
  subpir_directives:
    $S0 = node['directives']
    unless $S0 goto subpir_decl
    subpir.'append_format'("%0", $S0)
  subpir_decl:
    $S0 = self.'escape'(name)
    subpir.'append_format'(".sub %0 %1\n", $S0, pirflags)
    .local pmc paramlist
    paramlist = node['paramlist']
    if null paramlist goto paramlist_done
    .local pmc it
    it = iter paramlist
  param_loop:
    unless it goto paramlist_done
    $P0 = shift it
    if null $P0 goto param_loop
    subpir .= $P0
    goto param_loop
  paramlist_done:

    self.'pir_children'(node)
    subpir.'append_format'(".end\n\n")

  subpir_done:
    .local pmc outerpir
    outerpir = find_caller_lex '$CODE'
    outerpir .= subpir
    outerpir .= innerpir

    set_global '$?NAMESPACE', outerns
    set_global '$?HLL', outerhll
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
