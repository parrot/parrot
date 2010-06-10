# $Id$

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


=item C<escape(string str)>

Returns an escaped value of C<str> suitable for including in PIR.
If the string contains any non-ASCII characters, then it's
prefixed with 'unicode:'.  (This method just delegates to
PAST::Compiler.escape, which does the same thing.)

=cut

.sub 'escape' :method
    .param string str
    $P0 = get_hll_global ['PAST'], 'Compiler'
    .tailcall $P0.'escape'(str)
.end

=item C<key_pir( string name1 [, string name2, ...] )>

Constructs a PIR key using the strings passed as arguments.
For example, C<key('Foo', 'Bar')> returns C<["Foo";"Bar"]>.

=cut

.sub 'key_pir' :method
    .param pmc args            :slurpy
    .local string out, sep
    out = '['
    sep = ''
  args_loop:
    unless args goto args_done
    $P0 = shift args
    if null $P0 goto args_loop
    $I0 = does $P0, 'array'
    if $I0 goto args_array
  args_string:
    $S0 = self.'escape'($P0)
    concat out, sep
    concat out, $S0
    sep = ';'
    goto args_loop
  args_array:
    splice args, $P0, 0, 0
    goto args_loop
  args_done:
    concat out, ']'
    .return (out)
.end


.sub 'to_pir' :method
    .param pmc post
    .param pmc adverbs         :slurpy :named

    .local pmc newself
    newself = new ['POST';'Compiler']

    .local pmc innerpir, line
    innerpir = new 'StringBuilder'
    .lex '$CODE', innerpir
    line = box 0
    .lex '$LINE', line

    ##  if the root node isn't a Sub, wrap it
    $I0 = isa post, ['POST';'Sub']
    if $I0 goto have_sub
    $P0 = get_hll_global ['POST'], 'Sub'
    post = $P0.'new'(post, 'name'=>'anon')
  have_sub:

    ##  now generate the pir
    newself.'pir'(post)

    ##  and return whatever code was generated
    .return (innerpir)
.end


=item pir_children(node)

Return generated PIR for C<node> and all of its children.

=cut

.sub 'pir_children' :method
    .param pmc node
    .local pmc line
    line = find_caller_lex '$LINE'
    .lex '$LINE', line

    .local pmc iter
    iter = node.'iterator'()
  iter_loop:
    unless iter goto iter_end
    .local pmc cpost, pos, source
    cpost = shift iter
    pos = cpost['pos']
    if null pos goto done_subline
    source = cpost['source']
    $I0 = can source, 'lineof'
    unless $I0 goto done_subline
    line = source.'lineof'(pos)
    inc line
  done_subline:
    self.'pir'(cpost)
    goto iter_loop
  iter_end:
.end


=item pir(Any node)

Return generated pir for any POST::Node.  Returns
the generated pir of C<node>'s children.

=cut

.sub 'pir' :method :multi(_,_)
    .param pmc node
    self.'pir_children'(node)
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
    if pirop == 'yield' goto pirop_yield
    if pirop == 'tailcall' goto pirop_tailcall
    if pirop == 'inline' goto pirop_inline

  pirop_opcode:
    fmt = "    %n %,\n"
    name = pirop
    goto pirop_emit

  pirop_call:
    fmt = "    %r%n(%,)\n"
    name = shift arglist
    goto pirop_emit

  pirop_callmethod:
    fmt = "    %r%i.%n(%,)\n"
    name = shift arglist
    invocant = shift arglist
    goto pirop_emit

  pirop_return:
    fmt = "    .return (%,)\n"
    goto pirop_emit

  pirop_yield:
    fmt = "    .yield (%,)\n"
    goto pirop_emit

  pirop_tailcall:
    name = shift arglist
    fmt = "    .tailcall %n(%,)\n"
    goto pirop_emit

  pirop_inline:
    fmt = node.'inline'()
    concat fmt, "\n"
    result = node.'result'()
    goto pirop_emit

  pirop_emit:
    .local pmc subpir, subline, line
    subpir  = find_caller_lex '$SUBPIR'
    subline = find_caller_lex '$SUBLINE'
    line    = find_caller_lex '$LINE'
    if subline == line goto done_line
    subpir.'append_format'(".annotate 'line', %0\n", line)
    assign subline, line
  done_line:
    subpir.'append_format'(fmt, arglist :flat, 'r'=>result, 'n'=>name, 'i'=>invocant, 't'=>result)
.end


=item pir(POST::Label node)

Generate a label.

=cut

.sub 'pir' :method :multi(_, ['POST';'Label'])
    .param pmc node
    .local pmc subpir, value
    value = node.'result'()
    subpir = find_caller_lex '$SUBPIR'
    subpir.'append_format'("  %0:\n", value)
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
    concat pirflags, $S0
    concat pirflags, ')'
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
    unless hll goto subpir_ns
    $P0 = self.'escape'(hll)
    subpir.'append_format'("\n.HLL %0\n", $P0)
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


.sub 'hll_pir' :method
    .param pmc node
    .param pmc options         :slurpy :named

    options['target'] = 'pir'
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

Copyright (C) 2006-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
