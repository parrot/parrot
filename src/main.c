/*
Copyright (C) 2007-2010, Parrot Foundation.
$Id$

=head1 NAME

src/main.c - the Entry Point to Parrot Programs

=head1 DESCRIPTION

Start Parrot

=head2 Functions

=over 4

=cut

*/

#include <stdio.h>

#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/imcc.h"
#include "parrot/longopt.h"
#include "parrot/runcore_api.h"
#include "pmc/pmc_callcontext.h"

/* For gc_sys_type_enum */
#include "gc/gc_private.h"

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void help(void);
static void help_debug(void);
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int is_all_hex_digits(ARGIN(const char *s))
        __attribute__nonnull__(1);

static void Parrot_version(void);
PARROT_CAN_RETURN_NULL
static const char * parseflags(PARROT_INTERP,
    int argc,
    ARGIN(const char *argv[]),
    ARGOUT(int *pgm_argc),
    ARGOUT(const char ***pgm_argv),
    ARGMOD(Parrot_Run_core_t *core),
    ARGMOD(Parrot_trace_flags *trace))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        __attribute__nonnull__(6)
        __attribute__nonnull__(7)
        FUNC_MODIFIES(*pgm_argc)
        FUNC_MODIFIES(*pgm_argv)
        FUNC_MODIFIES(*core)
        FUNC_MODIFIES(*trace);

static void parseflags_minimal(PARROT_INTERP,
    int argc,
    ARGIN(const char *argv[]))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static void usage(ARGMOD(FILE *fp))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*fp);

#define ASSERT_ARGS_help __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_help_debug __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_is_all_hex_digits __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_version __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_parseflags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(argv) \
    , PARROT_ASSERT_ARG(pgm_argc) \
    , PARROT_ASSERT_ARG(pgm_argv) \
    , PARROT_ASSERT_ARG(core) \
    , PARROT_ASSERT_ARG(trace))
#define ASSERT_ARGS_parseflags_minimal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(argv))
#define ASSERT_ARGS_usage __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(fp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<int main(int argc, const char *argv[])>

The entry point from the command line into Parrot.

=cut

*/

int
main(int argc, const char *argv[])
{
    int          stacktop;
    const char  *sourcefile;
    const char  *execname;
    Interp      *interp;
    int          status;
    int          pir_argc;
    const char **pir_argv;

    Parrot_Run_core_t  core  = PARROT_SLOW_CORE;
    Parrot_trace_flags trace = PARROT_NO_TRACE;

    /* internationalization setup */
    /* setlocale(LC_ALL, ""); */
    PARROT_BINDTEXTDOMAIN(PACKAGE, LOCALEDIR);
    PARROT_TEXTDOMAIN(PACKAGE);

    Parrot_set_config_hash();

    interp = allocate_interpreter(NULL, PARROT_NO_FLAGS);

    /* We parse the arguments, but first store away the name of the Parrot
       executable, since parsing destroys that and we want to make it
       available. */
    execname = argv[0];

    /* Parse minimal subset of flags */
    parseflags_minimal(interp, argc, argv);

    /* Now initialize interpreter */
    initialize_interpreter(interp, (void*)&stacktop);

    /* Parse flags */
    sourcefile = parseflags(interp, argc, argv, &pir_argc, &pir_argv, &core, &trace);

    Parrot_set_trace(interp, trace);
    Parrot_set_run_core(interp, (Parrot_Run_core_t) core);
    Parrot_set_executable_name(interp, Parrot_str_new(interp, execname, 0));

    status = imcc_run(interp, sourcefile, argc, argv);

    if (status)
        imcc_run_pbc(interp, interp->output_file, pir_argc, pir_argv);

    /* Clean-up after ourselves */
    Parrot_destroy(interp);
    Parrot_exit(interp, 0);
}

#define SET_FLAG(flag)   Parrot_set_flag(interp, (flag))
#define SET_DEBUG(flag)  Parrot_set_debug(interp, (flag))
#define SET_TRACE(flag)  Parrot_set_trace(interp, (flag))

