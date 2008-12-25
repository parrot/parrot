# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/alarm.pir - Lua Alarm Library

=head1 DESCRIPTION

The library exports a single function: alarm(s,[f]).

See original on L<http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lalarm/>

=head2 Function

=over 4

=cut

.HLL 'lua'
.loadlib 'lua_group'
.namespace [ 'alarm' ]

.sub '__onload' :anon :load
#    print "__onload alarm\n"
    .const 'Sub' entry = 'luaopen_alarm'
    set_hll_global 'luaopen_alarm', entry
.end

.sub 'luaopen_alarm'

#    print "luaopen_alarm\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    new $P1, 'LuaString'

    .const 'Sub' _alarm = 'alarm'
    _alarm.'setfenv'(_lua__GLOBAL)
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

.sub 'alarm' :anon
    .param pmc s :optional
    .param pmc func :optional
    .param pmc extra :slurpy
    .local pmc res
    $I1 = lua_checknumber(1, s)
    $P0 = get_hll_global '_REGISTRY'
    new $P1, 'LuaString'
    set $P1, 'alarm handler'
    unless null func goto L1
    func = $P0[$P1]
    $I0 = isa func, 'LuaNil'
    unless $I0 goto L2
    lua_error("no alarm handler set")
    goto L2
  L1:
    lua_checktype(2, func, 'function')
    $P0[$P1] = func
  L2:
    new $P0, 'Timer'
    $P0[.PARROT_TIMER_SEC] = $I1
    $P0[.PARROT_TIMER_REPEAT] = 0
    $P0[.PARROT_TIMER_HANDLER] = func
    $P0()
    new res, 'LuaNumber'
    set res, $I1
    .return (res)
.end

=back

=head1 AUTHORS

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
