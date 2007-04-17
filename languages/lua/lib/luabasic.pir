# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

=head1 NAME

lib/luabasic.pir - Lua Basic Library

=head1 DESCRIPTION

The basic library provides some core functions to Lua.

See "Lua 5.1 Reference Manual", section 5.1 "Basic Functions".

=head2 Variables

=over 4

=cut

.HLL 'Lua', 'lua_group'

.sub 'init_basic' :load :anon

    load_bytecode 'languages/lua/lib/luaaux.pbc'

#    print "init Lua Basic\n"

    .local pmc _lua__REGISTRY
    _lua__REGISTRY = new .LuaTable
    global '_REGISTRY' = _lua__REGISTRY

    .local pmc _lua__ENVIRON
    _lua__ENVIRON = new .LuaTable
    global '_ENVIRON' = _lua__ENVIRON

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = new .LuaTable
    global '_G' = _lua__GLOBAL
    new $P1, .LuaString

    set $P1, '_LOADED'
    new $P0, .LuaTable
    _lua__REGISTRY[$P1] = $P0

=item C<_G>

A global variable (not a function) that holds the global environment (that is,
C<_G._G = _G>). Lua itself does not use this variable; changing its value
does not affect any environment, nor vice-versa. (Use C<setfenv> to change
environments.)

=cut

    set $P1, '_G'
    _lua__GLOBAL[$P1] = _lua__GLOBAL

    _register($P1, _lua__GLOBAL)

=item C<_VERSION>

A global variable (not a function) that holds a string containing the current
interpreter version. The current contents of this variable is C<"Lua 5.1">.

=cut

    new $P0, .LuaString
    set $P0, "Lua 5.1 (on Parrot)"
    set $P1, '_VERSION'
    _lua__GLOBAL[$P1] = $P0

=back

=head2 Functions

=over 4

