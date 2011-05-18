/*
Copyright (C) 2007-2011, Parrot Foundation.

=head1 NAME

src/main.c - The PIR/PASM compiler frontend to libparrot

=head1 DESCRIPTION

Start Parrot

=head2 Functions

=over 4

=cut

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "parrot/longopt.h"
#include "parrot/api.h"

struct init_args_t {
    const char *run_core_name;
    const char *sourcefile;
    Parrot_Int trace;
    int        execute_packfile;
    Parrot_Int have_pbc_file;
    Parrot_Int turn_gc_off;
};

extern int Parrot_set_config_hash(Parrot_PMC interp_pmc);

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void help(void);
static void help_debug(void);
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int is_all_digits(ARGIN(const char *s))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int is_all_hex_digits(ARGIN(const char *s))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const struct longopt_opt_decl * Parrot_cmd_options(void);

static void Parrot_confess(
    ARGIN(const char * condition),
    ARGIN(const char * file),
    unsigned int line)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void Parrot_version(void);
static void parseflags(
    Parrot_PMC interp,
    int argc,
    ARGIN(const char *argv[]),
    ARGOUT(int *pgm_argc),
    ARGOUT(const char ***pgm_argv),
    ARGMOD(struct init_args_t * args))
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        __attribute__nonnull__(6)
        FUNC_MODIFIES(*pgm_argc)
        FUNC_MODIFIES(*pgm_argv)
        FUNC_MODIFIES(* args);

static void parseflags_minimal(
    ARGMOD(Parrot_Init_Args * initargs),
    int argc,
    ARGIN(const char *argv[]))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* initargs);

static void print_parrot_string(
    Parrot_PMC interp,
    ARGMOD(FILE *vector),
    Parrot_String str,
    int newline)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*vector);

static void show_last_error_and_exit(Parrot_PMC interp);
static void usage(ARGMOD(FILE *fp))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*fp);

#define ASSERT_ARGS_help __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_help_debug __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_is_all_digits __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_is_all_hex_digits __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_cmd_options __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_confess __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(condition) \
    , PARROT_ASSERT_ARG(file))
#define ASSERT_ARGS_Parrot_version __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_parseflags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(argv) \
    , PARROT_ASSERT_ARG(pgm_argc) \
    , PARROT_ASSERT_ARG(pgm_argv) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_parseflags_minimal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(initargs) \
    , PARROT_ASSERT_ARG(argv))
#define ASSERT_ARGS_print_parrot_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(vector))
#define ASSERT_ARGS_show_last_error_and_exit __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
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
    Parrot_PMC   interp;
    Parrot_PMC   bytecodepmc;
    Parrot_PMC   argsarray;
    int          pir_argc;
    const char **pir_argv;
    Parrot_Init_Args *initargs;
    struct init_args_t parsed_flags;
    Parrot_String source_str;

    GET_INIT_STRUCT(initargs);
    /* internationalization setup */
    /* setlocale(LC_ALL, ""); */
    /* PARROT_BINDTEXTDOMAIN(PACKAGE, LOCALEDIR); */
    /* PARROT_TEXTDOMAIN(PACKAGE); */

    /* Parse minimal subset of flags */
    parseflags_minimal(initargs, argc, argv);

    if (!(Parrot_api_make_interpreter(NULL, 0, initargs, &interp) &&
          Parrot_set_config_hash(interp) &&
          Parrot_api_set_executable_name(interp, argv[0]))) {
        fprintf(stderr, "PARROT VM: Could not initialize new interpreter");
        show_last_error_and_exit(interp);
    }

    /* Parse flags */
    parseflags(interp, argc, argv, &pir_argc, &pir_argv, &parsed_flags);
    if (!Parrot_api_set_runcore(interp, parsed_flags.run_core_name, parsed_flags.trace))
        show_last_error_and_exit(interp);

    if (!Parrot_api_string_import(interp, parsed_flags.sourcefile, &source_str))
        show_last_error_and_exit(interp);

    if (parsed_flags.execute_packfile) {
        if (!Parrot_api_pmc_wrap_string_array(interp, pir_argc, pir_argv, &argsarray))
            show_last_error_and_exit(interp);
    }

    if (parsed_flags.have_pbc_file) {
        if (!Parrot_api_load_bytecode_file(interp, source_str, &bytecodepmc))
            show_last_error_and_exit(interp);
        if (parsed_flags.turn_gc_off)
            Parrot_api_toggle_gc(interp, 0);
    }
    else {
        Parrot_api_toggle_gc(interp, 0);
        if (!Parrot_api_wrap_imcc_hack(interp, source_str, argc, argv,
                                       &bytecodepmc, &parsed_flags.execute_packfile,
                                       imcc_run_api))
            show_last_error_and_exit(interp);
        if (!parsed_flags.turn_gc_off)
            Parrot_api_toggle_gc(interp, 1);
    }

    if (parsed_flags.execute_packfile) {
        if (!Parrot_api_run_bytecode(interp, bytecodepmc, argsarray))
            show_last_error_and_exit(interp);
    }

    /* Clean-up after ourselves */
    Parrot_api_destroy_interpreter(interp);
    exit(EXIT_SUCCESS);
}

