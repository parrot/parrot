# Copyright (C) 2006, The Perl Foundation.
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

See "Lua 5.1 Reference Manual", section 5.9 "The Debug Library".

=head2 Functions

=over 4

=cut

.namespace [ 'Lua' ]
.HLL 'Lua', 'lua_group'

.include 'languages/lua/lib/luaaux.pir'

.sub 'init_debug' :load :anon

#    load_bytecode 'languages/lua/lib/luaaux.pbc'
    load_bytecode 'languages/lua/lib/luabasic.pbc'

#    print "init Lua Debug\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = global '_G'
    $P1 = new .LuaString

    .local pmc _debug
    _debug = new .LuaTable
    $P1 = 'debug'
    _lua__GLOBAL[$P1] = _debug

    .const .Sub _debug_debug = '_debug_debug'
    $P1 = 'debug'
    _debug[$P1] = _debug_debug

    .const .Sub _debug_getfenv = '_debug_getfenv'
    $P1 = 'getfenv'
    _debug[$P1] = _debug_getfenv

    .const .Sub _debug_gethook = '_debug_gethook'
    $P1 = 'gethook'
    _debug[$P1] = _debug_gethook

    .const .Sub _debug_getinfo = '_debug_getinfo'
    $P1 = 'getinfo'
    _debug[$P1] = _debug_getinfo

    .const .Sub _debug_getlocal = '_debug_getlocal'
    $P1 = 'getlocal'
    _debug[$P1] = _debug_getlocal

    .const .Sub _debug_getmetatable = '_debug_getmetatable'
    $P1 = 'getmetatable'
    _debug[$P1] = _debug_getmetatable

    .const .Sub _debug_getregistry = '_debug_getregistry'
    $P1 = 'getregistry'
    _debug[$P1] = _debug_getregistry

    .const .Sub _debug_getupvalue = '_debug_getupvalue'
    $P1 = 'getupvalue'
    _debug[$P1] = _debug_getupvalue

    .const .Sub _debug_setfenv = '_debug_setfenv'
    $P1 = 'setfenv'
    _debug[$P1] = _debug_setfenv

    .const .Sub _debug_sethook = '_debug_sethook'
    $P1 = 'sethook'
    _debug[$P1] = _debug_sethook

    .const .Sub _debug_setlocal = '_debug_setlocal'
    $P1 = 'setlocal'
    _debug[$P1] = _debug_setlocal

    .const .Sub _debug_setmetatable = '_debug_setmetatable'
    $P1 = 'setmetatable'
    _debug[$P1] = _debug_setmetatable

    .const .Sub _debug_setupvalue = '_debug_setupvalue'
    $P1 = 'setupvalue'
    _debug[$P1] = _debug_setupvalue

    .const .Sub _debug_traceback = '_debug_traceback'
    $P1 = 'traceback'
    _debug[$P1] = _debug_traceback

.end

=item C<debug.debug ()>

Enters an interactive mode with the user, running each string that the user
enters. Using simple commands and other debug facilities, the user can
inspect global and local variables, change their values, evaluate expressions,
and so on. A line containing only the word C<cont> finishes this function,
so that the caller continues its execution.

Note that commands for C<debug.debug> are not lexically nested within any
function, and so have no direct access to local variables.

NOT YET IMPLEMENTED.

=cut

.sub '_debug_debug' :anon
    not_implemented()
.end


=item C<debug.getfenv (o)>

Returns the environment of object C<o>.

NOT YET IMPLEMENTED.

=cut

.sub '_debug_getfenv' :anon
    not_implemented()
.end


=item C<debug.gethook ()>

Returns the current hook settings, as three values: the current hook function,
the current hook mask, and the current hook count (as set by the
C<debug.sethook> function).

NOT YET IMPLEMENTED.

=cut

.sub '_debug_gethook' :anon
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

.sub '_debug_getinfo' :anon
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

.sub '_debug_getlocal' :anon
    not_implemented()
.end


=item C<debug.getmetatable (object)>

Returns the metatable of the given C<object> or B<nil> if it does not have a
metatable.

=cut

.sub '_debug_getmetatable' :anon
    .param pmc obj :optional
    .local pmc ret
    checkany(obj)
    ret = obj."get_metatable"()
    .return (ret)
.end


=item C<debug.getregistry ()>

Returns the registry table.

NOT YET IMPLEMENTED.

=cut

.sub '_debug_getregistry' :anon
    not_implemented()
.end


=item C<debug.getupvalue (func, up)>

This function returns the name and the value of the upvalue with index C<up>
of the function C<func>. The function returns B<nil> if there is no upvalue
with the given index.

NOT YET IMPLEMENTED.

=cut

.sub '_debug_getupvalue' :anon
    not_implemented()
.end


=item C<debug.setfenv (object, table)>

Sets the environment of the given C<object> to the given C<table>.

NOT YET IMPLEMENTED.

=cut

.sub '_debug_setfenv' :anon
    not_implemented()
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

.sub '_debug_sethook' :anon
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

.sub '_debug_setlocal' :anon
    not_implemented()
.end


=item C<debug.setmetatable (object, table)>

Sets the metatable for the given C<object> to the given C<table> (which can
be B<nil>).

=cut

.sub '_debug_setmetatable' :anon
    .param pmc table :optional
    .param pmc metatable :optional
    checktype(table, 'table')
    if_null metatable, L0
    $S0 = typeof metatable
    if $S0 == 'nil' goto L1
    if $S0 == 'table' goto L1
L0:
    argerror("nil or table expected")
L1:
    table.'set_metatable'(metatable)
    .return ()
.end


=item C<debug.setupvalue (func, up, value)>

This function assigns the value C<value> to the upvalue with index C<up> of
the function C<func>. The function returns B<nil> if there is no upvalue with
the given index. Otherwise, it returns the name of the upvalue.

NOT YET IMPLEMENTED.

=cut

.sub '_debug_setupvalue' :anon
    not_implemented()
.end


=item C<debug.traceback ([message])>

Returns a string with a traceback of the call stack. An optional C<message>
string is appended at the beginning of the traceback. This function is
typically used with C<xpcall> to produce better error messages.

NOT YET IMPLEMENTED.

=cut

.sub '_debug_traceback' :anon
    not_implemented()
.end


=back

=head1 AUTHORS

Francois Perrad

=cut

