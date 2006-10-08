## $Id: /parrot/offline/languages/cardinal/src/PAST.pir 136 2006-10-02T14:16:26.459770Z tewk  $

=head1 NAME

C99::CPP::PAST - Abstract syntax tree nodes for C99

=head1 DESCRIPTION

This file implements the various abstract syntax tree nodes
needed for C99.  The currently defined ast nodes:

    C99::CPP::PAST::Node       - base class for all ast nodes

=head1 METHODS

=over 4

=cut

.include 'languages/c99/src/preamble'

.HLL 'C99', 'c99_group'
.namespace [ 'C99::CPP::PAST' ]

.sub '__onload' :load
    .local pmc base
    base = newclass 'C99::CPP::PAST::Node'
    addattribute base, 'children'
    addattribute base, 'source'
    addattribute base, 'pos'
    addattribute base, 'name'
    addattribute base, 'line'

    $P0 = subclass base, 'C99::CPP::PAST::IF_SECTION'
    $P0 = subclass base, 'C99::CPP::PAST::IFNDEF'
    $P0 = subclass base, 'C99::CPP::PAST::IFDEF'
    $P0 = subclass base, 'C99::CPP::PAST::IF'
    $P0 = subclass base, 'C99::CPP::PAST::ELIF'
    $P0 = subclass base, 'C99::CPP::PAST::ELSE'
    $P0 = subclass base, 'C99::CPP::PAST::DEFINE'
    $P0 = subclass base, 'C99::CPP::PAST::DEFINE_FUNCTION'
    $P0 = subclass base, 'C99::CPP::PAST::INCLUDE'
    $P0 = subclass base, 'C99::CPP::PAST::ERROR'
    $P0 = subclass base, 'C99::CPP::PAST::LINE'
    $P0 = subclass base, 'C99::CPP::PAST::PRAGMA'
    $P0 = subclass base, 'C99::CPP::PAST::SOURCE_LINE'
    $P0 = subclass base, 'C99::CPP::PAST::WSNWS'


    $P0 = new .Integer
    $P0 = 10
    set_hll_global ['C99::CPP::PAST'], 'serial_number', $P0
    .return ()
.end


.namespace [ 'C99::CPP::PAST::Node' ]

.sub 'attr' :method
    .param string attrname
    .param pmc value
    .param int setvalue
    if setvalue goto set
    value = getattribute self, attrname
    unless null value goto end
    value = new .Undef
  set:
    setattribute self, attrname, value
  end:
    .return (value)
.end


.sub 'init' :method
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named

    unless null children goto set_children
    children = new .ResizablePMCArray
  set_children:
    setattribute self, 'children', children

    if null adverbs goto end
    .local pmc iter
    iter = new .Iterator, adverbs
  iter_loop:
    unless iter goto iter_end
    $S0 = shift iter
    if $S0 == 'XXX' goto iter_loop
    $P0 = iter[$S0]
    $P1 = find_method self, $S0
    self.$P1($P0)
    goto iter_loop
  iter_end:
  end:
    .return ()
.end


.sub 'new' :method
    .param string class
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named

    $I0 = find_type class
    $P0 = new $I0
    $P0.'init'(children :flat, 'node'=>self, 'XXX'=>1, adverbs :flat :named)
    .return ($P0)
.end


.sub 'add_child' :method
    .param pmc child
    .local pmc array
    array = getattribute self, 'children'
    push array, child
    .return ()
  .end

.sub 'append_children' :method
    .param pmc children
    .local pmc array
    array = getattribute self, 'children'
    array.'append'(children)
    .return ()
.end


.sub 'add_child_new' :method
    .param string class
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named
    $P0 = self.'new'(class, children :flat, 'XXX'=>0, adverbs :flat :named)
    self.'add_child'($P0)
    .return ($P0)
.end

.gen_accessor('source')
.gen_accessor('pos')
.gen_accessor('name')
.gen_accessor('line')
.gen_get_accessor('children')

.sub 'children' :method
#    .param pmc value :optional
#    .param int has_value        :opt_flag
    null $P0
    .return self.'attr'('children', $P0, 0)
.end

