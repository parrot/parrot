# Copyright (C) 2006, The Perl Foundation.
# $Id: base_lua.pir 14985 2006-10-20 14:59:05Z fperrad $

=head1 NAME

lib/base.pir - Lua abstract base class

=head1 DESCRIPTION

C<base_lua> provides an abstract base class for some Lua types.

=head2 Functions

=over 4

=cut

.HLL '', 'lua_group'

.sub 'init_base' :load :anon
    $P0 = newclass 'base_lua'
.end

.namespace [ 'base_lua' ]

=item C<__clone>

=cut

.sub '__clone' :method
    .return (self)
.end

=item C<__get_string>

=cut

.sub '__get_string' :method
    new $P0, .Array
    $P0 = 2
    $S0 = classname self
    $P0[0] = $S0
    $I0 = get_addr self
    $P0[1] = $I0
    $S0 = sprintf "%s: %08X", $P0
    .return ($S0)
.end

=item C<__get_bool>

Returns C<true>.

=cut

.sub '__get_bool' :method
    $I0 = 1
    .return ($I0)
.end


=item C<__get_pmc_keyed>

=item C<__set_pmc_keyed>

Throws an exception.

=cut

.sub '__get_pmc_keyed' :method
    .param pmc key
    $S0 = classname self
    ex_index($S0)
.end

.sub '__set_pmc_keyed' :method
    .param pmc key
    .param pmc value
    $S0 = classname self
    ex_index($S0)
.end

.sub 'ex_index' :anon
    .param string type
    .local pmc ex
    ex = new .Exception
    $S0 = "attempt to index a "
    $S0 .= type
    $S0 .= " value" 
    ex['_message'] = $S0
    throw ex
.end

=item C<__neg>

=item C<__i_neg>

Throws an exception.

=cut

.sub '__neg' :method
    .param pmc value
    .local pmc meth
    .local pmc ret
    meth = self.'find_metamethod'('__unm')
    if_null meth, L1
    ret = meth(self)
    unless_null ret, L2
    new ret, .LuaNil
L2:
    .return (ret)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__i_neg' :method
    .local pmc meth
    meth = self.'find_metamethod'('__unm')
    if_null meth, L1
    self = meth(self)
    unless_null self, L2
    new self, .LuaNil
L2:
    .return (self)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

=item C<__logical_not>

Always returns C<false>.

=cut

.sub '__logical_not' :method
    .param pmc dummy
    .local pmc ret
    $I0 = isfalse self
    new ret, .LuaBoolean
    set ret, $I0
    .return (ret)
.end

=item C<__defined>

Always returns C<true>.

=cut

.sub '__defined' :method
    $I0 = 1
    .return ($I0)
.end

=item C<__invoke>

=cut

.sub '__invoke' :method
    .param pmc next
#    .local pmc ret
#    .local pmc meth
#    meth = self.'find_metamethod'('__call')
#    if_null meth, L1
##    ret = meth(self, next :flat)
#    ret = meth(self)
#    unless_null ret, L2
#    new ret, .LuaNil
#L2:
#    .return (ret)
#L1:
    .local pmc ex
    ex = new .Exception
    $S0 = "attempt to call a "
    $S1 = classname self 
    $S0 .= $S1
    $S0 .= " value" 
    ex['_message'] = $S0
    throw ex
.end

=back

=head2 non-Vtable Methods

=over 4

=item C<__add>

=item C<__i_add>

=item C<__subtract>

=item C<__i_substract>

=item C<__multiply>

=item C<__i_multiply>

=item C<__divide>

=item C<__i_divide>

=item C<__modulus>

=item C<__i_modulus>

=item C<__pow>

=item C<__i_pow>

=item C<__concatenate>

=item C<__i_concatenate>

Throws an exception.

=cut

.sub '__add' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__add')
    if_null meth, L1
    dest = meth(self, value)
    unless_null dest, L2
    new dest, .LuaNil
