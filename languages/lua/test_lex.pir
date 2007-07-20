# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

test_lex -- A dumper for Lua 5.1 lexicography

=head1 SYNOPSIS

  $ parrot test_lex.pir script.lua
  $ parrot test_lex.pir --target=parse script.lua
                                 PAST
                                 POST
                                 PIR

=head1 DESCRIPTION

This compiler extends C<HLLCompiler>
(see F<runtime/parrot/library/Parrot/HLLCompiler.pir>)

This compiler defines the following stages:

=over 4

=item * parse F<languages/lua/src/lua51_testlex.pg>

=item * past  F<languages/lua/src/dumplex.tg>

=back

and imports many definitions from the full Lua compiler
(F<languages/lua/src/lua51.pir>).

=cut

.sub '__onload' :load :init
    load_bytecode 'languages/lua/lua.pbc'

    $P0 = new [ 'HLLCompiler' ]
    $P0.'language'('LuaTestLex')
    $P0.'parsegrammar'('Lua::TestLex')
    $P0.'astgrammar'('Lua::DumpLex')

    $S0 = "Lexico of Lua 5.1 on Parrot  Copyright (C) 2005-2007, The Perl Foundation.\n"
    $P0.'commandline_banner'($S0)
    $P0.'commandline_prompt'('> ')

    # import Lua::Grammar::* into Lua::TestLex
    $P0 = get_hll_global ['Lua::Grammar'], 'string'
    set_hll_global ['Lua::TestLex'], 'String', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'ws'
    set_hll_global ['Lua::TestLex'], 'ws', $P0

    $P0 = get_hll_global ['Lua::Grammar'], 'syntaxerror'
    set_hll_global ['Lua::TestLex'], 'die', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'name'
    set_hll_global ['Lua::TestLex'], 'Name', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'number'
    set_hll_global ['Lua::TestLex'], 'Number', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'quoted_literal'
    set_hll_global ['Lua::TestLex'], 'quoted_literal', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'long_string'
    set_hll_global ['Lua::TestLex'], 'long_string', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'long_comment'
    set_hll_global ['Lua::TestLex'], 'long_comment', $P0
    $P0 = get_hll_global ['Lua::Grammar'], 'shebang'
    set_hll_global ['Lua::TestLex'], 'shebang', $P0

    # import Lua::PAST::Grammar::internal_error into Lua::DumpLex
    $P0 = get_hll_global ['Lua::PAST::Grammar'], 'internal_error'
    set_hll_global ['Lua::DumpLex'], 'internal_error', $P0
.end

.sub 'main' :main
    .param pmc args
    $P0 = compreg 'LuaTestLex'
    $P0.'command_line'(args)
.end

.include 'languages/lua/src/dumplex_gen.pir'
.include 'languages/lua/src/lua51_testlex_gen.pir'

.namespace

.sub 'println'
    .param pmc arg
    print arg
    print "\n"
    .return ()
.end

=head1 AUTHOR

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
