=head1 NAME

PAST::Compiler - PAST Compiler

=head1 DESCRIPTION

PAST::Compiler implements a basic compiler for PAST nodes.
By default PAST::Compiler transforms a PAST tree into POST.

=cut

.namespace [ 'PAST::Compiler' ]

.sub 'onload' :anon :load :init
    load_bytecode 'PCT/HLLCompiler.pbc'
    $P0 = get_hll_global 'Protomaker'
    $P1 = $P0.'new_subclass'('PCT::HLLCompiler', 'PAST::Compiler')

    $P0 = get_hll_global ['PAST'], 'Compiler'
    $P0.'language'('PAST')
    $P1 = split ' ', 'post pir evalpmc'
    $P0.'stages'($P1)

    .local pmc piropsig
    piropsig = new 'Hash'
    piropsig['n_abs']    = 'PP'
    piropsig['n_add']    = 'PP+'
    piropsig['n_band']   = 'PPP'
    piropsig['n_bnot']   = 'PP'
    piropsig['n_bor']    = 'PPP'
    piropsig['n_concat'] = 'PP~'
    piropsig['n_div']    = 'PP+'
    piropsig['n_fdiv']   = 'PP+'
    piropsig['n_mod']    = 'PP+'
    piropsig['n_mul']    = 'PP+'
    piropsig['n_neg']    = 'PP'
    piropsig['n_not']    = 'PP'
    piropsig['n_shl']    = 'PP+'
    piropsig['n_shr']    = 'PP+'
    piropsig['n_sub']    = 'PP+'
    piropsig['print']    = 'v*'
    piropsig['set']      = 'PP'
    set_global '%piropsig', piropsig

    .local pmc valflags
    valflags = new 'Hash'
    valflags['String']   = '~*:e'
    valflags['Integer']  = '+*:'
    valflags['Float']    = '+*:'
    set_global '%valflags', valflags

    .return ()
.end

=head2 Compiler methods

=over 4

=item to_post(node [, 'option'=>option, ...])

Compile the abstract syntax tree given by C<past> into POST.

=cut

.sub 'to_post' :method
    .param pmc past
    .param pmc options         :slurpy :named

    .local pmc blockpast
    blockpast = get_global '@?BLOCK'
    unless null blockpast goto have_blockpast
    blockpast = new 'ResizablePMCArray'
    set_global '@?BLOCK', blockpast
  have_blockpast:
    .return self.'as_post'(past, 'rtype'=>'v')
.end

=item post_children(node [, 'signature'=>signature] )

Return the POST representation of evaluating all of C<node>'s
children in sequence.  The C<signature> option is a string of
characters that allow the caller to suggest the type of
result that should be returned by each child:

    *     Anything
    P     PMC register
    +     PMC, numeric register, or numeric constant
    ~     PMC, string register, or string constant
    :     Argument (same as '*'), possibly with :named or :flat
    v     void result (result value not used)

The first character of C<signature> is ignored (return type),
thus C<v~P*> says that the first child needs to be something
in string context, the second child should be a PMC, and the
third and subsequent children can be any value they wish.

=cut

.sub 'post_children' :method
    .param pmc node
    .param pmc options         :slurpy :named

    .local pmc ops
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node)

    ##  get any conversion types
    .local string signature
    signature = options['signature']
    if signature goto have_signature
    signature = '**'
  have_signature:
    .local int sigmax, sigidx
    sigmax = length signature
    dec sigmax

    ##  if the signature contains a ':', then we're doing
    ##  flagged arguments (:flat, :named)
    .local pmc posargs, namedargs
    null posargs
    null namedargs
    $I0 = index signature, ':'
    if $I0 < 0 goto nocolon
    posargs = new 'ResizableStringArray'
    namedargs = new 'ResizableStringArray'
  nocolon:

    .local pmc iter
    .local string rtype
    .local int sigidx
    iter = node.'iterator'()
    sigidx = 1
    rtype = substr signature, sigidx, 1
  iter_loop:
    unless iter goto iter_end
    .local pmc cpast, cpost
    cpast = shift iter
    cpost = self.'as_post'(cpast, 'rtype'=>rtype)
    ops.'push'(cpost)
    if null posargs goto iter_rtype
    if rtype != ':' goto iter_pos
    .local pmc npast, npost
    npast = cpast.'named'()
    unless npast goto iter_pos
  iter_named:
    npost = self.'as_post'(npast, 'rtype'=>'~')
    ops.'push'(npost)
    $S0 = cpost
    $S1 = npost
    concat $S0, ' :named('
    concat $S0, $S1
    concat $S0, ')'
    push namedargs, $S0
    goto iter_rtype
  iter_pos:
    push posargs, cpost
  iter_rtype:
    unless sigidx < sigmax goto iter_loop
    inc sigidx
    rtype = substr signature, sigidx, 1
    goto iter_loop
  iter_end:
    .return (ops, posargs, namedargs)
.end

=back

=head2 Methods on C<PAST::Node> arguments

The methods below are used to transform PAST nodes into their
POST equivalents.

=head3 Defaults

=over 4

=item post(node)

Return a POST representation of C<node>.  Note that C<post> is
a multimethod based on the type of its first argument, this is
the method that is called when no other methods match.

