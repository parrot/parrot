# Copyright (C) 2006, The Perl Foundation.
# $Id: thread.pir 14985 2006-10-20 14:59:05Z fperrad $

=head1 NAME

lib/thread.pir - Lua Thread

=head1 DESCRIPTION

C<thread> extends C<Parrot::Coroutine> to provide a class with the behaviour
of the Lua C<Thread> type.

=head2 Functions

=over 4

=cut

.HLL '', 'lua_group'

.sub 'init_thread' :load :anon
    load_bytecode 'Parrot/Coroutine.pbc'
    $P0 = subclass 'Parrot::Coroutine', 'thread'
.end

.namespace [ 'thread' ]

.sub '__clone' :method
    .return (self)
.end

.sub '__get_string' :method
    new $P0, .Array
    $P0 = 1
    $I0 = get_addr self
    $P0[0] = $I0
    $S0 = sprintf "thread: %08X", $P0
    .return ($S0)
.end

.sub '__get_bool' :method
    $I0 = 1
    .return ($I0)
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

.sub '__neg' :method
    .param pmc dummy
    ex_arithmetic()
.end

.sub '__logical_not' :method
    .param pmc dummy
    .local pmc ret
    new ret, .LuaBoolean
    .return (ret)
.end

.sub '__add' :method :multi(thread, pmc)
    .param pmc value
    .param pmc dummy
    ex_arithmetic()
.end

.sub '__subtract' :method :multi(thread, pmc)
    .param pmc value
    .param pmc dummy
    ex_arithmetic()
.end

.sub '__multiply' :method :multi(thread, pmc)
    .param pmc value
    .param pmc dummy
    ex_arithmetic()
.end

.sub '__divide' :method :multi(thread, pmc)
    .param pmc value
    .param pmc dummy
    ex_arithmetic()
.end

.sub '__modulus' :method :multi(thread, pmc)
    .param pmc value
    .param pmc dummy
    ex_arithmetic()
.end

.sub '__pow' :method :multi(thread, pmc)
    .param pmc value
    .param pmc dummy
    ex_arithmetic()
.end

.sub 'ex_arithmetic' :anon
    .local pmc ex
    ex = new .Exception
    ex['_message'] = "attempt to perform arithmetic on a thread value"
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

.sub '__is_equal' :method :multi(thread, pmc)
    .param pmc value
    $I0 = 0
    .return ($I0)
.end

.sub '__cmp' :method :multi(thread, thread)
    .param pmc value
    .local pmc ex
    ex = new .Exception
    ex['_message'] = "attempt to compare two thread values"
    throw ex
.end

.sub '__cmp' :method :multi(thread, pmc)
    .param pmc value
    .local pmc ex
    ex = new .Exception
    $S0 = "attempt to compare thread with "
    $S1 = classname value
    $S0 .= $S1
    ex['_message'] = $S0
    throw ex
.end

.sub '__concatenate' :method :multi(thread, pmc)
    .param pmc value
    .param pmc dummy
    .local pmc ex
    ex = new .Exception
    ex['_message'] = "attempt to concatenate a thread value"
    throw ex
.end

=back

=head2 Specific Methods

=over 4

=item C<PMC* len()>

=cut

.sub 'len' :method
    .local pmc ex
    ex = new .Exception
    ex['_message'] = "attempt to get length of a thread value"
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
    .local pmc ret
    new ret, .LuaString
    $S0 = self.'__get_string'()
    ret = $S0
    .return (ret)
.end

=back

=head1 AUTHORS

Francois Perrad.

=cut

