# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

lib/thread.pir - Lua Thread

=head1 DESCRIPTION

C<thread> extends C<Parrot::Coroutine> and C<base_lua> to provide a class 
with the behaviour of the Lua C<Thread> type.

=cut

.HLL '', 'lua_group'

.sub 'init_thread' :load :anon
    load_bytecode 'Parrot/Coroutine.pbc'
    load_bytecode 'languages/lua/type/base_lua.pir'
    $P0 = subclass 'Parrot::Coroutine', 'thread'
    $P1 = getclass 'base_lua'
    addparent $P0, $P1
.end

.namespace [ 'thread' ]

.sub '__get_bool' :method
    $I0 = 1
    .return ($I0)
.end

.sub '__logical_not' :method
    .param pmc dummy
    .local pmc ret
    $I0 = isfalse self
    new ret, .LuaBoolean
    set ret, $I0
    .return (ret)
.end

.sub '__get_pmc_keyed' :method
    .param pmc key
    ex_index()
.end

.sub '__set_pmc_keyed' :method
    .param pmc key
    .param pmc value
    ex_index()
.end

.sub 'ex_index' :anon
    .local pmc ex
    ex = new .Exception
    ex['_message'] = "attempt to index a thread value"
    throw ex
.end

.sub '__is_equal' :method :multi(thread, thread)
    .param pmc value
    $I1 = get_addr self
    $I2 = get_addr value
    $I0 = 0
    if $I1 != $I2 goto L1
    $I0 = 1
L1:
    .return ($I0)
.end

=head1 AUTHORS

Francois Perrad.

=cut