=cut

    .const .Sub _lua_assert = '_lua_assert'
    _lua_assert.'setfenv'(_lua__GLOBAL)
    set $P1, 'assert'
    _lua__GLOBAL[$P1] = _lua_assert

    .const .Sub _lua_collectgarbage = '_lua_collectgarbage'
    _lua_collectgarbage.'setfenv'(_lua__GLOBAL)
    set $P1, 'collectgarbage'
    _lua__GLOBAL[$P1] = _lua_collectgarbage

    .const .Sub _lua_dofile = '_lua_dofile'
    _lua_dofile.'setfenv'(_lua__GLOBAL)
    set $P1, 'dofile'
    _lua__GLOBAL[$P1] = _lua_dofile

    .const .Sub _lua_error = '_lua_error'
    _lua_error.'setfenv'(_lua__GLOBAL)
    set $P1, 'error'
    _lua__GLOBAL[$P1] = _lua_error

    .const .Sub _lua_getfenv = '_lua_getfenv'
    _lua_getfenv.'setfenv'(_lua__GLOBAL)
    set $P1, 'getfenv'
    _lua__GLOBAL[$P1] = _lua_getfenv

    .const .Sub _lua_getmetatable = '_lua_getmetatable'
    _lua_getmetatable.'setfenv'(_lua__GLOBAL)
    set $P1, 'getmetatable'
    _lua__GLOBAL[$P1] = _lua_getmetatable

    .const .Sub _lua_ipairs = '_lua_ipairs'
    _lua_ipairs.'setfenv'(_lua__GLOBAL)
    set $P1, 'ipairs'
    _lua__GLOBAL[$P1] = _lua_ipairs

    .const .Sub _lua_load = '_lua_load'
    _lua_load.'setfenv'(_lua__GLOBAL)
    set $P1, 'load'
    _lua__GLOBAL[$P1] = _lua_load

    .const .Sub _lua_loadfile = '_lua_loadfile'
    _lua_loadfile.'setfenv'(_lua__GLOBAL)
    set $P1, 'loadfile'
    _lua__GLOBAL[$P1] = _lua_loadfile

    .const .Sub _lua_loadstring = '_lua_loadstring'
    _lua_loadstring.'setfenv'(_lua__GLOBAL)
    set $P1, 'loadstring'
    _lua__GLOBAL[$P1] = _lua_loadstring

    .const .Sub _lua_next = '_lua_next'
    _lua_next.'setfenv'(_lua__GLOBAL)
    set $P1, 'next'
    _lua__GLOBAL[$P1] = _lua_next

    .const .Sub _lua_pairs = '_lua_pairs'
    _lua_pairs.'setfenv'(_lua__GLOBAL)
    set $P1, 'pairs'
    _lua__GLOBAL[$P1] = _lua_pairs

    .const .Sub _lua_pcall = '_lua_pcall'
    _lua_pcall.'setfenv'(_lua__GLOBAL)
    set $P1, 'pcall'
    _lua__GLOBAL[$P1] = _lua_pcall

    .const .Sub _lua_print = '_lua_print'
    _lua_print.'setfenv'(_lua__GLOBAL)
    set $P1, 'print'
    _lua__GLOBAL[$P1] = _lua_print

    .const .Sub _lua_rawequal = '_lua_rawequal'
    _lua_rawequal.'setfenv'(_lua__GLOBAL)
    set $P1, 'rawequal'
    _lua__GLOBAL[$P1] = _lua_rawequal

    .const .Sub _lua_rawget = '_lua_rawget'
    _lua_rawget.'setfenv'(_lua__GLOBAL)
    set $P1, 'rawget'
    _lua__GLOBAL[$P1] = _lua_rawget

    .const .Sub _lua_rawset = '_lua_rawset'
    _lua_rawset.'setfenv'(_lua__GLOBAL)
    set $P1, 'rawset'
    _lua__GLOBAL[$P1] = _lua_rawset

    .const .Sub _lua_select = '_lua_select'
    _lua_select.'setfenv'(_lua__GLOBAL)
    set $P1, 'select'
    _lua__GLOBAL[$P1] = _lua_select

    .const .Sub _lua_setfenv = '_lua_setfenv'
    _lua_setfenv.'setfenv'(_lua__GLOBAL)
    set $P1, 'setfenv'
    _lua__GLOBAL[$P1] = _lua_setfenv

    .const .Sub _lua_setmetatable = '_lua_setmetatable'
    _lua_setmetatable.'setfenv'(_lua__GLOBAL)
    set $P1, 'setmetatable'
    _lua__GLOBAL[$P1] = _lua_setmetatable

    .const .Sub _lua_tonumber = '_lua_tonumber'
    _lua_tonumber.'setfenv'(_lua__GLOBAL)
    set $P1, 'tonumber'
    _lua__GLOBAL[$P1] = _lua_tonumber

    .const .Sub _lua_tostring = '_lua_tostring'
    _lua_tostring.'setfenv'(_lua__GLOBAL)
    set $P1, 'tostring'
    _lua__GLOBAL[$P1] = _lua_tostring

    .const .Sub _lua_type = '_lua_type'
    _lua_type.'setfenv'(_lua__GLOBAL)
    set $P1, 'type'
    _lua__GLOBAL[$P1] = _lua_type

    .const .Sub _lua_unpack = '_lua_unpack'
    _lua_unpack.'setfenv'(_lua__GLOBAL)
    set $P1, 'unpack'
    _lua__GLOBAL[$P1] = _lua_unpack

    .const .Sub _lua_xpcall = '_lua_xpcall'
    _lua_xpcall.'setfenv'(_lua__GLOBAL)
    set $P1, 'xpcall'
    _lua__GLOBAL[$P1] = _lua_xpcall

.end


=item C<assert (v [, message])>

Issues an error when the value of its argument C<v> is false (i.e., B<nil>
or B<false>); otherwise, returns all its arguments. C<message> is an error
message; when absent, it defaults to "assertion failed!"

=cut

.sub '_lua_assert' :anon
    .param pmc v :optional
    .param pmc message :optional
    checkany(v)
    $I0 = istrue v
    if $I0 goto L1
    $S0 = optstring(message, "assertion failed!")
    error($S0)
