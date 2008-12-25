# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luapackage.pir - Lua Package Library

=head1 DESCRIPTION

The package library provides basic facilities for loading and building
modules in Lua. It exports two of its functions directly in the global
environment: C<require> and C<module>. Everything else is exported in a
table C<package>.

See "Lua 5.1 Reference Manual", section 5.3 "Modules",
L<http://www.lua.org/manual/5.1/manual.html#5.3>.

=cut

.HLL 'lua'
.loadlib 'lua_group'
.namespace [ 'package' ]

.sub 'luaopen_package'
#    print "init Lua Package\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'
    new $P1, 'LuaString'

    .local pmc _package
    new _package, 'LuaTable'
    set $P1, 'package'
    _lua__GLOBAL[$P1] = _package

    $P2 = split "\n", <<'LIST'
loadlib
seeall
LIST
    lua_register($P1, _package, $P2)

    # LUA_COMPAT_LOADLIB
    set $P1, 'loadlib'
    $P0 = _package[$P1]
    _lua__GLOBAL[$P1] = $P0

    .local pmc _loaders
    new _loaders, 'LuaTable'
    set $P1, 'loaders'
    _package[$P1] = _loaders
    new $P2, 'LuaNumber'

    .const 'Sub' loader_preload = 'loader_preload'
    set $P2, 1
    _loaders[$P2] = loader_preload

    .const 'Sub' loader_Lua = 'loader_Lua'
    inc $P2
    _loaders[$P2] = loader_Lua

    .const 'Sub' loader_PBC = 'loader_PBC'
    inc $P2
    _loaders[$P2] = loader_PBC

    .const 'Sub' loader_PBCroot = 'loader_PBCroot'
    inc $P2
    _loaders[$P2] = loader_PBCroot

    setpath(_package, 'path', 'LUA_PATH', './?.lua;languages/lua/src/lib/?.lua')
    setpath(_package, 'pbcpath', 'LUA_PBCPATH', './?.pbc;./?.pir;languages/lua/?.pbc')

    .local pmc _lua__REGISTRY
    _lua__REGISTRY = get_hll_global '_REGISTRY'
    set $P1, '_LOADED'
    $P0 = _lua__REGISTRY[$P1]
    set $P1, 'loaded'
    _package[$P1] = $P0

    new $P0, 'LuaTable'
    set $P1, 'preload'
    _package[$P1] = $P0

    $P2 = split "\n", <<'LIST'
module
require
LIST
    null $P0
    lua_register($P0, _lua__GLOBAL, $P2)

.end

.sub 'setpath' :anon
    .param pmc package
    .param string fieldname
    .param string envname
    .param string default
    new $P1, 'LuaString'
    set $P1, fieldname
    new $P0, 'Env'
    $S0 = $P0[envname]
    if $S0 goto L1
    $S0 = default
    goto L2
  L1:
    $S0 = lua_gsub($S0, ';;', ';,;')
    $S0 = lua_gsub($S0, ',', default)
  L2:
    new $P0, 'LuaString'
    set $P0, $S0
    package[$P1] = $P0
.end

.sub 'findfile' :anon
    .param string name
    .param string pname
    name = lua_gsub(name, '.', '/')
    $P0 = get_hll_global '_G'
    new $P1, 'LuaString'
    set $P1, 'package'
    $P0 = $P0[$P1]
    set $P1, pname
    $P0 = $P0[$P1]
    $I0 = isa $P0, 'LuaString'
    if $I0 goto L1
    lua_error("'package.", pname, "' must be a string")
  L1:
    .local string path
    .local string tmpl
    path = $P0
    .local pmc msg      # error accumulator
    new msg, 'LuaString'
    set msg, ''
  L2:
    (path, tmpl) = nexttemplate(path)
    if tmpl == '' goto L3
    .local string filename
    filename = lua_gsub(tmpl, '?', name)
    $I0 = stat filename, 0
    unless $I0 goto L4
    .return (filename)
  L4:
    $S0 = msg
    $S0 .= "\n\tno file '"
    $S0 .= filename
    $S0 .= "'"
    set msg, $S0
    goto L2
  L3:
    # not found
    .return ('', msg)
.end