/*

=item C<static int is_all_hex_digits(const char *s)>

Tests all characters in a string are hexadecimal digits.
Returns 1 if true, 0 as soon as a non-hex found

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int
is_all_hex_digits(ARGIN(const char *s))
{
    ASSERT_ARGS(is_all_hex_digits)
    for (; *s; ++s)
        if (!isxdigit(*s))
            return 0;
    return 1;
}

/*

=item C<static void usage(FILE *fp)>

Outputs usage error message.

=cut

*/

static void
usage(ARGMOD(FILE *fp))
{
    ASSERT_ARGS(usage)
    fprintf(fp,
            "parrot -[acEGhprtvVwy.] [-d [FLAGS]] [-D [FLAGS]]"
            "[-O [level]] [-R runcore] [-o FILE] <file>\n");
}

/*

=item C<static void help_debug(void)>

Print out list of debugging flag values.

=cut

*/

static void
help_debug(void)
{
    ASSERT_ARGS(help_debug)
    /* split printf for C89 compliance on string length */
    printf(
    "--imcc-debug -d [Flags] ...\n"
    "    0002    lexer\n"
    "    0004    parser\n"
    "    0008    imc\n"
    "    0010    CFG\n"
    "    0020    optimization 1\n"
    "    0040    optimization 2\n"
    "    0100    AST\n"
    "    1000    PBC\n"
    "    2000    PBC constants\n"
    "    4000    PBC fixups\n"
    "\n");
    printf(
    "--parrot-debug -D [Flags] ...\n"
    "    0001    memory statistics\n"
    "    0002    print backtrace on exception\n"
    "    0004    JIT debugging\n"
    "    0008    interpreter startup\n"
    "    0010    thread debugging\n"
    "    0020    eval/compile\n"
    "    0040    fill I, N registers with garbage\n"
    "    0080    show when a context is destroyed\n"
    "\n"
    "--trace -t [Flags] ...\n"
    "    0001    opcodes\n"
    "    0002    find_method\n"
    "    0004    function calls\n");
}

/*

=item C<static void help(void)>

Print out "help" list of options.

=cut

*/

static void
help(void)
{
    ASSERT_ARGS(help)
    /* split printf for C89 compliance on string length */
    printf(
    "parrot [Options] <file>\n"
    "  Options:\n"
    "    -h --help\n"
    "    -V --version\n"
    "    -I --include add path to include search\n"
    "    -L --library add path to library search\n"
    "       --hash-seed F00F  specify hex value to use as hash seed\n"
    "    -X --dynext add path to dynamic extension search\n"
    "   <Run core options>\n"
    "    -R --runcore slow|bounds|fast\n"
    "    -R --runcore trace|profiling|gcdebug\n"
    "    -t --trace [flags]\n"
    "   <VM options>\n"
    "    -D --parrot-debug[=HEXFLAGS]\n"
    "       --help-debug\n");
    printf(
    "    -w --warnings\n"
    "    -G --no-gc\n"
    "       --gc-debug\n"
    "       --leak-test|--destroy-at-end\n"
    "    -g --gc ms|inf set GC type\n"
    "    -. --wait    Read a keystroke before starting\n"
    "       --runtime-prefix\n"
    "   <Compiler options>\n"
    "    -d --imcc-debug[=HEXFLAGS]\n"
    "    -v --verbose\n"
    "    -E --pre-process-only\n"
    "    -o --output=FILE\n"
    "       --output-pbc\n"
    "    -O --optimize[=LEVEL]\n"
    "    -a --pasm\n"
    "    -c --pbc\n"
    "    -r --run-pbc\n"
    "    -y --yydebug\n"
    "   <Language options>\n"
    "see docs/running.pod for more\n");
}


/*

=item C<static void Parrot_version(void)>

Print out parrot version number.

=cut

*/

static void
Parrot_version(void)
{
    ASSERT_ARGS(Parrot_version)
    printf("This is Parrot version " PARROT_VERSION);
    printf(" built for " PARROT_ARCHNAME ".\n");
    printf("Copyright (C) 2001-2010, Parrot Foundation.\n\
\n\
This code is distributed under the terms of the Artistic License 2.0.\
\n\
For more details, see the full text of the license in the LICENSE file\
\n\
included in the Parrot source tree.\n\n");

    exit(EXIT_SUCCESS);
}

/*

=item C<static void parseflags_minimal(PARROT_INTERP, int argc, const char
*argv[])>

Parse minimal subset of args required for initializing interpreter.

=cut

*/
static void
parseflags_minimal(PARROT_INTERP, int argc, ARGIN(const char *argv[]))
{
    ASSERT_ARGS(parseflags_minimal)

    int pos = 0;

    while (pos < argc) {
        const char *arg = argv[pos];

        if (STREQ(arg, "--gc")) {
            ++pos;
            if (pos == argc) {
                fprintf(stderr,
                        "main: No GC specified."
                        "\n\nhelp: parrot -h\n");
                exit(EXIT_FAILURE);
            }
            arg = argv[pos];
            if (STREQ(arg, "ms"))
                interp->gc_sys->sys_type = MS;
            else if (STREQ(arg, "inf"))
                interp->gc_sys->sys_type = INF;
            else {
                fprintf(stderr,
                        "main: Unrecognized GC '%s' specified."
                        "\n\nhelp: parrot -h\n", arg);
                exit(EXIT_FAILURE);
            }
            break;
        }
        else if (!strncmp(arg, "--hash-seed", 11)) {

            if ((arg = strrchr(arg, '=')))
                ++arg;
            else
                arg = argv[++pos];

            if (is_all_hex_digits(arg)) {
                interp->hash_seed = strtoul(arg, NULL, 16);
            }
            else {
                fprintf(stderr, "error: invalid hash seed specified:"
                        "'%s'\n", arg);
                exit(EXIT_FAILURE);
            }
            ++pos;
            arg = argv[pos];
        }
        ++pos;
    }
}

/*

=item C<static const char * parseflags(PARROT_INTERP, int argc, const char
*argv[], int *pgm_argc, const char ***pgm_argv, Parrot_Run_core_t *core,
Parrot_trace_flags *trace)>

Parse Parrot's command line for options and set appropriate flags.

=cut

*/

