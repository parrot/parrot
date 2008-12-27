# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luabasic.pir - Lua Basic Library

=head1 DESCRIPTION

The basic library provides some core functions to Lua.

See "Lua 5.1 Reference Manual", section 5.1 "Basic Functions",
L<http://www.lua.org/manual/5.1/manual.html#5.1>.

=head2 Variables

=over 4

=cut

.HLL 'lua'
.loadlib 'lua_group'
.namespace [ 'basic' ]

.sub 'luaopen_basic'
#    print "init Lua Basic\n"

    .local pmc _lua__REGISTRY
    new _lua__REGISTRY, 'LuaTable'
    set_hll_global '_REGISTRY', _lua__REGISTRY

    .local pmc _lua__GLOBAL
    new _lua__GLOBAL, 'LuaTable'
    set_hll_global '_G', _lua__GLOBAL
    new $P1, 'LuaString'

    set $P1, '_LOADED'
    new $P0, 'LuaTable'
    _lua__REGISTRY[$P1] = $P0

=item C<_G>

A global variable (not a function) that holds the global environment (that is,
C<_G._G = _G>). Lua itself does not use this variable; changing its value
does not affect any environment, nor vice-versa. (Use C<setfenv> to change
environments.)

=cut

    set $P1, '_G'
    _lua__GLOBAL[$P1] = _lua__GLOBAL

    $P2 = split "\n", <<'LIST'
assert
collectgarbage
dofile
error
getfenv
getmetatable
ipairs
load
loadfile
loadstring
next
pairs
pcall
print
rawequal
rawget
rawset
select
setfenv
setmetatable
tonumber
tostring
type
unpack
xpcall
LIST
    lua_register($P1, _lua__GLOBAL, $P2)

=item C<_VERSION>

A global variable (not a function) that holds a string containing the current
interpreter version. The current contents of this variable is C<"Lua 5.1">.

=cut

    new $P0, 'LuaString'
    set $P0, "Lua 5.1 (on Parrot)"
    set $P1, '_VERSION'
    _lua__GLOBAL[$P1] = $P0

.end


=back

=head2 Functions

=over 4

=item C<assert (v [, message])>

Issues an error when the value of its argument C<v> is false (i.e., B<nil>
or B<false>); otherwise, returns all its arguments. C<message> is an error
message; when absent, it defaults to "assertion failed!"

=cut

.sub 'assert'
    .param pmc v :optional
    .param pmc message :optional
    .param pmc extra :slurpy
    lua_checkany(1, v)
    $I0 = istrue v
    if $I0 goto L1
    $S2 = lua_optstring(2, message, "assertion failed!")
    lua_error($S2)
  L1:
    .return (v, message, extra :flat)
.end


=item C<collectgarbage (opt [, arg])>

This function is a generic interface to the garbage collector. It performs
different functions according to its first argument, C<opt>:

=over 4

=item B<"stop">

stops the garbage collector.

=item B<"restart">

restarts the garbage collector.

=item B<"collect">

performs a full garbage-collection cycle.

=item B<"count">

returns the total memory in use by Lua (in Kbytes).

=item B<"step">

performs a garbage-collection step. The step C<"size"> is controlled
by C<arg> (larger values mean more steps) in a non-specified way.
If you want to control the step size you must tune experimentally the value
of C<arg>. Returns B<true> if the step finished a collection cycle.

=item B<"steppause">

sets C<arg>/100 as the new value for the I<pause> of the collector.

=item B<"setstepmul">

sets C<arg>/100 as the new value for the I<step multiplier> of the collector.

=back

STILL INCOMPLETE (see lua_gc).

=cut

.sub 'collectgarbage'
    .param pmc opt :optional
    .param pmc arg :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_optstring(1, opt, 'collect')
    lua_checkoption(1, $S1, 'stop restart collect count step setpause setstepmul')
    $I2 = lua_optint(2, arg, 0)
    $N0 = lua_gc($S1, $I2)
    unless $S1 == 'step' goto L1
    new res, 'LuaBoolean'
    $I0 = $N0
    set res, $I0
    goto L2
  L1:
    new res, 'LuaNumber'
    set res, $N0
  L2:
    .return (res)
.end


=item C<dofile (filename)>

Opens the named file and executes its contents as a Lua chunk. When called
without arguments, C<dofile> executes the contents of the standard input
(C<stdin>). Returns all values returned by the chunk. In case of errors,
C<dofile> propagates the error to its caller (that is, dofile does not run in
protected mode).

=cut

