# $Id$

=head1 NAME

plumhead.pir - A wingless implementation of PHP

=head1 DESCRIPTION

Take XML from phc and transform it with XSLT to PIR setting up PAST.
Run the PAST with the help of TGE.

=cut

.const string VERSION="0.0.1"

.sub plumhead :main
    .param pmc argv

    .local pmc    opt
    .local string php_source_fn
    ( opt, php_source_fn ) = parse_options(argv)

    .local string cmd, err_msg
    .local int ret
    
    err_msg = 'Creating XML-AST with phc failed'
    cmd = 'phc --dump-ast-xml '
    concat cmd, php_source_fn
    concat cmd, '> phc_ast.xml'
    ret = spawnw cmd
    if ret goto error

    err_msg = 'Creating XML-PAST with xsltproc failed'
    cmd = 'xsltproc languages/plumhead/phc_xml_to_past_xml.xsl phc_ast.xml > past.xml'
    ret = spawnw cmd
    if ret goto error

    err_msg = 'Creating PIR with xsltproc failed'
    cmd = 'xsltproc languages/plumhead/past_xml_to_past_pir.xsl  past.xml  > past.pir'
    ret = spawnw cmd
    if ret goto error

    err_msg = 'Executing past.pir with parrot failed'
    cmd = './parrot past.pir'
    ret = spawnw cmd
    if ret goto error

    # TODO: Clean up, with OS PMC
    # phc_ast.xml
    # past.xml
    # past.pir

    exit 0

error:
   printerr err_msg
   printerr "\n"

   exit ret

.end


# get commandline options
.sub parse_options
    .param pmc argv

    load_bytecode "Getopt/Obj.pbc"

    .local string prog
    prog = shift argv

    # Specification of command line arguments.
    # --version, --debug, --inv=nnn, --builtin=name, --nc, --help
    .local pmc getopts
    getopts = new "Getopt::Obj"
    push getopts, "version"
    push getopts, "debug"
    push getopts, "help"

    .local pmc opt
    opt = getopts."get_options"(argv)

    $I0 = defined opt['version']
    unless $I0 goto n_ver
	print prog
	print " "
	print VERSION
	print "\n"
	end
n_ver:
    $I0 = defined opt['help']
    unless $I0 goto n_help
help:
    print "usage: "
    print prog
    print " [options...] [file]\n"
    print "see\n\tperldoc -F "
    print prog
    print "\nfor more\n"
    end

n_help:
    $I0 = defined opt['debug']
    unless $I0 goto n_deb
	print "debugging on\n"
n_deb:

    .local int argc
    .local string php_source_fn
    argc = elements argv
    if argc < 1 goto help
    dec argc
    php_source_fn = argv[argc]

    .return (opt, php_source_fn )
.end

=head1 SEE ALSO

=head1 AUTHOR

Bernhard Schmalhofer - L<Bernhard.Schmalhofer@gmx.de>

=cut

# vim: ft=imc sw=4:
