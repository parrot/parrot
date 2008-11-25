# $Id$

=head1 NAME

lisp.pir - main function of Parrot Common Lisp

=head1 Description

The C<main> sub is provided here.
Some constants are defined
Needed PIR code is included.

=cut

# standard libs
.include "library/dumper.pir"

.const int INVALID_CHAR     = 0
.const int CONSTITUENT_CHAR = 1
.const int WHITESPACE_CHAR  = 2
.const int TERM_MACRO_CHAR  = 3
.const int NTERM_MACRO_CHAR = 4
.const int SESCAPE_CHAR     = 5
.const int MESCAPE_CHAR     = 6

.sub _init_common_lisp :init
    $P1 = loadlib 'rational'                   # The rational PMC is needed for 'LispRational'
.end


.include 'include/macros.pir'
.include 'types.pir'
.include 'read.pir'
.include 'eval.pir'
.include 'system.pir'
.include 'validate.pir'
.include 'cl.pir'
.include 'internals.pir'

.sub _common_lisp :main
    .param pmc argv

    .local pmc args                       # piece together args of function
    .local pmc retv                       # return value of function calls
    .local int res

    load_bytecode 'PGE.pbc'               # Parrot Grammar engine

    # compile a couple of regexes that are needed in validate.pir
    .local pmc p6rule
    p6rule = compreg "PGE::Perl6Regex"

    .local pmc is_integer
    is_integer = p6rule( '^<[+\-]>?\d+\.?$' )
    set_global 'is_integer', is_integer

    .local pmc is_float
    is_float = p6rule( '^<[+\-]>?\d+\.\d+$' )
    set_global 'is_float', is_float

    .local pmc is_qualified
    # todo keyword, split into qualifier, package and symbol
    is_qualified = p6rule( '(<[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]>*)\:(<[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789%\-]>*)' )
    set_global 'is_qualified', is_qualified

    # TODO: initialize the null lexical environment.

    # bootstrapping
    .local pmc bootstrap_filename
    .STRING(bootstrap_filename, "lisp/bootstrap.l")
    .LIST_1(args, bootstrap_filename)
    _load(args)

    # check the commandline whether we should read STDIN or load from file
    .local int argc
    argc = argv
    if argc <= 1 goto READ_STDIN

        # interpret a file
        .local pmc infile_name          # name of the inputfile from the commandline
        .STRING(infile_name, argv[1])
        .LIST_1(args, infile_name)
        retv = _load(args)              # Load the specified file.

        end

READ_STDIN:
    # Read-Eval-Print-Loop

    .local pmc symbol
    symbol = _LOOKUP_GLOBAL("COMMON-LISP", "*STANDARD-INPUT*")
    .local pmc stdin
    stdin = symbol.'_get_value'()

    push_eh DEBUGGER                    # Setup error handler for debug loop.

REP_LOOP:
    print "-> "                         # Display the top level prompt.

    .LIST_1(args, stdin)                # Read!
    retv = _read(args)

    .LIST_1(args, retv)                 # Eval!
    # VALID_IN_PARROT_0_2_0 retv = _eval(args)

    # VALID_IN_PARROT_0_2_0 foldup retv
    ( retv :slurpy) = _eval(args)

    .local int nretv
    nretv = retv

    .local pmc tmpval
    .local int i
    i = 0

PRINT_LOOP:
    tmpval = retv[i]

    print tmpval

    inc i
    if i == nretv goto PRINT_DONE

    print " ;\n"

    goto PRINT_LOOP

PRINT_DONE:
    print "\n"

    goto REP_LOOP

DEBUGGER:
    .local string message
    .local string msgtype
    .local pmc e

    .get_results (e)

    message = e

    print "*** ERROR: "
    print message
    print "\n"

    push_eh DEBUGGER

    goto REP_LOOP
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
