# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

wmls2pir - WMLScript bytecode to Parrot PIR Translator

=head1 SYNOPSYS

 parrot wmls2pir.pbc file.wmlsc

=head1 DESCRIPTION

B<wmls2pir> translates a WMLScript bytecode file to Parrot PIR.

=head1 SEE ALSO

wmlsd, wmls2pbc, wmlsi

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
    _init_lib()
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
    .local string gen_pir
    gen_pir = script.translate()
    save_pir(gen_pir, filename)
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
    printerr "Usage: parrot wmls2pir.pbc filename\n"
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
    content = ''
    goto L2
L1:
    content = read fh, 65535
    close fh
L2:
    .return (content) 
.end

.sub save_pir
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

.include 'languages/WMLScript/src/stdlibs.pir' 
.include 'languages/WMLScript/src/script.pir' 
.include 'languages/WMLScript/src/opcode.pir' 
    
