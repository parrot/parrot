# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

lua -- An interpreter for Lua 5.1

=head1 SYNOPSIS

  $ parrot lua.pbc script.lua
  $ parrot lua.pbc --target=parse script.lua
                            PAST
                            POST
                            PIR

=head1 DESCRIPTION

C<lua> is a interpreter for Lua version 5.1, running on Parrot.

=cut

.include 'languages/lua/src/lua51.pir'

.HLL "Lua", "lua_group"


.sub 'main' :main
    .param pmc args
    load_bytecode "languages/lua/lib/luabasic.pbc"
    load_bytecode "languages/lua/lib/luacoroutine.pbc"
    load_bytecode "languages/lua/lib/luapackage.pbc"
    load_bytecode "languages/lua/lib/luastring.pbc"
    load_bytecode "languages/lua/lib/luatable.pbc"
    load_bytecode "languages/lua/lib/luamath.pbc"
    load_bytecode "languages/lua/lib/luaio.pbc"
    load_bytecode "languages/lua/lib/luaos.pbc"
    load_bytecode "languages/lua/lib/luadebug.pbc"
    $I0 = handle_luainit()
    if $I0 goto L1
    $P0 = compreg 'Lua'
    $P0.'command_line'(args)
  L1:
.end


.sub 'handle_luainit' :anon
    $I0 = 0
    new $P0, .Env
    $S0 = $P0['LUA_INIT']
    if $S0 goto L1
    .return (0)
  L1:
    $S1 = substr $S0, 0, 1
    unless $S1 == '@' goto L2
    $S0 = substr $S0, 1
    ($P0, $S0) = lua_loadfile($S0)
    goto L3
  L2:
    ($P0, $S0) = lua_loadbuffer($S0, '=LUA_INIT')
  L3:
    if null $P0 goto L4
    .return docall($P0)
  L4:
    l_message('lua.pbc', $S0)
    .return (1)
.end


.sub 'l_message' :anon
    .param string pname
    .param string msg
    printerr pname
    printerr ': '
    printerr msg
    printerr "\n"
.end


=head1 SEE ALSO

F<languages/lua/doc/status.pod>

=head1 AUTHORS

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
