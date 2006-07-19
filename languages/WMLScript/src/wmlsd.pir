# Copyright (C) 2006, The Perl Foundation.
# $Id: wmlsd.pir 12840 2006-05-30 15:08:05Z coke $

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

.loadlib "wmls_ops"
.HLL 'WMLScript', 'wmls_group'

.sub main :main
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

.sub load_script
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
    content = ""
    goto L2
L1:
    content = read fh, 65535
    close fh
L2:
    .return (content) 
.end

.include 'languages/WMLScript/src/script.pir' 
.include 'languages/WMLScript/src/opcode.pir' 
    
