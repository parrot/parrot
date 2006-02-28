# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

lib/luabasic.pir - Lua Basic Library

=head1 DESCRIPTION

The basic library provides some core functions to Lua.

See "Lua 5.0 Reference Manual", section 5.1 "Basic Functions".

=head2 Variables

=over 4

=cut

.namespace [ "Lua" ]
.HLL "Lua", "lua_group"


.sub init :load, :anon

    load_bytecode "languages/lua/lib/luapir.pbc"

#    print "init Lua Basic\n"

    .local pmc _lua__G
    _lua__G = new .LuaTable
    global "_G" = _lua__G
    $P1 = new .LuaString

=item C<_G>

A global variable (not a function) that holds the global environment (that is,
C<_G._G = _G>). Lua itself does not use this variable; changing its value
does not affect any environment. (Use C<setfenv> to change environments.)

=cut

    $P1 = "_G"
    _lua__G[$P1] = _lua__G

=item C<_VERSION>

A global variable (not a function) that holds a string containing the current
interpreter version. The current content of this string is C<"Lua 5.0">.

=cut

    $P0 = new .LuaString
    $P0 = "Lua 5.0 (on Parrot)"
    $P1 = "_VERSION"
    _lua__G[$P1] = $P0

=back

=head2 Functions

=over 4

=cut

    .const .Sub _lua_assert = "_lua_assert"
    $P0 = _lua_assert
    $P1 = "assert"
    _lua__G[$P1] = $P0

    .const .Sub _lua_collectgarbage = "_lua_collectgarbage"
    $P0 = _lua_collectgarbage
    $P1 = "collectgarbage"
    _lua__G[$P1] = $P0

    .const .Sub _lua_dofile = "_lua_dofile"
    $P0 = _lua_dofile
    $P1 = "dofile"
    _lua__G[$P1] = $P0

    .const .Sub _lua_error = "_lua_error"
    $P0 = _lua_error
    $P1 = "error"
    _lua__G[$P1] = $P0

    .const .Sub _lua_getfenv = "_lua_getfenv"
    $P0 = _lua_getfenv
    $P1 = "getfenv"
    _lua__G[$P1] = $P0

    .const .Sub _lua_getmetatable = "_lua_getmetatable"
    $P0 = _lua_getmetatable
    $P1 = "getmetatable"
    _lua__G[$P1] = $P0

    .const .Sub _lua_gcinfo = "_lua_gcinfo"
    $P0 = _lua_gcinfo
    $P1 = "gcinfo"
    _lua__G[$P1] = $P0

    .const .Sub _lua_ipairs = "_lua_ipairs"
    $P0 = _lua_ipairs
    $P1 = "ipairs"
    _lua__G[$P1] = $P0

    .const .Sub _lua_loadfile = "_lua_loadfile"
    $P0 = _lua_loadfile
    $P1 = "loadfile"
    _lua__G[$P1] = $P0

    .const .Sub _lua_loadlib = "_lua_loadlib"
    $P0 = _lua_loadlib
    $P1 = "loadlib"
    _lua__G[$P1] = $P0

    .const .Sub _lua_loadstring = "_lua_loadstring"
    $P0 = _lua_loadstring
    $P1 = "loadstring"
    _lua__G[$P1] = $P0

    .const .Sub _lua_next = "_lua_next"
    $P0 = _lua_next
    $P1 = "next"
    _lua__G[$P1] = $P0

    .const .Sub _lua_pairs = "_lua_pairs"
    $P0 = _lua_pairs
    $P1 = "pairs"
    _lua__G[$P1] = $P0

    .const .Sub _lua_pcall = "_lua_pcall"
    $P0 = _lua_pcall
    $P1 = "pcall"
    _lua__G[$P1] = $P0

    .const .Sub _lua_print = "_lua_print"
    $P0 = _lua_print
    $P1 = "print"
    _lua__G[$P1] = $P0

    .const .Sub _lua_rawequal = "_lua_rawequal"
    $P0 = _lua_rawequal
    $P1 = "rawequal"
    _lua__G[$P1] = $P0

    .const .Sub _lua_rawget = "_lua_rawget"
    $P0 = _lua_rawget
    $P1 = "rawget"
    _lua__G[$P1] = $P0

    .const .Sub _lua_rawset = "_lua_rawset"
    $P0 = _lua_rawset
    $P1 = "rawset"
    _lua__G[$P1] = $P0

    .const .Sub _lua_require = "_lua_require"
    $P0 = _lua_require
    $P1 = "require"
    _lua__G[$P1] = $P0

    .const .Sub _lua_setfenv = "_lua_setfenv"
    $P0 = _lua_setfenv
    $P1 = "setfenv"
    _lua__G[$P1] = $P0

    .const .Sub _lua_setmetatable = "_lua_setmetatable"
    $P0 = _lua_setmetatable
    $P1 = "setmetatable"
    _lua__G[$P1] = $P0

    .const .Sub _lua_tonumber = "_lua_tonumber"
    $P0 = _lua_tonumber
    $P1 = "tonumber"
    _lua__G[$P1] = $P0

    .const .Sub _lua_tostring = "_lua_tostring"
    $P0 = _lua_tostring
    $P1 = "tostring"
    _lua__G[$P1] = $P0

    .const .Sub _lua_type = "_lua_type"
    $P0 = _lua_type
    $P1 = "type"
    _lua__G[$P1] = $P0

    .const .Sub _lua_unpack = "_lua_unpack"
    $P0 = _lua_unpack
    $P1 = "unpack"
    _lua__G[$P1] = $P0

    .const .Sub _lua_xpcall = "_lua_xpcall"
    $P0 = _lua_xpcall
    $P1 = "xpcall"
    _lua__G[$P1] = $P0

