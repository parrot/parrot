# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

lib/luapackage.pir - Lua Package Library

=head1 DESCRIPTION

The package library provides basic facilities for loading and building
modules in Lua. It exports two of its functions directly in the global
environment: C<require> and C<module>. Everything else is exported in a
table C<package>.

See "Lua 5.1 Reference Manual", section 5.3 "Modules".

=cut

.HLL 'Lua', 'lua_group'

.sub 'init_package' :load :anon

    load_bytecode 'languages/lua/lib/luabasic.pbc'

#    print "init Lua Package\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = global '_G'
    new $P1, .LuaString

    .const .Sub _lua_module = '_lua_module'
    set $P1, 'module'
    _lua__GLOBAL[$P1] = _lua_module

    .const .Sub _lua_require = '_lua_require'
    set $P1, 'require'
    _lua__GLOBAL[$P1] = _lua_require

    .local pmc _package
    new _package, .LuaTable
    set $P1, 'package'
    _lua__GLOBAL[$P1] = _package

    _register($P1, _package)

    .const .Sub _package_loadlib = '_package_loadlib'
    set $P1, 'loadlib'
    _package[$P1] = _package_loadlib

    # LUA_COMPAT_LOADLIB
    _lua__GLOBAL[$P1] = _package_loadlib

    .const .Sub _package_seeall = '_package_seeall'
    set $P1, 'seeall'
    _package[$P1] = _package_seeall

    .local pmc _lua__ENVIRON
    _lua__ENVIRON = global '_ENVIRON'

    .local pmc _loaders
    new _loaders, .LuaTable
    set $P1, 'loaders'
    _lua__ENVIRON[$P1] = _loaders
    _package[$P1] = _loaders
    new $P2, .LuaNumber

    .const .Sub loader_Lua = 'loader_Lua'
    set $P2, 1
    _loaders[$P2] = loader_Lua

    setpath(_package, 'path', 'LUA_PATH', '')
    setpath(_package, 'pirpath', 'LUA_PIRPATH', '')

    .local pmc _lua__REGISTRY
    _lua__REGISTRY = global '_REGISTRY'
    set $P1, '_LOADED'
    $P0 = _lua__REGISTRY[$P1]
    set $P1, 'loaded'
    _package[$P1] = $P0

    new $P0, .LuaTable
    set $P1, 'preload'
    _package[$P1] = $P0

.end

.sub 'setpath' :anon
    .param pmc package
    .param string fieldname
    .param string envname
    .param string default
    new $P1, .LuaString
    set $P1, fieldname
    new $P0, .Env
    $S0 = $P0[envname]
    if $S0 goto L1
    $S0 = default
    goto L2
L1:
L2:
    new $P0, .LuaString
    set $P0, $S0
    package[$P1] = $P0
.end

.sub 'findfile' :anon
    .param pmc name
    .param string pname
    $S0 = name
    $S0 .= '.lua'
    $I0 = stat $S0, 0
    unless $I0 goto L1
    .return ($S0)
L1:
    $S1 = "\n\tno file '"
    $S1 .= $S0
    $S1 .= "'"
    new $P0, .LuaString
    set $P0, $S1
    .return ('', $P0)
.end

.sub 'loaderror' :anon
    .param string name
    .param string filename
    .param string msg
    $S0 = "error loading module '"
    $S0 .= name
    $S0 .= "' from file '"
    $S0 .= filename
    $S0 .= "':\n\t"
    $S0 .= msg
    error($S0)
.end

.sub 'loader_Lua' :anon
    .param pmc name :optional
    .local string filename
    $S1 = checkstring(name)
    (filename, $P0) = findfile(name, 'path')
    unless filename == '' goto L1
    # library not found in this path
    .return ($P0)
L1:
    ($P0, $S0) = loadfile(filename)
    unless null $P0 goto L2
    loaderror($S1, filename, $S0)
L2:
    # library loaded successfully
    .return ($P0)
.end


=head2 Functions & Variables

=over 4

=item C<module (name [, ...])>

Creates a module. If there is a table in C<package.loaded[name]>, this table
is the module. Otherwise, if there is a global table C<t> with the given name,
this table is the module. Otherwise creates a new table C<t> and sets it as
the value of the global C<name> and the value of C<package.loaded[name]>.
This function also initializes C<t._NAME> with the given name, C<t._M> with
the module (C<t> itself), and C<t._PACKAGE> with the package name (the full
module name minus last component; see below). Finally, C<module> sets C<t>
as the new environment of the current function and the new value of
C<package.loaded[name]>, so that C<require> returns C<t>.

If C<name> is a compound name (that is, one with components separated by dots),
C<module> creates (or reuses, if they already exist) tables for each component.
For instance, if C<name> is C<a.b.c>, then C<module> stores the module table
in field C<c> of field C<b> of global C<a>.

This function may receive optional I<options> after the module name, where
each option is a function to be applied over the module.

NOT YET IMPLEMENTED.

=cut

.sub '_lua_module' :anon
    .param pmc name :optional
    $S0 = checkstring(name)
    not_implemented()
.end


=item C<require (modname)>

Loads the given module. The function starts by looking into the table
C<package.loaded> to determine whether C<modname> is already loaded.
If it is, then C<require> returns the value stored at
C<package.loaded[modname]>. Otherwise, it tries to find a I<loader> for the
module.

