#!./parrot

# $Id$

=head1 NAME

plumhead.pir - three variants of PHP on Parrot

=head1 DESCRIPTION

Driver for three variants of PHP on Parrot.

=head1 Variants

=head2 Plumhead partridge

Parse PHP with the Parrot compiler tools. This is the default variant.

=head2 Plumhead phc

Take XML from phc and transform it with XSLT to PIR setting up PAST-pm.
Run the PAST-pm with the help of TGE.

=head2 Plumhead antlr3

Parse PHP with Java based parser and tree parser, generated from ANTLR3 grammars.

=head2 Plumhead perl5re

Parse PHP with Perl 5 regexes.

=head1 SEE ALSO

F<languages/plumhead/docs>

=head1 AUTHOR

Bernhard Schmalhofer - L<Bernhard.Schmalhofer@gmx.de>

=cut


.namespace [ 'Plumhead' ]

.const string VERSION = "0.0.1"

.include "library/dumper.pir"

.sub '__onload' :load :init
    load_bytecode 'Getopt/Obj.pbc'
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'Parrot/HLLCompiler.pbc'
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'languages/plumhead/src/common/plumheadlib.pbc'

    # import PGE::Util::die into Plumhead::Grammar
    $P0 = get_hll_global ['PGE::Util'], 'die'
    set_hll_global ['Plumhead::Grammar'], 'die', $P0

    $P0 = new [ 'HLLCompiler' ]
    $P0.'language'('Plumhead')
    $P0.'parsegrammar'('Plumhead::Grammar')
    $P0.'astgrammar'('Plumhead::PAST::Grammar')

.end

.sub plumhead :main
    .param pmc argv
    # _dumper( argv )

    .local string rest
    .local pmc    opt
    ( opt, rest ) = parse_options(argv)

    .local string php_source_fn 
    php_source_fn = opt['f']
    if php_source_fn goto GOT_PHP_SOURCE_FN
        php_source_fn = rest
GOT_PHP_SOURCE_FN:

    .local string cmd, err_msg
    .local int ret
    
    .local string variant
    variant = opt['variant']

    if variant == 'antlr3'    goto VARIANT_ANTLR3
    if variant == 'partridge' goto VARIANT_PARTRIDGE
    if variant == 'phc'       goto VARIANT_PHC
    if variant == 'perl5re'   goto VARIANT_PERL5RE

VARIANT_PARTRIDGE:
    err_msg = 'Compiling and executing with partridge failed'
    $P0 = compreg 'Plumhead'

    .local string target
    target = opt['target']
    unless target goto got_no_target
        .return $P0.'evalfiles'(php_source_fn, 'target' => target )
    got_no_target:
    .return $P0.'evalfiles'( php_source_fn )

VARIANT_PHC:
    err_msg = 'Creating XML-AST with phc failed'
    cmd = 'phc --dump-ast-xml '
    concat cmd, php_source_fn
    concat cmd, '> plumhead_phc_ast.xml'
    ret = spawnw cmd
    if ret goto ERROR

    err_msg = 'Creating XML-PAST with xsltproc failed'
    cmd = 'xsltproc languages/plumhead/src/phc/phc_xml_to_past_xml.xsl plumhead_phc_ast.xml > plumhead_past.xml'
    ret = spawnw cmd
    if ret goto ERROR

    err_msg = 'Creating PIR with xsltproc failed'
    cmd = 'xsltproc languages/plumhead/src/phc/past_xml_to_past_pir.xsl  plumhead_past.xml  > plumhead_past.pir'
    ret = spawnw cmd
    if ret goto ERROR
    goto EXECUTE_PAST_PIR

VARIANT_PERL5RE:
    err_msg = 'Creating PAST with Perl 5 regexes failed'
    # TODO: this is not portable
    cmd = 'perl5.9.5 languages/plumhead/src/perl5re/gen_past_pir.pl '
    concat cmd, php_source_fn
    concat cmd, '> plumhead_past.pir'
    ret = spawnw cmd
    if ret goto ERROR
    goto EXECUTE_PAST_PIR

VARIANT_ANTLR3:
    err_msg = 'Generating PAST from annotated PHP source failed'
    cmd = 'java PlumheadAntlr3 '
    concat cmd, php_source_fn
    concat cmd, ' plumhead_past.pir'
    ret = spawnw cmd
    if ret goto ERROR
    goto EXECUTE_PAST_PIR

EXECUTE_PAST_PIR:
    err_msg = 'Executing plumhead_past.pir with parrot failed'
    cmd = './parrot plumhead_past.pir'
    ret = spawnw cmd
    if ret goto ERROR

    # Clean up temporary files
    #.local pmc os
    #os = new .OS
    # os."rm"('plumhead_phc_ast.xml')
    # os."rm"('plumhead_past.xml')
    # os."rm"('plumhead_past.pir')

    exit 0

ERROR:
    printerr err_msg
    printerr "\n"
    # Clean up temporary files
    #.local pmc os
    #os = new .OS
    #os."rm"('plumhead_phc_ast.xml')
    #os."rm"('plumhead_past.xml')
    #os."rm"('plumhead_past.pir')

FINISH:
   exit ret

.end


# get commandline options
.sub parse_options
    .param pmc argv

    .local string prog
    prog = shift argv

    # Specification of command line arguments.
    # --version, --debug, --inv=nnn, --builtin=name, --nc, --help
    .local pmc getopts
    getopts = new 'Getopt::Obj'
    push getopts, 'version'
    push getopts, 'debug'
    push getopts, 'help'
    push getopts, 'd:%'
    push getopts, 'r=s'
    push getopts, 'f=s'
    push getopts, 'C'
    push getopts, 'variant=s'          # switch between variants
    push getopts, 'target=s'           # relevant for 'Plumhead partridge'

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
    .local string rest
    argc = elements argv
    if argc < 1 goto help
    dec argc
    rest = argv[argc]

    .return (opt, rest )
.end

.namespace [ 'Plumhead::Grammar' ]

.include 'src/partridge/Plumhead_gen.pir'

.include 'src/partridge/PlumheadPAST_gen.pir'

# vim: ft=imc sw=4:
