=head1 NAME

POST - Parrot opcode syntax tree

=head1 DESCRIPTION

This file implements the various opcode syntax tree nodes
for compiling programs in Parrot.

=head1 METHODS

=cut

.namespace [ 'POST' ]

.sub '__onload' :load :init
    .local pmc base

    base = subclass 'PAST::Node', 'POST::Node'

    $P0 = subclass base, 'POST::Op'
    $P0 = subclass base, 'POST::Ops'
    $P0 = subclass base, 'POST::Sub'

    .local pmc pirtable
    pirtable = new .Hash
    pirtable['add'] = 'TPn'
    pirtable['sub'] = 'TPn'
    pirtable['mul'] = 'TPn'
    pirtable['div'] = 'TPn'
    pirtable['n_add'] = 'rPn'
    pirtable['n_sub'] = 'rPn'
    pirtable['n_mul'] = 'rPn'
    pirtable['n_div'] = 'rPn'
    pirtable['concat'] = 'TPs'
    pirtable['abs'] = 'T'
    pirtable['say'] = 'v'
    set_hll_global ['POST'], '%pirtable', pirtable
    .return ()
.end


.namespace [ 'POST::Node' ]

.sub 'result' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag

    if has_value == 1 goto set_value
    value = self['result']
    unless null value goto end
    value = self.'unique'('$P')
    goto set_value_1
  set_value:
    $I0 = isa value, 'POST::Node'
    if $I0 == 0 goto set_value_1
    value = value.'result'()
  set_value_1:
    self['result'] = value
  end:
    .return (value)
.end


.sub 'compile'
    .param pmc post
    .param pmc adverbs         :slurpy :named

    .local string target
    target = adverbs['target']
    target = downcase target
    if target != 'post' goto compile_post
    .return (post)

  compile_post:
    $I0 = isa post, 'POST::Sub'
    if $I0 goto with_sub
    post = post.'new'('POST::Sub', post, 'name'=>'anon')
  with_sub:
    .local pmc code
    code = new 'PGE::CodeString'
    set_hll_global ['POST'], '$!subpir', code
    post.'pir'()

    code = get_hll_global ['POST'], '$!subpir'
    if target != 'pir' goto compile_pir
    .return (code)

  compile_pir:
    $P0 = compreg 'PIR'
    $P0 = $P0(code)
    .return ($P0)
.end


.sub 'pir' :method
    .local pmc code
    code = self.'cpir'()
    # code = concat "    # POST::Node\n", code
    .return (code)
.end


.sub 'cpir' :method
    .local pmc code, iter
    code = new 'PGE::CodeString'
    iter = self.'iterator'()
  iter_loop:
    unless iter goto iter_end
    .local pmc cpost
    cpost = shift iter
    $P0 = cpost.'pir'()
    code .= $P0
    goto iter_loop
  iter_end:
    .return (code)
.end

.namespace [ 'POST::Ops' ]

.sub 'pir' :method
    .return self.'cpir'()
.end


.namespace [ 'POST::Op' ]

.sub 'pirop' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('pirop', value, has_value)
.end

.sub 'arglist' :method
    .param pmc arglist         :slurpy
    .local int argc
    argc = elements arglist
    $I0 = 0
  argc_loop:
    if $I0 >= argc goto argc_end
    $P0 = arglist[$I0]
    $I1 = isa $P0, 'POST::Node'
    if $I1 == 0 goto argc_next
    $P0 = $P0.'result'()
    arglist[$I0] = $P0
  argc_next:
    inc $I0
    if $I0 < argc goto argc_loop
  argc_end:
    self['arglist'] = arglist
    .return (arglist)
.end


.sub 'pir' :method
    .local pmc code, arglist
    code = self.'cpir'()
    arglist = self['arglist']
    .local string pirop
    pirop = self.'pirop'()
    if pirop == 'call' goto pir_call
    code.'emit'('    %n %,', arglist :flat, 'n'=>pirop)
    .return (code)

  pir_call:
    .local pmc result, name
    result = self.'result'()
    name = shift arglist
    code.'emit'('    %r = %n(%,)', arglist :flat, 'r'=>result, 'n'=>name)
    .return (code)
.end


.namespace [ 'POST::Sub' ]

.sub 'pir' :method
    .local string name
    name = self.'name'()
    .local pmc code
    code = new 'PGE::CodeString'
    code.'emit'("\n.sub '%0'", name)
    .local pmc iter, cpost
    iter = self.'iterator'()
  iter_loop:
    unless iter goto iter_end
    cpost = shift iter
    $P1 = cpost.'pir'()
    code .= $P1
    goto iter_loop
  iter_end:
    .local string value
    value = self.'result'()
    code.'emit'("    .return (%0)\n.end\n", value)
    $P0 = get_hll_global ['POST'], '$!subpir'
    code .= $P0
    set_hll_global ['POST'], '$!subpir', code
.end

