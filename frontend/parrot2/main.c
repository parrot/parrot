/*
Copyright (C) 2007-2011, Parrot Foundation.

=head1 NAME

frontend/parrot2/main.c - The alternate PIR/PASM compiler frontend to libparrot

=head1 DESCRIPTION

Start Parrot, bootstrapping to PIR as early as possible.

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
#include "imcc/api.h"

struct init_args_t {
    const char *run_core_name;
    Parrot_Int trace;
    Parrot_Int turn_gc_off;
    const char ** argv;
    int argc;
};

extern int Parrot_set_config_hash(Parrot_PMC interp_pmc);
extern const unsigned char * get_program_code(void);
size_t get_program_code_size(void);

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

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
PARROT_PURE_FUNCTION
static int is_float(ARGIN(const char *s))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const struct longopt_opt_decl * Parrot_cmd_options(void);

static void parseflags(
    Parrot_PMC interp,
    int argc,
    ARGIN(const char *argv[]),
    ARGMOD(struct init_args_t * args))
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
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

PARROT_CANNOT_RETURN_NULL
static void setup_imcc(Parrot_PMC interp);

static void show_last_error_and_exit(Parrot_PMC interp);
static void usage(ARGMOD(FILE *fp))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*fp);

#define ASSERT_ARGS_help_debug __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_is_all_digits __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_is_all_hex_digits __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_is_float __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_cmd_options __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_parseflags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(argv) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_parseflags_minimal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(initargs) \
    , PARROT_ASSERT_ARG(argv))
#define ASSERT_ARGS_print_parrot_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(vector))
#define ASSERT_ARGS_setup_imcc __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
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
    Parrot_PMC interp, bytecodepmc, args;
    Parrot_Init_Args *initargs;
    struct init_args_t parsed_flags;

    GET_INIT_STRUCT(initargs);

    /* Parse minimal subset of flags */
    parseflags_minimal(initargs, argc, argv);

    if (!Parrot_api_make_interpreter(NULL, 0, initargs, &interp)) {
        fprintf(stderr, "PARROT VM: Could not allocate new interpreter\n");
        if (interp != NULL)
            show_last_error_and_exit(interp);
        else
            fprintf(stderr, "PARROT VM: No interpreter. Cannot get error details\n");
        exit(EXIT_FAILURE);
    }
    if (!(Parrot_set_config_hash(interp) &&
          Parrot_api_set_executable_name(interp, argv[0]))) {
        fprintf(stderr, "PARROT VM: Could not initialize new interpreter\n");
        show_last_error_and_exit(interp);
    }

    /* Parse flags */
    parseflags(interp, argc, argv, &parsed_flags);

    if (!Parrot_api_set_runcore(interp, parsed_flags.run_core_name, parsed_flags.trace))
        show_last_error_and_exit(interp);

    Parrot_api_toggle_gc(interp, 0);
    setup_imcc(interp);
    if (!parsed_flags.turn_gc_off)
        Parrot_api_toggle_gc(interp, 1);

    if (!(Parrot_api_pmc_wrap_string_array(interp, parsed_flags.argc, parsed_flags.argv,
                                            &args)
    && Parrot_api_load_bytecode_bytes(interp, get_program_code(), get_program_code_size(),
                                        &bytecodepmc)
    && Parrot_api_run_bytecode(interp, bytecodepmc, args)))
        show_last_error_and_exit(interp);

    /* Clean-up after ourselves */
    Parrot_api_destroy_interpreter(interp);
    exit(EXIT_SUCCESS);
}

