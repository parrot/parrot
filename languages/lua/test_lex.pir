# Copyright (C) 2006, The Perl Foundation.
# $Id: test_lex.pir $

=head1 NAME

test_lex -- A dumper for Lua 5.1 lexicography

=head1 SYNOPSIS

  $ ./parrot languages/lua/test_lex.pir script.lua

=head1 DESCRIPTION

C<test_lex> is a dumper for Lua 5.1 lexicography.

=cut

.sub 'main' :main
    .param pmc argv
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'languages/lua/src/Lua51TestLex.pbc'
    load_bytecode 'languages/lua/src/LuaDumpLex.pbc'
    .local int argc
    argc = elements argv
    if argc != 2 goto USAGE
    .local string progname
    .local string filename
    .local string source
    progname = shift argv
    filename = shift argv
    source = load_script(filename)
    unless source goto L1
    # Retrieve the start rule
    .local pmc start_rule
    start_rule = get_root_global [ 'parrot'; 'Lua::TestLex'], 'start'
    # Parse the source and return a match object
    .local pmc match
    push_eh _handler
    match = start_rule(source, 'grammar'=> 'Lua::TestLex')
    clear_eh
    # Dump
    .local pmc grammar
    grammar = new 'Lua::DumpLex'
    .local pmc dumper
    dumper = grammar.apply(match)
    $P0 = dumper.get('dump')
L1:
    end
USAGE:
    printerr "Usage: parrot test_lex.pir script.lua\n"
    exit -1
_handler:
    .local pmc e
    .local string s
    .get_results (e, s)
    print s
    end
.end

.sub 'load_script' :anon
    .param string filename
    .local pmc fh
    .local string content
    fh = open filename, '<'
    if fh goto L1
    $S0 = err
    print "Can't open '"
    print filename
    print "' ("
    print $S0
    print ")\n"
    content = ''
    goto L2
L1:
    content = read fh, 65535
    close fh
L2:
    .return (content) 
.end

.namespace [ 'Lua::TestLex' ]
.include 'languages/lua/src/parse.pir'

=head1 AUTHOR

Francois Perrad

=cut
