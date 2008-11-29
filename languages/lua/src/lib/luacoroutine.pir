# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luacoroutine.pir - Lua Coroutine Library

=head1 DESCRIPTION

The operations related to coroutines comprise a sub-library of the basic
library and come inside the table C<coroutine>.

See "Lua 5.1 Reference Manual", section 5.2 "Coroutine Manipulation",
L<http://www.lua.org/manual/5.1/manual.html#5.2>.

=head2 Functions

=over 4

=cut

.HLL 'Lua'
.loadlib 'lua_group'
.namespace [ 'coroutine' ]

.sub 'luaopen_coroutine'
    load_bytecode 'Parrot/Coroutine.pbc'

#    print "init Lua Coroutine\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'
    new $P1, 'LuaString'

    .local pmc _coroutine
    new _coroutine, 'LuaTable'
    set $P1, 'coroutine'
    _lua__GLOBAL[$P1] = _coroutine

    $P2 = split "\n", <<'LIST'
create
resume
running
status
wrap
yield
LIST
    lua_register($P1, _coroutine, $P2)

    new $P0, 'ResizablePMCArray'
    set_hll_global '_COROUTINE_STACK', $P0

.end

.const int CO_RUN = 0   # running
.const int CO_SUS = 1   # suspended
.const int CO_NOR = 2   # 'normal' (it resumed another coroutine)
.const int CO_DEAD = 3
.const string statnames = 'running suspended normal dead'

=item C<coroutine.create (f)>

Creates a new coroutine, with body C<f>. C<f> must be a Lua function.
Returns this new coroutine, an object with type C<"thread">.

=cut

.sub 'create'
    .param pmc f :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checktype(1, f, 'function')
    $P0 = f.'get_outer'()
    unless null $P0 goto L1
    lua_argerror(1, 'Lua function expected')
  L1:
    new res, 'LuaThread', f
    .return (res)
.end

=item C<coroutine.resume (co [, val1, ..., valn])>

Starts or continues the execution of coroutine C<co>. The first time you
resume a coroutine, it starts running its body. The values C<val1, ..., valn>
are passed as the arguments to the body function. If the coroutine has yielded,
C<resume> restarts it; the values C<val1, ..., valn> are passed as the results
from the yield.

If the coroutine runs without any errors, C<resume> returns B<true> plus any
values passed to yield (if the coroutine yields) or any values returned by
the body function (if the coroutine terminates). If there is any error,
C<resume> returns B<false> plus the error message.

=cut

.sub 'resume'
    .param pmc co :optional
    .param pmc argv :slurpy
    .local pmc res
    .local pmc status
    lua_checktype(1, co, 'thread')
    ($I0, res :slurpy) = auxresume(co, argv :flat)
    new status, 'LuaBoolean'
    set status, $I0
    unless $I0 goto L1
    .return (status, res :flat)
  L1:
    .local pmc msg
    $S0 = res[0]
    new msg, 'LuaString'
    set msg, $S0
    .return (status, msg)
.end

.sub 'auxresume' :anon
    .param pmc co
    .param pmc argv :slurpy
    .local pmc res
    .local pmc co_stack
    .local int status
    co_stack = get_hll_global '_COROUTINE_STACK'
    push co_stack, co
    $P0 = getattribute co, 'co'
    status = costatus($P0)
    if status == CO_SUS goto L1
    $P0 = pop co_stack
    $P0 = split ' ', statnames
    $S0 = $P0[status]
    $S1 = "cannot resume "
    $S1 .= $S0
    $S1 .= " coroutine"
    .return (0, $S1)
  L1:
    push_eh _handler
    (res :slurpy) = $P0.'resume'(argv :flat)
    pop_eh
    .return (1, res :flat)
  _handler:
    .local pmc e
    .local string s
    .get_results (e)
    s = e
    $P0 = pop co_stack
    .return (0, s)
.end

=item C<coroutine.running ()>

Returns the running coroutine, or B<nil> when called by the main thread.

=cut

.sub 'running'
    .param pmc extra :slurpy
    .local pmc co_stack
    .local pmc res
    co_stack = get_hll_global '_COROUTINE_STACK'
    $I0 = elements co_stack
    if $I0 goto L1
    new res, 'LuaNil'
    goto L2
  L1:
    res = pop co_stack
    push co_stack, res
  L2:
    .return (res)
.end


=item C<coroutine.status (co)>

Returns the status of coroutine C<co>, as a string: C<"running">, if the
coroutine is running (that is, it called C<status>); C<"suspended">, if the
coroutine is suspended in a call to yield, or if it has not started running
yet; C<"normal"> if the coroutine is active but not running (that is, it has
resumed another coroutine); and C<"dead"> if the coroutine has finished its
body function, or if it has stopped with an error.

STILL INCOMPLETE.

=cut

.sub 'status'
    .param pmc co :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checktype(1, co, 'thread')
    $P0 = getattribute co, 'co'
    $I0 = costatus($P0)
    $P0 = split ' ', statnames
    $S0 = $P0[$I0]
    new res, 'LuaString'
    set res, $S0
    .return (res)
.end


.sub 'costatus' :anon
    .param pmc coro
    $P0 = getattribute coro, 'state'
    if $P0 goto L1
    .return (CO_DEAD)
  L1:
    .return (CO_SUS)
.end

=item C<coroutine.wrap (f)>

Creates a new coroutine, with body C<f>. C<f> must be a Lua function.
Returns a function that resumes the coroutine each time it is called. Any
arguments passed to the function behave as the extra arguments to C<resume>.
Returns the same values returned by C<resume>, except the first boolean. In
case of error, propagates the error.

=cut

.sub 'wrap' :lex
    .param pmc f :optional
    .param pmc argv :slurpy
    .local pmc res
    .local pmc co
    .lex 'upvar_co', co
    co = create(f)
    .const 'Sub' auxwrap = 'auxwrap'
    res = newclosure auxwrap
    .return (res)
.end

.sub 'auxwrap' :anon :lex :outer(wrap)
    .param pmc argv :slurpy
    .local pmc co
    .local pmc res
    co = find_lex 'upvar_co'
    ($I0, res :slurpy) = auxresume(co, argv :flat)
    unless $I0 goto L1
    .return (res :flat)
  L1:
    $S0 = res[0]
    lua_error($S0)
.end

=item C<coroutine.yield ([val1, ..., valn])>

Suspends the execution of the calling coroutine. The coroutine cannot be
running a C function, a metamethod, or an iterator.
Any arguments to C<yield> are passed as extra results to C<resume>.

=cut

.sub 'yield'
    .param pmc argv :slurpy
    .local pmc res
    .local pmc co
    .local pmc co_stack
    co_stack = get_hll_global '_COROUTINE_STACK'
    co = pop co_stack
    $P0 = getattribute co, 'co'
    (res :slurpy) = $P0.'yield'(argv :flat)
    .return (res :flat)
.end

=back

=head1 AUTHORS

Francois Perrad.

Bob Rogers.

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
