# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

test_lex -- A dumper for Lua 5.1 lexicography

=head1 SYNOPSIS

  $ ./parrot languages/lua/test_lex.pir script.lua

=head1 DESCRIPTION

C<test_lex> is a dumper for Lua 5.1 lexicography.

=cut

.sub '__onload' :load :init
    load_bytecode 'languages/lua/src/lua.pbc'

    $P0 = new [ 'HLLCompiler' ]
    $P0.'language'('LuaTestLex')
    $P0.'parsegrammar'('Lua::TestLex')
    $P0.'astgrammar'('Lua::DumpLex')

    # import PGE::Util::die into Lua::TestLex
    $P0 = get_hll_global ['PGE::Util'], 'die'
    set_hll_global ['Lua::TestLex'], 'die', $P0

    # import Lua::Grammar::* into Lua::TestLex
    $P0 = get_hll_global ['Lua::Grammar'], 'name'
    set_hll_global ['Lua::TestLex'], 'Name', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'keyword'
    set_hll_global ['Lua::TestLex'], 'keyword', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'string'
    set_hll_global ['Lua::TestLex'], 'String', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'number'
    set_hll_global ['Lua::TestLex'], 'Number', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'ws'
    set_hll_global ['Lua::TestLex'], 'ws', $P0

    $P0 = get_hll_global ['Lua::Grammar'], 'quoted_literal'
    set_hll_global ['Lua::TestLex'], 'quoted_literal', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'long_string'
    set_hll_global ['Lua::TestLex'], 'long_string', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'long_comment'
    set_hll_global ['Lua::TestLex'], 'long_comment', $P0
.end

.sub 'main' :main
    .param pmc args
#    load_bytecode 'PGE/Dumper.pbc'
#    load_bytecode 'dumper.pbc'
    $P0 = compreg 'LuaTestLex'
    $P0.'command_line'(args, 'target' => 'past')
.end

.include 'languages/lua/src/dumplex_gen.pir'
.include 'languages/lua/src/lua51_testlex_gen.pir'

=head1 AUTHOR

Francois Perrad

=cut
