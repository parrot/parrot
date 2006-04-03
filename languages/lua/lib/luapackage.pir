# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: luapackage.pir 11848 2006-03-10 08:39:33Z fperrad $

=head1 NAME

lib/luapackage.pir - Lua Package Library

=head1 DESCRIPTION

The package library provides basic facilities for loading and building 
modules in Lua. It exports two of its functions directly in the global 
environment: C<require> and C<module>. Everything else is exported in a 
table C<package>.

See "Lua 5.1 Reference Manual", section 5.3 "Modules".

=cut

.namespace [ "Lua" ]
.HLL "Lua", "lua_group"


.sub init_package :load :anon

#    load_bytecode "languages/lua/lib/luaaux.pbc"
#    load_bytecode "languages/lua/lib/luabasic.pbc"

#    print "init Lua Package\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = global "_G"
    $P1 = new .LuaString

    .const .Sub _lua_module = "_lua_module"
    $P1 = "module"
    _lua__GLOBAL[$P1] = _lua_module

    .const .Sub _lua_require = "_lua_require"
    $P1 = "require"
    _lua__GLOBAL[$P1] = _lua_require

    .local pmc _package
    _package = new .LuaTable
    $P1 = "package"
    _lua__GLOBAL[$P1] = _package

    $P0 = new .LuaString
    $P1 = "cpath"
    _package[$P1] = $P0

    $P0 = new .LuaTable
    $P1 = "loaded"
    _package[$P1] = $P0

    .const .Sub _package_loadlib = "_package_loadlib"
    $P1 = "loadlib"
    _package[$P1] = _package_loadlib

    $P0 = new .LuaString
    $P1 = "path"
    _package[$P1] = $P0

    $P0 = new .LuaTable
    $P1 = "preloaded"
    _package[$P1] = $P0

    .const .Sub _package_seeall = "_package_seeall"
    $P1 = "seeall"
    _package[$P1] = _package_seeall

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

.sub _lua_module :anon :outer(init_package)
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

NOT YET IMPLEMENTED.

=cut

.sub _lua_require :anon :outer(init_package)
    .param pmc packagename :optional
    $S0 = checkstring(packagename)
    not_implemented()
.end


=item C<package.cpath>

The path used by C<require> to search for a C loader.

Lua initializes the C path C<package.cpath> in the same way it initializes 
the Lua path C<package.path>, using the environment variable C<LUA_CPATH>
(plus another default path). 

NOT YET IMPLEMENTED.


=item C<package.loaded>

A table used by C<require> to control which modules are already loaded. 
When you require a module C<modname> and C<package.loaded[modname]> is not 
false, C<require> simply returns the value stored there. 

NOT YET IMPLEMENTED.


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

.sub _package_loadlib :anon :outer(init_package)
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

NOT YET IMPLEMENTED.


=item C<package.preload>

A table to store loaders for specific modules (see C<require>). 

NOT YET IMPLEMENTED.


=item C<package.seeall (module)>

Sets a metatable for C<module> with its C<__index> field referring to the
global environment, so that this module inherits values from the global 
environment. To be used as an option to function C<module>.

NOT YET IMPLEMENTED.

=cut

.sub _package_seeall :anon :outer(init_package)
    not_implemented()
.end

=back

=head1 AUTHORS


=cut

