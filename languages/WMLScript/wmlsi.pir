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

.loadlib 'wmls_ops'
.HLL 'WMLScript', 'wmls_group'

.sub 'main' :main
    .param pmc argv
    load_bytecode 'languages/WMLScript/src/WMLScript.pbc'
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
    
