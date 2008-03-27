# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

POST - Parrot opcode syntax tree

=head1 DESCRIPTION

This file implements the various opcode syntax tree nodes
for compiling programs in Parrot.

=cut

.namespace [ 'Lua::PAST' ]

.sub '__onload' :load :init
    load_bytecode 'TGE.pbc'
    $P0 = get_class 'TGE::Grammar'
    $P1 = subclass $P0, 'POST::Grammar'

    ##   create the PAST::Node base class
    ##   XXX: Eventually we want this to be a subclass of
    ##   Capture, but as of now Capture isn't working.
    ##   So, we'll simulate it for now.
    .local pmc base
    load_bytecode 'Parrot/Capture_PIR.pir'
    base = subclass 'Capture_PIR', 'Lua::PAST::Node'

    .return ()
.end

=head1 PAST Node types

=head2 PAST::Node

C<PAST::Node> is the base class for all PAST (and POST) nodes.  It's
derived from class C<Capture>, so that it has both array and hash
components.  The array component is used to maintain a node's children,
while the hash component contains the attributes of the node.  In general
we provide and use accessor methods for a node's attributes, instead
of accessing the hash component directly.

Every PAST node predefines C<name>, C<source>, and C<pos> attributes.
The C<name> attribute is the node's name, if any, while C<source>
and C<pos> are used to identify the location in the original source
code for the node.  The C<source> and C<pos> values are generally
set by the C<node> method below.

Other node attributes are generally defined by subclasses of C<PAST::Node>.

=over 4

=item init([child1, child2, ..., ] [attr1=>val1, attr2=>val2, ... ])

Initialize a PAST node with the given children and attributes.
Adds each child to the node (using the C<push> method, below) and
calls the appropriate accessor method for each attribute.
And returns the node.

=cut

.namespace [ 'Lua::PAST::Node' ]

.sub 'init' :method
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named

    .local pmc iter
    iter = new .Iterator, children
  children_loop:
    unless iter goto children_end
    $P0 = shift iter
    push self, $P0
    goto children_loop
  children_end:

    iter = new .Iterator, adverbs
  adverbs_loop:
    unless iter goto adverbs_end
    $S0 = shift iter
    $P0 = iter[$S0]
    $P1 = find_method self, $S0
    self.$P1($P0)
    goto adverbs_loop
  adverbs_end:
  end:
    .return (self)
.end


=item new(class, [child1, child2, ..., ] [attr1=>val1, attr2=>val2, ...])

Create a new PAST node of type C<class> initialized with the given
children and attributes.  Returns the newly created node.

=cut

.sub 'new' :method
    .param string class
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named

    $P0 = new class
    $P0.'init'(children :flat, 'node'=>self, adverbs :flat :named)
    .return ($P0)
.end


=item push(child)

Add C<child> to the end of the invocant's list of children.

=cut

.sub 'push' :method
    .param pmc value
    push self, value
.end


.sub 'pop' :method
    $P0 = self.'get_array'()
    $P1 = pop $P0
    .return ($P1)
.end


=item push_new(class, [child1, child2, ..., ] [attr1=>val1, attr2=>val2, ...])

Creates a new PAST node of type C<class>, initializes it with the
given children and attributes, and adds it to the end of the invocant's
array of children.  Returns the newly created PAST node.

=cut

.sub 'push_new' :method
    .param string class
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named
    $P0 = self.'new'(class, children :flat, adverbs :flat :named)
    push self, $P0
    .return ($P0)
.end


=item iterator( )

Returns a newly initialized iterator for the invocant's list of
children.

=cut

.sub 'iterator' :method
    .local pmc iter
    $P0 = self.'get_array'()
    iter = new .Iterator, $P0
    iter = 0
    .return (iter)
.end


=item node([val])

Sets the invocant's C<source> and C<pos> attributes to those
of C<val>.  If C<val> is another PAST node, then C<source> and C<pos>
are simply copied from that node, otherwise C<val> is assumed to be
a C<Match> object and obtains source/position information from that.

=cut

.sub 'node' :method
    .param pmc node
    $I0 = isa node, 'PAST::Node'
    if $I0 goto clone_past
    $I0 = isa node, 'Lua::PAST::Node'
    if $I0 goto clone_past
  clone_pge:
    $S0 = node
    $I0 = node.'from'()
    self['source'] = $S0
    self['pos'] = $I0
    .return ()
  clone_past:
    $P0 = node['source']
    $P1 = node['pos']
    self['source'] = $P0
    self['pos'] = $P1
    .return ()
.end


=item attr(STR attrname, PMC value, INT has_value)

Helper method for accessors.  If C<has_value> is true then set
the invocant's value of C<attrname> to C<value>.  Returns the
(resulting) value of C<attrname> in the invocant.

