# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

=head1 NAME

lib/luacoroutine.pir - Lua Coroutine Library

=head1 DESCRIPTION

The operations related to coroutines comprise a sub-library of the basic
library and come inside the table C<coroutine>.

See "Lua 5.1 Reference Manual", section 5.2 "Coroutine Manipulation".

=head2 Functions

=over 4

=cut

.namespace [ 'Lua' ]
.HLL 'Lua', 'lua_group'


.sub 'init_coroutine' :load :anon

#    load_bytecode 'languages/lua/lib/luaaux.pbc'
#    load_bytecode 'languages/lua/lib/luabasic.pbc'

#    print "init Lua Coroutine\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = global '_G'
    $P1 = new .LuaString

    .local pmc _coroutine
    _coroutine = new .LuaTable
    $P1 = 'coroutine'
    _lua__GLOBAL[$P1] = _coroutine

    .const .Sub _coroutine_create = '_coroutine_create'
    $P1 = 'create'
    _coroutine[$P1] = _coroutine_create

    .const .Sub _coroutine_resume = '_coroutine_resume'
    $P1 = 'resume'
    _coroutine[$P1] = _coroutine_resume

    .const .Sub _coroutine_running = '_coroutine_running'
    $P1 = 'running'
    _coroutine[$P1] = _coroutine_running

    .const .Sub _coroutine_status = '_coroutine_status'
    $P1 = 'status'
    _coroutine[$P1] = _coroutine_status

    .const .Sub _coroutine_wrap = '_coroutine_wrap'
    $P1 = 'wrap'
    _coroutine[$P1] = _coroutine_wrap

    .const .Sub _coroutine_yield = '_coroutine_yield'
    $P1 = 'yield'
    _coroutine[$P1] = _coroutine_yield

    $P0 = subclass 'FixedPMCArray', 'thread'
.end

=item C<coroutine.create (f)>

Creates a new coroutine, with body C<f>. C<f> must be a Lua function.
Returns this new coroutine, an object with type C<"thread">.

=cut

.sub '_coroutine_create' :anon :outer(init_coroutine)
    .param pmc f :optional
    .local pmc ret
    checktype(f, 'function')
    ret = coroutine_create(f)
    .return (ret)
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

.sub '_coroutine_resume' :anon :outer(init_coroutine)
    .param pmc co :optional
    .param pmc argv :slurpy
    .local pmc ret
    .local pmc status
    new status, .LuaBoolean
#    checktype(co, 'thread')
    push_eh _handler
    (ret :slurpy) = coroutine_resume(co, argv :flat)
    status = 1
    .return (status, ret :flat)
_handler:
    .local pmc e
    .local string s
    .local pmc msg
    .get_results (e, s)
    status = 0
    new msg, .LuaString
    msg = s
    .return (status, msg)
.end


=item C<coroutine.running ()>

Returns the running coroutine, or B<nil> when called by the main thread.

NOT YET IMPLEMENTED.

=cut

.sub '_coroutine_running' :anon :outer(init_coroutine)
    not_implemented()
.end


=item C<coroutine.status (co)>

Returns the status of coroutine C<co>, as a string: C<"running">, if the
coroutine is running (that is, it called C<status>); C<"suspended">, if the
coroutine is suspended in a call to yield, or if it has not started running
yet; C<"normal"> if the coroutine is active but not running (that is, it has
resumed another coroutine); and C<"dead"> if the coroutine has finished its
body function, or if it has stopped with an error.

DUMMY IMPLEMENTATION.

=cut

.sub '_coroutine_status' :anon :outer(init_coroutine)
    .param pmc co :optional
    .local pmc ret
#    checktype(co, 'thread')
    new ret, .LuaString
    ret = 'suspended'
    .return (ret)
.end

=item C<coroutine.wrap (f)>