PARROT_CAN_RETURN_NULL
static const char *
parseflags(PARROT_INTERP,
        int argc, ARGIN(const char *argv[]),
        ARGOUT(int *pgm_argc), ARGOUT(const char ***pgm_argv),
        ARGMOD(Parrot_Run_core_t *core), ARGMOD(Parrot_trace_flags *trace))
{
    ASSERT_ARGS(parseflags)
    struct longopt_opt_info opt  = LONGOPT_OPT_INFO_INIT;
    int                     status;

    if (argc == 1) {
        usage(stderr);
        exit(EXIT_SUCCESS);
    }

    while ((status = longopt_get(interp, argc, argv, Parrot_cmd_options(), &opt)) > 0) {
        switch (opt.opt_id) {
          case 'R':
            if (STREQ(opt.opt_arg, "slow") || STREQ(opt.opt_arg, "bounds"))
                *core = PARROT_SLOW_CORE;
            else if (STREQ(opt.opt_arg, "fast") || STREQ(opt.opt_arg, "function"))
                *core = PARROT_FAST_CORE;
            else if (STREQ(opt.opt_arg, "jit"))
                *core = PARROT_FAST_CORE;
            else if (STREQ(opt.opt_arg, "exec"))
                *core = PARROT_EXEC_CORE;
            else if (STREQ(opt.opt_arg, "trace"))
                *core = PARROT_SLOW_CORE;
            else if (STREQ(opt.opt_arg, "profiling"))
                *core = PARROT_PROFILING_CORE;
            else if (STREQ(opt.opt_arg, "gcdebug"))
                *core = PARROT_GC_DEBUG_CORE;
            else {
                fprintf(stderr,
                        "main: Unrecognized runcore '%s' specified."
                        "\n\nhelp: parrot -h\n", opt.opt_arg);
                exit(EXIT_FAILURE);
            }
            break;
          case 'g':
            /* Handled in parseflags_minimal */
            break;
          case 't':
            if (opt.opt_arg && is_all_hex_digits(opt.opt_arg)) {
                const unsigned long _temp = strtoul(opt.opt_arg, NULL, 16);
                const Parrot_trace_flags _temp_flag = (Parrot_trace_flags)_temp;
                *trace = _temp_flag;
            }
            else
                *trace = PARROT_TRACE_OPS_FLAG;
            break;
          case 'D':
            if (opt.opt_arg && is_all_hex_digits(opt.opt_arg)) {
                SET_DEBUG(strtoul(opt.opt_arg, NULL, 16));
            }
            else
                SET_DEBUG(PARROT_MEM_STAT_DEBUG_FLAG);
            break;

          case '.':  /* Give Windows Parrot hackers an opportunity to
                      * attach a debuggger. */
            fgetc(stdin);
            break;
          case 'h':
            help();
            exit(EXIT_FAILURE);
            break;
          case OPT_HASH_SEED:
            /* handled in parseflags_minimal */
            break;
          case OPT_HELP_DEBUG:
            help_debug();
            exit(EXIT_FAILURE);
            break;
          case OPT_RUNTIME_PREFIX:
            Parrot_io_printf(interp, "%Ss\n",
                    Parrot_get_runtime_path(interp));
            exit(EXIT_SUCCESS);
          case 'V':
            Parrot_version();
            break;

          case OPT_GC_DEBUG:
#if DISABLE_GC_DEBUG
            Parrot_warn(interp, PARROT_WARNINGS_ALL_FLAG,
                "PARROT_GC_DEBUG is set but the binary was compiled "
                "with DISABLE_GC_DEBUG.");
#endif
            SET_FLAG(PARROT_GC_DEBUG_FLAG);
            break;
          case OPT_DESTROY_FLAG:
            SET_FLAG(PARROT_DESTROY_FLAG);
            break;
          case 'I':
            Parrot_lib_add_path_from_cstring(interp, opt.opt_arg,
                    PARROT_LIB_PATH_INCLUDE);
            break;
          case 'L':
            Parrot_lib_add_path_from_cstring(interp, opt.opt_arg,
                    PARROT_LIB_PATH_LIBRARY);
            break;
          case 'X':
            Parrot_lib_add_path_from_cstring(interp, opt.opt_arg,
                    PARROT_LIB_PATH_DYNEXT);
            break;
          case 'w':
            /* FIXME It's not best way to set warnings... */
            Parrot_setwarnings(interp, PARROT_WARNINGS_ALL_FLAG);
            break;
          case 'o':
            interp->output_file = opt.opt_arg;
            break;
          case OPT_PBC_OUTPUT:
            if (!interp->output_file)
                interp->output_file = "-";
          default:
            /* languages handle their arguments later (after being initialized) */
            break;
        }
    }

    if (status == -1) {
        fprintf(stderr, "%s\n", opt.opt_error);
        usage(stderr);
        exit(EXIT_FAILURE);
    }

    /* reached the end of the option list and consumed all of argv */
    if (argc == opt.opt_index) {
        if (interp->output_file) {
            fprintf(stderr, "Missing program name or argument for -o\n");
        }
        else {
            /* We are not looking at an option, so it must be a program name */
            fprintf(stderr, "Missing program name\n");
        }
        usage(stderr);
        exit(EXIT_FAILURE);
    }

    *pgm_argc = argc - opt.opt_index;
    *pgm_argv = argv + opt.opt_index;

    return (*pgm_argv)[0];
}
/*

=back

=head1 SEE ALSO

F<compilers/imcc/main.c>, unfortunately.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
