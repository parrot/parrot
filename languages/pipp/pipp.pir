# $Id$

=head1 NAME

pipp.pir - driver program for Pipp, PCT and PHC variants

=head1 SYNOPSIS

   cd languages/pipp

   make pipp

   ./pipp t/in_php/01_sea_only.t

   ./pipp --variant=pct t/in_php/01_sea_only.t

   ./pipp --variant=phc t/in_php/01_sea_only.t
   ./pipp --run-nqp        t.nqp

=head1 DESCRIPTION

pipp.pbc is the driver for Pipp.

=head1 Variants

=head2 Pipp pct

Parse PHP with the Parrot compiler toolkit. This is the default variant.

=head2 Pipp phc

Take XML from phc and transform it with XSLT to PIR setting up PAST.
Run the PAST with the help of PCT.


=head1 SEE ALSO

L<http://pipp.org>

=head1 AUTHOR

Bernhard Schmalhofer - L<Bernhard.Schmalhofer@gmx.de>

=cut

.HLL 'pipp'

.sub '' :anon :load :init

    # Pipp uses the Parrot Compiler Toolkit
    load_bytecode 'PCT.pbc'

    # Export namespaces to the appropriate HLL ns
    .local pmc parrotns, phpns, exports
    parrotns = get_root_namespace ['parrot']
    phpns = get_hll_namespace
    exports = split ' ', 'PAST PCT PGE'
    parrotns.'export_to'(phpns, exports)
.end

.include 'src/pct/gen_grammar.pir'
.include 'src/pct/gen_actions.pir'
.include 'src/pct/quote_expression.pir'

.HLL '_pipp'

.const string VERSION = "0.0.1"

.sub '__onload' :anon :load :init

    # %valflags specifies when PAST::Val nodes are allowed to
    # be used as a constant.  The 'e' flag indicates that the
    # value must be quoted+escaped in PIR code.
    .local pmc valflags
    valflags = get_root_global ['parrot';'PAST';'Compiler'], '%valflags'
    valflags['PhpString']   = 's~*e'

    # for accessing config info
    load_bytecode 'config.pbc'

    load_bytecode 'P6object.pbc'

    # determine location of libs from the Parrot config
    .local pmc cfg
    $P0 = get_root_global ['parrot'], '_config'
    cfg  = $P0()
    .local string lib_dir, pbc_fn
    lib_dir = cfg['build_dir']
    lib_dir .= '/languages/pipp/src/common'

    pbc_fn = concat lib_dir, '/pipplib.pbc'
    load_bytecode pbc_fn
    pbc_fn = concat lib_dir, '/php_ctype.pbc'
    load_bytecode pbc_fn
    pbc_fn = concat lib_dir, '/php_gmp.pbc'
    load_bytecode pbc_fn
    pbc_fn = concat lib_dir, '/php_pcre.pbc'
    load_bytecode pbc_fn

    load_bytecode 'CGI/QueryHash.pbc'
    load_bytecode 'dumper.pbc'
    load_bytecode 'Getopt/Obj.pbc'

    # import PGE::Util::die into Pipp::Grammar
    $P0 = get_root_global ['parrot';'PGE';'Util'], 'die'
    set_hll_global ['Pipp'; 'Grammar'], 'die', $P0
    set_hll_global ['Pipp'], 'die', $P0

    # Initialize the stack @?BLOCK
    $P0 = new 'ResizablePMCArray'
    set_root_global ['pipp';'Pipp';'Grammar';'Actions'], '@?BLOCK', $P0

    # register and set up the the HLLCompiler
    $P1 = new ['PCT';'HLLCompiler']
    $P1.'language'('Pipp')
    $P0 = get_root_namespace ['pipp';'Pipp';'Grammar']
    $P1.'parsegrammar'($P0)
    $P0 = get_root_namespace ['pipp';'Pipp';'Grammar';'Actions']
    $P1.'parseactions'($P0)

.end

