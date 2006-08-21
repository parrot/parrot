# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

wmls2pir - WMLScript bytecode to Parrot PIR Translator

=head1 SYNOPSYS

 parrot wmls2pir.pir file.wmlsc

=head1 DESCRIPTION

B<wmls2pir> translates a WMLScript bytecode file to Parrot PIR.

=head1 SEE ALSO

wmlsd, wmls2pbc, wmlsi

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
    