.end

=item C<assert (v [, message])>

Issues an error when the value of its argument C<v> is B<nil> or B<false>;
otherwise, returns this value. C<message> is an error message; when absent,
it defaults to "assertion failed!"

=cut

.sub _lua_assert :anon
    .param pmc v :optional
    .param pmc message :optional
    checkany(v)
    $I0 = istrue v
    if $I0 goto L0
    $S0 = optstring(message, "assertion failed!")
    error($S0)
L0:
.end

=item C<collectgarbage ([limit])>

Sets the garbage-collection threshold to the given limit (in Kbytes) and
checks it against the byte counter. If the new threshold is smaller than the
byte counter, then Lua immediately runs the garbage collector. If C<limit>
is absent, it defaults to zero (thus forcing a garbage-collection cycle).

NOT YET IMPLEMENTED.

=cut

.sub _lua_collectgarbage :anon
    .param pmc limit :optional
    $I0 = optint(limit, 0)
    not_implemented()
.end

=item C<dofile (filename)>

Opens the named file and executes its contents as a Lua chunk. When called
without arguments, C<dofile> executes the contents of the standard input
(C<stdin>). Returns any value returned by the chunk. In case of errors,
C<dofile> propagates the error to its caller (that is, it does not run in
protected mode).

NOT YET IMPLEMENTED.

=cut

.sub _lua_dofile :anon
    .param pmc filename :optional
    $S0 = optstring(filename, "")
    not_implemented()
.end

=item C<error (message [, level])>

Terminates the last protected function called and returns C<message> as the
error message. Function C<error> never returns.

The C<level> argument specifies where the error message points the error. With
level 1 (the default), the error position is where the C<error> function was
called. Level 2 points the error to where the function that called C<error>
was called; and so on.

STILL INCOMPLETE.

=cut

.sub _lua_error :anon
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
function or a number, which specifies the function at that stack level: Level
1 is the function calling C<getfenv>. If the given function is not a Lua
function, or if C<f> is 0, C<getfenv> returns the global environment. The
default for C<f> is 1.

If the environment has a C<"__fenv"> field, returns the associated value,
instead of the environment.

NOT YET IMPLEMENTED.

=cut

.sub _lua_getfenv :anon
    not_implemented()
.end

=item C<getmetatable (object)>

If the object does not have a metatable, returns B<nil>. Otherwise, if the
object’s metatable has a C<"__metatable"> field, returns the associated value.
Otherwise, returns the metatable of the given object.

=cut

.sub _lua_getmetatable :anon
    .param pmc obj :optional
    .local pmc ret
    checkany(obj)
    ret = getprop "__metatable", obj
    if ret goto L1
    new ret, .LuaNil
    .return (ret)
L1:
    .local pmc prot
    .const .LuaString mt = "__metatable"
    prot = ret[mt]
    unless prot goto L2
    .return (prot)
L2:
    .return (ret)
.end

=item C<gcinfo ()>

