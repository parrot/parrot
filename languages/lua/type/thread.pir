# Copyright (C) 2006, The Perl Foundation.
# $Id: thread.pir 14985 2006-10-20 14:59:05Z fperrad $

=head1 NAME

lib/thread.pir - Lua Thread

=head1 DESCRIPTION

C<thread> extends C<Parrot::Coroutine> and C<base_lua> to provide a class 
with the behaviour of the Lua C<Thread> type.

=cut

.HLL '', 'lua_group'

.sub 'init_thread' :load :anon
    load_bytecode 'Parrot/Coroutine.pbc'
    load_bytecode 'languages/lua/type/base_lua.pbc'
#    $P0 = subclass 'Parrot::Coroutine', 'thread'
#    $P1 = getclass 'base_lua'
    $P0 = subclass 'base_lua', 'thread'
    $P1 = getclass 'Parrot::Coroutine'
    addparent $P0, $P1
.end

.namespace [ 'thread' ]

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

=back

=head1 AUTHORS

Francois Perrad.

=cut