.sub 'pipp' :main
    .param pmc argv

    .local string prog, php_source_fn
    .local pmc    opt
    (prog, opt, php_source_fn) = parse_arguments(argv)

    if php_source_fn goto GOT_PHP_SOURCE_FN
        # XXX: should do REPL or read from stdin
        printerr "No input file specified.\n"
        exit -1

  GOT_PHP_SOURCE_FN:

    # config stuff
    .local pmc cfg
    $P0 = get_root_global ['parrot'], '_config'
    cfg  = $P0()
    .local string build_dir
    build_dir = cfg['build_dir']

    .local pmc pipp_ini
    pipp_ini = opt['d']
    set_ini( pipp_ini )

    set_predefined_variables()
    set_superglobals()

    # target of compilation
    .local string target
    target = opt['target']

    # output file
    .local string output
    output = opt['output']

    # look at commandline and decide what to do
    .local string cmd, err_msg, variant
    .local int ret

    # run the NQP-code when called with --run-nqp
    $I0 = defined opt['run-nqp']
    if  $I0                   goto RUN_NQP

    # check for the variant from the commandline or from the environment
    $I0 = defined opt['variant']
    unless $I0 goto GET_VARIANT_FROM_ENV
        variant = opt['variant']
        goto GOT_VARIANT
GET_VARIANT_FROM_ENV:
    .local pmc env
    env = new 'Env'
    $I0 = exists env['PIPP_VARIANT']
    unless $I0 goto USE_DEFAULT_VARIANT
        variant = env['PIPP_VARIANT']
        goto GOT_VARIANT
USE_DEFAULT_VARIANT:
    variant = 'pct'
    goto GOT_VARIANT

GOT_VARIANT:
    if variant == 'antlr3'    goto VARIANT_ANTLR3
    if variant == 'ANTLR3'    goto VARIANT_ANTLR3
    if variant == 'antlr'     goto VARIANT_ANTLR3
    if variant == 'ANTLR'     goto VARIANT_ANTLR3
    if variant == 'pct'       goto VARIANT_PCT
    if variant == 'PCT'       goto VARIANT_PCT
    if variant == 'phc'       goto VARIANT_PHC
    if variant == 'PHC'       goto VARIANT_PHC
    err_msg = "Unknown pipp variant: '"
    err_msg .= variant
    err_msg .= "'."
    goto ERROR

VARIANT_PCT:
    # use the Parrot Compiler Toolkit by default
    .local pmc pipp_compiler
    pipp_compiler = compreg 'Pipp'

    .local pmc args
    args = new 'ResizableStringArray'
    push args, prog
    push args, php_source_fn

    # $P0 = get_root_global ['parrot'], '_dumper'
    # $P0( args )
    .tailcall pipp_compiler.'command_line'( args, 'target' => target, 'output' => output )

VARIANT_PHC:
    .local string phc_src_dir
    phc_src_dir =  concat build_dir, '/languages/pipp/src/phc'

    # work with the XML generated by PHC, the PHP Compiler
    err_msg = 'Creating XML-AST with phc failed'
    cmd = 'phc --dump-ast-xml '
    concat cmd, source_fn
    concat cmd, '> pipp_phc_ast.xml'
    ret = spawnw cmd
    if ret goto ERROR

    err_msg = 'Creating XML-PAST with xsltproc failed'
    cmd  = 'xsltproc '
    cmd .= phc_src_dir
    cmd .= '/phc_xml_to_past_xml.xsl pipp_phc_ast.xml > pipp_phc_past.xml'
    ret = spawnw cmd
    if ret goto ERROR

    err_msg = 'Creating NQP with xsltproc failed'
    cmd  = 'xsltproc '
    cmd .= phc_src_dir
    cmd .= '/past_xml_to_past_nqp.xsl  pipp_phc_past.xml  > pipp_phc_past.nqp'
    ret = spawnw cmd
    if ret goto ERROR

    .tailcall run_nqp( 'pipp_phc_past.nqp', target )

RUN_NQP:
    .tailcall run_nqp( php_source_fn, target )

ERROR:
    printerr err_msg
    printerr "\n"

    exit ret

.end

# currently not used
.sub run_nqp
    .param string nqp_source_fn
    .param string target

    # config stuff
    .local pmc cfg
    $P0 = get_root_global ['parrot'], '_config'
    cfg  = $P0()
    .local string build_dir
    build_dir = cfg['build_dir']

    # compile NQP to PIR
    .local string pir_fn, cmd
    .local int ret
    pir_fn  = build_dir
    pir_fn .= '/languages/pipp/'
    pir_fn .=  nqp_source_fn
    substr pir_fn, -3, 3, 'pir'     # change extension from '.nqp' to '.pir'
    cmd  = build_dir
    cmd .= '/parrot '
    cmd .= build_dir
    cmd .= '/compilers/nqp/nqp.pbc --target=pir --output='
    cmd .= pir_fn
    cmd .= ' '
    cmd .= nqp_source_fn
    ret = spawnw cmd

    # load the generated PIR
    load_bytecode pir_fn

    .local pmc stmts
    ( stmts ) = php_entry()     # stmts contains the PAST
    if target != 'past' goto NO_PAST_DUMP
        $P0 = get_root_global ['parrot'], '_dumper'
        $P0( stmts )
        .return ()
    NO_PAST_DUMP:

    # compile and evaluate the PAST returned from scheme_entry()
    .local pmc past_compiler
    past_compiler = new [ 'PCT';'HLLCompiler' ]
    $P0 = split ' ', 'post pir evalpmc'
    past_compiler.'stages'( $P0 )
    past_compiler.'eval'(stmts)

    .return ()