Returns two results: the number of Kbytes of dynamic memory that Lua is
using and the current garbage collector threshold (also in Kbytes).

NOT YET IMPLEMENTED.

=cut

.sub _lua_gcinfo :anon
    not_implemented()
.end

=item C<ipairs (t)>

Returns an iterator function, the table C<t>, and 0, so that the construction

    for i,v in ipairs(t) do ... end

will iterate over the pairs (C<1,t[1]>), (C<2,t[2]>), ... , up to the first
integer key with a nil value in the table.

=cut

.sub _lua_ipairs :anon
    .param pmc t :optional
    .param pmc i :optional
    checktype(t, "table")
    unless_null i, L0
    .local pmc _G
    _G = global "_G"
    .const .LuaString key_ipairs = "ipairs"
    .local pmc ipairs
    ipairs = _G[key_ipairs]
    .local pmc zero
    new zero, .LuaNumber
    zero = 0.0
    .return (ipairs, t, zero)
L0:
    $N0 = checknumber(i)
    inc $N0
    .local pmc ret
    .local pmc n
    new n, .LuaNumber
    n = $N0
    ret = t[n]
    unless ret goto L1
    .return (n, ret)
L1:
    .return ()
.end

=item C<loadfile (filename)>

Loads a file as a Lua chunk (without running it). If there are no errors,
returns the compiled chunk as a function; otherwise, returns B<nil> plus the
error message. The environment of the returned function is the global
environment.

NOT YET IMPLEMENTED.

=cut

.sub _lua_loadfile :anon
    .param pmc filename :optional
    $S0 = optstring(filename, "")
    not_implemented()
.end

=item C<loadlib (libname, funcname)>

Links the program with the dynamic C library C<libname>. Inside this library,
looks for a function C<funcname> and returns this function as a C function.

C<libname> must be the complete file name of the C library, including any
eventual path and extension.

NOT YET IMPLEMENTED.

=cut

.sub _lua_loadlib :anon
    not_implemented()
.end

=item C<loadstring (string [, chunkname])>

Loads a string as a Lua chunk (without running it). If there are no errors,
returns the compiled chunk as a function; otherwise, returns B<nil> plus the
error message. The environment of the returned function is the global
environment.

The optional parameter C<chunkname> is the name to be used in error messages
and debug information.

To load and run a given string, use the idiom

    assert(loadstring(s))()

NOT YET IMPLEMENTED.

=cut

.sub _lua_loadstring :anon
    .param pmc s :optional
    .param pmc chunkname :optional
    $S0 = checkstring(s)
    $S1 = optstring(chunkname, s)
    not_implemented()
.end

=item C<next (table [, index])>

Allows a program to traverse all fields of a table. Its first argument is a
table and its second argument is an index in this table. C<next> returns the
next index of the table and the value associated with the index. When called
with B<nil> as its second argument, C<next> returns the first index of the
table and its associated value. When called with the last index, or with
B<nil> in an empty table, C<next> returns B<nil>. If the second argument is
absent, then it is interpreted as B<nil>.

Lua has no declaration of fields; There is no difference between a field
not present in a table or a field with value B<nil>. Therefore, C<next> only
considers fields with non-B<nil> values. The order in which the indices are
enumerated is not specified, I<even for numeric indices>. (To traverse a table
in numeric order, use a numerical for or the C<ipairs> function.)

The behavior of C<next> is I<undefined> if, during the traversal, you assign
any value to a non-existent field in the table.

STILL INCOMPLETE (see next in luapir.pir).

=cut

.sub _lua_next :anon
    .param pmc table :optional
    .param pmc index :optional
    .local pmc idx
    .local pmc value
    checktype(table, "table")
    (idx, value) = next(table, index)
    unless idx goto L1
    .return (idx, value) 
L1:
    .return (idx)	# nil                               
.end

=item C<pairs (t)>

Returns the C<next> function and the table C<t> (plus a B<nil>), so that the
construction

    for k,v in pairs(t) do ... end

will iterate over all key-value pairs of table C<t>.

STILL INCOMPLETE (see next).

=cut

.sub _lua_pairs :anon
    .param pmc t :optional
    checktype(t, "table")
    .local pmc _G
    _G = global "_G"
    .const .LuaString key_next = "next"
    .local pmc next
    next = _G[key_next]
    .local pmc nil
    new nil, .LuaNil
    .return (next, t, nil)
.end

=item C<pcall (f, arg1, arg2, ...)>

Calls function C<f> with the given arguments in protected mode. That means
that any error inside C<f> is not propagated; instead, C<pcall> catches the
error and returns a status code. Its first result is the status code (a
boolean), which is B<true> if the call succeeds without errors. In such case,
C<pcall> also returns all results from the call, after this first result.
In case of any error, C<pcall> returns B<false> plus the error message.

=cut

.sub _lua_pcall :anon
    .param pmc f :optional
    .param pmc argv :slurpy
    .local pmc ret
    .local pmc status
    new status, .LuaBoolean
    checkany(f)
    push_eh _handler
    (ret :slurpy) = f(argv :flat)
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

=item C<print (e1, e2, ...)>

Receives any number of arguments, and prints their values in C<stdout>, using
the C<tostring> function to convert them to strings. This function is not
intended for formatted output, but only as a quick way to show a value,
typically for debugging. For formatted output, use C<format>.

=cut

.sub _lua_print :anon
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
    $P1 = $P0."tostring"()
    print $P1
    inc i
    goto L1
L3:
    print "\n"
.end

=item C<rawequal (v1, v2)>

Checks whether C<v1> is equal to C<v2>, without invoking any metamethod.
Returns a boolean.

NOT YET IMPLEMENTED.

=cut

.sub _lua_rawequal :anon
    .param pmc v1 :optional
    .param pmc v2 :optional
    checkany(v1)
    checkany(v2)
    not_implemented()
.end

=item C<rawget (table, index)>

Gets the real value of C<table[index]>, without invoking any metamethod.
C<table> must be a table; C<index> is any value different from B<nil>.

=cut

.sub _lua_rawget :anon
    .param pmc table :optional
    .param pmc index :optional
    .local pmc ret
    checktype(table, "table")
    checkany(index)
#    ret = table[index]
     ret = table."rawget"(index)
    .return (ret)
.end

=item C<rawset (table, index, value)>

Sets the real value of C<table[index]> to value, without invoking any
metamethod. C<table> must be a table, C<index> is any value different from
B<nil>, and C<value> is any Lua value.

=cut

.sub _lua_rawset :anon
    .param pmc table :optional
    .param pmc index :optional
    .param pmc value :optional
    checktype(table, "table")
    checkany(index)
    checkany(value)
#    table[index] = value
    table."rawset"(index, value)
    .return ()
.end

=item C<require (packagename)>

Loads the given package. The function starts by looking into the table
C<_LOADED> to determine whether C<packagename> is already loaded. If it is,
then C<require> returns the value that the package returned when it was first
loaded. Otherwise, it searches a path looking for a file to load.

If the global variable C<LUA_PATH> is a string, this string is the path.
Otherwise, C<require> tries the environment variable C<LUA_PATH>. As a last
resort, it uses the predefined path F<"?;?.lua">.

The path is a sequence of I<templates> separated by semicolons. For each
template, C<require> will change each interrogation mark in the template to
C<packagename>, and then will try to load the resulting file name. So, for
instance, if the path is

    "./?.lua;./?.lc;/usr/local/?/?.lua;/lasttry"

a C<require "mod"> will try to load the files F<./mod.lua>, F<./mod.lc>,
F</usr/local/mod/mod.lua>, and F</lasttry>, in that order.

The function stops the search as soon as it can load a file, and then it runs
the file. After that, it associates, in table C<_LOADED>, the package name
with the value that the package returned, and returns that value. If the
package returns B<nil> (or no value), require converts this value to true.
If the package returns B<false>, C<require> also returns B<false>. However,
as the mark in table C<_LOADED> is B<false>, any new attempt to reload the
file will happen as if the package was not loaded (that is, the package will
be loaded again).

If there is any error loading or running the file, or if it cannot find any
file in the path, then C<require> signals an error.

While running a file, C<require> defines the global variable C<_REQUIREDNAME>
with the package name. The package being loaded always runs within the global
environment.

NOT YET IMPLEMENTED.

=cut

.sub _lua_require :anon
    .param pmc packagename :optional
    $S0 = checkstring(packagename)
    not_implemented()
.end

=item C<setfenv (f, table)>

Sets the current environment to be used by the given function. C<f> can be a
Lua function or a number, which specifies the function at that stack level:
Level 1 is the function calling C<setfenv>.

