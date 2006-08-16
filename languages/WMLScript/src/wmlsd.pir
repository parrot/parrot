# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

wmlsd - WMLScript Disassembler

=head1 SYNOPSYS

 parrot wmlsd.pbc file.wmlsc

=head1 DESCRIPTION

B<wmlsd> disassembles binary form of WMLScript file.

=head1 SEE ALSO

wmls2pir, wmls2pbc, wmlsi

=head1 AUTHOR

Francois Perrad.

=cut

.loadlib 'wmls_ops'
.HLL 'WMLScript', 'wmls_group'

.sub 'main' :main
    .param pmc argv
    .local int argc
    .local string progname
    .local string filename
    .local string content
    _init_script()
    argc = elements argv
    if argc != 2 goto USAGE
    progname = shift argv
    filename = shift argv
    content = load_script(filename)
    unless content goto L1
    .local pmc loader
    .local pmc script
    new loader, .WmlsBytecode
    push_eh _handler
    script = loader.load(content)
    script['filename'] = filename
    script.dump()
    end
_handler:
    .local pmc e
    .local string s
    .get_results (e, s)
    print s
    print "\n"
L1:
    end
USAGE:
    printerr "Usage: parrot wmlsd.pbc filename\n"
    exit -1
.end

.include 'languages/WMLScript/runtime/wmlsstdlibs.pir' 
.include 'languages/WMLScript/src/script.pir' 
.include 'languages/WMLScript/src/opcode.pir' 
    