.end

# get commandline options
.sub parse_arguments
    .param pmc argv

    # name of the called program
    .local string prog
    prog = shift argv

    .local pmc getopts
    getopts = new 'Getopt::Obj'

    # Pipp specific command line options
    push getopts, 'f=s'                # source file
    push getopts, 'variant=s'          # switch between variants
    push getopts, 'target=s'           # compilation target, used during development
    push getopts, 'run-nqp'            # run PAST set up in NQP
    push getopts, 'output|o=s'

    # standard PHP options
    push getopts, 'version'
    push getopts, 'help'
    push getopts, 'd=%'

    # options used by the PHP 5.3 test suit, not yet used
    push getopts, 'C'

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
        print "usage: "
        print prog
        print " [options...] [file]\n"
        print "see\n\tperldoc -F "
        print prog
        print "\nfor more\n"
        end
  n_help:

    # Find the name of the input file
    .local int argc
    .local string php_source_fn
    argc = elements argv
    if argc < 1 goto NO_PHP_SCRIPT_NAME
        dec argc
        php_source_fn = argv[argc]
        goto GOT_PHP_SOURCE_FN
  NO_PHP_SCRIPT_NAME:

    $I0 = defined opt['f']
    unless $I0 goto GOT_NO_F_OPTION
        php_source_fn = opt['f']
  GOT_NO_F_OPTION:

  GOT_PHP_SOURCE_FN:
    .return (prog, opt, php_source_fn)
.end

# keep arguments from the command line and from ini-file
.sub set_ini
    .param pmc pipp_ini

    set_root_global ['pipp'], 'pipp_ini', pipp_ini
.end

# there is a distinction between predefined variables and superglobals
.sub set_predefined_variables

    # TODO: these should probably be lexicals
    .local pmc php_errormsg
    php_errormsg = new 'PhpString'
    php_errormsg = ''
    set_root_global ['pipp'], '$php_errormsg', php_errormsg

    .local pmc included_files
    included_files = new 'PhpArray'
    set_root_global ['pipp'], '$INC', included_files

    .local string default_include_path
    $P0 = get_root_global ['pipp'], 'constant'
    default_include_path = $P0('DEFAULT_INCLUDE_PATH')
    $P0 = split ':', default_include_path
    set_root_global ['pipp'], '$INCLUDE_PATH', $P0

.end

# Most of the superglobals are not initialized yet
# When adding superglobals, please alse add them to @?SUPER_GLOBALS in actions.pm
.sub set_superglobals

    # the superglobals _GET and _POST need to be set up
    .local pmc parse_get
    parse_get   = get_root_global ['parrot';'CGI'; 'QueryHash'], 'parse_get'
    $P0         = parse_get()
    $P1         = new 'PhpArray'
    assign $P1, $P0
    set_root_global ['pipp'], '$_GET', $P1

    .local pmc parse_post
    parse_post = get_root_global ['parrot';'CGI';'QueryHash'], 'parse_post'
    $P0        = parse_post()
    $P1        = new 'PhpArray'
    assign $P1, $P0
    set_root_global ['pipp'], '$_POST', $P1

    $P0 = new 'PhpArray'
    set_root_global ['pipp'], '$_SERVER', $P0

    $P0 = new 'PhpArray'
    set_root_global ['pipp'], '$_GLOBALS', $P0

    $P0 = new 'PhpArray'
    set_root_global ['pipp'], '$_FILES', $P0

    $P0 = new 'PhpArray'
    set_root_global ['pipp'], '$_COOKIE', $P0

    $P0 = new 'PhpArray'
    $P0['name'] = '$_SESSION'  # dummy content
    set_root_global ['pipp'], '$_SESSION', $P0

    $P0 = new 'PhpArray'
    $P0['name'] = '$_REQUEST'  # dummy content
    set_root_global ['pipp'], '$_REQUEST', $P0

    $P0 = new 'PhpArray'
    set_root_global ['pipp'], '$_ENV', $P0

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