L2:
    .return (dest)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__i_add' :method :multi(base_lua, pmc)
    .param pmc value
    .local pmc meth
    meth = self.'find_metamethod'('__add')
    if_null meth, L1
    self = meth(self, value)
    unless_null self, L2
    new self, .LuaNil
L2:
    .return (self)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__subtract' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__sub')
    if_null meth, L1
    dest = meth(self, value)
    unless_null dest, L2
    new dest, .LuaNil
L2:
    .return (dest)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__i_subtract' :method :multi(base_lua, pmc)
    .param pmc value
    .local pmc meth
    meth = self.'find_metamethod'('__sub')
    if_null meth, L1
    self = meth(self, value)
    unless_null self, L2
    new self, .LuaNil
L2:
    .return (self)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__multiply' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__mul')
    if_null meth, L1
    dest = meth(self, value)
    unless_null dest, L2
    new dest, .LuaNil
L2:
    .return (dest)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__i_multiply' :method :multi(base_lua, pmc)
    .param pmc value
    .local pmc meth
    meth = self.'find_metamethod'('__mul')
    if_null meth, L1
    self = meth(self, value)
    unless_null self, L2
    new self, .LuaNil
L2:
    .return (self)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__divide' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__div')
    if_null meth, L1
    dest = meth(self, value)
    unless_null dest, L2
    new dest, .LuaNil
L2:
    .return (dest)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__i_divide' :method :multi(base_lua, pmc)
    .param pmc value
    .local pmc meth
    meth = self.'find_metamethod'('__div')
    if_null meth, L1
    self = meth(self, value)
    unless_null self, L2
    new self, .LuaNil
L2:
    .return (self)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__modulus' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__mod')
    if_null meth, L1
    dest = meth(self, value)
    unless_null dest, L2
    new dest, .LuaNil
L2:
    .return (dest)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__i_modulus' :method :multi(base_lua, pmc)
    .param pmc value
    .local pmc meth
    meth = self.'find_metamethod'('__mod')
    if_null meth, L1
    self = meth(self, value)
    unless_null self, L2
    new self, .LuaNil
L2:
    .return (self)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__pow' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__pow')
    if_null meth, L1
    dest = meth(self, value)
    unless_null dest, L2
    new dest, .LuaNil
L2:
    .return (dest)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__i_pow' :method :multi(base_lua, pmc)
    .param pmc value
    .local pmc meth
    meth = self.'find_metamethod'('__pow')
    if_null meth, L1
    self = meth(self, value)
    unless_null self, L2
    new self, .LuaNil
L2:
    .return (self)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub 'ex_arithmetic' :anon
    .param string type
    .local pmc ex
    ex = new .Exception
    $S0 = "attempt to perform arithmetic on a " 
    $S0 .= type
    $S0 .= " value" 
    ex['_message'] = $S0
    throw ex
.end

.sub '__concatenate' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__concat')
    if_null meth, L1
    dest = meth(self, value)
    unless_null dest, L2
    new dest, .LuaNil
L2:
    .return (dest)
L1: 
    $S0 = classname self
    ex_concat($S0)
.end

.sub '__i_concatenate' :method :multi(base_lua, pmc)
    .param pmc value
    .local pmc meth
    meth = self.'find_metamethod'('__concat')
    if_null meth, L1
    self = meth(self, value)
    unless_null self, L2
    new self, .LuaNil
L2:
    .return (self)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub 'ex_concat' :anon
    .param string type
    .local pmc ex
    ex = new .Exception
    $S0 = "attempt to concatenate a " 
    $S0 .= type
    $S0 .= " value" 
    ex['_message'] = $S0
    throw ex
.end

=item C<__is_equal>

=cut

.sub '__is_equal' :method :multi(base_lua, pmc)
    .param pmc value
    $I0 = 0
    .return ($I0)
.end

=item C<__cmp>

