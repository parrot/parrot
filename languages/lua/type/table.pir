# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

type/table.pir - Lua Table

=head1 DESCRIPTION

C<table> extends C<base_lua> to provide a class with the behaviour of
the Lua C<table> type.

TRIVIAL IMPLEMENTATION : C<table> is just a Parrot C<Hash>, like in Lua 4.0.
Now, Lua 5 uses a hybrid data structure with a Hash part and an Array part.

=head2 Functions

=over 4

=cut

.HLL '', 'lua_group'

.sub 'init_table' :load :anon
    load_bytecode 'languages/lua/type/base_lua.pir'
    $P0 = subclass 'base_lua', 'table'
    addattribute $P0, 'hash'
    addattribute $P0, 'iter'
.end

.namespace [ 'table' ]

.sub 'init' :method :vtable
    new $P0, .Hash
    setattribute self, 'hash', $P0
    $P1 = iter $P0
    setattribute self, 'iter', $P1
.end

.sub '_make_key' :anon
    .param pmc key
    $S0 = classname key
    $S1 = key
    $S0 .= $S1
    new $P0, .Key
    set $P0, $S0 
    .return ($P0)
.end

.sub '_set' :anon
    .param pmc t
    .param pmc key
    .param pmc value
    $P0 = getattribute t, 'hash'
    $P1 = _make_key(key)
    $I0 = isa value, 'LuaNil'
    unless $I0 goto L1
    delete $P0[$P1]
    goto L2
L1:
    $P2 = clone key
    $P3 = clone value
    new $P4, .Pair
    $P4[$P2] = $P3
    $P0[$P1] = $P4
L2:
.end

.sub '_get' :anon
    .param pmc t
    .param pmc key
    .local pmc ret
    null ret
    $P0 = getattribute t, 'hash'
    $P1 = _make_key(key)
    $P2 = $P0[$P1]
    if_null $P2, L1
    ret = $P2.'value'() 
L1:
    .return (ret)
.end

.sub '_has' :anon
    .param pmc t
    .param pmc key
    $P0 = getattribute t, 'hash'
    $P1 = _make_key(key)
    $I0 = exists $P0[$P1]
    .return ($I0)
.end

.sub 'get_pmc_keyed' :method :vtable
    .param pmc key
    .local pmc ret
    .local pmc value
    value = _get(self, key)
    unless_null value, L1
    .local pmc meth
    meth = self.'find_metamethod'('__index')
    if_null meth, L2
    $I0 = isa meth, 'table'
    unless $I0 goto L3
    ret = meth[key]
    goto L4
L3:
    value = meth(self, key)
    unless_null value, L1
L2:
    new ret, .LuaNil
    goto L4
L1:
    ret = clone value
L4:
    .return (ret)
.end

.sub 'set_pmc_keyed' :method :vtable
    .param pmc key
    .param pmc value
    $I0 = isa key, 'LuaNil'
    if $I0 goto L1
    $I0 = _has(self, key)
    if $I0 goto L2
    .local pmc meth
    meth = self.'find_metamethod'('__newindex')
    if_null meth, L2
    $I0 = isa meth, 'table'
    unless $I0 goto L3
    meth[key] = value
    goto L4
L3:
    meth(self, key, value)
    goto L4
L2:
    _set(self, key, value)
L4:
    .return ()
L1:
    ex_index()
.end

.sub 'ex_index' :anon
    .local pmc ex
    ex = new .Exception
    ex['_message'] = "table index is nil"
    throw ex
.end

=back

=head2 non-Vtable Methods

=over 4

=item C<is_equal (value)>

The C<==> operation. Compares reference (not in depth).

=cut

.sub '__is_equal' :method :multi(table, table)
    .param pmc value
    .local pmc meth
    meth = self.'find_metamethod'('__eq')
    if_null meth, L1
    $P0 = meth(self, value)
    $I0 = 0
    if_null $P0, L2
    $I0 = istrue $P0
    goto L2
L1:
    $I1 = get_addr self
    $I2 = get_addr value
    $I0 = 0
    if $I1 != $I2 goto L2
    $I0 = 1
L2:
    .return ($I0)
.end

=back

=head2 Specific Methods

=over 4

=item C<len ()>

=cut

.sub 'len' :method
    .local pmc meth
    .local pmc ret
    meth = self.'find_metamethod'('__len')
    if_null meth, L1
    ret = meth(self)
    unless_null ret, L2
    new ret, .LuaNil
L2:
    .return (ret)
L1:
    .local pmc key
    .local int idx
    new ret, .LuaNumber
    new key, .LuaNumber
    idx = 1
    key = idx
    $I0 = _has(self, key)
L3:
    unless $I0 goto L4
    inc idx
    key = idx
    $I0 = _has(self, key)
    goto L3
L4:
    dec idx
    ret = idx
    .return (ret)
.end

=item C<next (index)>

=cut

.include 'iterator.pasm'

.sub 'next' :method
    .param pmc index
    $P1 = getattribute self, 'iter'
    if index goto L1
    set $P1, .ITERATE_FROM_START
    goto L2
L1:
    $I0 = _has(self, index)
    unless $I0 goto L3 
    set $P1, .ITERATE_FROM_START
L4:
    $P2 = shift $P1    
    $P3 = $P1[$P2]
    $P4 = $P3.'key'()
    unless $P4 == index goto L4
L2:
    push_eh _handler
    $P2 = shift $P1
    $P3 = $P1[$P2]
    .local pmc key
    .local pmc value
    $P4 = $P3.'key'()
    key = clone $P4 
    $P4 = $P3.'value'()
    value = clone $P4 
    .return (key, value)
_handler:
    .local pmc ret
    new ret, .LuaNil
    .return (ret)
L3:
    .local pmc ex
    ex = new .Exception
    ex['_message'] = "invalid key to 'next'"
    throw ex
.end

=item C<rawget (key)>

=cut

.sub 'rawget' :method
    .param pmc key
    .local pmc value
    .local pmc ret
    value = _get(self, key)
    if_null value, L1
    ret = clone value
    .return (ret)
L1:
    new ret, .LuaNil
    .return (ret)
.end

=item C<rawset (key, value)>

=cut

.sub 'rawset' :method
    .param pmc key
    .param pmc value
    $I0 = isa key, 'LuaNil'
    if $I0 goto L1
    _set(self, key, value)
    .return ()
L1:
    ex_index()
.end

=back

=head1 AUTHORS

Francois Perrad.

=cut