.sub 'dofile'
    .param pmc filename :optional
    .param pmc extra :slurpy
    $S1 = lua_optstring(1, filename, '')
    ($P0, $S0) = lua_loadfile($S1)
    if null $P0 goto L1
    .tailcall $P0()
  L1:
    lua_error($S0)
.end


=item C<error (message [, level])>

Terminates the last protected function called and returns C<message> as the
error message. Function C<error> never returns.

Usually, C<error> adds some information about the error position at the
beginning of the message. The C<level> argument specifies how to get the
error position. With level 1 (the default), the error position is where the
C<error> function was called. Level 2 points the error to where the function
that called C<error> was called; and so on. Passing a level 0 avoids the
addition of error position information to the message.

STILL INCOMPLETE.

=cut

.sub 'error'
    .param pmc message :optional
    .param pmc level :optional
    .param pmc extra :slurpy
    $I2 = lua_optint(2, level, 1)
    lua_checkany(1, message)
    #
    $S1 = message
    lua_error($S1)
.end


=item C<getfenv (f)>

Returns the current environment in use by the function. C<f> can be a Lua
function or a number that specifies the function at that stack level: Level
1 is the function calling C<getfenv>. If the given function is not a Lua
function, or if C<f> is 0, C<getfenv> returns the global environment. The
default for C<f> is 1.

=cut

.sub 'getfenv'
    .param pmc f :optional
    .param pmc extra :slurpy
    .local pmc res
    if null f goto L1
    .const 'LuaNumber' zero = '0'
    if f == zero goto L2
  L1:
    f = getfunc(f, 1)
    $P0 = f.'get_outer'()
    unless null $P0 goto L3
  L2:
    res = get_hll_global '_G'
    .return (res)
  L3:
    .tailcall lua_getfenv(f)
.end

.sub 'getfunc' :anon
    .param pmc f
    .param int opt
    if null f goto L1
    $I0 = isa f, 'LuaFunction'
    if $I0 goto L2
  L1:
    .local int level
    unless opt goto L3
    level = lua_optint(1, f, 1)
    goto L4
  L3:
    level = lua_checknumber(1, f)
  L4:
    if level >= 0 goto L5
    lua_argerror(1, "level must be non-negative")
  L5:
    $P0 = getinterp
    inc level
    push_eh _handler
    f = $P0['sub'; level]
    pop_eh
  L2:
    .return (f)
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = lua_x_argerror(1, "invalid level")
    e = $S0
    rethrow e
.end

=item C<getmetatable (object)>

If C<object> does not have a metatable, returns B<nil>. Otherwise, if the
object's metatable has a C<"__metatable"> field, returns the associated value.
Otherwise, returns the metatable of the given object.

=cut

.sub 'getmetatable'
    .param pmc obj :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checkany(1, obj)
    res = obj.'get_metatable'()
    if res goto L1
    .return (res)
  L1:
    .local pmc prot
    .const 'LuaString' mt = '__metatable'
    prot = res.'rawget'(mt)
    unless prot goto L2
    .return (prot)
  L2:
    .return (res)
.end


=item C<ipairs (t)>

Returns three values: an iterator function, the table C<t>, and 0, so that
the construction

    for i,v in ipairs(t) do ... end

will iterate over the pairs (C<1,t[1]>), (C<2,t[2]>), ..., up to the first
integer key with a nil value in the table.

See C<next> for the caveats of modifying the table during its traversal.

=cut

.sub 'ipairs'
    .param pmc t :optional
    .param pmc i :optional
    .param pmc extra :slurpy
    lua_checktype(1, t, 'table')
    unless null i goto L1
    .local pmc _G
    _G = get_hll_global '_G'
    .const 'LuaString' key_ipairs = 'ipairs'
    .local pmc ipairs
    ipairs = _G.'rawget'(key_ipairs)
    .local pmc zero
    new zero, 'LuaNumber'
    set zero, 0.0
    .return (ipairs, t, zero)
  L1:
    $P2 = lua_checknumber(2, i)
    $P0 = clone $P2
    inc $P0
    .local pmc res
    res = t.'rawget'($P0)
    unless res goto L2
    .return ($P0, res)
  L2:
    .return ()
.end


=item C<load (func [, chunkname])>

Loads a chunk using function C<func> to get its pieces. Each call to C<func>
must return a string that concatenates with previous results. A return of
B<nil> (or no value) signals the end of the chunk.

If there are no errors, returns the compiled chunk as a function; otherwise,
returns B<nil> plus the error message. The environment of the returned
function is the global environment.

C<chunkname> is used as the chunk name for error messages and debug
information.

NOT YET IMPLEMENTED.

=cut