L1:
    .return (v, message)
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

STILL INCOMPLETE (see gc).

=cut

.sub '_lua_collectgarbage' :anon
    .param pmc opt :optional
    .param pmc arg :optional
    .local pmc ret
    new $P0, .FixedStringArray
    set $P0, 7
    $P0[0] = 'stop'
    $P0[1] = 'restart'
    $P0[2] = 'collect'
    $P0[3] = 'count'
    $P0[4] = 'step'
    $P0[5] = 'setpause'
    $P0[6] = 'setstepmul'
    $S1 = optstring(opt, 'collect')
    $I1 = checkoption($S1, $P0)
    $I2 = optint(arg, 0)
    $N0 = gc($S1, $I2)
    unless $S1 == 'step' goto L1
    new ret, .LuaBoolean
    $I0 = $N0
    set ret, $I0
    goto L2
L1:
    new ret, .LuaNumber
    set ret, $N0
L2:
    .return (ret)
.end

.include 'interpinfo.pasm'

.sub 'gc' :anon
    .param string what
    .param int data
    .local float res
    res = 0
L_stop:
    unless what == 'stop' goto L_restart
    collectoff
    goto L_end
L_restart:
    unless what == 'restart' goto L_collect
    collecton
    goto L_end
L_collect:
    unless what == 'collect' goto L_count
    collect
    goto L_end
L_count:
    unless what == 'count' goto L_step
    interpinfo $I0, .INTERPINFO_TOTAL_MEM_ALLOC
    # GC values are expressed in Kbytes
    res = $I0 / 1024
    goto L_end
L_step:
    unless what == 'step' goto L_setpause
    goto L_end
L_setpause:
    unless what == 'setpause' goto L_setstepmul
    # not_implemented()
    goto L_end
L_setstepmul:
    unless what == 'setstepmul' goto L_default
    goto L_end
L_default:
    res = -1
L_end:
    .return (res)
.end


=item C<dofile (filename)>

Opens the named file and executes its contents as a Lua chunk. When called
without arguments, C<dofile> executes the contents of the standard input
(C<stdin>). Returns all values returned by the chunk. In case of errors,
C<dofile> propagates the error to its caller (that is, dofile does not run in
protected mode).

=cut

.sub '_lua_dofile' :anon
    .param pmc filename :optional
    $S1 = optstring(filename, '')
    ($P0, $S0) = loadfile($S1)
    if null $P0 goto L1
    .return $P0()
L1:
    error($S0)
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

.sub '_lua_error' :anon
    .param pmc message :optional
    .param pmc level :optional
    $I0 = optint(level, 1)
    checkany(message)
    #
    $S0 = message
    error($S0)
.end


=item C<getfenv (f)>

Returns the current environment in use by the function. C<f> can be a Lua
function or a number that specifies the function at that stack level: Level
1 is the function calling C<getfenv>. If the given function is not a Lua
function, or if C<f> is 0, C<getfenv> returns the global environment. The
default for C<f> is 1.

=cut

.sub '_lua_getfenv' :anon
    .param pmc f :optional
    .local pmc ret
    if null f goto L1
    .const .LuaNumber zero = '0'
    if f == zero goto L2
L1:
    f = getfunc(f, 1)
    $I0 = isa f, 'LuaClosure'
    if $I0 goto L3
L2:
    ret = get_global '_G'
    .return (ret)
L3:
    .return getfenv(f)
.end

.sub 'getfunc' :anon
    .param pmc f
    .param int opt
    if null f goto L1
    $I0 = isa f, 'LuaFunction'
    if $I0 goto L2
    $I0 = isa f, 'LuaClosure'
    if $I0 goto L2
L1:
    .local int level
    unless opt goto L3
    level = optint(f, 1)
    goto L4
L3:
    level = checknumber(f)
L4:
    if level >= 0 goto L5
    error("level must be non-negative")
L5:
    $P0 = getinterp
    inc level
    push_eh _handler
    f = $P0['sub'; level]