.sub 'nexttemplate' :anon
    .param string path
  L1:
    $S0 = substr path, 0, 1
    unless $S0 == ';' goto L2
    # skip separators
    path = substr path, 1
    goto L1
  L2:
    unless path == '' goto L3
    # no more templates
    .return ('', '')
  L3:
    $I0 = index path, ';'
    unless $I0 < 0 goto L4
    .return ('', path)
  L4:
    $S0 = substr path, 0, $I0
    inc $I0
    path = substr path, $I0
    .return (path, $S0)
.end

.sub 'loaderror' :anon
    .param string name
    .param string filename
    .param string msg
    lua_error("error loading module '", name, "' from file '", filename, "':\n\t", msg)
.end

.sub 'loader_Lua' :anon
    .param pmc name :optional
    .local string filename
    $S1 = lua_checkstring(1, name)
    (filename, $P0) = findfile($S1, 'path')
    unless filename == '' goto L1
    # library not found in this path
    .return ($P0)
  L1:
    ($P0, $S0) = lua_loadfile(filename)
    unless null $P0 goto L2
    loaderror($S1, filename, $S0)
  L2:
    # library loaded successfully
    .return ($P0)
.end

.sub 'loader_PBC' :anon
    .param pmc name :optional
    .local string funcname
    .local string filename
    $S1 = lua_checkstring(1, name)
    (filename, $P0) = findfile($S1, 'pbcpath')
    unless filename == '' goto L1
    # library not found in this path
    .return ($P0)
  L1:
    funcname = mkfuncname($S1)
    ($P0, $S0) = loadfunc(filename, funcname)
    unless null $P0 goto L2
    loaderror($S1, filename, $S0)
  L2:
    # library loaded successfully
    .return ($P0)
.end

.sub 'loader_PBCroot' :anon
    .param pmc name :optional
    .local string funcname
    .local string filename
    $S1 = lua_checkstring(1, name)
    $I0 = index $S1, '.'
    unless $I0 < 0 goto L1
    new $P0, 'LuaString'
    .return ($P0)
  L1:
    $S0 = substr name, 0, $I0
    (filename, $P0) = findfile($S1, 'pbcpath')
    unless filename == '' goto L2
    # root not found
    .return ($P0)
  L2:
    funcname = mkfuncname($S1)
    ($P0, $S0) = loadfunc(filename, funcname)
    unless null $P0 goto L3
    loaderror($S1, filename, $S0)
  L3:
    # library loaded successfully
    .return ($P0)
.end

.sub 'mkfuncname' :anon
    .param string modname
    $S0 = 'luaopen_' . modname
    .return ($S0)
.end

.sub 'loadfunc' :anon
    .param string path
    .param string sym
    load_bytecode path
    $P0 = get_hll_global sym
    if null $P0 goto L1
    .return ($P0)
  L1:
    $S0 = "can't found function '"
    $S0 .= sym
    $S0 .= "' in module '"
    $S0 .= path
    $S0 .= "'"
    .return ($P0, $S0)
.end

.sub 'loader_preload' :anon
    .param pmc name :optional
    $S1 = lua_checkstring(1, name)
    $P0 = get_hll_global '_G'
    new $P1, 'LuaString'
    set $P1, 'package'
    $P0 = $P0[$P1]
    set $P1, 'preload'
    $P0 = $P0[$P1]
    $I0 = isa $P0, 'LuaTable'
    if $I0 goto L1
    lua_error("'package.preload' must be a table")
  L1:
    $P0 = $P0[name]
    $I0 = isa $P0, 'LuaNil'
    unless $I0 goto L2
    $S0 = "\n\tno field package.preload['"
    $S0 .= $S1
    $S0 .= "']"
    new $P0, 'LuaString'
    set $P0, $S0
  L2:
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

=cut

