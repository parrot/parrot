# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

luac2pir - Lua 5.1 VM bytecode to Parrot PIR Translator

=head1 SYNOPSYS

 parrot luac2pir.pir file.luac

=head1 DESCRIPTION

B<luac2pir> translates a Lua 5.1 VM bytecode file to Parrot PIR.

=head1 SEE ALSO

luad

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
    .local string gen_pir
    gen_pir = script.'translate'()
    save_pir(gen_pir, filename)
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

.sub 'load_file' :anon
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

.sub 'save_pir' :anon
    .param string gen_pir
    .param string filename
    .local string output
    .local pmc fh
    output = concat filename, '.pir'
    fh = open output, '>'
    if fh goto L1
    $S0 = err
    print "Can't open '"
    print output
    print "' ("
    print $S0
    print ")\n"
    goto L2
  L1:
    print fh, gen_pir
    close fh
  L2:
.end

.include 'languages/lua/src/lib/luabytecode.pir'


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