L2:
    .return (f)
_handler:
    error("invalid level")
.end

=item C<getmetatable (object)>

If C<object> does not have a metatable, returns B<nil>. Otherwise, if the
object's metatable has a C<"__metatable"> field, returns the associated value.
Otherwise, returns the metatable of the given object.

=cut

.sub '_lua_getmetatable' :anon
    .param pmc obj :optional
    .local pmc ret
    checkany(obj)
    ret = obj.'get_metatable'()
    if ret goto L1
    .return (ret)
L1:
    .local pmc prot
    .const .LuaString mt = '__metatable'
    prot = ret.'rawget'(mt)
    unless prot goto L2
    .return (prot)
L2:
    .return (ret)
.end


=item C<ipairs (t)>

Returns three values: an iterator function, the table C<t>, and 0, so that
the construction

    for i,v in ipairs(t) do ... end

will iterate over the pairs (C<1,t[1]>), (C<2,t[2]>), ..., up to the first
integer key with a nil value in the table.

See C<next> for the caveats of modifying the table during its traversal.

=cut

.sub '_lua_ipairs' :anon
    .param pmc t :optional
    .param pmc i :optional
    checktype(t, 'table')
    unless null i goto L1
    .local pmc _G
    _G = global '_G'
    .const .LuaString key_ipairs = 'ipairs'
    .local pmc ipairs
    ipairs = _G.'rawget'(key_ipairs)
    .local pmc zero
    new zero, .LuaNumber
    set zero, 0.0
    .return (ipairs, t, zero)
L1:
    $P0 = checknumber(i)
    $P1 = clone $P0
    inc $P1
    .local pmc ret
    ret = t.'rawget'($P1)
    unless ret goto L2
    .return ($P1, ret)
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

.sub '_lua_load' :anon
    .param pmc func :optional
    .param pmc chunkname :optional
    checktype(func, 'function')
    $S2 = optstring(chunkname, '=(load)')
    not_implemented()
    .return load_aux($P0, $S0)
.end

.sub 'load_aux' :anon
    .param pmc func
    .param string error
    if null func goto L1
    .return (func)
L1:
    .local pmc msg
    new msg, .LuaString
    set msg, error
    new func, .LuaNil
    .return (func, msg)
.end


=item C<loadfile ([filename])>

Similar to C<load>, but gets the chunk from file C<filename> or from the
standard input, if no file name is given.

=cut

.sub '_lua_loadfile' :anon
    .param pmc filename :optional
    $S1 = optstring(filename, '')
    ($P0, $S0) = loadfile($S1)
    .return load_aux($P0, $S0)
.end


=item C<loadstring (string [, chunkname])>

Similar to C<load>, but gets the chunk from the given string.

To load and run a given string, use the idiom

    assert(loadstring(s))()

=cut

.sub '_lua_loadstring' :anon
    .param pmc s :optional
    .param pmc chunkname :optional
    $S1 = checkstring(s)
    $S2 = optstring(chunkname, $S1)
    ($P0, $S0) = loadbuffer($S1, $S2)
    .return load_aux($P0, $S0)
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

.sub '_lua_next' :anon
    .param pmc table :optional
    .param pmc idx :optional
    checktype(table, 'table')
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

.sub '_lua_pairs' :anon
    .param pmc t :optional
    checktype(t, 'table')
    .local pmc _G
    _G = global '_G'
    .const .LuaString key_next = 'next'
    .local pmc next
    next = _G.'rawget'(key_next)
    .local pmc nil
    new nil, .LuaNil
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

.sub '_lua_pcall' :anon
    .param pmc f :optional
    .param pmc argv :slurpy
    .local pmc ret
    .local pmc status
    new status, .LuaBoolean
    checkany(f)
    push_eh _handler
    (ret :slurpy) = f(argv :flat)
    set status, 1
    .return (status, ret :flat)
_handler:
    .local pmc e
    .local string s
    .local pmc msg
    .get_results (e, s)
    set status, 0
    new msg, .LuaString
    set msg, s
    .return (status, msg)
