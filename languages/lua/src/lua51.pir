# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

src/lua51.pir -- The compiler for Lua 5.1

=head1 DESCRIPTION

This compiler extends C<PCT::HLLCompiler>
(see F<compilers/pct/src/PCT/HLLCompiler.pir>)

This compiler defines the following stages:

=over 4

=item * parse F<languages/lua/src/lua51.pg>

=item * PAST  F<languages/lua/src/PASTGrammar.tg>

=item * POST  F<languages/lua/src/POSTGrammar.tg>

=back

Used by F<languages/lua/lua.pir>.

=cut

.namespace [ 'Lua' ]

.sub '__onload' :anon :load :init
    load_bytecode 'PCT.pbc'
    load_bytecode 'PGE/Text.pbc'

    new $P0, 'P6metaclass'
    $P0.'new_class'('Lua::Compiler', 'parent'=>'PCT::HLLCompiler', 'attr'=>'$ostgrammar')

    $P0 = new ['Lua';'Compiler']
    $P0.'language'('lua')
    $P0.'parsegrammar'('Lua::Grammar')
    $P0.'astgrammar'('Lua::PAST::Grammar')
    $P0.'ostgrammar'('Lua::POST::Grammar')

    $P0.'commandline_prompt'('> ')
.end


.namespace [ 'Lua';'Compiler' ]

=head2 Overloaded methods

=over 4

=item C<ostgrammar([string grammar])>

Accessor for the 'ostgrammar' attribute.

=cut

.sub 'ostgrammar' :method
    .param string value        :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('$ostgrammar', value, has_value)
.end


=item C<post(source [, adverbs :slurpy :named])>

Transform C<source> using the compiler's C<ostgrammar>
according to any options given by C<adverbs>, and return the
resulting ost.

=back

=cut

.sub 'post' :method
    .param pmc source
    .param pmc adverbs         :slurpy :named
    .local string ostgrammar_name
    .local pmc ostgrammar, ostbuilder
    ostgrammar_name = self.'ostgrammar'()
    unless ostgrammar_name goto default_ostgrammar
    .local pmc ostgrammar_namekeys
    ostgrammar_namekeys = split '::', ostgrammar_name
    ostgrammar = new ostgrammar_namekeys
    ostbuilder = ostgrammar.'apply'(source)
    .tailcall ostbuilder.'get'('post')

  default_ostgrammar:
    $P0 = compreg 'PAST'
    .tailcall $P0.'compile'(source, adverbs :flat :named)
.end


.namespace [ 'Lua'; 'PAST'; 'Grammar' ]

=head2 Functions

=over 4

=item C<internal_error>

used in F<languages/lua/src/PASTGrammar.tg>

=cut

.sub internal_error
    .param string msg
    $S0 = "ERROR_INTERNAL (PAST): " . msg
    $S0 .= "\n"
    printerr $S0
    exit 1
.end


.namespace [ 'Lua'; 'POST'; 'Grammar' ]

=item C<internal_error>

used in F<languages/lua/src/POSTGrammar.tg>

=cut

.sub internal_error
    .param string msg
    $S0 = "ERROR_INTERNAL (POST): " . msg
    $S0 .= "\n"
    printerr $S0
    exit 1
.end


.namespace [ 'POST';'Node' ]

.sub 'has_call_in_last_op' :method
    $I0 = isa self, ['POST';'Ops']
    unless $I0 goto L1
    $P0 = self.'list'()
    $I0 = elements $P0
    unless $I0 goto L1
    $P1 = $P0[-1]
    $I0 = isa $P1, ['POST';'Op']
    unless $I0 goto L1
    $S0 = $P1.'pirop'()
    unless $S0 == 'call' goto L1
    .return (1, $P1)
  L1:
    .return (0)
.end


.namespace [ 'Lua';'POST';'Sub' ]

.sub '__onload' :anon :load :init
    new $P0, 'P6metaclass'
    $P0.'new_class'('Lua::POST::Sub', 'parent'=>'POST::Sub')
.end

.sub 'ops_const' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('ops_const', value, has_value)
.end

.sub 'ops_subr' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('ops_subr', value, has_value)
.end

.sub 'storage_const' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('storage_const', value, has_value)
.end

.sub 'storage_lex' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('storage_lex', value, has_value)
.end


.namespace [ 'Lua';'POST';'Chunk' ]

.sub '__onload' :anon :load :init
    new $P0, 'P6metaclass'
    $P0.'new_class'('Lua::POST::Chunk', 'parent'=>'Lua::POST::Sub')
.end

.sub 'prologue' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('prologue', value, has_value)
.end


.namespace [ 'POST';'Compiler' ]

.sub 'pir' :method :multi(_, ['Lua';'POST';'Chunk'])
    .param pmc node
    .local pmc subcode
    subcode = get_global '@!subcode'
    $P0 = new 'CodeString'
    push subcode, $P0
    .local pmc code
    code = self.'pir_children'(node)
    $S0 = node.'prologue'()
    if $S0 == '' goto L1
    new code, 'CodeString'
    code.'emit'($S0)
    $P0 = pop subcode
    code .= $P0
    $P0 = subcode[-1]
    $P0 .= code
  L1:
    .return (code)
.end


.namespace [ 'Lua';'Symbtab' ]

.sub '__onload' :anon :load :init
    $P0 = get_hll_global 'P6metaclass'
    $P0 = $P0.'new_class'('Lua::Symbtab', 'parent'=>'ResizablePMCArray')
    new $P0, 'Integer'
    set $P0, 0
    set_global '$nb', $P0
.end

.sub 'insert' :method
    .param string name
    $P0 = self[0]
    $I0 = exists $P0[name]
    if $I0 goto L1
    $S0 = name . '_'
    $P1 = get_global '$nb'
    $S1 = $P1
    $S0 .= $S1
    $P0[name] = $S0
  L1:
    $S0 = $P0[name]
    .return ($S0)
.end

.sub 'lookup' :method
    .param string name
    .local pmc iter
    new iter, 'Iterator', self
  L1:
    unless iter goto L2
    $P0 = shift iter
    $I0 = exists $P0[name]
    unless $I0 goto L1
    $S0 = $P0[name]
    .return (1, $S0)
  L2:
    .return (0)
.end

.sub 'push_scope' :method
    new $P0, 'Hash'
    unshift self, $P0
    $P1 = get_global '$nb'
    inc $P1
.end

.sub 'pop_scope' :method
    $P0 = shift self
.end

.include 'languages/lua/src/grammar51.pir'
.include 'languages/lua/src/lua51_gen.pir'
.include 'languages/lua/src/PASTGrammar_gen.pir'
.include 'languages/lua/src/POSTGrammar_gen.pir'

=back

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