.sub 'node' :method
    .param pmc node
    $I0 = isa node, 'C99::CPP::PAST::Node'
    if $I0 goto clone_past
  clone_pge:
    $S0 = node
    self.'source'($S0)
    $I0 = node.'from'()
    self.'pos'($I0)
    .return ()
  clone_past:
    $S0 = node.'source'()
    self.'source'($S0)
    $I0 = node.'pos'()
    self.'pos'($I0)
    .return ()
.end


.sub 'child_iter' :method
    $P0 = getattribute self, 'children'
    $P1 = new .Iterator, $P0
    $P1 = 0
    .return ($P1)
.end


=item C<C99::CPP::PAST::Node::unique([string fmt])>

Each call to C<unique> returns a unique number, or if a C<fmt>
parameter is given it returns a unique string beginning with
C<fmt>.  (This may eventually be generalized to allow
uniqueness anywhere in the string.)  The function starts
counting at 10 (so that the values 0..9 can be considered "safe").

=cut

.sub 'unique' :method
    .param string fmt          :optional
    .param int has_fmt         :opt_flag

    if has_fmt goto unique_1
    fmt = ''
  unique_1:
    $P0 = get_hll_global ['C99::CPP::PAST'], 'serial_number'
    $S0 = $P0
    $S0 = concat fmt, $S0
    inc $P0
    .return ($S0)
.end


.sub '__elements' :method
    $P0 = getattribute self, 'children'
    $I0 = elements $P0
    .return ($I0)
.end


.sub '__get_pmc_keyed_int' :method
    .param int key
    $P0 = getattribute self, 'children'
    $P0 = $P0[key]
    .return ($P0)
.end


.sub '__set_pmc_keyed_int' :method
    .param int key
    .param pmc val
    $P0 = getattribute self, 'children'
    $P0[key] = val
    .return ()
.end

.sub '__get_string' :method
    $P0 = getattribute self, 'name'
    $S0 = $P0
    .return ($S0)
.end


.sub '__dumplist' :method
    .return ('pos name children')
.end


.sub '__dump' :method
    .param pmc dumper
    .param string label
    .local string indent, subindent

    (subindent, indent) = dumper.'newIndent'()
    print '=> { '
.local pmc attrlist, iter
    $S0 = self.'__dumplist'()
    attrlist = split ' ', $S0
    iter = new .Iterator, attrlist
  iter_loop:
    unless iter goto iter_end
    .local string attrname
    .local pmc val
    attrname = shift iter
    val = getattribute self, attrname
    print "\n"
    print subindent
    print attrname
    print ' => '
    dumper.'dump'(label, val)
    goto iter_loop
  iter_end:
    print "\n"
    print indent
    print '}'
    dumper.'deleteIndent'()
    .return ()
.end


.namespace [ 'C99::CPP::PAST::Node' ]
.gen_dumplist('children')
.namespace [ 'C99::CPP::PAST::IF_SECTION' ]
.gen_dumplist('children')
.namespace [ 'C99::CPP::PAST::IFNDEF' ]
.gen_dumplist('line children')
.namespace [ 'C99::CPP::PAST::IFDEF' ]
.gen_dumplist('line children')
.namespace [ 'C99::CPP::PAST::IF' ]
.gen_dumplist('line children')
.namespace [ 'C99::CPP::PAST::ELIF' ]
.gen_dumplist('line children')
.namespace [ 'C99::CPP::PAST::ELSE' ]
.gen_dumplist('children')
.namespace [ 'C99::CPP::PAST::DEFINE' ]
.gen_dumplist('name line')
.namespace [ 'C99::CPP::PAST::DEFINE_FUNCTION' ]
.gen_dumplist('name line')
.namespace [ 'C99::CPP::PAST::INCLUDE' ]
.gen_dumplist('line')
.namespace [ 'C99::CPP::PAST::ERROR' ]
.gen_dumplist('line')
.namespace [ 'C99::CPP::PAST::LINE' ]
.gen_dumplist('line')
.namespace [ 'C99::CPP::PAST::PRAGMA' ]
.gen_dumplist('line')
.namespace [ 'C99::CPP::PAST::SOURCE_LINE' ]
.gen_dumplist('line')
.namespace [ 'C99::CPP::PAST::WSNWS' ]
.gen_dumplist('line')