.sub 'load'
    .param pmc func :optional
    .param pmc chunkname :optional
    .param pmc extra :slurpy
    lua_checktype(1, func, 'function')
    $S2 = lua_optstring(2, chunkname, '=(load)')
    not_implemented()
    .tailcall load_aux($P0, $S0)
.end

.sub 'load_aux' :anon
    .param pmc func
    .param string error
    if null func goto L1
    .return (func)
  L1:
    .local pmc msg
    new msg, 'LuaString'
    set msg, error
    new func, 'LuaNil'
    .return (func, msg)
.end


=item C<loadfile ([filename])>

Similar to C<load>, but gets the chunk from file C<filename> or from the
standard input, if no file name is given.

=cut

.sub 'loadfile'
    .param pmc filename :optional
    .param pmc extra :slurpy
    $S1 = lua_optstring(1, filename, '')
    ($P0, $S0) = lua_loadfile($S1)
    .tailcall load_aux($P0, $S0)
.end


=item C<loadstring (string [, chunkname])>

Similar to C<load>, but gets the chunk from the given string.

To load and run a given string, use the idiom

    assert(loadstring(s))()

=cut

.sub 'loadstring'
    .param pmc s :optional
    .param pmc chunkname :optional
    .param pmc extra :slurpy
    $S1 = lua_checkstring(1, s)
    $S2 = lua_optstring(2, chunkname, $S1)
    ($P0, $S0) = lua_loadbuffer($S1, $S2)
    .tailcall load_aux($P0, $S0)
.end


=item C<next (table [, index])>

Allows a program to traverse all fields of a table. Its first argument is a
table and its second argument is an index in this table. C<next> returns the
next index of the table and its associated value. When called
with B<nil> as its second argument, C<next> returns an initial index
and its associated value. When called with the last index, or with
B<nil> in an empty table, C<next> returns B<nil>. If the second argument is
absent, then it is interpreted as B<nil>. In particular, you can use
C<next(t)> to check whether a table is empty.

Lua has no declaration of fields. There is no difference between a field
not present in a table or a field with value B<nil>. Therefore, C<next> only
considers fields with non-B<nil> values. The order in which the indices are
enumerated is not specified, I<even for numeric indices>. (To traverse a table
in numeric order, use a numerical for or the C<ipairs> function.)

The behavior of C<next> is I<undefined> if, during the traversal, you assign
any value to a non-existent field in the table. You may however modify
existing fields. In particular, you may clear existing fields.

=cut

.sub 'next'
    .param pmc table :optional
    .param pmc idx :optional
    .param pmc extra :slurpy
    lua_checktype(1, table, 'table')
    $P0 = table.'next'(idx)
    unless $P0 goto L1
    .return ($P0 :flat)
  L1:
    .return ($P0)   # nil
.end


=item C<pairs (t)>

Returns three values: the C<next> function, the table C<t>, and B<nil>, so
that the construction

    for k,v in pairs(t) do ... end

will iterate over all key--value pairs of table C<t>.

See C<next> for the caveats of modifying the table during its traversal.

=cut

.sub 'pairs'
    .param pmc t :optional
    .param pmc extra :slurpy
    lua_checktype(1, t, 'table')
    .local pmc _G
    _G = get_hll_global '_G'
    .const 'LuaString' key_next = 'next'
    .local pmc next
    next = _G.'rawget'(key_next)
    .local pmc nil
    new nil, 'LuaNil'
    .return (next, t, nil)
.end


=item C<pcall (f, arg1, arg2, ...)>

Calls function C<f> with the given arguments in protected mode. This means
that any error inside C<f> is not propagated; instead, C<pcall> catches the
error and returns a status code. Its first result is the status code (a
boolean), which is B<true> if the call succeeds without errors. In such case,
C<pcall> also returns all results from the call, after this first result.
In case of any error, C<pcall> returns B<false> plus the error message.

=cut

.sub 'pcall'
    .param pmc f :optional
    .param pmc argv :slurpy
    .local pmc res
    .local pmc status
    new status, 'LuaBoolean'
    lua_checkany(1, f)
    push_eh _handler
    (res :slurpy) = f(argv :flat)
    pop_eh
    set status, 1
    .return (status, res :flat)
  _handler:
    .local pmc e
    .local string s
    .local pmc msg
    .get_results (e)
    s = e
    set status, 0
    new msg, 'LuaString'
    set msg, s
    .return (status, msg)
.end


=item C<print (e1, e2, ...)>

Receives any number of arguments, and prints their values to C<stdout>, using
the C<tostring> function to convert them to strings. C<print> is not intended
for formatted output, but only as a quick way to show a value, typically for
debugging. For formatted output, use C<string.format>.

=cut

