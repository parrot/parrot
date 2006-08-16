# Copyright (C) 2006, The Perl Foundation.
# $Id: luac.pir $

=head1 NAME

luac -- A compiler for Lua 5.1

=head1 SYNOPSIS

  $ ./parrot languages/lua/luac.pir script.lua
  $ ./parrot script.pir [params ...]

=head1 DESCRIPTION

C<luac> is a compiler for Lua version 5.1, running on Parrot.

=cut

.sub 'main' :main
    .param pmc argv
    load_bytecode 'languages/lua/src/Lua51.pbc'
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
    .local pmc lua_comp
    lua_comp = compreg 'Lua'
    $P0 = lua_comp(source)
    unless $P0 goto L2
L1:
    end
L2:
    print "Parse failed on "
    print filename
    print "\n"
    exit -1
USAGE:
    printerr "Usage: parrot luac.pir script.lua\n"
    exit -1
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

=head1 AUTHOR

Francois Perrad

=cut