If C<node> is an instance of C<PAST::Node>  (meaning that none
of the other C<post> multimethods were invoked), then return
the POST representation of C<node>'s children, with the result
of the node being the result of the last child.

If C<node> revaluates to false, return an empty POST node.

Otherwise, C<node> is treated as a string, and a POST node
is returned to create a new object of the type given by C<node>.
This is useful for vivifying values with a simple type name
instead of an entire PAST structure.

=cut

.sub 'as_post' :method :multi(_, _)
    .param pmc node
    .param pmc options         :slurpy :named

    .local pmc ops
    $I0 = isa node, 'PAST::Node'
    if $I0 goto from_past
    unless node goto from_nothing
  from_string:
    .local string result
    $P0 = get_hll_global ['POST'], 'Op'
    result = $P0.'unique'('$P')
    $S0 = $P0.'escape'(node)
    .return $P0.'new'(result, $S0, 'pirop'=>'new', 'result'=>result)

  from_nothing:
    $P0 = get_hll_global ['POST'], 'Ops'
    result = $P0.'unique'('$P')
    .return $P0.'new'('result'=>result)

  from_past:
    $P0 = node.'get_array'()
    $I0 = elements $P0
    $S0 = repeat 'v', $I0
    concat $S0, 'P'
    ops = self.'post_children'(node, 'signature'=>$S0)
    $P0 = ops[-1]
    ops.'result'($P0)
    .return (ops)
.end

=back

=head3 C<PAST::Block>

=over 4

=item post(PAST::Block node)

Return the POST representation of a C<PAST::Block>.

=cut

.sub 'as_post' :method :multi(_, ['PAST::Block'])
    .param pmc node
    .param pmc options         :slurpy :named

    ##  add current block node to @?BLOCK
    .local pmc blockpast
    blockpast = get_global '@?BLOCK'
    unshift blockpast, node

    .local string name
    name = node.'name'()
    if name goto have_name
    name = node.'unique'('_block')
  have_name:

    ##  create a POST::Sub node for this block
    .local string blocktype
    blocktype = node.'blocktype'()
    .local pmc ns, pirflags
    ns = node.'namespace'()
    pirflags = node.'pirflags'()
    .local pmc bpost
    $P0 = get_hll_global ['POST'], 'Sub'
    bpost = $P0.'new'('node'=>node, 'name'=>name, 'blocktype'=>blocktype, 'namespace'=>ns, 'pirflags'=>pirflags)

    ##  determine the outer POST::Sub for the new one
    .local pmc outerpost
    outerpost = get_global '$?SUB'
    $P0 = node.'lexical'()
    if $P0 goto outer_block
    null $P0
    set_global '$?SUB', $P0
    goto outer_done
  outer_block:
    bpost.'outer'(outerpost)
    set_global '$?SUB', bpost
  outer_done:

    .local pmc compiler
    compiler = node.'compiler'()
    if compiler goto children_compiler

  children_past:
    ##  all children but last can return anything, last returns PMC
    $P0 = node.'get_array'()
    $I0 = elements $P0
    $S0 = repeat 'v', $I0
    concat $S0, 'P'
    ##  convert children to post
    .local pmc ops
    ops = self.'post_children'(node, 'signature'=>$S0)
    bpost.'push'(ops)
    ##  result of last child is return from block
    $P0 = ops[-1]
    bpost.'push_pirop'('return', $P0)
    goto children_done

  children_compiler:
    ##  set the compiler to use for the POST::Sub node, and
    ##  add this block's child to it.
    bpost.'compiler'(compiler)
    $P0 = node[0]
    bpost.'push'($P0)

  children_done:
    ##  restore previous outer scope
    set_global '$?SUB', outerpost

    ##  get a result register if we need it
    .local string rtype, result
    result = ''
    rtype = options['rtype']
    if rtype == 'v' goto have_result
    result = bpost.'unique'('$P')
  have_result:

    name = bpost.'escape'(name)
    $I0 = defined ns
    unless $I0 goto have_ns_key
    $P0 = new 'CodeString'
    ns = $P0.'key'(ns)
  have_ns_key:

    if blocktype == 'immediate' goto block_immediate
    if rtype == 'v' goto block_done
    $P0 = get_hll_global ['POST'], 'Ops'
    bpost = $P0.'new'(bpost, 'node'=>node, 'result'=>result)
    if ns goto block_decl_ns
    bpost.'push_pirop'('get_global', result, name, 'result'=>result)
    goto block_done
  block_decl_ns:
    bpost.'push_pirop'('get_hll_global', result, ns, name, 'result'=>result)
    goto block_done

  block_immediate:
    $P0 = get_hll_global ['POST'], 'Ops'
    bpost = $P0.'new'(bpost, 'node'=>node, 'result'=>result)
    if ns goto block_immediate_ns
    $S0 = bpost.'unique'('$P')
    bpost.'push_pirop'('get_global', $S0, name)
    bpost.'push_pirop'('newclosure', $S0, $S0)
    bpost.'push_pirop'('call', $S0, 'result'=>result)
    goto block_done
  block_immediate_ns:
    $S0 = bpost.'unique'('$P')
    bpost.'push_pirop'('get_hll_global', $S0, ns, name, 'result'=>$S0)
    bpost.'push_pirop'('call', $S0, 'result'=>result)

  block_done:
    ##  remove current block from @?BLOCK
    $P99 = shift blockpast
    .return (bpost)
