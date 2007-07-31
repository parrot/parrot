# Copyright (C) 2005-2007, The Perl Foundation.
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

.HLL 'Lua', 'lua_group'
.namespace [ 'Lua::coroutine' ]

.sub 'luaopen_coroutine'
    load_bytecode 'Parrot/Coroutine.pbc'

#    print "init Lua Coroutine\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'
    new $P1, .LuaString

    .local pmc _coroutine
    new _coroutine, .LuaTable
    set $P1, 'coroutine'
    _lua__GLOBAL[$P1] = _coroutine

    lua_register($P1, _coroutine)

    .const .Sub _coroutine_create = 'create'
    _coroutine_create.'setfenv'(_lua__GLOBAL)
    set $P1, 'create'
    _coroutine[$P1] = _coroutine_create

    .const .Sub _coroutine_resume = 'resume'
    _coroutine_resume.'setfenv'(_lua__GLOBAL)
    set $P1, 'resume'
    _coroutine[$P1] = _coroutine_resume

    .const .Sub _coroutine_running = 'running'
    _coroutine_running.'setfenv'(_lua__GLOBAL)
    set $P1, 'running'
    _coroutine[$P1] = _coroutine_running

    .const .Sub _coroutine_status = 'status'
    _coroutine_status.'setfenv'(_lua__GLOBAL)
    set $P1, 'status'
    _coroutine[$P1] = _coroutine_status

    .const .Sub _coroutine_wrap = 'wrap'
    _coroutine_wrap.'setfenv'(_lua__GLOBAL)
    set $P1, 'wrap'
    _coroutine[$P1] = _coroutine_wrap

    .const .Sub _coroutine_yield = 'yield'
    _coroutine_yield.'setfenv'(_lua__GLOBAL)
    set $P1, 'yield'
    _coroutine[$P1] = _coroutine_yield

    new $P0, .ResizablePMCArray
    set_hll_global '_COROUTINE_STACK', $P0

.end

=item C<coroutine.create (f)>

Creates a new coroutine, with body C<f>. C<f> must be a Lua function.
Returns this new coroutine, an object with type C<"thread">.

=cut

.sub 'create' :anon
    .param pmc f :optional
    .local pmc res
    lua_checktype(1, f, 'function')
    $I0 = isa f, 'LuaClosure'
    if $I0 goto L1
    lua_argerror(1, 'Lua function expected')
  L1:
    res = new .LuaThread, f
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

.sub 'resume' :anon
    .param pmc co :optional
    .param pmc argv :slurpy
    .local pmc res
    .local pmc status
    lua_checktype(1, co, 'thread')
    ($I0, res :slurpy) = auxresume(co, argv :flat)
    new status, .LuaBoolean
    set status, $I0
    unless $I0 goto L1
    .return (status, res :flat)
  L1:
    .local pmc msg
    $S0 = res[0]
    new msg, .LuaString
    set msg, $S0
    .return (status, msg)
.end

.sub 'auxresume' :anon
    .param pmc co :optional
    .param pmc argv :slurpy
    .local pmc res
    .local pmc co_stack
    co_stack = get_hll_global '_COROUTINE_STACK'
    push co_stack, co
    $P0 = getattribute co, 'co'
    $P1 = getattribute $P0, 'state'
    if $P1 goto L1
    $P0 = pop co_stack
    .return (0, "cannot resume dead coroutine")
  L1:
    push_eh _handler
    (res :slurpy) = $P0.'resume'(argv :flat)
    .return (1, res :flat)
  _handler:
    .local pmc e
    .local string s
    .get_results (e, s)
    $P0 = pop co_stack
    .return (0, s)
.end

=item C<coroutine.running ()>

Returns the running coroutine, or B<nil> when called by the main thread.

=cut

.sub 'running' :anon
    .local pmc co_stack
    .local pmc res
    co_stack = get_hll_global '_COROUTINE_STACK'
    $I0 = elements co_stack
    if $I0 goto L1
    new res, .LuaNil
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

.sub 'status' :anon
    .param pmc co :optional
    .local pmc res
    lua_checktype(1, co, 'thread')
    new res, .LuaString
    $P0 = getattribute co, 'co'
    $P1 = getattribute $P0, 'state'
    if $P1 goto L1
    set res, 'dead'
    goto L2
  L1:
    set res, 'suspended'
  L2:
    .return (res)
.end

=item C<coroutine.wrap (f)>

Creates a new coroutine, with body C<f>. C<f> must be a Lua function.
Returns a function that resumes the coroutine each time it is called. Any
arguments passed to the function behave as the extra arguments to C<resume>.
Returns the same values returned by C<resume>, except the first boolean. In
case of error, propagates the error.

=cut

.sub 'wrap' :anon :lex
    .param pmc f :optional
    .param pmc argv :slurpy
    .local pmc res
    .local pmc co
    .lex 'upvar_co', co
    co = create(f)
    .const .Sub auxwrap = 'auxwrap'
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

.sub 'yield' :anon
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
# vim: expandtab shiftwidth=4:
