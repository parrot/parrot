=head1 NAME

PAST - Parrot abstract syntax tree

=head1 DESCRIPTION

This file implements the various abstract syntax tree nodes
for compiling programs in Parrot.

=head1 METHODS

=over 4

=cut

.namespace [ 'PAST' ]

.sub '__onload' :load :init
    load_bytecode 'TGE.pbc'
    $P0 = getclass 'TGE::Grammar'
    $P1 = subclass $P0, 'POST::Grammar'
  
    ##   create the PAST::Node base class
    ##   XXX: Eventually we want this to be a subclass of
    ##   Capture, but as of now Capture isn't working.  
    ##   So, we'll simulate it for now.
    .local pmc base
    load_bytecode 'Parrot/Capture_PIR.pir'
    base = subclass 'Capture_PIR', 'PAST::Node'

    $P0 = subclass base, 'PAST::Op'
    $P0 = subclass base, 'PAST::Stmts'
    $P0 = subclass base, 'PAST::Val'
    $P0 = subclass base, 'PAST::Var'
    $P0 = subclass base, 'PAST::Block'

    $P0 = new .Integer
    $P0 = 10
    set_hll_global ['PAST::Node'], '$!serno', $P0

    .return ()
.end
    

.namespace [ 'PAST::Node' ]

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
    .return ()
.end


.sub 'new' :method
    .param string class
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named

    $I0 = find_type class
    $P0 = new $I0
    $P0.'init'(children :flat, 'node'=>self, adverbs :flat :named)
    .return ($P0)
.end


.sub 'push' :method
    .param pmc value
    push self, value
.end


.sub 'push_new' :method
    .param string class
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named
    $P0 = self.'new'(class, children :flat, adverbs :flat :named)
    push self, $P0
    .return ($P0)
.end


.sub 'iterator' :method
    .local pmc iter
    $P0 = self.'get_array'()
    iter = new .Iterator, $P0
    iter = 0
    .return (iter)
.end


.sub 'node' :method
    .param pmc node
    $I0 = isa node, 'PAST::Node'
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
  

.sub 'attr' :method
    .param string attrname
    .param pmc value
    .param int has_value
    if has_value goto setattr
    value = self[attrname]
    .return (value)
  setattr:
    self[attrname] = value
    .return (value)
.end


.sub 'unique' :method
    .param string fmt          :optional
    .param int has_fmt         :opt_flag

    if has_fmt goto unique_1
    fmt = ''
  unique_1:
    $P0 = get_global '$!serno'
    $S0 = $P0
    $S0 = concat fmt, $S0
    inc $P0
    .return ($S0)
.end

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

.sub 'name' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('name', value, has_value)
.end

.sub 'atype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('atype', value, has_value)
.end


.sub 'compile'
    .param pmc past
    .param pmc adverbs         :slurpy :named

    .local string target
    target = adverbs['target']
    target = downcase target
    if target == 'past' goto return_past
    if target == 'parse' goto return_past

    .local pmc postgrammar, postbuilder, post
    postgrammar = new 'POST::Grammar'
    postbuilder = postgrammar.'apply'(past)
    post = postbuilder.'get'('root')
    .return post.'compile'(adverbs :flat :named)

  return_past:
    .return (past)
.end


.namespace [ 'PAST::Val' ]

.sub 'vtype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('vtype', value, has_value)
.end

.sub 'ctype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('ctype', value, has_value)
.end

.namespace [ 'PAST::Op' ]

.sub 'pasttype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('pasttype', value, has_value)
.end

.sub 'pirop' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('pirop', value, has_value)
.end

.include 'POST.pir'

.namespace [ 'POST::Grammar' ]
.include 'past2post_gen.pir'


