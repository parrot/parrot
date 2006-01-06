#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/lib/os.t - Lua Operating System Library


=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/lib/os.t

=head1 DESCRIPTION

Tests Lua Operating System Library
(implemented in F<languages/lua/lib/luaos.pir>).

=cut

use Parrot::Test tests => 5;
use Test::More;

pir_output_is(<< 'CODE', << 'OUTPUT', "function execute");
.namespace [ "Lua" ]
.HLL "Lua", "lua_group"
.sub _main
    load_bytecode "languages/lua/lib/luaos.pbc"
    .local pmc _G
    _G = global "_G"
    .local pmc key1
    key1 = new .LuaString
    key1 = "os"
    .local pmc os
    os = new .LuaTable
    os = _G[key1]
    .local pmc key2
    key2 = new .LuaString
    key2 = "execute"
    .local pmc fct1
    fct1 = os[key2]
    .local pmc arg1
    .local pmc ret1
    new arg1, .LuaString
    arg1 = 'perl -e "print \"test\n\"; exit(2)"'
    (ret1) = fct1(arg1)
    print ret1
    print "\n"
    end
.end
CODE
test
2
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "function getenv");
.namespace [ "Lua" ]
.HLL "Lua", "lua_group"
.sub _main
    load_bytecode "languages/lua/lib/luaos.pbc"
    .local pmc _G
    _G = global "_G"
    .local pmc key1
    key1 = new .LuaString
    key1 = "os"
    .local pmc os
    os = new .LuaTable
    os = _G[key1]
    .local pmc key2
    key2 = new .LuaString
    key2 = "getenv"
    .local pmc fct1
    fct1 = os[key2]
    .local pmc arg1
    .local pmc ret1
    new arg1, .LuaString
    arg1 = "PARROT_TMP"
    (ret1) = fct1(arg1)
    print ret1
    print "\n"
    .local pmc env
    new env, .Env
    env["PARROT_TMP"] = "GETENV_PARROT"
    (ret1) = fct1(arg1)
    print ret1
    print "\n"
    end
.end
CODE
nil
GETENV_PARROT
OUTPUT

open X, "> ../file.rm";
print X "file to remove";
close X;

pir_output_is(<< 'CODE', << 'OUTPUT', "function remove");
.namespace [ "Lua" ]
.HLL "Lua", "lua_group"
.sub _main
    load_bytecode "languages/lua/lib/luaos.pbc"
    .local pmc _G
    _G = global "_G"
    .local pmc key1
    key1 = new .LuaString
    key1 = "os"
    .local pmc os
    os = new .LuaTable
    os = _G[key1]
    .local pmc key2
    key2 = new .LuaString
    key2 = "remove"
    .local pmc fct1
    fct1 = os[key2]
    .local pmc arg1
    .local pmc ret1
    new arg1, .LuaString
    arg1 = "file.rm"
    ret1 = fct1(arg1)
    print ret1
    print "\n"
    end
.end
CODE
true
OUTPUT

ok(!-e "../file.rm", "Test that rm removed the file");
unlink("../file.rm") if (-e "../file.rm");

pir_output_is(<< 'CODE', << 'OUTPUT', "function remove");
.namespace [ "Lua" ]
.HLL "Lua", "lua_group"
.sub _main
    load_bytecode "languages/lua/lib/luaos.pbc"
    .local pmc _G
    _G = global "_G"
    .local pmc key1
    key1 = new .LuaString
    key1 = "os"
    .local pmc os
    os = new .LuaTable
    os = _G[key1]
    .local pmc key2
    key2 = new .LuaString
    key2 = "remove"
    .local pmc fct1
    fct1 = os[key2]
    .local pmc arg1
    .local pmc ret1
    .local pmc msg1
    new arg1, .LuaString
    arg1 = "file.rm"
    (ret1, msg1) = fct1(arg1)
    print ret1
    print "\n"
    print msg1
    print "\n"
    end
.end
CODE
nil
file.rm: No such file or directory
OUTPUT