=cut

.sub 'attr' :method
    .param string attrname
    .param pmc value
    .param int has_value
    if has_value goto setattr
    value = self[attrname]
    unless null value goto getattr
    value = new 'Undef'
  getattr:
    .return (value)
  setattr:
    self[attrname] = value
    .return (value)
.end


=item name([value])

Accessor method -- sets/returns the C<name> attribute of the invocant.

=cut

.sub 'name' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('name', value, has_value)
.end


.namespace [ 'Lua::POST' ]

.sub '__onload' :load :init
    .local pmc base

    base = subclass 'Lua::PAST::Node', 'Lua::POST::Node'

    $P0 = subclass base, 'Lua::POST::Op'
    $P0 = subclass base, 'Lua::POST::Ops'
    $P0 = subclass base, 'Lua::POST::Label'
    $P0 = subclass base, 'Lua::POST::Sub'
    $P0 = subclass $P0, 'Lua::POST::Chunk'

    $P0 = new 'Integer'
    $P0 = 10
    set_hll_global ['Lua::POST::Node'], '$!serno', $P0

    .return ()
.end


=head1 POST Node types

=head2 POST::Node

C<POST::Node> is the base class for all POST nodes.  It's derived from class
C<PAST::Node> (see F<compilers/past-pm/PAST/Node.pir>).

=over 4

=item result([value])

Get/set

=cut

.namespace [ 'Lua::POST::Node' ]

.sub 'result' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag

    if has_value == 1 goto set_value
    value = self['result']
    unless null value goto end
    value = self.'unique'('$P')
    goto set_value_1
  set_value:
    $I0 = isa value, 'Lua::POST::Node'
    if $I0 == 0 goto set_value_1
    value = value.'result'()
  set_value_1:
    self['result'] = value
  end:
    .return (value)
.end


=item escape(STR name)

Returns C<name> in a format that can be compiled by PIR.

=cut

.sub 'escape' :method
    .param string str
    str = escape str
    str = concat '"', str
    str = concat str, '"'
    $I0 = index str, '\x'
    if $I0 >= 0 goto unicode
    $I0 = index str, '\u'
    if $I0 >= 0 goto unicode
    .return (str)
  unicode:
    str = concat 'unicode:', str
    .return (str)
.end


=item unique([STR fmt])

Generate a unique number that can be used as an identifier.
If C<fmt> is provided, then it will be used as a prefix to the
unique number.

=cut

.sub 'unique' :method
    .param pmc fmt             :slurpy
    $S1 = join '', fmt
    $P0 = get_global '$!serno'
    $S0 = $P0
    $S0 = concat $S1, $S0
    inc $P0
    .return ($S0)
.end


=item push_pirop(pirop [,arglist :slurpy] [,adverbs :slurpy :named])

=cut

.sub 'push_pirop' :method
    .param pmc pirop
    .param pmc arglist         :slurpy
    .param pmc adverbs         :slurpy :named
    if null adverbs goto no_adverbs
    adverbs['pirop'] = pirop
    $P0 = self.'push_new'('Lua::POST::Op', adverbs :flat :named)
    goto end
  no_adverbs:
    $P0 = self.'push_new'('Lua::POST::Op', 'pirop'=>pirop)
  end:
    $P0.'arglist'(arglist :flat)
    .return ($P0)
.end


=item cpir()

=cut

.sub 'cpir' :method
    .local pmc code, iter
    code = new 'CodeString'
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


=back

=head2 POST::Ops

C<POST::Ops> is a container of C<POST::Node>.

=over 4

=item pir()

=cut

.namespace [ 'Lua::POST::Ops' ]

.sub 'pir' :method
    .return self.'cpir'()
.end


=back

=head2 POST::Op

C<POST::Op> nodes represents any PIR opcodes.

=over 4

=item pirop([opcode])

Get/set

call, callmethod, tailcall, inline

=cut

.namespace [ 'Lua::POST::Op' ]

.sub 'pirop' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('pirop', value, has_value)
.end

=item arglist(arglist)

=cut

.sub 'arglist' :method
    .param pmc arglist         :slurpy
    .local int argc
    argc = elements arglist
    $I0 = 0
  argc_loop:
    if $I0 >= argc goto argc_end
    $P0 = arglist[$I0]
    $I1 = isa $P0, 'Lua::POST::Node'
    if $I1 == 0 goto argc_next
    $S0 = $P0.'result'()
    arglist[$I0] = $S0
  argc_next:
    inc $I0
    if $I0 < argc goto argc_loop
  argc_end:
    self['arglist'] = arglist
    .return (arglist)
.end


=item pir()