=cut

.sub '__cmp' :method :multi(base_lua, pmc)
    .param pmc value
    .local pmc meth_lt
    .local pmc meth_le
    .local int ret
    ret = 0
    meth_lt = self.'find_metamethod'('__lt')
    if_null meth_lt, L1
    $P0 = meth_lt(self, value)
    if_null $P0, L2
    $I0 = istrue $P0
    unless $I0 goto L2
    ret = -1
    .return (ret)
L2:
    meth_le = self.'find_metamethod'('__le')
    if_null meth_le, L3
    $P0 = meth_le(self, value)
    if_null $P0, L4
    $I0 = istrue $P0
    unless $I0 goto L4
    .return (ret)
L4:
    ret = 1
    .return (ret)
L3:
    $P0 = meth_lt(value, self)
    if_null $P0, L5
    $I0 = istrue $P0
    unless $I0 goto L5
    ret = 1
    .return (ret)
L5:
    .return (ret)
L1:
    .local pmc ex
    $S1 = classname self
    $S2 = classname value
    if $S1 == $S2 goto L6
    $S0 = "attempt to compare "
    $S0 .= $S1
    $S0 .= " with "
    $S0 .= $S2
    goto L7
L6:
    $S0 = "attempt to compare two "
    $S0 .= $S1
    $S0 .= " values"
L7:
    ex = new .Exception
    ex['_message'] = $S0
    throw ex
.end

=back

=head2 Specific Methods

=over 4

=item C<len>

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
    .local pmc ex
    ex = new .Exception
    $S0 .= "attempt to get length of a "
    $S1 = classname self
    $S0 .= $S1
    $S0 .= " value"
    ex['_message'] = $S0
    throw ex
.end

=item C<PMC* rawequal (PMC* value)>

=cut

.sub 'rawequal' :method
    .param pmc value
    .local pmc ret
    new ret, .LuaBoolean
    $I1 = get_addr self
    $I2 = get_addr value
    if $I1 != $I2 goto L1
    set ret, 1
L1:
    .return (ret)
.end

=item C<tonumber>

=cut

.sub 'tonumber' :method
    .local pmc ret
    new ret, .LuaNil
    .return (ret)
.end

=item C<tostring>

=cut

.sub 'tostring' :method
    .local pmc meth
    .local pmc ret
    meth = self.'find_metamethod'('__tostring')
    if_null meth, L1
    ret = meth(self)
    unless_null ret, L2
    new ret, .LuaNil
L2:
    .return (ret)
L1: 
    new ret, .LuaString
    $S0 = self.'__get_string'()
    ret = $S0
    .return (ret)
.end

=item C<set_metatable>

=cut

.sub 'set_metatable' :method
    .param pmc meta
    $I0 = isa meta, 'LuaNil'
    if $I0 goto L1
    setprop self, '__metatable', meta
    goto L2 
L1:
    delprop self, '__metatable'
L2:
.end    

=item C<get_metatable>

=cut

.sub 'get_metatable' :method
    .local pmc metatable
    .local pmc ret
    ret = getprop '__metatable', self
    if_null ret, L1
    $I0 = isa ret, 'table'
    unless $I0 goto L1
    goto L2
L1:
    new ret, .LuaNil
L2:
    .return (ret)
.end    

=item C<find_metamethod>

Looks up the method for C<*method_name>.

=cut

.sub 'find_metamethod' :method
    .param string name
    .local pmc metatable
    .local pmc key
    .local pmc ret
    null ret
    metatable = self.'get_metatable'()
    $I0 = isa metatable, 'table'
    unless $I0 goto L1
    new key, .LuaString
    set key, name
    $P0 = metatable[key]
    $I0 = isa $P0, 'LuaNil'
    if $I0 goto L1
    ret = $P0
L1:
    .return (ret)
.end    

=back

=head1 AUTHORS

Francois Perrad.

=cut

