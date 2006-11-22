# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

lib/thread.pir - Lua Thread

=head1 DESCRIPTION

C<thread> extends C<base_lua> to provide a class with the behaviour of 
the Lua C<Thread> type. 
This implementation is based on C<Parrot::Coroutine>.

=cut

.HLL '', 'lua_group'

.sub 'init_thread' :load :anon
    load_bytecode 'Parrot/Coroutine.pbc'
    load_bytecode 'languages/lua/type/base_lua.pir'
    $P0 = subclass 'base_lua', 'thread'
    addattribute $P0, 'co'
.end

.namespace [ 'thread' ]

.sub 'init_pmc' :method :vtable
    .param pmc f
    $I0 = find_type 'Parrot::Coroutine'
    $P0 = new $I0, f
    setattribute self, 'co', $P0 
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

.sub 'resume' :method
    .param pmc argv :slurpy
    $P0 = getattribute self, 'co'
    $P1 = getattribute $P0, 'state'
    if $P1 goto L1
    .local pmc ex
    ex = new .Exception
    ex['_message'] = "cannot resume dead coroutine"
    throw ex
L1:
    ($P1 :slurpy) = $P0.'resume'(argv :flat)
    .return ($P1 :flat)
.end

.sub 'yield' :method
    .param pmc argv :slurpy
    $P0 = getattribute self, 'co'
    ($P1 :slurpy) = $P0.'yield'(argv :flat)
    .return ($P1 :flat)
.end

=head1 AUTHORS

Francois Perrad.

=cut