=cut

.sub 'pir' :method
    .local pmc code, arglist
    code = self.'cpir'()
    arglist = self['arglist']
    .local string pirop
    pirop = self.'pirop'()
    if pirop == 'call' goto pir_call
    if pirop == 'callmethod' goto pir_callmethod
    if pirop == 'tailcall' goto pir_tailcall
    if pirop == 'inline' goto pir_inline
    code.'emit'('    %n %,', arglist :flat, 'n'=>pirop)
    .return (code)

  pir_call:
    .local pmc result, name
    result = self.'result'()
    name = shift arglist
    if result == '' goto call_without_ret
    code.'emit'('    %r = %n(%,)', arglist :flat, 'r'=>result, 'n'=>name)
    .return (code)
  call_without_ret:
    code.'emit'('    %n(%,)', arglist :flat, 'n'=>name)
    .return (code)

  pir_callmethod:
    .local pmc result, name, invocant
    result = self.'result'()
    name = shift arglist
    invocant = shift arglist
    if result == '' goto callmethod_without_ret
    code.'emit'('    %r = %i.%n(%,)', arglist :flat, 'r'=>result, 'i'=>invocant, 'n'=>name)
    .return (code)
  callmethod_without_ret:
    code.'emit'('    %i.%n(%,)', arglist :flat, 'i'=>invocant, 'n'=>name)
    .return (code)

  pir_tailcall:
    .local pmc name
    name = shift arglist
    code.'emit'('    .return %n(%,)', arglist :flat, 'n'=>name)
    .return (code)

  pir_inline:
    .local pmc result, inline
    result = self.'result'()
    inline = shift arglist
    code.'emit'(inline, arglist :flat, 'r'=>result, 't'=>result, 'u'=>result)
    .return (code)
.end


=back

=head2 POST::Label

C<POST::Label> nodes represent PIR labels.

=over 4

=item result([value])

Get/set

=cut

.namespace [ 'Lua::POST::Label' ]

.sub 'result' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    if has_value goto set_value
    value = self['value']
    unless null value goto end
    .local string name
    name = self.'name'()
    value = self.'unique'(name)
  set_value:
    self['value'] = value
  end:
    .return(value)
.end


=item pir()

=cut

.sub 'pir' :method
    .local string code
    .local string value
    value = self.'result'()
    code = '  '
    code .= value
    code .= ":\n"
    .return (code)
.end


=back

=head2 POST::Sub

C<POST::Sub> nodes represent PIR subroutines.

=over 4

=item pir()

=cut

.namespace [ 'Lua::POST::Sub' ]

.sub 'pir' :method
    $S0 = self.'compiler'()
    unless $S0 goto post_pir
    .return self.'hll_pir'()
  post_pir:
    .local string name
    name = self.'name'()
    name = self.'escape'(name)
    .local pmc outerpost
    .local string outer
    outer = ''
    outerpost = self.'outer'()
    if null outerpost goto have_outer
    unless outerpost goto have_outer
    outer = outerpost.'name'()
    outer = outerpost.'escape'(outer)
    outer = concat ':outer(', outer
    outer = concat outer, ')'
  have_outer:
    .local string pragma
    pragma = self.'pragma'()
    .local pmc code
    code = new 'CodeString'
    .local string namespace
    namespace = self.'namespace'()
    unless namespace goto have_namespace
    code.'emit'("\n.namespace [ '%0' ]", namespace)
  have_namespace:
    code.'emit'("\n.sub %0 %1 %2", name, outer, pragma)
    $P0 = self.'paramcode'()
    code .= $P0
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
    if value == '' goto no_return
    code.'emit'("    .return (%0)\n", value)
  no_return:
    code.'emit'(".end\n")
    $P0 = get_hll_global ['Lua::POST'], '$!subpir'
    code .= $P0
    set_hll_global ['Lua::POST'], '$!subpir', code

    code = new 'CodeString'
    $S0 = self.'blocktype'()
    if $S0 == 'declaration' goto skip_declaration
    code.'emit'("    %0 = find_name %1", value, name)
    if $S0 == 'END'         goto add_end_block
  skip_declaration:
    .return (code)
  add_end_block:
    $S1 = code.'unique'('$P')
    code.'emit'("    %0 = find_global '_perl6', '%BLOCKS'", $S1)
    code.'emit'("    %0 = %0['END']", $S1)
    code.'emit'("    push %0, %1", $S1, value)
    .return (code)
.end


