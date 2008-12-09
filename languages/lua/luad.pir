# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

luad - Lua Disassembler

=head1 SYNOPSYS

 parrot luad.pir file.luac

=head1 DESCRIPTION

B<luad> disassembles Lua 5.1 bytecode produced by C<luac>.

=head1 SEE ALSO

L<http://luaforge.net/projects/chunkspy/>

=head1 AUTHOR

Francois Perrad.

=cut

.loadlib 'lua_group'

.sub 'main' :main
    .param pmc argv
    .local int argc
    .local string progname
    .local string filename
    .local string content
    argc = elements argv
    if argc != 2 goto USAGE
    progname = shift argv
    filename = shift argv
    content = load_file(filename)
    unless content goto L1
    .local pmc script
    push_eh _handler
    new $P0, 'LuaBytecode'
    script = $P0.'undump'(content)
    .local string basename
    $P0 = split '/', filename
    $S0 = pop $P0
    $P0 = split '\', $S0
    basename = pop $P0
    script.'brief'(basename)
    pop_eh
    end
  _handler:
    .local pmc e
    .local string msg
    .get_results (e)
    msg = e
    print msg
    print "\n"
  L1:
    end
  USAGE:
    printerr "Usage: parrot luad.pir filename\n"
    exit -1
.end

.sub 'load_file'
    .param string filename
    .local pmc fh
    .local string content
    fh = new 'FileHandle'
    push_eh _handler
    content = fh.'readall'(filename)
    pop_eh
    if content goto L1
    $S0 = err
    print "Can't slurp '"
    print filename
    print "' ("
    print $S0
    print ")\n"
  L1:
  _handler:
    .return (content)
.end

.include 'languages/lua/src/lib/luabytecode.pir'


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