To find a loader, first C<require> queries C<package.preload[modname]>.
If it has a value, this value (which should be a function) is the loader.
Otherwise C<require> searches for a Lua loader using the path stored in
C<package.path>. If that also fails, it searches for a C loader using the
path stored in C<package.cpath>. If that also fails, it tries an all-in-one
loader (see below).

If there is any error loading or running the module, or if it cannot find
any loader for the module, then C<require> signals an error.

STILL INCOMPLETE (see loaders).

=cut

.sub '_lua_require' :anon
    .param pmc modname :optional
    .local pmc ret
    $S1 = checkstring(modname)
    .local pmc _lua__REGISTRY
    _lua__REGISTRY = global '_REGISTRY'
    new $P1, .LuaString
    set $P1, '_LOADED'
    .local pmc _LOADED
    _LOADED = _lua__REGISTRY[$P1]
    ret = _LOADED[modname]
    $I0 = istrue ret
    unless $I0 goto L1
    $I0 = isa ret, 'LuaUserdata'
    unless $I0 goto L2
    $S0 = "loop or previous error loading module '"
    $S0 .= $S1
    $S0 .= "'"
    error($S0)
L2:
    # package is already loaded
    .return (ret)
L1:
    .local pmc _lua__ENVIRON
    _lua__ENVIRON = global '_ENVIRON'
    .local pmc loaders
    set $P1, 'loaders'
    loaders = _lua__ENVIRON[$P1]
    .local pmc i
    new i, .LuaNumber
    set i, 1
    .local pmc msg      # error message accumulator
    new msg, .LuaString
    set msg, ''
L3:
    $P0 = loaders[i]    # get a loader
    $I0 = isa $P0, 'LuaNil'
    unless $I0 goto L4
    $S0 = "module '"
    $S0 .= $S1
    $S0 .= "' not found:"
    $S1 = msg
    $S0 .= $S1
    error($S0)
L4:
    new $P1, .LuaNil
    $P1 = $P0(modname)  # call it
    $I0 = isa $P1 , 'LuaClosure'
    if $I0 goto L5
    $I0 = isa $P1 , 'LuaFunction'
    if $I0 goto L5
    $I0 = isa $P1 , 'LuaString'
    unless $I0 goto L6
    msg .= $P1
L6:
    inc i
    goto L3
L5:
    .local pmc sentinel
    new sentinel, .LuaUserdata
    _LOADED[modname] = sentinel
    new $P0, .LuaNil
    $P0 = $P1(modname)  # run loaded module
    $I0 = isa $P0, 'LuaNil'
    unless $I0 goto L7
    # use true as result
    new $P0, .LuaBoolean
    set $P0, 1
L7:
    _LOADED[modname] = $P0
    .return ($P0)
.end


=item C<package.cpath>

The path used by C<require> to search for a C loader.

Lua initializes the C path C<package.cpath> in the same way it initializes
the Lua path C<package.path>, using the environment variable C<LUA_CPATH>
(plus another default path).

NOT USED (see package.pirpath).


=item C<package.loaded>

A table used by C<require> to control which modules are already loaded.
When you require a module C<modname> and C<package.loaded[modname]> is not
false, C<require> simply returns the value stored there.

=item C<package.loadlib (libname, funcname)>

Dynamically links the host program with the C library C<libname>. Inside
this library, looks for a function C<funcname> and returns this function
as a C function.

This is a low-level function. It completely bypasses the package and module
system. Unlike C<require>, it does not perform any path searching and does
not automatically adds extensions. C<libname> must be the complete file name
of the C library, including if necessary a path and extension. C<funcname>
must be the exact name exported by the C library .

NOT YET IMPLEMENTED.

=cut

.sub '_package_loadlib' :anon
    not_implemented()
.end


=item C<package.path>

The path used by C<require> to search for a Lua loader.

At start-up, Lua initializes this variable with the value of the environment
variable C<LUA_PATH> or with a default path, if the environment variable is
not defined. Any C<";;"> in the value of the environment variable is replaced
by the default path.

A path is a sequence of I<templates> separated by semicolons. For each
template, C<require> will change each interrogation mark in the template by
C<filename>, which is C<modname> with each dot replaced by a
C<"directory separator"> (such as C<"/"> in Unix); then it will try to load
the resulting file name. So, for instance, if the Lua path is

  "./?.lua;./?.lc;/usr/local/?/init.lua"

the search for a Lua loader for module C<foo> will try to load the files
C<./foo.lua>, C<./foo.lc>, and C</usr/local/foo/init.lua>, in that order.

STILL INCOMPLETE.

=item C<package.pirpath>

The path used by C<require> to search for a PIR loader.

STILL INCOMPLETE.

=item C<package.preload>

A table to store loaders for specific modules (see C<require>).

STILL INCOMPLETE.

=item C<package.seeall (module)>

Sets a metatable for C<module> with its C<__index> field referring to the
global environment, so that this module inherits values from the global
environment. To be used as an option to function C<module>.

NOT YET IMPLEMENTED.

=cut

.sub '_package_seeall' :anon
    not_implemented()
.end

=back

=head1 AUTHORS

Francois Perrad

=cut

