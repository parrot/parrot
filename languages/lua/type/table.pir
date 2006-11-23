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
.end

.namespace [ 'table' ]

.sub 'init' :method :vtable
    new $P0, .Hash
    setattribute self, 'hash', $P0
.end

.sub '_make_key' :anon
    .param pmc key
    $S0 = classname key
    $S1 = key
    $S0 .= $S1
    .return ($S0)
.end

.sub '_set' :method
    .param pmc key
    .param pmc value
    $P0 = getattribute self, 'hash'
    $S0 = _make_key(key)
    $I0 = isa value, 'LuaNil'
    unless $I0 goto L1
    delete $P0[$S0]
    goto L2
L1:
    $P1 = clone value
    $P0[$S0] = $P1
L2:
.end

.sub '_get' :method
    .param pmc key
    .local pmc ret
    null ret
    $P0 = getattribute self, 'hash'
    $S0 = _make_key(key)
    ret = $P0[$S0]
    .return (ret)
.end

.sub 'get_pmc_keyed' :method :vtable
    .param pmc key
    .local pmc ret
    .local pmc value
    value = self.'_get'(key)
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
L2:
    unless_null value, L1
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
    unless $I0 goto L1
    .local pmc ex
    ex = new .Exception
    ex['_message'] = "table index is nil"
    throw ex
L1:
    $P0 = self.'_get'(key)
    unless_null $P0, L2
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
    self.'_set'(key, value)
L4:
.end

.sub 'elements' :method :vtable
    $P0 = getattribute self, 'hash'
    $I0 = elements $P0
    .return ($I0)
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
    .local pmc value
    .local int idx
    new ret, .LuaNumber
    new key, .LuaNumber
    idx = 1
    key = idx
    value = self.'_get'(key)
L3:
    if_null value, L4
    inc idx
    key = idx
    value = self.'_get'(key)
    goto L3
L4:
    dec idx
    ret = idx
    .return (ret)
.end

=item C<rawget (key)>

=cut

.sub 'rawget' :method
    .param pmc key
    .local pmc value
    .local pmc ret
    value = self.'_get'(key)
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
    unless $I0 goto L1
    .local pmc ex
    ex = new .Exception
    ex['_message'] = "table index is nil"
    throw ex
L1:
    self.'_set'(key, value)
.end

=back

=head1 AUTHORS

Francois Perrad.

=cut