.end

=back

=head3 C<PAST::Op>

=over 4

=item post(PAST::Op node)

Return the POST representation of a C<PAST::Op> node.  Normally
this is handled by redispatching to a method corresponding to
the node's "pasttype" attribute.

=cut

.sub 'as_post' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named

    ##  see if we set first child's lvalue
    $I0 = node.'lvalue'()
    unless $I0 goto have_lvalue
    $P0 = node[0]
    if null $P0 goto have_lvalue
    $P0.'lvalue'($I0)
  have_lvalue:

    .local string pasttype
    pasttype = node.'pasttype'()
    unless pasttype goto post_pirop
    $P0 = find_method self, pasttype
    .return self.$P0(node, options :flat :named)

  post_pirop:
    .local pmc pirop
    pirop = node.'pirop'()
    unless pirop goto post_inline
    .return self.'pirop'(node, options :flat :named)

  post_inline:
    .local pmc inline
    inline = node.'inline'()
    unless inline goto post_call
    .return self.'inline'(node, options :flat :named)

  post_call:
    .return self.'call'(node, options :flat :named)
.end


=item pirop(PAST::Op node)

Return the POST representation of a C<PAST::Op> node with
a 'pasttype' of 'pirop'.

=cut

.sub 'pirop' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local string pirop, signature
    pirop = node.'pirop'()
    $P0 = get_global '%piropsig'
    signature = $P0[pirop]
    if signature goto have_signature
    signature = 'vP'
  have_signature:

    .local pmc ops
    ops = self.'post_children'(node, 'signature'=>signature)

    .local pmc arglist
    arglist = ops.'get_array'()

    $S0 = substr signature, 0, 1
    if $S0 == 'v' goto pirop_void
  pirop_reg:
    .local string result
    result = ops.'unique'('$P')
    ops.'result'(result)
    ops.'push_pirop'(pirop, result, arglist :flat)
    .return (ops)
  pirop_void:
    ops.'push_pirop'(pirop, arglist :flat)
    .return (ops)
.end


=item call(PAST::Op node)

=item callmethod(PAST::Op node)

Return the POST representation of a C<PAST::Op> node
with a 'pasttype' attribute of either 'call' or 'callmethod'.

=cut

.sub 'call' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local string pasttype
    pasttype = node.'pasttype'()
    if pasttype goto have_pasttype
    pasttype = 'call'
  have_pasttype:

    .local string signature
    signature = ':'
    unless pasttype == 'callmethod' goto have_signature
    signature = 'P:'
  have_signature:

    .local pmc ops, posargs, namedargs
    .local string name
    name = node.'name'()
    unless name goto call_first_arg
    signature = concat 'v', signature
    (ops, posargs, namedargs) = self.'post_children'(node, 'signature'=>signature)
    name = ops.'escape'(name)
    unshift posargs, name
    goto children_done
  call_first_arg:
    signature = concat 'vP', signature
    (ops, posargs, namedargs) = self.'post_children'(node, 'signature'=>signature)
  children_done:

    .local string result, rtype
    result = ''
    rtype = options['rtype']
    if rtype == 'v' goto result_done
    result = ops.'unique'('$P')
    ops.'result'(result)
  result_done:

    ops.'push_pirop'(pasttype, posargs :flat, namedargs :flat, 'result'=>result)
    .return (ops)
.end

.sub 'callmethod' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named
    .return self.'call'(node, options :flat :named)
.end


=item if(PAST::Op node)

=item unless(PAST::Op node)

Return the POST representation of C<PAST::Op> nodes with
a 'pasttype' of if/unless.

=cut