/*

=item C<static void setup_imcc(Parrot_PMC interp)>

Call into IMCC to either compile or preprocess the input.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static void
setup_imcc(Parrot_PMC interp)
{
    ASSERT_ARGS(setup_imcc)
    Parrot_PMC pir_compiler = NULL;
    Parrot_PMC pasm_compiler = NULL;;

    if (!(imcc_get_pir_compreg_api(interp, 1, &pir_compiler) &&
          imcc_get_pasm_compreg_api(interp, 1, &pasm_compiler)))
        show_last_error_and_exit(interp);
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

    if (!Parrot_api_get_result(interp, &is_error, &exception, &exit_code, &errmsg)) {
        Parrot_api_destroy_interpreter(interp);
        exit(EXIT_FAILURE);
    }
    if (is_error) {
        if (!Parrot_api_get_exception_backtrace(interp, exception, &backtrace)) {
            Parrot_api_destroy_interpreter(interp);
            exit(EXIT_FAILURE);
        }
        print_parrot_string(interp, stderr, errmsg, 1);
        print_parrot_string(interp, stderr, backtrace, 0);
    }

    Parrot_api_destroy_interpreter(interp);
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
=item C<static int is_float(const char *s)>

Tests all characters in a string are decimal digits or dot.
Returns 1 if true, 0 as soon as a non-decimal found

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int
is_float(ARGIN(const char *s))
{
    ASSERT_ARGS(is_float)
    for (; *s; ++s)
        if (!(isdigit((unsigned char)*s) || (*s=='.')))
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
    ASSERT_ARGS(is_all_hex_digits)
    for (; *s; ++s)
        if (!isxdigit((unsigned char)*s))
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
            "parrot -[acEGhrtvVwy.] [-d [FLAGS]] [-D [FLAGS]]"
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
        { '\0', OPT_GC_NURSERY_SIZE, OPTION_required_FLAG, { "--gc-nursery-size" } },
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
          case OPT_GC_NURSERY_SIZE:
            if (opt.opt_arg && is_float(opt.opt_arg)) {
                initargs->gc_nursery_size = (float)strtod(opt.opt_arg, NULL);

                if (initargs->gc_nursery_size > 50) {
                    fprintf(stderr, "error: maximum GC nursery size is 50%%\n");
                    exit(EXIT_FAILURE);
                }
            }
            else {
                fprintf(stderr, "error: invalid GC nursery size specified:"
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
struct init_args_t * args)>

Parse Parrot's command line for options and set appropriate flags.

=cut

*/

static void
parseflags(Parrot_PMC interp, int argc, ARGIN(const char *argv[]),
        ARGMOD(struct init_args_t * args))
{
    ASSERT_ARGS(parseflags)
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;
    int status;
    int result = 1;
    int nargs = 0;
    int i;

    // Any option with an argument we handle may split an argument
    // into two.  So be pessimistic with the allocation.
    int pargs_size = argc * 2;
    const char **pargs = (const char**)calloc(pargs_size, sizeof (char*));

    if (argc == 1) {
        usage(stderr);
        exit(EXIT_SUCCESS);
    }

    args->run_core_name = "fast";
    args->trace = 0;
    args->turn_gc_off = 0;
    pargs[nargs++] = argv[0];

    while ((status = longopt_get(argc, argv, Parrot_cmd_options(), &opt)) > 0) {
        switch (opt.opt_id) {
          case 'R':
            args->run_core_name = opt.opt_arg;
            break;
          case 'g':
          case OPT_GC_NURSERY_SIZE:
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
            pargs[nargs++] = "-h";
            break;
          case OPT_HASH_SEED:
            /* handled in parseflags_minimal */
            break;
          case OPT_HELP_DEBUG:
            help_debug();
            exit(EXIT_FAILURE);
            break;
          case OPT_RUNTIME_PREFIX:
            pargs[nargs++] = "--runtime-prefix";
            break;
          case 'V':
            pargs[nargs++] = "-V";
            break;
          case OPT_PBC_OUTPUT:
          case 'o':
            pargs[nargs++] = "-o";
            pargs[nargs++] = opt.opt_arg;
            break;
          case 'r':
            pargs[nargs++] = "-r";
            break;
          case 'c':
            pargs[nargs++] = "-c";
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

            /* TODO: Can we do these in prt0.pir? */
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

          case 'E':
            pargs[nargs++] = "-E";
            break;
          default:
            /* languages handle their arguments later (after being initialized) */
            break;
        }
        if (!result) {
            fprintf(stderr, "Parrot VM: Error parsing option %s\n", argv[opt.opt_index]);
            usage(stderr);
            exit(EXIT_FAILURE);
        }
    }

    if (status == -1) {
        fprintf(stderr, "%s\n", opt.opt_error);
        usage(stderr);
        exit(EXIT_FAILURE);
    }
    for (i = opt.opt_index; i < argc; i++)
        pargs[nargs++] = argv[i];

    // Make sure we don't overrun the end of the array
    PARROT_ASSERT(nargs <= pargs_size);

    args->argv = pargs;
    args->argc = nargs;
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