.sub 'print'
    .param pmc argv :slurpy
    .local int argc
    .local int i
    argc = argv
    i = 0
  L1:
    if i >= argc goto L3
    if i == 0 goto L2
    print "\t"
  L2:
    $P0 = argv[i]
    $P0 = $P0.'tostring'()
    print $P0
    inc i
    goto L1
  L3:
    print "\n"
.end


=item C<rawequal (v1, v2)>

Checks whether C<v1> is equal to C<v2>, without invoking any metamethod.
Returns a boolean.

=cut

.sub 'rawequal'
    .param pmc v1 :optional
    .param pmc v2 :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checkany(1, v1)
    lua_checkany(2, v2)
    res = v1.'rawequal'(v2)
    .return (res)
.end


=item C<rawget (table, index)>

Gets the real value of C<table[index]>, without invoking any metamethod.
C<table> must be a table; C<index> is any value different from B<nil>.

=cut

.sub 'rawget'
    .param pmc table :optional
    .param pmc idx :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checktype(1, table, 'table')
    lua_checkany(2, idx)
    res = table.'rawget'(idx)
    .return (res)
.end


=item C<rawset (table, index, value)>

Sets the real value of C<table[index]> to value, without invoking any
metamethod. C<table> must be a table, C<index> is any value different from
B<nil>, and C<value> is any Lua value.

This function returns C<table>.

=cut

.sub 'rawset'
    .param pmc table :optional
    .param pmc idx :optional
    .param pmc value :optional
    .param pmc extra :slurpy
    lua_checktype(1, table, 'table')
    lua_checkany(2, idx)
    lua_checkany(3, value)
    table.'rawset'(idx, value)
    .return (table)
.end


=item C<select (index, ...)>

If C<index> is a number, returns all arguments after argument number C<index>.
Otherwise, C<index> must be the string C<"#">, and C<select> returns the
total number of extra arguments it received.

=cut

.sub 'select'
    .param pmc idx :optional
    .param pmc argv :slurpy
    .local pmc res
    unless idx goto L1
    $I0 = isa idx, 'LuaString'
    unless $I0 goto L1
    $S0 = idx
    unless $S0 == '#' goto L1
    $I1 = argv
    new res, 'LuaNumber'
    res = $I1
    .return (res)
  L1:
    .local int i
    i = lua_checknumber(1, idx)
    .local int n
    n = argv
    inc n
    unless i < 0 goto L2
    i = n + i
    goto L3
  L2:
    unless i > n goto L3
    i = n
  L3:
    if 1 <= i goto L4
    lua_argerror(1, "index out of range")
  L4:
    $I0 = n - i
    new res, 'FixedPMCArray'
    set res, $I0
    $I1 = 0
    dec i
  L5:
    unless $I1 < $I0 goto L6
    $P0 = argv[i]
    res[$I1] = $P0
    inc i
    inc $I1
    goto L5
  L6:
    .return (res :flat)
.end


=item C<setfenv (f, table)>

Sets the environment to be used by the given function. C<f> can be a Lua
function or a number that specifies the function at that stack level: Level
1 is the function calling C<setfenv>. C<setfenv> returns the given function.

As a special case, when C<f> is 0 C<setfenv> changes the environment of the
running thread. In this case, C<setfenv> returns no values.

STILL INCOMPLETE.

=cut

.sub 'setfenv'
    .param pmc f :optional
    .param pmc table :optional
    .param pmc extra :slurpy
    .const 'LuaNumber' zero = '0'
    lua_checktype(2, table, 'table')
    unless f == zero goto L1
    # change environment of current thread
    not_implemented()
    .return ()
  L1:
    f = getfunc(f, 0)
    $P0 = f.'get_outer'()
    if null $P0 goto L2
    $I0 = lua_setfenv(f, table)
    unless $I0 goto L2
    .return (f)
  L2:
    lua_error("'setfenv' cannot change environment of given object")
.end


=item C<setmetatable (table, metatable)>

Sets the metatable for the given table. (You cannot change the metatable of
other types from Lua.) If metatable is B<nil>, removes the metatable of the
given table. If the original metatable has a C<"__metatable"> field, raises
an error.

This function returns C<table>.

=cut

.sub 'setmetatable'
    .param pmc table :optional
    .param pmc metatable :optional
    .param pmc extra :slurpy
    lua_checktype(1, table, 'table')
    if null metatable goto L1
    $I0 = isa metatable, 'LuaNil'
    if $I0 goto L2
    $I0 = isa metatable, 'LuaTable'
    if $I0 goto L2
  L1:
    lua_argerror(2, "nil or table expected")
  L2:
    .local pmc meta
    meta = table.'get_metatable'()
    unless meta goto L3
    .local pmc prot
    .const 'LuaString' mt = '__metatable'
    prot = meta.'rawget'(mt)
    unless prot goto L3
    lua_error("cannot change a protected metatable")
  L3:
    table.'set_metatable'(metatable)
    .return (table)