.end


=item C<print (e1, e2, ...)>

Receives any number of arguments, and prints their values to C<stdout>, using
the C<tostring> function to convert them to strings. C<print> is not intended
for formatted output, but only as a quick way to show a value, typically for
debugging. For formatted output, use C<string.format>.

=cut

.sub '_lua_print' :anon
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
    $P1 = $P0.'tostring'()
    print $P1
    inc i
    goto L1
L3:
    print "\n"
.end


=item C<rawequal (v1, v2)>

Checks whether C<v1> is equal to C<v2>, without invoking any metamethod.
Returns a boolean.

=cut

.sub '_lua_rawequal' :anon
    .param pmc v1 :optional
    .param pmc v2 :optional
    .local pmc ret
    checkany(v1)
    checkany(v2)
    ret = v1.'rawequal'(v2)
    .return (ret)
.end


=item C<rawget (table, index)>

Gets the real value of C<table[index]>, without invoking any metamethod.
C<table> must be a table; C<index> is any value different from B<nil>.

=cut

.sub '_lua_rawget' :anon
    .param pmc table :optional
    .param pmc idx :optional
    .local pmc ret
    checktype(table, 'table')
    checkany(idx)
    ret = table.'rawget'(idx)
    .return (ret)
.end


=item C<rawset (table, index, value)>

Sets the real value of C<table[index]> to value, without invoking any
metamethod. C<table> must be a table, C<index> is any value different from
B<nil>, and C<value> is any Lua value.

This function returns C<table>.

=cut

.sub '_lua_rawset' :anon
    .param pmc table :optional
    .param pmc idx :optional
    .param pmc value :optional
    checktype(table, 'table')
    checkany(idx)
    checkany(value)
    table.'rawset'(idx, value)
    .return (table)
.end


=item C<select (index, ...)>

If C<index> is a number, returns all arguments after argument number C<index>.
Otherwise, C<index> must be the string C<"#">, and C<select> returns the
total number of extra arguments it received.

=cut

.sub '_lua_select' :anon
    .param pmc idx :optional
    .param pmc argv :slurpy
    .local pmc ret
    unless idx goto L1
    $I0 = isa idx, 'LuaString'
    unless $I0 goto L1
    $S0 = idx
    unless $S0 == '#' goto L1
    $I1 = argv
    new ret, .LuaNumber
    ret = $I1
    .return (ret)
L1:
    .local int i
    i = checknumber(idx)
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
    argerror("index out of range")
L4:
    $I0 = n - i
    new ret, .FixedPMCArray
    set ret, $I0
    $I1 = 0
    dec i
L5:
    unless $I1 < $I0 goto L6
    $P0 = argv[i]
    ret[$I1] = $P0
    inc i
    inc $I1
    goto L5
L6:
    .return (ret :flat)
.end


=item C<setfenv (f, table)>

Sets the environment to be used by the given function. C<f> can be a Lua
function or a number that specifies the function at that stack level: Level
1 is the function calling C<setfenv>. C<setfenv> returns the given function.

As a special case, when C<f> is 0 C<setfenv> changes the environment of the
running thread. In this case, C<setfenv> returns no values.

STILL INCOMPLETE.

=cut

.sub '_lua_setfenv' :anon
    .param pmc f :optional
    .param pmc table :optional
    .const .LuaNumber zero = '0'
    checktype(table, 'table')
    unless f == zero goto L1
    # change environment of current thread
    not_implemented()
    .return ()
L1:
    f = getfunc(f, 0)
    $I0 = isa f, 'LuaFunction'
    if $I0 goto L2
    $I0 = setfenv(f, table)
    unless $I0 goto L2
    .return (f)
L2:
    error("'setfenv' cannot change environment of given object")
.end


=item C<setmetatable (table, metatable)>

Sets the metatable for the given table. (You cannot change the metatable of
other types from Lua.) If metatable is B<nil>, removes the metatable of the
given table. If the original metatable has a C<"__metatable"> field, raises
an error.