.sub 'hll_pir' :method
    .local string compname, name
    compname = self.'compiler'()
    name = self.'name'()
    .local pmc adverbs
    adverbs = new .Hash
    adverbs['target'] = 'pir'
    adverbs['name'] = name
    adverbs['grammar'] = ''
    .local pmc outerpost
    outerpost = self.'outer'()
    unless outerpost goto have_outer
    $S0 = outerpost.'name'()
    adverbs['outer'] = $S0
  have_outer:
    .local pmc sourcecode, compiler, pircode
    sourcecode = self[0]
    compiler = compreg compname
    $I0 = isa compiler, 'Sub'
    if $I0 goto compile_sub
    pircode = compiler.'compile'(sourcecode, adverbs :flat :named)
    goto have_pircode
  compile_sub:
    pircode = compiler(sourcecode, adverbs :flat :named)
  have_pircode:
    $P0 = get_hll_global ['Lua::POST'], '$!subpir'
    pircode .= $P0
    set_hll_global ['Lua::POST'], '$!subpir', pircode
    .local string result
    result = self.'result'()
    name = self.'escape'(name)
    .local pmc code
    code = new 'CodeString'
    code.'emit'("    %0 = find_name %1", result, name)
    .return (code)
.end


=item outer([outer])

Get/set

=cut

.sub 'outer' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('outer', value, has_value)
.end


=item pragma([pragma])

Get/set

=cut

.sub 'pragma' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('pragma', value, has_value)
.end


=item blocktype([type])

Get/set

=cut

.sub 'blocktype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('blocktype', value, has_value)
.end


=item namespace([name])

Get/set the namespace for this sub.  If called to retrieve the namespace,
use any outer namespace if it exists.

=cut

.sub 'namespace' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .local string namespace
    namespace = self.'attr'('namespace', value, has_value)
    if namespace goto end
    if has_value goto end
    .local pmc outer
    outer = self.'outer'()
    if null outer goto end
    unless outer goto end
    namespace = outer.'namespace'()
  end:
    .return (namespace)
.end

=item paramcode([paramcode])

Get/set

=cut

.sub 'paramcode' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('paramcode', value, has_value)
.end


=item compiler([name])

Get/set

=cut

.sub 'compiler' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('compiler', value, has_value)
.end


=item push_param(STR regtype, STR pname, STR flags, INT has_flags)

=cut

.sub 'push_param' :method
    .param string regtype
    .param string pname
    .param string flags        :optional
    .param int has_flags       :opt_flag

    .local pmc paramcode
    paramcode = self.'paramcode'()
    if paramcode goto add_param
    paramcode = new 'CodeString'
    self.'paramcode'(paramcode)
  add_param:
    if has_flags goto have_flags
    flags = ''
  have_flags:
    paramcode.'emit'('    .param %0 %1    %2', regtype, pname, flags)
    .return ()
.end


.sub 'ops_const' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('ops_const', value, has_value)
.end

.sub 'ops_subr' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('ops_subr', value, has_value)
.end

.sub 'storage_const' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('storage_const', value, has_value)
.end

.sub 'storage_lex' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('storage_lex', value, has_value)
.end


.namespace [ 'Lua::POST::Chunk' ]

.sub 'prologue' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('prologue', value, has_value)
.end

.sub 'pir' :method
    self.'cpir'()
    $S0 = self.'prologue'()
    if $S0 == '' goto L1
    .local pmc code
    new code, 'CodeString'
    code.'emit'($S0)
    $P0 = get_hll_global ['Lua::POST'], '$!subpir'
    code .= $P0
    set_hll_global ['Lua::POST'], '$!subpir', code
  L1:
.end


=head1 NAME

POST::Compiler - Compiler for POST trees

=head1 DESCRIPTION

POST::Compiler defines a compiler that converts a POST tree into
either PIR or executable bytecode.

=head1 METHODS

=cut

.namespace [ 'Lua::POST::Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'Parrot/HLLCompiler.pbc'

    $P99 = subclass 'HLLCompiler', 'Lua::POST::Compiler'
    $P0 = new 'Lua::POST::Compiler'
    $P0.'language'('POST')
    .return ()
.end


.sub 'compile' :method
    .param pmc post
    .param pmc adverbs         :slurpy :named

    $I0 = isa post, 'Lua::POST::Sub'
    if $I0 goto with_sub
    $S0 = typeof post
    say $S0
    post = post.'new'('Lua::POST::Sub', post, 'name'=>'anon')
  with_sub:
    .local pmc code
    code = new 'CodeString'
    set_hll_global ['Lua::POST'], '$!subpir', code
    post.'pir'()

    code = get_hll_global ['Lua::POST'], '$!subpir'
    .return (code)
.end


=back

=head1 HISTORY

Mostly taken from F<compilers/past-pm/PAST/Node.pir>,
F<compilers/past-pm/POST/Node.pir>, and
F<compilers/past-pm/POST/Compiler.pir>.

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