.sub 'if' :method :multi(_,['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local string rtype
    rtype = options['rtype']

    .local string pasttype
    pasttype = node.'pasttype'()

    .local pmc ops
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node)

    .local pmc exprpast, thenpast, elsepast
    .local pmc exprpost, thenpost, elsepost
    exprpast = node[0]
    thenpast = node[1]
    elsepast = node[2]

    .local pmc thenlabel, endlabel
    $P0 = get_hll_global ['POST'], 'Label'
    $S0 = concat pasttype, '_'
    $S0 = ops.'unique'($S0)
    thenlabel = $P0.'new'('result'=>$S0)
    $S0 = concat $S0, '_end'
    endlabel = $P0.'new'('result'=>$S0)

    exprpost = self.'as_post'(exprpast, 'rtype'=>'P')
    ops.'push'(exprpost)
    ops.'result'(exprpost)
    ops.'push_pirop'(pasttype, exprpost, thenlabel)
    $I0 = defined elsepast
    unless $I0 goto else_done
    elsepost = self.'as_post'(elsepast, 'rtype'=>'P')
    ops.'push'(elsepost)
    if rtype == 'v' goto else_done
    ops.'push_pirop'('set', ops, elsepost)
  else_done:
    ops.'push_pirop'('goto', endlabel)
    ops.'push'(thenlabel)
    $I0 = defined thenpast
    unless $I0 goto then_done
    thenpost = self.'as_post'(thenpast, 'rtype'=>'P')
    ops.'push'(thenpost)
    if rtype == 'v' goto then_done
    ops.'push_pirop'('set', ops, thenpost)
  then_done:
    ops.'push'(endlabel)
    .return (ops)
.end

.sub 'unless' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named
    .return self.'if'(node, options :flat :named)
.end


=item while(PAST::Op node)

=item until(PAST::Op node)

Return the POST representation of a C<while> or C<until> loop.

=cut

.sub 'while' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local string pasttype
    pasttype = node.'pasttype'()

    .local pmc ops
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node)

    .local pmc exprpast, exprpost
    .local pmc bodypast, bodypost
    exprpast = node[0]
    bodypast = node[1]

    .local pmc looplabel, endlabel
    $P0 = get_hll_global ['POST'], 'Label'
    $S0 = concat pasttype, '_'
    $S0 = ops.'unique'($S0)
    looplabel = $P0.'new'('result'=>$S0)
    $S0 = concat $S0, '_end'
    endlabel = $P0.'new'('result'=>$S0)

    ##  determine if we need an 'if' or an 'unless'
    ##  on the conditional (while => if, until => unless)
    .local string iftype
    iftype = 'if'
    if pasttype == 'until' goto have_iftype
    iftype = 'unless'
  have_iftype:

    ops.'push'(looplabel)
    exprpost = self.'as_post'(exprpast, 'rtype'=>'P')
    ops.'push'(exprpost)
    ops.'push_pirop'(iftype, exprpost, endlabel)
    bodypost = self.'as_post'(bodypast, 'rtype'=>'v')
    ops.'push'(bodypost)
    ops.'push_pirop'('goto', looplabel)
    ops.'push'(endlabel)
    ops.'result'(exprpost)
    .return (ops)
.end

.sub 'until' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named
    .return self.'while'(node, options :flat :named)
.end

=item repeat_while(PAST::Op node)

=item repeat_until(PAST::Op node)

Return the POST representation of a C<repeat_while> or C<repeat_until> loop.

=cut

.sub 'repeat_while' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local string pasttype
    pasttype = node.'pasttype'()

    .local pmc ops
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node)

    .local pmc exprpast, exprpost
    .local pmc bodypast, bodypost
    exprpast = node[0]
    bodypast = node[1]

    .local pmc looplabel
    $P0 = get_hll_global ['POST'], 'Label'
    $S0 = concat pasttype, '_'
    looplabel = $P0.'new'('name'=>$S0)

    ##  determine if we need an 'if' or an 'unless'
    ##  on the conditional (repeat_while => if, repeat_until => unless)
    .local string iftype
    iftype = 'if'
    if pasttype != 'repeat_until' goto have_iftype
    iftype = 'unless'
  have_iftype:

    ops.'push'(looplabel)
    bodypost = self.'as_post'(bodypast, 'rtype'=>'v')
    ops.'push'(bodypost)
    exprpost = self.'as_post'(exprpast, 'rtype'=>'P')
    ops.'push'(exprpost)
    ops.'push_pirop'(iftype, exprpost, looplabel)
    ops.'result'(exprpost)
    .return (ops)
.end

.sub 'repeat_until' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named
    .return self.'repeat_while'(node, options :flat :named)
.end


=item for(PAST::Op node)

Return the POST representation of the C<for> loop given
by C<node>.

=cut

.sub 'for' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local pmc ops
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node)

    .local pmc looplabel, endlabel
    $P0 = get_hll_global ['POST'], 'Label'
    $S0 = ops.'unique'('for_')
    looplabel = $P0.'new'('result'=>$S0)
    $S0 = concat $S0, '_end'
    endlabel = $P0.'new'('result'=>$S0)

    .local pmc collpast, collpost
    collpast = node[0]
    collpost = self.'as_post'(collpast, 'rtype'=>'P')
    ops.'push'(collpost)

    .local string iter
    iter = ops.'unique'('$P')
    ops.'result'(iter)
    $S0 = ops.'unique'('$I')
    ops.'push_pirop'('defined', $S0, collpost)
    ops.'push_pirop'('unless', $S0, endlabel)
    ops.'push_pirop'('new', iter, '"Iterator"', collpost)
    ops.'push'(looplabel)
    ops.'push_pirop'('unless', iter, endlabel)

    .local string nextval
    nextval = ops.'unique'('$P')
    ops.'push_pirop'('shift', nextval, iter)

    .local pmc subpast, subpost
    subpast = node[1]
    subpost = self.'as_post'(subpast, 'rtype'=>'P')
    ops.'push'(subpost)
    ops.'push_pirop'('newclosure', subpost, subpost)
    ops.'push_pirop'('call', subpost, nextval)
    ops.'push_pirop'('goto', looplabel)
    ops.'push'(endlabel)
    .return (ops)
.end


=item try(PAST::Op node)

Return the POST representation of a C<PAST::Op>
node with a 'pasttype' of bind.  The first child
is the code to be surrounded by an exception handler,
the second child (if any) is the code to process the
handler.