This function returns C<table>.

=cut

.sub '_lua_setmetatable' :anon
    .param pmc table :optional
    .param pmc metatable :optional
    checktype(table, 'table')
    if null metatable goto L0
    $I0 = isa metatable, 'LuaNil'
    if $I0 goto L1
    $I0 = isa metatable, 'LuaTable'
    if $I0 goto L1
L0:
    argerror("nil or table expected")
L1:
    .local pmc meta
    meta = table.'get_metatable'()
    unless meta goto L3
    .local pmc prot
    .const .LuaString mt = '__metatable'
    prot = meta.'rawget'(mt)
    unless prot goto L3
    error("cannot change a protected metatable")
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

.sub '_lua_tonumber' :anon
    .param pmc e :optional
    .param pmc base :optional
    .local pmc ret
    checkany(e)
    $I0 = optint(base, 10)
    unless $I0 == 10 goto L1
    ret = e.'tonumber'()
    .return (ret)
L1:
    $P0 = checkstring(e)
    unless 2 <= $I0 goto L2
    unless $I0 <= 36 goto L2
    goto L3
L2:
    argerror("base out of range")
L3:
    ret = $P0.'tobase'($I0)
    .return (ret)
.end


=item C<tostring (e)>

Receives an argument of any type and converts it to a string in a reasonable
format. For complete control of how numbers are converted, use C<format>.

If the metatable of e has a C<"__tostring"> field, C<tostring> calls the
corresponding value with C<e> as argument, and uses the result of the call
as its result.

=cut

.sub '_lua_tostring' :anon
    .param pmc e :optional
    .local pmc ret
    checkany(e)
    ret = e.'tostring'()
    .return (ret)
.end


=item C<type (v)>

Returns the type of its only argument, coded as a string. The possible results
of this function are C<"nil"> (a string, not the value B<nil>), C<"number">,
C<"string">, C<"boolean">, C<"table">, C<"function">, C<"thread">, and
C<"userdata">.

=cut

.sub '_lua_type' :anon
    .param pmc v :optional
    .local pmc ret
    checkany(v)
    $S0 = typeof v
    new ret, .LuaString
    set ret, $S0
    .return (ret)
.end


=item C<unpack (list [, i [, j]])>

Returns the elements from the given table. This function is equivalent to

    return list[i], list[i+1], ..., list[j]

except that the above code can be written only for a fixed number of elements.
By default, C<i> is 1 and C<j> is the length of the list, as defined by the
length operator.

=cut

.sub '_lua_unpack' :anon
    .param pmc list :optional
    .param pmc i :optional
    .param pmc j :optional
    .local pmc ret
    .local pmc index
    .local int idx
    .local int e
    .local int n
    checktype(list, 'table')
    $I0 = list.'len'()
    $I1 = optint(i, 1)
    e = optint(j, $I0)
    n = e - $I1
    inc n
    new ret, .FixedPMCArray
    set ret, n
    new index, .LuaNumber
    set index, $I1
    idx = 0
L0:
    unless idx < n goto L1
    $P0 = list.'rawget'(index)
    ret[idx] = $P0
    inc index
    inc idx
    goto L0
L1:
    .return (ret :flat)
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

.sub '_lua_xpcall' :anon
    .param pmc f :optional
    .param pmc err :optional
    .local pmc ret
    .local pmc status
    new status, .LuaBoolean
    checkany(f)
    checkany(err)
    push_eh _handler
    (ret :slurpy) = f()
    set status, 1
    .return (status, ret :flat)
_handler:
    .local pmc e
    .local pmc msg
    set status, 0
    $I0 = isa err, 'LuaFunction'
    if $I0 goto L1
    $I0 = isa err, 'LuaClosure'
    unless $I0 goto L2
L1:
    .get_results (e)
    (ret :slurpy) = err(e)
    .return (status, ret :flat)
L2:
    .return (status)
.end

=back

=head1 AUTHORS

Francois Perrad.

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