.sub 'module'
    .param pmc name :optional
    .param pmc options :slurpy
    .local pmc m
    $S1 = lua_checkstring(1, name)
    .local pmc _lua__REGISTRY
    _lua__REGISTRY = get_hll_global '_REGISTRY'
    new $P1, 'LuaString'
    set $P1, '_LOADED'
    .local pmc _LOADED
    _LOADED = _lua__REGISTRY[$P1]
    m = _LOADED[name]
    $I0 = isa m, 'LuaTable'
    if $I0 goto L1
    # try global variable (and create one if it does not exist)
    $P0 = get_hll_global '_G'
    m = lua_findtable($P0, $S1)
    unless null m goto L2
    lua_error("name conflict for module '", $S1, "'")
  L2:
    _LOADED[name] = m
  L1:
    # check whether table already has a _NAME field
    set $P1, '_NAME'
    $P0 = m[$P1]
    $I0 = isa $P0, 'LuaNil'
    # is table an initialized module?
    unless $I0 goto L3
    # no; initialize it
    m[$P1] = name
    set $P1, '_M'
    m[$P1] = m
    set $P1, '_PACKAGE'
    $I0 = index $S1, '.'
    if $I0 < 0 goto L4
  L5:
    $I1 = $I0
    inc $I0
    $I0 = index $S1, '.', $I0
    unless $I0 < 0 goto L5
    dec $I1
    $S0 = substr $S1, 0, $I1
    # set _PACKAGE as package name (full module name minus last part)
    new $P0, 'LuaString'
    set $P0, $S0
    m[$P1] = $P0
    goto L3
  L4:
    m[$P1] = name
  L3:
    $P2 = getinterp
    $P3 = $P2['sub'; 1]
    lua_setfenv($P3, m)
  L6:
    unless options goto L7
    $P0 = shift options
    $P0(m)
    goto L6
  L7:
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

=cut

.sub 'require'
    .param pmc modname :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, modname)
    .local pmc _lua__REGISTRY
    _lua__REGISTRY = get_hll_global '_REGISTRY'
    new $P1, 'LuaString'
    set $P1, '_LOADED'
    .local pmc _LOADED
    _LOADED = _lua__REGISTRY[$P1]
    res = _LOADED[modname]
    $I0 = istrue res
    unless $I0 goto L1
    $I0 = isa res, 'LuaUserdata'
    unless $I0 goto L2
    lua_error("loop or previous error loading module '", $S1, "'")
  L2:
    # package is already loaded
    .return (res)
  L1:
    $P0 = get_hll_global '_G'
    set $P1, 'package'
    $P0 = $P0[$P1]
    .local pmc loaders
    set $P1, 'loaders'
    loaders = $P0[$P1]
    .local pmc i
    new i, 'LuaNumber'
    set i, 1
    .local pmc msg      # error message accumulator
    new msg, 'LuaString'
    set msg, ''
  L3:
    $P0 = loaders[i]    # get a loader
    $I0 = isa $P0, 'LuaNil'
    unless $I0 goto L4
    $S0 = msg
    lua_error("module '", $S1, "' not found:", $S0)
  L4:
    new $P1, 'LuaNil'
    $P1 = $P0(modname)  # call it
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
    new sentinel, 'LuaUserdata'
    _LOADED[modname] = sentinel
    new $P0, 'LuaNil'
    $P0 = $P1(modname)  # run loaded module
    $I0 = isa $P0, 'LuaNil'
    unless $I0 goto L7
    # use true as result
    new $P0, 'LuaBoolean'
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

NOT USED (see package.pbcpath).


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

.sub 'loadlib'
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

STILL INCOMPLETE (see default).

=item C<package.pbcpath>

The path used by C<require> to search for a PBC loader.

STILL INCOMPLETE (see default).

=item C<package.preload>

A table to store loaders for specific modules (see C<require>).

=item C<package.seeall (module)>

Sets a metatable for C<module> with its C<__index> field referring to the
global environment, so that this module inherits values from the global
environment. To be used as an option to function C<module>.

=cut

.sub 'seeall'
    .param pmc module :optional
    .param pmc extra :slurpy
    .local pmc mt
    lua_checktype(1, module, 'table')
    mt = module.'get_metatable'()
    $I0 = isa mt, 'LuaNil'
    unless $I0 goto L1
    new mt, 'LuaTable'
    module.'set_metatable'(mt)
  L1:
    # mt.__index = _G
    $P0 = get_hll_global '_G'
    new $P1, 'LuaString'
    set $P1, '__index'
    mt[$P1] = $P0
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
