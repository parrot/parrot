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

.sub '__clone' :method
    .return (self)
.end

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

=item C<INTVAL get_bool()>

Returns C<true>.

=cut

.sub '__get_bool' :method
    $I0 = 1
    .return ($I0)
.end


=item C<PMC* get_pmc_keyed (PMC* key)>

Throws an exception.

=cut

.sub '__get_pmc_keyed' :method
    .param pmc key
    $S0 = classname self
    ex_index($S0)
.end

=item C<void set_pmc_keyed (PMC* key, PMC* value)>

Throws an exception.

=cut

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

=item C<PMC* neg (PMC *dest)>

Throws an exception.

=cut

.sub '__neg' :method
    .param pmc value
    .local pmc meth
    .local pmc ret
    meth = self.'find_metamethod'('__unm')
    $I0 = defined meth
    unless $I0 goto L1
    ret = meth(self)
    .return (ret)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

=item C<PMC* logical_not(PMC *dest)>

=cut

.sub '__logical_not' :method
    .param pmc dummy
    .local pmc ret
    new ret, .LuaBoolean
    .return (ret)
.end

=item C<INTVAL defined()>

Always returns true.

=cut

.sub '__defined' :method
    $I0 = 1
    .return ($I0)
.end

=item C<void* invoke(void* next)>

=cut

.sub '__invoke' :method
    .param pmc next
    .local pmc ret
    .local pmc meth
    meth = self.'find_metamethod'('__call')
    $I0 = defined meth
    unless $I0 goto L1
#    ret = meth(self, next :flat)
    ret = meth(self)
    unless_null ret, L2
    new ret, .LuaNil
L2:
    .return (ret)
L1:
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

=item C<void add(PMC *value, PMC *dest)>

=item C<void i_add (PMC *value)>

=item C<void subtract(PMC *value, PMC *dest)>

=item C<void i_substract (PMC *value)>

=item C<void multiply(PMC *value, PMC *dest)>

=item C<void i_multiply (PMC *value)>

=item C<void divide(PMC *value, PMC *dest)>

=item C<void i_divide (PMC *value)>

=item C<PMC* modulus (PMC* value, PMC* dest)>

=item C<void i_modulus (PMC *value)>

=item C<PMC* pow (PMC* value, PMC* dest)>

=item C<void i_pow (PMC *value)>

=item C<PMC* concatenate (PMC *value, PMC *dest)>

=item C<void i_concatenate (PMC *value)>

Throws an exception.

=cut

.sub '__add' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__add')
    $I0 = defined meth
    unless $I0 goto L1
    dest = meth(self, value)
    .return (dest)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__subtract' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__sub')
    $I0 = defined meth
    unless $I0 goto L1
    dest = meth(self, value)
    .return (dest)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__multiply' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__mul')
    $I0 = defined meth
    unless $I0 goto L1
    dest = meth(self, value)
    .return (dest)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__divide' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__div')
    $I0 = defined meth
    unless $I0 goto L1
    dest = meth(self, value)
    .return (dest)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__modulus' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__mod')
    $I0 = defined meth
    unless $I0 goto L1
    dest = meth(self, value)
    .return (dest)
L1: 
    $S0 = classname self
    ex_arithmetic($S0)
.end

.sub '__pow' :method :multi(base_lua, pmc)
    .param pmc value
    .param pmc dest
    .local pmc meth
    meth = self.'find_metamethod'('__pow')
    $I0 = defined meth
    unless $I0 goto L1
    dest = meth(self, value)
    .return (dest)
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
    $I0 = defined meth
    unless $I0 goto L1
    dest = meth(self, value)
    .return (dest)
L1: 
    $S0 = classname self
    ex_concat($S0)
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

.sub '__is_equal' :method :multi(base_lua, pmc)
    .param pmc value
    $I0 = 0
    .return ($I0)
.end

.sub '__cmp' :method :multi(base_lua, pmc)
    .param pmc value
    .local pmc ex
    $S1 = classname self
    $S2 = classname value
    if $S1 == $S2 goto L1
    $S0 = "attempt to compare "
    $S0 .= $S1
    $S0 .= " with "
    $S0 .= $S2
    goto L2
L1:
    $S0 = "attempt to compare two "
    $S0 .= $S1
    $S0 .= " values"
L2:
    ex = new .Exception
    ex['_message'] = $S0
    throw ex
.end

=back

=head2 Specific Methods

=over 4

=item C<PMC* len()>

=cut

.sub 'len' :method
    .local pmc meth
    .local pmc ret
    meth = self.'find_metamethod'('__len')
    $I0 = defined meth
    unless $I0 goto L1
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

=item C<PMC* tonumber()>

=cut

.sub 'tonumber' :method
    .local pmc ret
    new ret, .LuaNil
    .return (ret)
.end

=item C<PMC* tostring()>

=cut

.sub 'tostring' :method
    .local pmc meth
    .local pmc ret
    meth = self.'find_metamethod'('__tostring')
    $I0 = defined meth
    unless $I0 goto L1
    ret = meth(self)
    .return (ret)
L1: 
    new ret, .LuaString
    $S0 = self.'__get_string'()
    ret = $S0
    .return (ret)
.end

=item C<void set_metatable(PMC *meta)>

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

=item C<PMC *get_metatable()>

=cut

.sub 'get_metatable' :method
    .local pmc metatable
    .local pmc ret
    ret = getprop '__metatable', self
    if_null ret, L1
    $I0 = isa ret, 'LuaTable'
    unless $I0 goto L1
    goto L2
L1:
    new ret, .LuaNil
L2:
    .return (ret)
.end    

=item C<PMC *find_metamethod(STRING *method_name)>

Looks up the method for C<*method_name>.

=cut

.sub 'find_metamethod' :method
    .param string name
    .local pmc metatable
    .local pmc key
    .local pmc ret
    metatable = getprop '__metatable', self
    if_null metatable, L1
    $I0 = isa metatable, 'LuaTable'
    unless $I0 goto L1
    new key, .LuaString
    set key, name
    ret = metatable[key]
L1:
    .return (ret)
.end    

=back

=head1 AUTHORS

Francois Perrad.

=cut