/*

=item C<static void show_last_error_and_exit(Parrot_PMC interp)>

Prints out the C<interp>'s last error and exits.

=cut

*/

static void
show_last_error_and_exit(Parrot_PMC interp)
{
    ASSERT_ARGS(show_last_error_and_exit)
    Parrot_String errmsg, backtrace;
    Parrot_Int exit_code, is_error;
    Parrot_PMC exception;

    if (!Parrot_api_get_result(interp, &is_error, &exception, &exit_code, &errmsg))
        exit(EXIT_FAILURE);
    if (is_error) {
        if (!Parrot_api_get_exception_backtrace(interp, exception, &backtrace))
            exit(EXIT_FAILURE);
        print_parrot_string(interp, stderr, errmsg, 1);
        print_parrot_string(interp, stderr, backtrace, 0);
    }

    exit(exit_code);
}

/*

=item C<static void print_parrot_string(Parrot_PMC interp, FILE *vector,
Parrot_String str, int newline)>

Prints C<str> parrot string into the file handle C<vector> and an optional new
line if C<newline> is set to a true value.

=cut

*/

static void
print_parrot_string(Parrot_PMC interp, ARGMOD(FILE *vector), Parrot_String str,
        int newline)
{
    ASSERT_ARGS(print_parrot_string)
    char * msg_raw;
    if (!str)
        return;
    Parrot_api_string_export_ascii(interp, str, &msg_raw);
    if (msg_raw) {
        fprintf(vector, "%s%s", msg_raw, newline ? "\n" : "");
        Parrot_api_string_free_exported_ascii(interp, msg_raw);
    }
}

/*

=item C<static int is_all_digits(const char *s)>

Tests all characters in a string are decimal digits.
Returns 1 if true, 0 as soon as a non-decimal found

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int
is_all_digits(ARGIN(const char *s))
{
    ASSERT_ARGS(is_all_digits)
    for (; *s; ++s)
        if (!isdigit((unsigned char)*s))
            return 0;
    return 1;
}

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
    ASSERT_ARGS(is_all_hex_digits);
    for (; *s; ++s)
        if (!isxdigit(*s))
            return 0;
    return 1;
}

/*

=item C<static void Parrot_confess(const char * condition, const char * file,
unsigned int line)>

Prints an error

=cut

*/

