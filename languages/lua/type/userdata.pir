# Copyright (C) 2006, The Perl Foundation.
# $Id: userdata.pir 14985 2006-10-20 14:59:05Z fperrad $

=head1 NAME

lib/userdata.pir - Lua Userdata

=head1 DESCRIPTION

C<Userdata> extends C<base_lua> to provide a class with the behaviour of
the Lua C<Userdata> type.

=cut

.HLL '', 'lua_group'

.sub 'init_userdata' :load :anon
    load_bytecode 'languages/lua/type/base_lua.pbc'
    $P0 = subclass 'base_lua', 'userdata'
    addattribute $P0, 'data'
.end

.namespace [ 'userdata' ]

.sub '__get_pmc_keyed' :method
    .param pmc key
    .local pmc meth
    .local pmc ret
    meth = self.'find_metamethod'('__index')
    if_null meth, L1
    ret = meth[key]
    .return (ret)
L1: 
    new ret, .LuaNil
    .return (ret)
.end

.sub '__is_equal' :method :multi(userdata, userdata)
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

=head1 AUTHORS

Francois Perrad.

=cut

