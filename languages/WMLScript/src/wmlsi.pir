# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

wmlsi - WMLScript Interpreter

=head1 SYNOPSYS

 parrot wmlsi.pbc file.wmlsc function [params ...]

=head1 DESCRIPTION

B<wmlsi> translates a WMLScript bytecode file to Parrot PBC and calls
C<function(params, ...)>.

=head1 SEE ALSO

wmlsd, wmls2pir, wmls2pbc

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
    .local string entryname
    .local string content
    _init_script()
    _init_lib()
    argc = elements argv
    if argc < 3 goto USAGE
    progname = shift argv
    filename = shift argv
    entryname = shift argv
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
    .local pmc pir_comp
    .local pmc pbc_out
    pir_comp = compreg 'PIR'
    pbc_out = pir_comp(gen_pir)
    $S0 = save_pbc(pbc_out, filename)
    load_bytecode $S0
    .local pmc params
    params = new .ResizablePMCArray
L2:
    unless argv goto L3
    $S0 = shift argv
    new $P0, .WmlsString
    $P0 = $S0
    push params, $P0 
    goto L2
L3:
    .local pmc entry
    $S0 = filename
    $S0 .= ':'
    $S0 .= entryname
    entry = global $S0
    entry(params :flat)
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
    printerr "Usage: parrot wmlsi.pbc filename entry\n"
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

.sub save_pbc
    .param string pbc_out
    .param string filename
    .local string output
    .local pmc fh
    output = concat filename, '.pbc'
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
    print fh, pbc_out
    close fh
L2:
    .return (output)
.end

.include 'languages/WMLScript/src/stdlibs.pir' 
.include 'languages/WMLScript/src/script.pir' 
.include 'languages/WMLScript/src/opcode.pir' 
    
