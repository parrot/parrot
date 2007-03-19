# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

lib/alarm.pir - Lua Alarm Library

=head1 DESCRIPTION

The library exports a single function: alarm(s,[f]).

=head2 Function

=over 4

=cut

.HLL 'Lua', 'lua_group'

.sub '__onload' :anon :load
#    print "__onload alarm\n"
    .const .Sub entry = 'luaopen_alarm'
    set_root_global 'luaopen_alarm', entry
.end

.sub 'luaopen_alarm'

#    print "luaopen_alarm\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = global '_G'

    new $P1, .LuaString

    .const .Sub _alarm = '_alarm'
    set $P1, 'alarm'
    _lua__GLOBAL[$P1] = _alarm

    .return (_alarm)
.end

=item C<alarm (s, [f])>

It tells Lua to call C<f> after C<s> seconds have elapsed. This is done only
once. If you want f to be called every C<s> seconds, call C<alarm(s)>
inside C<f>.

=cut

.include 'timer.pasm'

.sub '_alarm' :anon
    .param pmc s :optional
    .param pmc func :optional
    .local pmc ret
    $I1 = checknumber(s)
    $P0 = global '_REGISTRY'
    new $P1, .LuaString
    set $P1, 'alarm handler'
    unless null func goto L1
    func = $P0[$P1]
    $I0 = isa func, 'LuaNil'
    unless $I0 goto L2
    error("no alarm handler set")
    goto L2
L1:
    checktype(func, 'function')
    $P0[$P1] = func
L2:
    new $P0, .Timer
    $P0[.PARROT_TIMER_SEC] = $I1
    $P0[.PARROT_TIMER_REPEAT] = 0
    $P0[.PARROT_TIMER_HANDLER] = func
    $P0()
    new ret, .LuaNumber
    set ret, $I1
    .return (ret)
.end

=back

=head1 AUTHORS

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
