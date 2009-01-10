# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luadebug.pir - Lua Debug Library

=head1 DESCRIPTION

This library provides the functionality of the debug interface to Lua programs.
You should exert care when using this library. The functions provided here
should be used exclusively for debugging and similar tasks, such as profiling.
Please resist the temptation to use them as a usual programming tool:
They can be very slow.
Moreover, several of its functions violate some assumptions about Lua code
(e.g., that variables local to a function cannot be accessed from outside
or that userdata metatables cannot be changed by Lua code) and therefore can
compromise otherwise secure code.

All functions in this library are provided inside the C<debug> table.

See "Lua 5.1 Reference Manual", section 5.9 "The Debug Library",
L<http://www.lua.org/manual/5.1/manual.html#5.9>.

=head2 Functions

=over 4

=cut

.HLL 'lua'
.loadlib 'lua_group'
.namespace [ 'debug' ]

.sub 'luaopen_debug'
#    print "init Lua Debug\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'
    new $P1, 'LuaString'

    .local pmc _debug
    new _debug, 'LuaTable'
    set $P1, 'debug'
    _lua__GLOBAL[$P1] = _debug

    $P2 = split "\n", <<'LIST'
debug
getfenv
gethook
getinfo
getlocal
getmetatable
getregistry
getupvalue
setfenv
sethook
setlocal
setmetatable
setupvalue
traceback
LIST
    lua_register($P1, _debug, $P2)

.end

=item C<debug.debug ()>

Enters an interactive mode with the user, running each string that the user
enters. Using simple commands and other debug facilities, the user can
inspect global and local variables, change their values, evaluate expressions,
and so on. A line containing only the word C<cont> finishes this function,
so that the caller continues its execution.

Note that commands for C<debug.debug> are not lexically nested within any
function, and so have no direct access to local variables.

=cut

.sub 'debug'
    .param pmc extra :slurpy
    .local string buffer
    .local pmc stdin
    stdin = getstdin
  L1:
    printerr 'lua_debug> '
    buffer = readline stdin
    if buffer == '' goto L2
    $I0 = index buffer, "cont"
    if $I0 == 0 goto L2
    ($P0, $S0) = lua_loadbuffer(buffer, '=(debug command)')
    unless null $P0 goto L3
    printerr $S0
    printerr "\n"
    goto L1
  L3:
    push_eh _handler
    $P0()
    pop_eh
    goto L1
  _handler:
    .local pmc e
    .local string msg
    .get_results (e)
    msg = e
    printerr msg
    printerr "\n"
    goto L1
  L2:
.end


=item C<debug.getfenv (o)>

Returns the environment of object C<o>.

=cut

.sub 'getfenv'
    .param pmc o :optional
    .param pmc extra :slurpy
    .tailcall lua_getfenv(o)
.end


=item C<debug.gethook ()>

Returns the current hook settings, as three values: the current hook function,
the current hook mask, and the current hook count (as set by the
C<debug.sethook> function).

NOT YET IMPLEMENTED.

=cut

.sub 'gethook'
    not_implemented()
.end


=item C<debug.getinfo (function [, what])>

Returns a table with information about a function. You can give the function
directly, or you can give a number as the value of C<function>, which means
the function running at level C<function> of the call stack: Level 0 is the
current function (C<getinfo> itself); level 1 is the function that called
C<getinfo>; and so on. If C<function> is a number larger than the number of
active functions, then C<getinfo> returns B<nil>.

