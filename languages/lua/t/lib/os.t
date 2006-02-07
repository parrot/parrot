#! perl -w
# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/lib/os.t - Lua Operating System Library


=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/lib/os.t

=head1 DESCRIPTION

Tests Lua Operating System Library
(implemented in F<languages/lua/lib/luaos.pir>).

=cut

use Parrot::Test tests => 11;
use Test::More;

pir_output_is(<< 'CODE', << 'OUTPUT', "function execute");
.namespace [ "Lua" ]
.HLL "Lua", "lua_group"
.sub _main
    load_bytecode "languages/lua/lib/luaos.pbc"
    .local pmc _G
    _G = global "_G"
    .const .LuaString key1 = "os"
    .local pmc os
    os = _G[key1]
    .const .LuaString key2 = "execute"
    .local pmc fct1
    fct1 = os[key2]
    .const .LuaString arg1 = 'perl -e "print \"test\n\"; exit(2)"'
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

pir_output_is(<< 'CODE', << 'OUTPUT', "function exit");
.namespace [ "Lua" ]
.HLL "Lua", "lua_group"
.sub _main
    load_bytecode "languages/lua/lib/luaos.pbc"
    .local pmc _G
    _G = global "_G"
    .const .LuaString key1 = "os"
    .local pmc os
    os = _G[key1]
    .const .LuaString key2 = "exit"
    .local pmc fct1
    fct1 = os[key2]
    .local pmc ret1
    print "reached\n"
    fct1()
    print "not reached\n"
    end
.end
CODE
reached
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "function getenv");
.namespace [ "Lua" ]
.HLL "Lua", "lua_group"
.sub _main
    load_bytecode "languages/lua/lib/luaos.pbc"
    .local pmc _G
    _G = global "_G"
    .const .LuaString key1 = "os"
    .local pmc os
    os = _G[key1]
    .const .LuaString key2 = "getenv"
    .local pmc fct1
    fct1 = os[key2]
    .const .LuaString arg1 = "PARROT_TMP"
    .local pmc ret1
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
    .const .LuaString key1 = "os"
    .local pmc os
    os = _G[key1]
    .const .LuaString key2 = "remove"
    .local pmc fct1
    fct1 = os[key2]
    .const .LuaString arg1 = "file.rm"
    .local pmc ret1
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
    .const .LuaString key1 = "os"
    .local pmc os
    os = _G[key1]
    .const .LuaString key2 = "remove"
    .local pmc fct1
    fct1 = os[key2]
    .const .LuaString arg1 = "file.rm"
    .local pmc ret1
    .local pmc msg1
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

open X, "> ../file.old";
print X "file to rename";
close X;

pir_output_is(<< 'CODE', << 'OUTPUT', "function rename");
.namespace [ "Lua" ]
.HLL "Lua", "lua_group"
.sub _main
    load_bytecode "languages/lua/lib/luaos.pbc"
    .local pmc _G
    _G = global "_G"
    .const .LuaString key1 = "os"
    .local pmc os
    os = _G[key1]
    .const .LuaString key2 = "rename"
    .local pmc fct1
    fct1 = os[key2]
    .const .LuaString arg1 = "file.old"
    .const .LuaString arg2 = "file.new"
    .local pmc ret1
    ret1 = fct1(arg1, arg2)
    print ret1
    print "\n"
    end
.end
CODE
true
OUTPUT

ok(!-e "../file.old", "Test that old file is missing");
ok(-e "../file.new", "Test that new file is here");
unlink("../file.old") if (-e "../file.old");
unlink("../file.new") if (-e "../file.new");

pir_output_is(<< 'CODE', << 'OUTPUT', "function rename");
.namespace [ "Lua" ]
.HLL "Lua", "lua_group"
.sub _main
    load_bytecode "languages/lua/lib/luaos.pbc"
    .local pmc _G
    _G = global "_G"
    .const .LuaString key1 = "os"
    .local pmc os
    os = _G[key1]
    .const .LuaString key2 = "rename"
    .local pmc fct1
    fct1 = os[key2]
    .const .LuaString arg1 = "file.old"
    .const .LuaString arg2 = "file.new"
    .local pmc ret1
    .local pmc msg1
    (ret1, msg1) = fct1(arg1, arg2)
    print ret1
    print "\n"
    print msg1
    print "\n"
    end
.end
CODE
nil
file.old: No such file or directory
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "function time");
.namespace [ "Lua" ]
.HLL "Lua", "lua_group"
.sub _main
    load_bytecode "languages/lua/lib/luaos.pbc"
    .local pmc _G
    _G = global "_G"
    .const .LuaString key1 = "os"
    .local pmc os
    os = _G[key1]
    .const .LuaString key2 = "time"
    .local pmc fct1
    fct1 = os[key2]
    .local pmc ret1
    (ret1) = fct1()
    $I0 = time
    unless ret1 == $I0 goto L0
    print "ok\n"
L0:    
    end
.end
CODE
ok
OUTPUT