Creates a new coroutine, with body C<f>. C<f> must be a Lua function.
Returns a function that resumes the coroutine each time it is called. Any
arguments passed to the function behave as the extra arguments to C<resume>.
Returns the same values returned by C<resume>, except the first boolean. In
case of error, propagates the error.

NOT YET IMPLEMENTED.

=cut

.sub '_coroutine_wrap' :anon :outer(init_coroutine)
    .param pmc f :optional
    checktype(f, 'function')
    not_implemented()
.end

=item C<coroutine.yield ([val1, ..., valn])>

Suspends the execution of the calling coroutine. The coroutine cannot be
running a C function, a metamethod, or an iterator.
Any arguments to C<yield> are passed as extra results to C<resume>.

=cut

.sub '_coroutine_yield' :anon :outer(init_coroutine)
    .param pmc argv :slurpy
    .local pmc ret
    .local pmc co   # current coroutine ?
    (ret :slurpy) = coroutine_yield(co, argv :flat)
    .return (ret :flat)
.end

### Coroutine implementation.

## Coroutine slots:
##
##  0.  Coroutine state:  1 is new or valid, 0 is dead.
##  1.  Initial sub.
##  2.  Continuation to which to return when yielding.
##  3.  Continuation from which to resume.

.include "interpinfo.pasm"

.sub 'coroutine_create' :anon
    .param pmc sub

    .local pmc coro, state
#    find_type $I0, 'thread'
#    coro = new $I0
    coro = new .FixedPMCArray
    coro = 4
    state = new .Undef
    state = 1
    coro[0] = state
    coro[1] = sub
    .return (coro)
.end

## Invoke the coroutine.
.sub 'coroutine_resume' :anon
    .param pmc coro
    .param pmc args :slurpy

    ## Decide whether we're dead.
    .local pmc state
    state = coro[0]
    unless state goto dead

    ## Decide where to go.  If we've never been invoked before, we need to
    ## call the sub.
    .local pmc entry
    entry = coro[3]
    unless null entry goto doit
    entry = coro[1]

doit:
    ## Remember where to return when we yield.
    .local pmc cc
    cc = interpinfo .INTERPINFO_CURRENT_CONT
    coro[2] = cc

    ## Call the entry with our args.  Most of the time, it will yield (by
    ## calling our continuation for us) instead of returning directly.
    .local pmc result
    (result :slurpy) = entry(args :flat)
    ## If we returned normally, then the coroutine is dead.
    state = 0
    ## Note that the value of coro[2] will normally have been changed
    ## magically behind our backs by a subsequent yield/resume, so we can't
    ## just return directly.
    cc = coro[2]
    .return cc(result :flat)

dead:
    ## Complain about zombie creation.
    .local pmc error
    error = new .Exception
    error['_message'] = "Can't reanimate a dead coroutine.\n"
    throw error
.end

## Return values to the calling thread.
.sub 'coroutine_yield' :anon
    .param pmc coro
    .param pmc args :slurpy

    ## Remember where to go when we are resumed.
    .local pmc cc
    cc = interpinfo .INTERPINFO_CURRENT_CONT
    coro[3] = cc

    ## Return to the coro caller.
    cc = coro[2]
    .return cc(args :flat)
.end

#.namespace ['thread']
#
#.sub '__get_string' :method
#    $S0 = sprintf "thread: %08X", self
#    .return ($S0)
#.end
#
#.sub '__get_bool' :method
#    $I0 = 1
#    .return ($I0)
#.end
#
#.sub 'rawequal' :method
#    .param pmc value
#    .local pmc ret
#    new ret, .LuaBoolean
#    not_implemented()
#    .return (ret)
#.end
#
#.sub 'tonumber' :method
#    .local pmc ret
#    new ret, .LuaNil
#    .return (ret)
#.end
#
#.sub 'tostring' :method
#    .local pmc ret
#    new ret, .LuaString
#    $S0 = self.__get_string()
#    ret = $S0
#    .return (ret)
#.end

=back

=head1 AUTHORS

Francois Perrad.

Bob Rogers.

=cut

