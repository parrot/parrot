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

    $P0 = new 'ResizablePMCArray'
    set_global '@!subcode', $P0

    $P0 = box '[]'
    set_global '$?NAMESPACE', $P0
    .return ()
.end


.sub 'to_pir' :method
    .param pmc post
    .param pmc adverbs         :slurpy :named

    .local pmc newself
    newself = new ['POST';'Compiler']

    ##  start with empty code
    .local pmc subcode, code
    subcode = get_global '@!subcode'
    code = new 'CodeString'
    push subcode, code

    ##  if the root node isn't a Sub, wrap it
    $I0 = isa post, ['POST';'Sub']
    if $I0 goto have_sub
    $P0 = get_hll_global ['POST'], 'Sub'
    post = $P0.'new'(post, 'name'=>'anon')
  have_sub:

    ##  now generate the pir
    newself.'pir'(post)

    ##  and return whatever code was generated
    $P0 = pop subcode
    .return ($P0)
.end


=item pir_children(node)

Return generated PIR for C<node> and all of its children.

=cut

.sub 'pir_children' :method
    .param pmc node
    .local pmc code, iter
    code = new 'CodeString'
    iter = node.'iterator'()
  iter_loop:
    unless iter goto iter_end
    .local pmc cpost
    cpost = shift iter
    $P0 = self.'pir'(cpost)
    code .= $P0
    goto iter_loop
  iter_end:
    .return (code)
.end


=item pir(Any node)

Return generated pir for any POST::Node.  Returns
the generated pir of C<node>'s children.

=cut

.sub 'pir' :method :multi(_,_)
    .param pmc node
    .tailcall self.'pir_children'(node)
.end


=item pir(POST::Op node)

Return pir for an operation node.

=cut

.sub 'pir' :method :multi(_,['POST';'Op'])
    .param pmc node

    ##  determine the type of operation
    .local string pirop
    pirop = node.'pirop'()

    ##  determine if we're storing result
    .local string result
    result = node.'result'()
    unless result goto have_result
    concat result, ' = '
  have_result:

    ##  get list of arguments to operation
    .local pmc arglist
    arglist = node.'list'()

    ##  get format and arguments based on pirop
    .local string fmt, name, invocant
    if pirop == 'call' goto pirop_call
    if pirop == 'callmethod' goto pirop_callmethod
    if pirop == 'return' goto pirop_return
    if pirop == 'tailcall' goto pirop_tailcall
    if pirop == 'inline' goto pirop_inline

  pirop_opcode:
    fmt = "    %n %,"
    name = pirop
    goto pirop_emit

  pirop_call:
    fmt = "    %r%n(%,)"
    name = shift arglist
    goto pirop_emit

  pirop_callmethod:
    fmt = "    %r%i.%n(%,)"
    name = shift arglist
    invocant = shift arglist
    goto pirop_emit

  pirop_return:
    fmt = "    .return (%,)"
    goto pirop_emit

  pirop_tailcall:
    name = shift arglist
    fmt = '    .tailcall %n(%,)'
    goto pirop_emit

  pirop_inline:
    fmt = node.'inline'()
    result = node.'result'()
    goto pirop_emit

  pirop_emit:
    .local pmc code
    code = new 'CodeString'
    code.'emit'(fmt, arglist :flat, 'r'=>result, 'n'=>name, 'i'=>invocant, 't'=>result)
    .return (code)
.end


=item pir(POST::Label node)

Generate a label.

=cut

.sub 'pir' :method :multi(_, ['POST';'Label'])
    .param pmc node
    .local string code, value
    value = node.'result'()
    code = '  '
    code .= value
    code .= ":\n"
    .return (code)
.end


=item pir(POST::Sub node)

Generate PIR for C<node>, storing the result into the compiler's
C<$!code> attribute and returning any code needed to look up
the sub.

=cut

.sub 'pir' :method :multi(_, ['POST';'Sub'])
    .param pmc node

    .local pmc subcode
    subcode = get_global '@!subcode'
    $P0 = new 'CodeString'
    push subcode, $P0

    .local pmc code
    code = new 'CodeString'

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
    $S0 = code.'escape'(outername)
    pirflags = concat pirflags, ' :outer('
    concat pirflags, $S0
    concat pirflags, ')'
  pirflags_done:

    .local pmc outerns, ns, nskey
    outerns = get_global '$?NAMESPACE'
    nskey = outerns
    ns = node.'namespace'()
    unless ns goto have_ns
    nskey = code.'key'(ns)
    set_global '$?NAMESPACE', nskey
  have_ns:

  subpir_start:
    $P0 = node.'compiler'()
    unless $P0 goto subpir_post
  subpir_compiler:
    $P0 = node.'compiler_args'()
    if $P0 goto have_compiler_args
    $P0 = new 'Hash'
  have_compiler_args:
    $P0 = self.'hll_pir'(node, 'name'=>name, 'namespace'=>ns, 'pirflags'=>pirflags, $P0 :named :flat)
    code .= $P0
    goto subpir_done

  subpir_post:
    code.'emit'("\n.namespace %0", nskey)
    $S0 = code.'escape'(name)
    code.'emit'(".sub %0 %1", $S0, pirflags)
    .local pmc paramlist
    paramlist = node['paramlist']
    if null paramlist goto paramlist_done
    .local pmc iter
    iter = new 'Iterator', paramlist
  param_loop:
    unless iter goto paramlist_done
    $P0 = shift iter
    if null $P0 goto param_loop
    code .= $P0
    goto param_loop
  paramlist_done:

    $P0 = self.'pir_children'(node)
    code .= $P0
    code.'emit'(".end\n\n")

  subpir_done:
    $P0 = pop subcode
    code .= $P0
    $P0 = subcode[-1]
    $P0 .= code

    set_global '$?NAMESPACE', outerns

    code = new 'CodeString'
    .return (code)
.end


.sub 'hll_pir' :method
    .param pmc node
    .param pmc options         :slurpy :named

    options['target'] = 'pir'
    options['grammar'] = ''
    $P0 = node.'subid'()
    options['subid'] = $P0
    .local pmc source, compiler, pir
    source = node[0]
    $S0 = node.'compiler'()
    compiler = compreg $S0
    $I0 = isa compiler, 'Sub'
    if $I0 goto compiler_sub
    .tailcall compiler.'compile'(source, options :flat :named)
  compiler_sub:
    .tailcall compiler(source, options :flat :named)
.end

=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=head1 HISTORY

2007-11-21  Significant refactor as part of Parrot Compiler Toolkit

=head1 COPYRIGHT

Copyright (C) 2006-2008, The Perl Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