=cut

.sub 'try' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options       :slurpy :named

    .local pmc ops
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node)

    .local pmc catchlabel, endlabel
    $P0 = get_hll_global ['POST'], 'Label'
    $S0 = ops.'unique'('catch_')
    catchlabel = $P0.'new'('result'=>$S0)
    $S0 = concat $S0, '_end'
    endlabel = $P0.'new'('result'=>$S0)

    .local pmc trypast, trypost
    trypast = node[0]
    trypost = self.'as_post'(trypast, 'rtype'=>'P')
    ops.'push_pirop'('push_eh', catchlabel)
    ops.'push'(trypost)
    ops.'push_pirop'('pop_eh')
    ops.'push_pirop'('goto', endlabel)
    ops.'push'(catchlabel)
    .local pmc catchpast, catchpost
    catchpast = node[1]
    if null catchpast goto catch_done
    catchpost = self.'as_post'(catchpast, 'rtype'=>'v')
    ops.'push'(catchpost)
  catch_done:
    ops.'push'(endlabel)
    ops.'result'(trypost)
    .return (ops)
.end


=item chain(PAST::Op node)

A short-circuiting chain of operations.  In a sequence of nodes
with pasttype 'chain', the right operand of a node serves as
the left operand of its parent.  Each node is evaluated only
once, and the first false result short-circuits the chain.
In other words,  C<<  $x < $y < $z >>  is true only if
$x < $y and $y < $z, but $y only gets evaluated once.

=cut

.sub 'chain' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named
    .local pmc clist, cpast

    ##  first, we build up the list of nodes in the chain
    clist = new 'ResizablePMCArray'
    cpast = node
  chain_loop:
    $I0 = isa cpast, 'PAST::Op'
    if $I0 == 0 goto chain_end
    .local string pasttype
    pasttype = cpast.'pasttype'()
    if pasttype != 'chain' goto chain_end
    push clist, cpast
    cpast = cpast[0]
    goto chain_loop
  chain_end:

    .local pmc ops, endlabel
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node)
    $S0 = ops.'unique'('$P')
    ops.'result'($S0)
    $P0 = get_hll_global ['POST'], 'Label'
    endlabel = $P0.'new'('name'=>'chain_end_')

    .local pmc apast, apost
    cpast = pop clist
    apast = cpast[0]
    apost = self.'as_post'(apast, 'rtype'=>'P')
    ops.'push'(apost)

  clist_loop:
    .local pmc bpast, bpost
    bpast = cpast[1]
    bpost = self.'as_post'(bpast, 'rtype'=>'P')
    ops.'push'(bpost)
    .local string name
    name = cpast.'name'()
    name = ops.'escape'(name)
    ops.'push_pirop'('call', name, apost, bpost, 'result'=>ops)
    unless clist goto clist_end
    ops.'push_pirop'('unless', ops, endlabel)
    cpast = pop clist
    apost = bpost
    goto clist_loop
  clist_end:
    ops.'push'(endlabel)
    .return (ops)
.end


=item def_or(PAST::Op node)