As a special case, when C<f> is 0 C<setfenv> changes the global environment
of the running thread. If the original environment has a C<"__fenv"> field,
C<setfenv> raises an error.

NOT YET IMPLEMENTED.

=cut

.sub _lua_setfenv :anon
    .param pmc f :optional
    .param pmc table :optional
    checktype(table, "table")
    not_implemented()
.end

=item C<setmetatable (table, metatable)>

Sets the metatable for the given table. (You cannot change the metatable of
a userdata from Lua.) If metatable is B<nil>, removes the metatable of the
given table. If the original metatable has a C<"__metatable"> field, raises
an error.

=cut

.sub _lua_setmetatable :anon
    .param pmc table :optional
    .param pmc metatable :optional
    checktype(table, "table")
    if_null metatable, L0
    $S0 = typeof metatable
    if $S0 == "nil" goto L1
    if $S0 == "table" goto L1
L0:
    argerror("nil or table expected")
L1:
    .local pmc meta
    meta = getprop "__metatable", table
    unless meta goto L3
    .local pmc prot
    .const .LuaString mt = "__metatable"
    prot = meta[mt]
    unless prot goto L3
    error("cannot change a protected metatable")
L3:
    if $S0 == "table" goto L4
    delprop table, "__metatable"
    .return ()
L4:    
    setprop table, "__metatable", metatable
    .return ()
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

.sub _lua_tonumber :anon
    .param pmc e :optional 
    .param pmc base :optional
    .local pmc ret
    checkany(e)
    $I0 = optint(base, 10)
    unless $I0 == 10 goto L1
    ret = e."tonumber"()
    .return (ret)
L1:
    $P0 = checkstring(e)
    unless 2 <= $I0 goto L2
    unless $I0 <= 36 goto L2
    goto L3
L2:
    argerror("base out of range")
L3:
    ret = $P0."tobase"($I0)
    .return (ret)
.end

=item C<tostring (e)>

Receives an argument of any type and converts it to a string in a reasonable
format. For complete control of how numbers are converted, use C<format>.

If the metatable of e has a C<"__tostring"> field, C<tostring> calls the
corresponding value with C<e> as argument, and uses the result of the call
as its result.

=cut

.sub _lua_tostring :anon
    .param pmc e :optional
    .local pmc ret
    checkany(e)
    ret = e."tostring"()
    .return (ret)
.end

=item C<type (v)>

Returns the type of its only argument, coded as a string. The possible results
of this function are C<"nil"> (a string, not the value B<nil>), C<"number">,
C<"string">, C<"boolean">, C<"table">, C<"function">, C<"thread">, and
C<"userdata">.

=cut

.sub _lua_type :anon
    .param pmc v :optional
    .local pmc ret
    checkany(v)
    $S0 = typeof v
    new ret, .LuaString
    ret = $S0
    .return (ret)
.end

=item C<unpack (list)>

Returns all elements from the given list. This function is equivalent to

    return list[1], list[2], ..., list[n]

except that the above code can be written only for a fixed I<n>. The number
I<n> is the size of the list, as defined for the C<table.getn> function.

=cut

.sub _lua_unpack :anon
    .param pmc list :optional
    .local pmc ret
    .local pmc index
    .local int n
    .local int i
    checktype(list, "table")
    n = getn(list)
    new ret, .Array
    set ret, n
    new index, .LuaNumber
    index = 1.0
    i = 0
L0:    
    unless i < n goto L1
    $P0 = list[index]
    ret[i] = $P0
    inc index
    inc i
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
is true if the call succeeds without errors. In such case, C<xpcall> also
returns all results from the call, after this first result. In case of any
error, C<xpcall> returns false plus the result from C<err>.

=cut

.sub _lua_xpcall :anon
    .param pmc f :optional
    .param pmc err :optional
    .local pmc ret
    .local pmc status
    new status, .LuaBoolean
    checkany(f)
    checkany(err)
    push_eh _handler
    (ret :slurpy) = f()
    status = 1
    .return (status, ret :flat)
_handler:
    .local pmc e
    .local pmc msg
    status = 0
    $S0 = typeof err
    unless $S0 == "Sub" goto L0    
    .get_results (e)
    (ret :slurpy) = err(e)
    .return (status, ret :flat)
L0:
    .return (status)    
.end

=back

=head1 AUTHORS

Francois Perrad.

=cut