The returned table contains all the fields returned by C<lua_getinfo>, with
the string C<what> describing which fields to fill in. The default for
C<what> is to get all information available. If present, the option `C<f>´
adds a field named C<func> with the function itself.

For instance, the expression C<debug.getinfo(1,"n").name> returns a name of
the current function, if a reasonable name can be found, and
C<debug.getinfo(print)> returns a table with all available information about
the C<print> function.

NOT YET IMPLEMENTED.

=cut

.sub 'getinfo'
    not_implemented()
.end


=item C<debug.getlocal (level, local)>

This function returns the name and the value of the local variable with index
C<local> of the function at level C<level> of the stack. (The first parameter
or local variable has index 1, and so on, until the last active local
variable.) The function returns B<nil> if there is no local variable with the
given index, and raises an error when called with a C<level> out of range.
(You can call C<debug.getinfo> to check whether the level is valid.)

Variable names starting with `C<(>´ (open parentheses) represent internal
variables (loop control variables, temporaries, and C function locals).

NOT YET IMPLEMENTED.

=cut

.sub 'getlocal'
    not_implemented()
.end


=item C<debug.getmetatable (object)>

Returns the metatable of the given C<object> or B<nil> if it does not have a
metatable.

=cut

.sub 'getmetatable'
    .param pmc obj :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checkany(1, obj)
    res = obj.'get_metatable'()
    .return (res)
.end


=item C<debug.getregistry ()>

Returns the registry table.

=cut

.sub 'getregistry'
    .param pmc extra :slurpy
    .local pmc res
    res = get_hll_global '_REGISTRY'
    .return (res)
.end


=item C<debug.getupvalue (func, up)>

This function returns the name and the value of the upvalue with index C<up>
of the function C<func>. The function returns B<nil> if there is no upvalue
with the given index.

NOT YET IMPLEMENTED.

=cut

.sub 'getupvalue'
    not_implemented()
.end


=item C<debug.setfenv (object, table)>

Sets the environment of the given C<object> to the given C<table>.

=cut

.sub 'setfenv'
    .param pmc o :optional
    .param pmc table :optional
    .param pmc extra :slurpy
    lua_checktype(2, table, 'table')
    $I0 = lua_setfenv(o, table)
    unless $I0 goto L1
    .return (o)
  L1:
    lua_error("'setfenv' cannot change environment of given object")
.end


=item C<debug.sethook (hook, mask [, count])>

Sets the given function as a hook. The string C<mask> and the number C<count>
describe when the hook will be called. The string mask may have the following characters, with the given meaning:

=over 4

=item C<"c">

The hook is called every time Lua calls a function;

=item C<"r">

The hook is called every time Lua returns from a function;

=item C<"l">

The hook is called every time Lua enters a new line of code.

=back

With a C<count> different from zero, the hook is called after every C<count>
instructions.

When called without arguments, C<debug.sethook> turns off the hook.

When the hook is called, its first parameter is a string describing the event
that has triggered its call: C<"call">, C<"return"> (or C<"tail return">),
C<"line">, and C<"count">. For line events, the hook also gets the new line
number as its second parameter. Inside a hook, you can call C<getinfo> with
level 2 to get more information about the running function (level 0 is the
C<getinfo> function, and level 1 is the hook function), unless the event is
C<"tail return">. In this case, Lua is only simulating the return, and a call
to C<getinfo> will return invalid data.

NOT YET IMPLEMENTED.

=cut

.sub 'sethook'
    not_implemented()
.end


=item C<debug.setlocal (level, local, value)>

This function assigns the value C<value> to the local variable with index
C<local> of the function at level C<level> of the stack. The function returns
B<nil> if there is no local variable with the given index, and raises an error
when called with a C<level> out of range. (You can call C<getinfo> to check
whether the level is valid.) Otherwise, it returns the name of the local
variable.

NOT YET IMPLEMENTED.

=cut

.sub 'setlocal'
    not_implemented()
.end


=item C<debug.setmetatable (object, table)>

Sets the metatable for the given C<object> to the given C<table> (which can
be B<nil>).

=cut

.sub 'setmetatable'
    .param pmc table :optional
    .param pmc metatable :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checktype(1, table, 'table')
    if null metatable goto L1
    $I0 = isa metatable, 'LuaNil'
    if $I0 goto L2
    $I0 = isa metatable, 'LuaTable'
    if $I0 goto L2
  L1:
    lua_argerror(2, "nil or table expected")
  L2:
    table.'set_metatable'(metatable)
    new res, 'LuaBoolean'
    set res, 1
    .return (res)
.end


=item C<debug.setupvalue (func, up, value)>

This function assigns the value C<value> to the upvalue with index C<up> of
the function C<func>. The function returns B<nil> if there is no upvalue with
the given index. Otherwise, it returns the name of the upvalue.

NOT YET IMPLEMENTED.

=cut

.sub 'setupvalue'
    not_implemented()
.end


=item C<debug.traceback ([message] [, level])>

Returns a string with a traceback of the call stack. An optional C<message>
string is appended at the beginning of the traceback. This function is
typically used with C<xpcall> to produce better error messages.

STILL INCOMPLETE.

=cut

.sub 'traceback'
    .param pmc message :optional
    .param pmc level :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_optstring(1, message, '')
    $I2 = lua_optint(2, level, 1)
    unless $S1 goto L1
    $S1 .= "\n"
  L1:
    $S0 = _traceback($I2)
    $S1 .= $S0
    new res, 'LuaString'
    set res, $S1
    .return (res)
.end

.sub '_traceback' :anon
    .param int level
    $P0 = getinterp
    $I0 = 0
    $S0 = "stack traceback:"
    .local pmc sub, outer
  L1:
    inc $I0
    push_eh _handler
    sub = $P0['sub'; $I0]
    pop_eh
    outer = sub.'get_outer'()
    $S0 .= "\n\t"
    unless null outer goto L3
    $S0 .= "[PIR]:"
    goto L4
  L3:
    $S0 .= "_._:0:"
  L4:
    $S0 .= " in function '"
    $S1 = sub.'get_name'()
    $S0 .= $S1
    $S0 .= "'"
    goto L1
  _handler:
    .return ($S0)
.end


=back

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