static void
Parrot_confess(ARGIN(const char * condition), ARGIN(const char * file),
        unsigned int line)
{
    fprintf(stderr, "Parrot Error: %s (%s:%d)\n", condition, file, line);
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
    "       --gc-dynamic-threshold=percentage    maximum memory wasted by GC\n"
    "       --gc-min-threshold=KB\n"
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

=item C<static const struct longopt_opt_decl * Parrot_cmd_options(void)>

Set up the const struct declaration for cmd_options

=cut

*/



/* TODO: Weed out the options that are not used by this executable */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const struct longopt_opt_decl *
Parrot_cmd_options(void)
{
    ASSERT_ARGS(Parrot_cmd_options)
    static const struct longopt_opt_decl cmd_options[] = {
        { '.', '.', (OPTION_flags)0, { "--wait" } },
        { 'D', 'D', OPTION_optional_FLAG, { "--parrot-debug" } },
        { 'E', 'E', (OPTION_flags)0, { "--pre-process-only" } },
        { 'G', 'G', (OPTION_flags)0, { "--no-gc" } },
        { '\0', OPT_HASH_SEED, OPTION_required_FLAG, { "--hash-seed" } },
        { 'I', 'I', OPTION_required_FLAG, { "--include" } },
        { 'L', 'L', OPTION_required_FLAG, { "--library" } },
        { 'O', 'O', OPTION_optional_FLAG, { "--optimize" } },
        { 'R', 'R', OPTION_required_FLAG, { "--runcore" } },
        { 'g', 'g', OPTION_required_FLAG, { "--gc" } },
        { '\0', OPT_GC_DYNAMIC_THRESHOLD, OPTION_required_FLAG, { "--gc-dynamic-threshold" } },
        { '\0', OPT_GC_MIN_THRESHOLD, OPTION_required_FLAG, { "--gc-min-threshold" } },
        { '\0', OPT_GC_DEBUG, (OPTION_flags)0, { "--gc-debug" } },
        { 'V', 'V', (OPTION_flags)0, { "--version" } },
        { 'X', 'X', OPTION_required_FLAG, { "--dynext" } },
        { '\0', OPT_DESTROY_FLAG, (OPTION_flags)0,
                                     { "--leak-test", "--destroy-at-end" } },
        { 'o', 'o', OPTION_required_FLAG, { "--output" } },
        { '\0', OPT_PBC_OUTPUT, (OPTION_flags)0, { "--output-pbc" } },
        { 'a', 'a', (OPTION_flags)0, { "--pasm" } },
        { 'c', 'c', (OPTION_flags)0, { "--pbc" } },
        { 'd', 'd', OPTION_optional_FLAG, { "--imcc-debug" } },
        { '\0', OPT_HELP_DEBUG, (OPTION_flags)0, { "--help-debug" } },
        { 'h', 'h', (OPTION_flags)0, { "--help" } },
        { 'r', 'r', (OPTION_flags)0, { "--run-pbc" } },
        { '\0', OPT_RUNTIME_PREFIX, (OPTION_flags)0, { "--runtime-prefix" } },
        { 't', 't', OPTION_optional_FLAG, { "--trace" } },
        { 'v', 'v', (OPTION_flags)0, { "--verbose" } },
        { 'w', 'w', (OPTION_flags)0, { "--warnings" } },
        { 'y', 'y', (OPTION_flags)0, { "--yydebug" } },
        { 0, 0, (OPTION_flags)0, { NULL } }
    };
    return cmd_options;
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
    printf("Copyright (C) 2001-2011, Parrot Foundation.\n\
\n\
This code is distributed under the terms of the Artistic License 2.0.\
\n\
For more details, see the full text of the license in the LICENSE file\
\n\
included in the Parrot source tree.\n\n");

    exit(EXIT_SUCCESS);
}

/*

=item C<static void parseflags_minimal(Parrot_Init_Args * initargs, int argc,
const char *argv[])>

Parse minimal subset of args required for initializing interpreter.

=cut

*/
static void
parseflags_minimal(ARGMOD(Parrot_Init_Args * initargs), int argc, ARGIN(const char *argv[]))
{
    ASSERT_ARGS(parseflags_minimal)
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;
    int status;

    while ((status = longopt_get(argc, argv, Parrot_cmd_options(), &opt)) > 0) {
        switch (opt.opt_id) {
          case 'g':
            initargs->gc_system = opt.opt_arg;
            break;
          case OPT_GC_DYNAMIC_THRESHOLD:
            if (opt.opt_arg && is_all_digits(opt.opt_arg)) {
                initargs->gc_dynamic_threshold = strtoul(opt.opt_arg, NULL, 10);

                if (initargs->gc_dynamic_threshold > 1000) {
                    fprintf(stderr, "error: maximum GC threshold is 1000\n");
                    exit(EXIT_FAILURE);
                }
            }
            else {
                fprintf(stderr, "error: invalid GC dynamic threshold specified:"
                        "'%s'\n", opt.opt_arg);
                exit(EXIT_FAILURE);
            }
            break;
          case OPT_GC_MIN_THRESHOLD:
            if (opt.opt_arg && is_all_digits(opt.opt_arg)) {
                initargs->gc_min_threshold = strtoul(opt.opt_arg, NULL, 10)
                                           * 1024;
            }
            else {
                fprintf(stderr, "error: invalid GC min threshold specified:"
                        "'%s'\n", opt.opt_arg);
                exit(EXIT_FAILURE);
            }
            break;
          case OPT_HASH_SEED:
            if (opt.opt_arg && is_all_hex_digits(opt.opt_arg)) {
                initargs->hash_seed = strtoul(opt.opt_arg, NULL, 16);
            }
            else {
                fprintf(stderr, "error: invalid hash seed specified:"
                        "'%s'\n", opt.opt_arg);
                exit(EXIT_FAILURE);
            }
            break;
          default:
            break;
        }
    }
}

/*

=item C<static void parseflags(Parrot_PMC interp, int argc, const char *argv[],
int *pgm_argc, const char ***pgm_argv, struct init_args_t * args)>

Parse Parrot's command line for options and set appropriate flags.

=cut

*/

static void
parseflags(Parrot_PMC interp, int argc, ARGIN(const char *argv[]),
        ARGOUT(int *pgm_argc), ARGOUT(const char ***pgm_argv),
        ARGMOD(struct init_args_t * args))
{
    ASSERT_ARGS(parseflags)
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;
    int status;
    int result = 1;
    args->run_core_name = "slow";
    args->execute_packfile = 1;
    args->have_pbc_file = 0;
    args->trace = 0;
    args->turn_gc_off = 0;

    if (argc == 1) {
        usage(stderr);
        exit(EXIT_SUCCESS);
    }

    while ((status = longopt_get(argc, argv, Parrot_cmd_options(), &opt)) > 0) {
        switch (opt.opt_id) {
          case 'R':
            args->run_core_name = opt.opt_arg;
            break;
          case 'g':
          case OPT_GC_DYNAMIC_THRESHOLD:
          case OPT_GC_MIN_THRESHOLD:
            /* Handled in parseflags_minimal */
            break;
          case 'G':
            args->turn_gc_off = 1;
            break;
          case 't':
            if (opt.opt_arg && is_all_hex_digits(opt.opt_arg)) {
                const unsigned long _temp = strtoul(opt.opt_arg, NULL, 16);
                /* const Parrot_trace_flags _temp_flag = (Parrot_trace_flags)_temp; */
                const Parrot_Int _temp_flag = _temp;
                args->trace = _temp_flag;
            }
            else
                args->trace = 0x01;
                /* *trace = PARROT_TRACE_OPS_FLAG; */
            break;
          case 'D':
            if (opt.opt_arg && is_all_hex_digits(opt.opt_arg))
                result = Parrot_api_debug_flag(interp, strtoul(opt.opt_arg, NULL, 16), 1);
            else
                /* Parrot_api_debug_flag(interp, PARROT_MEM_STAT_DEBUG_FLAG, 1); */
                result = Parrot_api_debug_flag(interp, 0x01, 1);
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
            {
                Parrot_String runtimepath;
                char * runtimepath_c;
                Parrot_api_get_runtime_path(interp, &runtimepath);
                Parrot_api_string_export_ascii(interp, runtimepath, &runtimepath_c);
                fprintf(stdout, "%s", runtimepath_c);
                Parrot_api_string_free_exported_ascii(interp, runtimepath_c);
                exit(EXIT_SUCCESS);
            }
          case 'V':
            Parrot_version();
            break;
          case 'o':
            args->execute_packfile = 0;
            /* IMCC is going to read this option too, and handle it. */
            /* TODO: Move this logic out of IMCC. IMCC should return a
                     packfile and we can write it out to a file ourselves. */
            break;
          case 'r':
            args->execute_packfile = 1;
            /* TODO: What else do we need to do for -r? We need to write the
                     packfile out to a file first, then open and execute it? */
            break;
          case 'c':
            args->have_pbc_file = 1;
            break;
          case OPT_GC_DEBUG:
          /*
#if DISABLE_GC_DEBUG
            // Parrot_warn(interp, PARROT_WARNINGS_ALL_FLAG,
            Parrot_warn(interp, 0xFFFF,
                "PARROT_GC_DEBUG is set but the binary was compiled "
                "with DISABLE_GC_DEBUG.");
#endif
            */
            /* Parrot_api_flag(interp, PARROT_GC_DEBUG_FLAG, 1); */
            result = Parrot_api_flag(interp, 0x10, 1);
            break;
          case OPT_DESTROY_FLAG:
            /* Parrot_api_flag(interp, PARROT_DESTROY_FLAG, 1); */
            result = Parrot_api_flag(interp, 0x200, 1);
            break;
          case 'I':
            result = Parrot_api_add_include_search_path(interp, opt.opt_arg);
            break;
          case 'L':
            result = Parrot_api_add_library_search_path(interp, opt.opt_arg);
            break;
          case 'X':
            result = Parrot_api_add_dynext_search_path(interp, opt.opt_arg);
            break;
          case 'w':
            /* result = Parrot_api_set_warnings(interp, PARROT_WARNINGS_ALL_FLAG); */
            result = Parrot_api_set_warnings(interp, 0xFFFF);
            break;
          default:
            /* languages handle their arguments later (after being initialized) */
            break;
        }
    }

    if (!result) {
        fprintf(stderr, "Parrot VM: Error parsing option %s\n", argv[opt.opt_index]);
        usage(stderr);
        exit(EXIT_FAILURE);
    }
    if (status == -1) {
        fprintf(stderr, "%s\n", opt.opt_error);
        usage(stderr);
        exit(EXIT_FAILURE);
    }

    /* reached the end of the option list and consumed all of argv */
    if (argc == opt.opt_index) {
        /* We are not looking at an option, so it must be a program name */
        fprintf(stderr, "Missing program name\n");
        usage(stderr);
        exit(EXIT_FAILURE);
    }

    *pgm_argc = argc - opt.opt_index;
    *pgm_argv = argv + opt.opt_index;

    args->sourcefile = (*pgm_argv)[0];
    {
        const char * ext = strrchr(args->sourcefile, '.');
        if (ext && !strcmp(ext, ".pbc"))
            args->have_pbc_file = 1;
    }
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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