.end


=item C<tonumber (e [, base])>

Tries to convert its argument to a number. If the argument is already a number
or a string convertible to a number, then C<tonumber> returns that number;
otherwise, it returns B<nil>.

An optional argument specifies the base to interpret the numeral. The base may
be any integer between 2 and 36, inclusive. In bases above 10, the letter ‘A’
(in either upper or lower case) represents 10, ‘B’ represents 11, and so forth,
with ‘Z’ representing 35. In base 10 (the default), the number may have a
decimal part, as well as an optional exponent part. In other bases, only
unsigned integers are accepted.

=cut

.sub 'tonumber'
    .param pmc e :optional
    .param pmc base :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checkany(1, e)
    $I2 = lua_optint(2, base, 10)
    unless $I2 == 10 goto L1
    res = e.'tonumber'()
    .return (res)
  L1:
    $P0 = lua_checkstring(1, e)
    unless 2 <= $I2 goto L2
    unless $I2 <= 36 goto L2
    goto L3
  L2:
    lua_argerror(2, "base out of range")
  L3:
    res = $P0.'tobase'($I2)
    .return (res)
.end


=item C<tostring (e)>

Receives an argument of any type and converts it to a string in a reasonable
format. For complete control of how numbers are converted, use C<format>.

If the metatable of e has a C<"__tostring"> field, C<tostring> calls the
corresponding value with C<e> as argument, and uses the result of the call
as its result.

=cut

.sub 'tostring'
    .param pmc e :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checkany(1, e)
    res = e.'tostring'()
    .return (res)
.end


=item C<type (v)>

Returns the type of its only argument, coded as a string. The possible results
of this function are C<"nil"> (a string, not the value B<nil>), C<"number">,
C<"string">, C<"boolean">, C<"table">, C<"function">, C<"thread">, and
C<"userdata">.

=cut

.sub 'type'
    .param pmc v :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checkany(1, v)
    $S0 = typeof v
    new res, 'LuaString'
    set res, $S0
    .return (res)
.end


=item C<unpack (list [, i [, j]])>

Returns the elements from the given table. This function is equivalent to

    return list[i], list[i+1], ..., list[j]

except that the above code can be written only for a fixed number of elements.
By default, C<i> is 1 and C<j> is the length of the list, as defined by the
length operator.

=cut

.sub 'unpack'
    .param pmc list :optional
    .param pmc i :optional
    .param pmc j :optional
    .param pmc extra :slurpy
    .local pmc res
    .local pmc index_
    .local int idx
    .local int e
    .local int n
    lua_checktype(1, list, 'table')
    $I0 = list.'len'()
    $I2 = lua_optint(2, i, 1)
    e = lua_optint(3, j, $I0)
    unless $I2 > e goto L1
    # empty range
    .return ()
  L1:
    n = e - $I2
    inc n
    new res, 'FixedPMCArray'
    set res, n
    new index_, 'LuaNumber'
    set index_, $I2
    idx = 0
  L2:
    unless idx < n goto L3
    $P0 = list.'rawget'(index_)
    res[idx] = $P0
    inc index_
    inc idx
    goto L2
  L3:
    .return (res :flat)
.end


=item C<xpcall (f, err)>

This function is similar to C<pcall>, except that you can set a new error
handler.

C<xpcall> calls function C<f> in protected mode, using C<err> as the error
handler. Any error inside C<f> is not propagated; instead, C<xpcall> catches
the error, calls the C<err> function with the original error object, and
returns a status code. Its first result is the status code (a boolean), which
is true if the call succeeds without errors. In this case, C<xpcall> also
returns all results from the call, after this first result. In case of any
error, C<xpcall> returns false plus the result from C<err>.

=cut

.sub 'xpcall'
    .param pmc f :optional
    .param pmc err_ :optional
    .param pmc extra :slurpy
    .local pmc res
    .local pmc status
    new status, 'LuaBoolean'
    lua_checkany(1, f)
    lua_checkany(2, err_)
    push_eh _handler
    (res :slurpy) = f()
    pop_eh
    set status, 1
    .return (status, res :flat)
  _handler:
    set status, 0
    $I0 = isa err_, 'LuaFunction'
    unless $I0 goto L1
    (res :slurpy) = err_()
    .return (status, res :flat)
  L1:
    .return (status)
.end

=back

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