The short-circuiting default operator (e.g., Perl 6's C<< infix:<//> >>).
Returns its first child if its defined, otherwise it evaluates and returns
the second child.  (N.B.: This particular pasttype is a candidate for
being refactored out using thunks of some sort.)

=cut

.sub 'def_or' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local pmc ops
    $P0 = get_hll_global ['POST'], 'Ops'
    $S0 = $P0.'unique'('$P')
    ops = $P0.'new'('node'=>node, 'result'=>$S0)

    .local pmc lpast, lpost
    lpast = node[0]
    lpost = self.'as_post'(lpast, 'rtype'=>'P')
    ops.'push'(lpost)
    ops.'push_pirop'('set', ops, lpost)

    .local pmc endlabel
    $P0 = get_hll_global ['POST'], 'Label'
    $S0 = ops.'unique'('default_')
    endlabel = $P0.'new'('result'=>$S0)

    $S0 = ops.'unique'('$I')
    ops.'push_pirop'('defined', $S0, ops)
    ops.'push_pirop'('if', $S0, endlabel)
    .local pmc rpast, rpost
    rpast = node[1]
    rpost = self.'as_post'(rpast, 'rtype'=>'P')
    ops.'push'(rpost)
    ops.'push_pirop'('set', ops, rpost)
    ops.'push'(endlabel)
    .return (ops)
.end


=item xor(PAST::Op node)

A short-circuiting exclusive-or operation.  Each child is evaluated,
if exactly one child evaluates to true then its value is returned,
otherwise return Undef.  Short-circuits with Undef as soon as
a second child is found that evaluates as true.

=cut

.sub 'xor' :method :multi(_,['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local pmc ops
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node)
    $S0 = ops.'unique'('$P')
    ops.'result'($S0)

    .local pmc labelproto, endlabel, falselabel
    labelproto = get_hll_global ['POST'], 'Label'
    falselabel = labelproto.'new'('name'=>'xor_false')
    endlabel = labelproto.'new'('name'=>'xor_end')

    .local pmc iter, apast, apost, i, t, u
    i = ops.'unique'('$I')
    t = ops.'unique'('$I')
    u = ops.'unique'('$I')
    iter = node.'iterator'()
    apast = shift iter
    apost = self.'as_post'(apast, 'rtype'=>'P')
    ops.'push'(apost)
    ops.'push_pirop'('set', ops, apost)
    ops.'push_pirop'('istrue', t, apost)
  middle_child:
    .local pmc bpast, bpost
    bpast = shift iter
    bpost = self.'as_post'(bpast, 'rtype'=>'P')
    ops.'push'(bpost)
    ops.'push_pirop'('istrue', u, bpost)
    ops.'push_pirop'('and', i, t, u)
    ops.'push_pirop'('if', i, falselabel)
    unless iter goto last_child
    .local pmc truelabel
    truelabel = labelproto.'new'('name'=>'xor_true')
    ops.'push_pirop'('if', t, truelabel)
    ops.'push_pirop'('set', ops, bpost)
    ops.'push_pirop'('set', t, u)
    ops.'push'(truelabel)
    goto middle_child
  last_child:
    ops.'push_pirop'('if', t, endlabel)
    ops.'push_pirop'('set', ops, bpost)
    ops.'push_pirop'('goto', endlabel)
    ops.'push'(falselabel)
    ops.'push_pirop'('new', ops, '"Undef"')
    ops.'push'(endlabel)
    .return (ops)
.end


=item bind(PAST::Op node)

Return the POST representation of a C<PAST::Op>
node with a 'pasttype' of bind.

=cut

.sub 'bind' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local pmc ops, lpast, rpast, lpost, rpost
    lpast = node[0]
    rpast = node[1]

    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node)
    rpost = self.'as_post'(rpast, 'rtype'=>'P')
    ops.'push'(rpost)

    .local string scope
    lpast.lvalue(1)
    scope = self.'scope'(lpast)
    $P0 = find_method self, scope
    lpost = self.$P0(lpast, rpost)
    ops.'push'(lpost)
    ops.'result'(lpost)
    .return (ops)
.end


=item assign(PAST::Op node)

Implement a 'copy' assignment (at least until we get the 'copy'
opcode -- see RT#47828).

=cut

.sub 'copy' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named
    .local pmc rpast, rpost, lpast, lpost
    rpast = node[1]
    lpast = node[0]
    rpost = self.'as_post'(rpast, 'rtype'=>'P')
    lpost = self.'as_post'(lpast, 'rtype'=>'P')
    .local pmc ops, alabel
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'(rpost, lpost, 'node'=>node, 'result'=>lpost)
    $P0 = get_hll_global ['POST'], 'Label'
    alabel = $P0.'new'('name'=>'copy_')
    ops.'push_pirop'('eq_addr', lpost, rpost, alabel)
    ops.'push_pirop'('morph', lpost, '"Undef"')
    ops.'push_pirop'('assign', lpost, rpost)
    ops.'push'(alabel)
    .return (ops)
.end


=item inline(PAST::Op node)

Return the POST representation of a C<PAST::Op>
node with a 'pasttype' of inline.

=cut

.sub 'inline' :method :multi(_, ['PAST::Op'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local pmc ops
    ops = self.'post_children'(node, 'signature'=>'vP')

    .local string inline
    inline = node.'inline'()

    .local string result
    result = ''
    $I0 = index inline, '%t'
    if $I0 >= 0 goto result_new
    $I0 = index inline, '%r'
    unless $I0 >= 0 goto have_result
    result = ops.'unique'('$P')
    ops.'result'(result)
    goto have_result
  result_new:
    result = ops.'unique'('$P')
    ops.'push_pirop'('new', result, "'Undef'")
    ops.'result'(result)
  have_result:

    .local pmc arglist
    arglist = ops.'get_array'()
    ops.'push_pirop'('inline', arglist :flat, 'inline'=>inline, 'result'=>result)
    .return (ops)
.end

=back

=head3 C<PAST::Var>

=over 4

=item scope(PAST::Var node)

Helper function to return the scope of a variable given by C<node>.
The scope is determined by the node's C<scope> attribute if set,
otherwise search outward through the symbol tables of any lexical
blocks to determine the scope.

=cut

.sub 'scope' :method :multi(_, ['PAST::Var'])
    .param pmc node
    .local pmc scope
    scope = node.'scope'()
    if scope goto end

    .local string name
    name = node.'name'()
    .local pmc iter, bpast
    $P0 = get_global '@?BLOCK'
    iter = new 'Iterator', $P0
  iter_loop:
    unless iter goto end
    .local pmc bpast, symbol
    bpast = shift iter
    symbol = bpast.'symbol'(name)
    unless symbol goto iter_loop
    scope = symbol['scope']
    unless scope goto iter_loop
  end:
    .return (scope)
.end


.sub 'vivify' :method
    .param pmc node
    .param pmc ops
    .param pmc fetchop
    .param pmc storeop

    .local pmc viviself, vivipost, vivilabel
    viviself = node.'viviself'()
    vivipost = self.'as_post'(viviself)
    ops.'result'(vivipost)
    ops.'push'(fetchop)
    unless viviself goto vivipost_done
    $P0 = get_hll_global ['POST'], 'Label'
    vivilabel = $P0.'new'('name'=>'vivify_')
    ops.'push_pirop'('unless_null', ops, vivilabel)
    ops.'push'(vivipost)
    $I0 = node.'lvalue'()
    unless $I0 goto vivipost_stored
    ops.'push'(storeop)
  vivipost_stored:
    ops.'push'(vivilabel)
  vivipost_done:
    .return (ops)
.end


.sub 'as_post' :method :multi(_, ['PAST::Var'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local string scope
    scope = self.'scope'(node)
    push_eh scope_error
    $P0 = find_method self, scope
    pop_eh
    .return self.$P0(node)
  scope_error:
    $S0 = node.'name'()
    .return self.'panic'("No scope found for PAST::Var '", $S0, "'")
.end


.sub 'parameter' :method :multi(_, ['PAST::Var'])
    .param pmc node

    ##  get the current sub
    .local pmc subpost
    subpost = get_global '$?SUB'

    ##  determine lexical, register, and parameter names
    .local string name, named, pname, has_pname
    name = node.'name'()
    named = node.'named'()
    pname = subpost.'unique'('param_')
    has_pname = concat 'has_', pname

    ##  returned post node
    .local pmc ops
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node, 'result'=>pname)

    ##  handle optional params
    .local pmc viviself, vivipost, vivilabel
    viviself = node.'viviself'()
    unless viviself goto param_required
    vivipost = self.'as_post'(viviself)
    $P0 = get_hll_global ['POST'], 'Label'
    vivilabel = $P0.'new'('name'=>'optparam_')
    subpost.'add_param'(pname, 'named'=>named, 'optional'=>1)
    ops.'push_pirop'('if', has_pname, vivilabel)
    ops.'push'(vivipost)
    ops.'push_pirop'('set', ops, vivipost)
    ops.'push'(vivilabel)
    goto param_done

  param_required:
    .local int slurpy
    slurpy = node.'slurpy'()
    subpost.'add_param'(pname, 'named'=>named, 'slurpy'=>slurpy)

  param_done:
    name = ops.'escape'(name)
    ops.'push_pirop'('.lex', name, ops)
    .return (ops)
.end


.sub 'package' :method :multi(_, ['PAST::Var'])
    .param pmc node
    .param pmc bindpost        :optional
    .param int has_bindpost    :opt_flag

    .local pmc ops, fetchop, storeop
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node)

    .local string name
    name = node.'name'()
    name = ops.'escape'(name)

    $P0 = get_hll_global ['POST'], 'Op'
    .local pmc ns
    ns = node.'namespace'()
    $I0 = defined ns
    if $I0 goto package_hll
    if has_bindpost goto package_bind
    fetchop = $P0.'new'(ops, name, 'pirop'=>'get_global')
    storeop = $P0.'new'(name, ops, 'pirop'=>'set_global')
    .return self.'vivify'(node, ops, fetchop, storeop)
  package_bind:
    .return $P0.'new'(name, bindpost, 'pirop'=>'set_global', 'result'=>bindpost)

  package_hll:
    if ns goto package_ns
    if has_bindpost goto package_hll_bind
    fetchop = $P0.'new'(ops, name, 'pirop'=>'get_hll_global')
    storeop = $P0.'new'(name, ops, 'pirop'=>'set_hll_global')
    .return self.'vivify'(node, ops, fetchop, storeop)
  package_hll_bind:
    .return $P0.'new'(name, bindpost, 'pirop'=>'set_hll_global', 'result'=>bindpost)

  package_ns:
    $P1 = new 'CodeString'
    ns = $P1.'key'(ns)
    if has_bindpost goto package_ns_bind
    fetchop = $P0.'new'(ops, ns, name, 'pirop'=>'get_hll_global')
    storeop = $P0.'new'(ns, name, ops, 'pirop'=>'set_hll_global')
    .return self.'vivify'(node, ops, fetchop, storeop)
  package_ns_bind:
    .return $P0.'new'(ns, name, bindpost, 'pirop'=>'set_hll_global', 'result'=>bindpost)
.end


.sub 'lexical' :method :multi(_, ['PAST::Var'])
    .param pmc node
    .param pmc bindpost        :optional
    .param int has_bindpost    :opt_flag

    .local string name
    $P0 = get_hll_global ['POST'], 'Ops'
    name = node.'name'()
    name = $P0.'escape'(name)

    .local int isdecl
    isdecl = node.'isdecl'()

    if has_bindpost goto lexical_bind

  lexical_post:
    if isdecl goto lexical_decl
    .local pmc ops, fetchop, storeop
    ops = $P0.'new'('node'=>node)
    $P0 = get_hll_global ['POST'], 'Op'
    fetchop = $P0.'new'(ops, name, 'pirop'=>'find_lex')
    storeop = $P0.'new'(name, ops, 'pirop'=>'store_lex')
    .return self.'vivify'(node, ops, fetchop, storeop)

  lexical_decl:
    ops = $P0.'new'('node'=>node)
    .local pmc viviself, vivipost
    viviself = node.'viviself'()
    vivipost = self.'as_post'(viviself, 'rtype'=>'P')
    ops.'push'(vivipost)
    ops.'push_pirop'('.lex', name, vivipost)
    ops.'result'(vivipost)
    .return (ops)

  lexical_bind:
    $P0 = get_hll_global ['POST'], 'Op'
    if isdecl goto lexical_bind_decl
    .return $P0.'new'(name, bindpost, 'pirop'=>'store_lex', 'result'=>bindpost)
  lexical_bind_decl:
    .return $P0.'new'(name, bindpost, 'pirop'=>'.lex', 'result'=>bindpost)
.end


.sub 'keyed' :method :multi(_, ['PAST::Var'])
    .param pmc node
    .param pmc bindpost        :optional
    .param int has_bindpost    :opt_flag

    .local pmc ops
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node)

    .local pmc keypast, keypost
    keypast = node[1]
    keypost = self.'as_post'(keypast, 'rtype'=>'*')
    ops.'push'(keypost)

    .local pmc basepast, basepost
    basepast = node[0]

    $P0 = node.'vivibase'()
    unless $P0 goto have_vivibase
    $P1 = basepast.'viviself'()
    unless $P1 goto vivibase_1
    if $P1 != 'Undef' goto have_vivibase
  vivibase_1:
    basepast.'viviself'($P0)
  have_vivibase:

    #  if the keyed node is an lvalue, its base is an lvalue also
    $I0 = node.'lvalue'()
    unless $I0 goto have_lvalue
    basepast.lvalue($I0)
  have_lvalue:

    basepost = self.'as_post'(basepast, 'rtype'=>'P')
    ops.'push'(basepost)
    .local string name
    $S0 = basepost.'result'()
    name = concat $S0, '['
    $S0 = keypost.'result'()
    concat name, $S0
    concat name, ']'
    .local pmc fetchop, storeop
    $P0 = get_hll_global ['POST'], 'Op'
    if has_bindpost goto keyed_bind
    fetchop = $P0.'new'(ops, name, 'pirop'=>'set')
    storeop = $P0.'new'(name, ops, 'pirop'=>'set')
    .return self.'vivify'(node, ops, fetchop, storeop)
  keyed_bind:
    ops.'result'(bindpost)
    ops.'push_pirop'('set', name, ops)
    .return (ops)
.end


.sub 'attribute' :method :multi(_, ['PAST::Var'])
    .param pmc node
    .param pmc bindpost        :optional
    .param int has_bindpost    :opt_flag

    .local string name
    $P0 = get_hll_global ['POST'], 'Ops'
    name = node.'name'()
    name = $P0.'escape'(name)

    .local int isdecl
    isdecl = node.'isdecl'()

    if has_bindpost goto attribute_bind

  attribute_post:
    if isdecl goto attribute_decl
    .local pmc ops, fetchop, storeop
    ops = $P0.'new'('node'=>node)
    $P0 = get_hll_global ['POST'], 'Op'
    fetchop = $P0.'new'(ops, 'self', name, 'pirop'=>'getattribute')
    storeop = $P0.'new'('self', name, ops, 'pirop'=>'setattribute')
    .return self.'vivify'(node, ops, fetchop, storeop)

  attribute_decl:
    ops = $P0.'new'('node'=>node)
    .return (ops)

  attribute_bind:
    $P0 = get_hll_global ['POST'], 'Op'
    if isdecl goto attribute_bind_decl
    .return $P0.'new'('self', name, bindpost, 'pirop'=>'setattribute', 'result'=>bindpost)
  attribute_bind_decl:
    .return $P0.'new'('self', name, bindpost, 'pirop'=>'setattribute', 'result'=>bindpost)
.end


=back

=head3 C<PAST::Val>

=over 4

=item post(PAST::Val node [, 'rtype'=>rtype])

Return the POST representation of the constant value given
by C<node>.  The C<rtype> parameter advises the method whether
the value may be returned directly as a PIR constant or needs
to have a PMC generated containing the constant value.

=cut

.sub 'as_post' :method :multi(_, ['PAST::Val'])
    .param pmc node
    .param pmc options         :slurpy :named

    .local pmc ops
    $P0 = get_hll_global ['POST'], 'Ops'
    ops = $P0.'new'('node'=>node)

    .local pmc value, returns
    value = node.'value'()
    returns = node.'returns'()
    if returns goto have_returns
    $S0 = typeof value
    returns = $S0
  have_returns:

    .local string valflags
    $P0 = get_global '%valflags'
    valflags = $P0[returns]

    $I0 = index valflags, 'e'
    if $I0 < 0 goto escape_done
    value = ops.'escape'(value)
  escape_done:

    .local string rtype
    rtype = options['rtype']
    $I0 = index valflags, rtype
    if $I0 < 0 goto result_pmc
    ops.'result'(value)
    .return (ops)

  result_pmc:
    .local string result
    result = ops.'unique'('$P')
    returns = ops.'escape'(returns)
    ops.'push_pirop'('new', result, returns)
    ops.'push_pirop'('assign', result, value)
    ops.'result'(result)
    .return (ops)
.end


=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=head1 HISTORY

2006-11-20  Patrick Michaud added first draft of POD documentation.
2006-11-27  Significant refactor into separate modules.

=head1 COPYRIGHT

Copyright (C) 2006-2008, The Perl Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
