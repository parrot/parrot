/*
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 * Copyright (C) 2003-2011, Parrot Foundation.
 */

/*

=head1 NAME

compilers/imcc/main.c

=head1 DESCRIPTION

IMCC helpers.

=head2 Functions

=over 4

=cut

*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "imc.h"
#include "parrot/embed.h"
#include "parrot/longopt.h"
#include "parrot/runcore_api.h"
#include "pmc/pmc_callcontext.h"
#include "pmc/pmc_sub.h"
#include "pbc.h"
#include "parser.h"
#include "optimizer.h"

extern int yydebug;

/* XXX non-reentrant */
static Parrot_mutex eval_nr_lock;
static INTVAL       eval_nr  = 0;

/* HEADERIZER HFILE: compilers/imcc/imc.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile * compile_to_bytecode(PARROT_INTERP,
    ARGIN(STRING *sourcefile),
    ARGIN(STRING *output_file),
    ARGIN(yyscan_t yyscanner))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static PIOHANDLE determine_input_file_type(PARROT_INTERP,
    ARGIN(STRING *sourcefile))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void determine_output_file_type(PARROT_INTERP,
    ARGIN(STRING *output_file))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void do_pre_process(PARROT_INTERP, yyscan_t yyscanner)
        __attribute__nonnull__(1);

static void imcc_destroy_macro_values(ARGMOD(void *value))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*value);

static void imcc_get_optimization_description(
    const PARROT_INTERP,
    int opt_level,
    ARGMOD(char *opt_desc))
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*opt_desc);

PARROT_CAN_RETURN_NULL
static STRING * imcc_parseflags(PARROT_INTERP,
    int argc,
    ARGIN_NULLOK(const char **argv))
        __attribute__nonnull__(1);

static int imcc_run(PARROT_INTERP,
    ARGIN(STRING *sourcefile),
    ARGIN(STRING *output_file),
    ARGOUT(PMC **pbcpmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*pbcpmc);

static void imcc_write_pbc(PARROT_INTERP, ARGIN(STRING *output_file))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int is_all_hex_digits(ARGIN(const char *s))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const struct longopt_opt_decl * Parrot_cmd_options(void);

#define ASSERT_ARGS_compile_to_bytecode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sourcefile) \
    , PARROT_ASSERT_ARG(output_file) \
    , PARROT_ASSERT_ARG(yyscanner))
#define ASSERT_ARGS_determine_input_file_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sourcefile))
#define ASSERT_ARGS_determine_output_file_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(output_file))
#define ASSERT_ARGS_do_pre_process __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_imcc_destroy_macro_values __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(value))
#define ASSERT_ARGS_imcc_get_optimization_description \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(opt_desc))
#define ASSERT_ARGS_imcc_parseflags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_imcc_run __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sourcefile) \
    , PARROT_ASSERT_ARG(output_file) \
    , PARROT_ASSERT_ARG(pbcpmc))
#define ASSERT_ARGS_imcc_write_pbc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(output_file))
#define ASSERT_ARGS_is_all_hex_digits __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_cmd_options __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


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
    for (; *s; s++)
        if (!isxdigit(*s))
            return 0;
    return 1;
}

/*

=item C<static const struct longopt_opt_decl * Parrot_cmd_options(void)>

Set up the const struct declaration for cmd_options

=cut

*/

/* TODO: Weed out the options that IMCC doesn't use, and rename this function
         to something more imcc-ish
*/

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
        { 'a', 'a', (OPTION_flags)0, { "--pasm" } },
        { 'c', 'c', (OPTION_flags)0, { "--pbc" } },
        { 'd', 'd', OPTION_optional_FLAG, { "--imcc-debug" } },
        { '\0', OPT_HELP_DEBUG, (OPTION_flags)0, { "--help-debug" } },
        { 'h', 'h', (OPTION_flags)0, { "--help" } },
        { 'o', 'o', OPTION_required_FLAG, { "--output" } },
        { '\0', OPT_PBC_OUTPUT, (OPTION_flags)0, { "--output-pbc" } },
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

=item C<static STRING * imcc_parseflags(PARROT_INTERP, int argc, const char
**argv)>

Parse flags ans set approptiate state(s)

=cut

*/

PARROT_CAN_RETURN_NULL
static STRING *
imcc_parseflags(PARROT_INTERP, int argc, ARGIN_NULLOK(const char **argv))
{
    ASSERT_ARGS(imcc_parseflags)
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;
    STRING *output_file = STRINGNULL;

    /* default state: run pbc */
    SET_STATE_RUN_PBC(interp);
    if (!argv)
        return STRINGNULL;

    while (longopt_get(argc, argv, Parrot_cmd_options(), &opt) > 0) {
        switch (opt.opt_id) {
          case 'd':
            if (opt.opt_arg && is_all_hex_digits(opt.opt_arg)) {
                IMCC_INFO(interp)->debug = strtoul(opt.opt_arg, NULL, 16);
            }
            else {
                IMCC_INFO(interp)->debug++;
            }
            break;
          case 'a':
            SET_STATE_PASM_FILE(interp);
            break;
          case 'v':
            IMCC_INFO(interp)->verbose++;
            break;
          case 'y':
            yydebug = 1;
            break;
          case 'E':
            SET_STATE_PRE_PROCESS(interp);
            break;
          case 'o':
            UNSET_STATE_RUN_PBC(interp);
            output_file = Parrot_str_from_platform_cstring(interp, opt.opt_arg);
            break;

          case OPT_PBC_OUTPUT:
            UNSET_STATE_RUN_PBC(interp);
            SET_STATE_WRITE_PBC(interp);
            if (STRING_IS_NULL(output_file))
                output_file = Parrot_str_new(interp, "-", 1);
            break;

          case 'O':
            if (!opt.opt_arg) {
                IMCC_INFO(interp)->optimizer_level |= OPT_PRE;
                break;
            }
            if (strchr(opt.opt_arg, 'p'))
                IMCC_INFO(interp)->optimizer_level |= OPT_PASM;
            if (strchr(opt.opt_arg, 'c'))
                IMCC_INFO(interp)->optimizer_level |= OPT_SUB;

            /* currently not ok due to different register allocation */
            if (strchr(opt.opt_arg, '1')) {
                IMCC_INFO(interp)->optimizer_level |= OPT_PRE;
            }
            if (strchr(opt.opt_arg, '2')) {
                IMCC_INFO(interp)->optimizer_level |= (OPT_PRE | OPT_CFG);
            }
            break;

          default:
            /* skip already processed arguments */
            break;
        }
    }
    return output_file;
}

/*

=item C<static void do_pre_process(PARROT_INTERP, yyscan_t yyscanner)>

Pre-processor step.  Turn parser's output codes into Parrot instructions.

=cut

*/

static void
do_pre_process(PARROT_INTERP, yyscan_t yyscanner)
{
    ASSERT_ARGS(do_pre_process)
    int       c;
    YYSTYPE   val;

    IMCC_push_parser_state(interp);
    c = yylex(&val, yyscanner, interp); /* is reset at end of while loop */
    while (c) {
        switch (c) {
            case EMIT:          printf(".emit\n"); break;
            case EOM:           printf(".eom\n"); break;
            case LOCAL:         printf(".local "); break;
            case ARG:           printf(".set_arg "); break;
            case SUB:           printf(".sub "); break;
            case ESUB:          printf(".end"); break;
            case RESULT:        printf(".result "); break;
            case RETURN:        printf(".return "); break;
            case NAMESPACE:     printf(".namespace "); break;
            case CONST:         printf(".const "); break;
            case PARAM:         printf(".param "); break;
            case MACRO:         printf(".macro "); break;

            case GOTO:          printf("goto ");break;
            case IF:            printf("if ");break;
            case UNLESS:        printf("unless ");break;
            case INTV:          printf("int ");break;
            case FLOATV:        printf("float ");break;
            case STRINGV:       printf("string ");break;
            case PMCV:          printf("pmc ");break;
            case SHIFT_LEFT:    printf(" << ");break;
            case SHIFT_RIGHT:   printf(" >> ");break;
            case SHIFT_RIGHT_U: printf(" >>> ");break;
            case LOG_AND:       printf(" && ");break;
            case LOG_OR:        printf(" || ");break;
            case LOG_XOR:       printf(" ~~ ");break;
            case RELOP_LT:      printf(" < ");break;
            case RELOP_LTE:     printf(" <= ");break;
            case RELOP_GT:      printf(" > ");break;
            case RELOP_GTE:     printf(" >= ");break;
            case RELOP_EQ:      printf(" == ");break;
            case RELOP_NE:      printf(" != ");break;
            case POW:           printf(" ** ");break;
            case COMMA:         printf(", ");break;
            case LABEL:         printf("%s:\t", val.s); break;
            case PCC_BEGIN:     printf(".begin_call "); break;
            case PCC_END:       printf(".end_call"); break;
            case PCC_SUB:       printf(".pccsub "); break;
            case PCC_CALL:      printf(".call "); break;
            case PCC_BEGIN_RETURN:    printf(".begin_return"); break;
            case PCC_END_RETURN:      printf(".end_return"); break;
            case PCC_BEGIN_YIELD:     printf(".begin_yield"); break;
            case PCC_END_YIELD:       printf(".end_yield"); break;
            case FILECOMMENT:   printf("setfile \"%s\"\n", val.s); break;
            case LINECOMMENT:   printf("setline %d\n", val.t); break;

            case PLUS_ASSIGN:   printf("+= ");break;
            case MINUS_ASSIGN:  printf("-= ");break;
            case MUL_ASSIGN:    printf("*= ");break;
            case DIV_ASSIGN:    printf("/= ");break;
            case MOD_ASSIGN:    printf("%%= ");break;
            case FDIV_ASSIGN:   printf("//= ");break;
            case BAND_ASSIGN:   printf("&= ");break;
            case BOR_ASSIGN:    printf("|= ");break;
            case BXOR_ASSIGN:   printf("~= ");break;
            case SHR_ASSIGN:    printf(">>= ");break;
            case SHL_ASSIGN:    printf("<<= ");break;
            case SHR_U_ASSIGN:  printf(">>>= ");break;
            case CONCAT_ASSIGN: printf(".= ");break;

            case MAIN:          printf(":main");break;
            case LOAD:          printf(":load");break;
            case INIT:          printf(":init");break;
            case IMMEDIATE:     printf(":immediate");break;
            case POSTCOMP:      printf(":postcomp");break;
            case ANON:          printf(":anon");break;
            case OUTER:         printf(":outer");break;
            case NEED_LEX:      printf(":lex");break;
            case METHOD:        printf(":method");break;

            case ADV_FLAT:      printf(":flat");break;
            case ADV_SLURPY:    printf(":slurpy");break;
            case ADV_OPTIONAL:  printf(":optional");break;
            case ADV_OPT_FLAG:  printf(":opt_flag");break;
            case ADV_NAMED:     printf(":named");break;
            case ADV_ARROW:     printf("=>");break;

            default:
                if (c < 255)
                    printf("%c", c);
                else
                    printf("%s ", val.s);
                break;
        }
        c = yylex(&val, yyscanner, interp);
    }
    printf("\n");
    fflush(stdout);

    return;
}

/*

=item C<static void imcc_get_optimization_description(const PARROT_INTERP, int
opt_level, char *opt_desc)>

Create list (opt_desc[]) describing optimisation flags.

=cut

*/

static void
imcc_get_optimization_description(const PARROT_INTERP, int opt_level, ARGMOD(char *opt_desc))
{
    ASSERT_ARGS(imcc_get_optimization_description)
    int i = 0;

    if (opt_level & (OPT_PRE | OPT_CFG))
            opt_desc[i++] = '2';
    else
        if (opt_level & OPT_PRE)
            opt_desc[i++] = '1';

    if (opt_level & OPT_PASM)
        opt_desc[i++] = 'p';
    if (opt_level & OPT_SUB)
        opt_desc[i++] = 'c';

    opt_desc[i] = '\0';
    return;
}

/*

=item C<static void imcc_write_pbc(PARROT_INTERP, STRING *output_file)>

Output packed bytecode file.

=cut

*/

static void
imcc_write_pbc(PARROT_INTERP, ARGIN(STRING *output_file))
{
    ASSERT_ARGS(imcc_write_pbc)
    size_t     size;
    opcode_t  *packed;
    PIOHANDLE  fp;
    PackFile_ByteCode * const interp_code = Parrot_pf_get_current_code_segment(interp);

    IMCC_info(interp, 1, "Writing %Ss\n", output_file);

    size = PackFile_pack_size(interp, interp_code->base.pf) *
        sizeof (opcode_t);
    IMCC_info(interp, 1, "packed code %d bytes\n", size);
    packed = (opcode_t*) mem_sys_allocate(size);
    PackFile_pack(interp, interp->code->base.pf, packed);
    if (STRING_length(output_file) == 1
    &&  STRING_ord(interp, output_file, 0) == '-') {
        fp = PIO_STDHANDLE(interp, PIO_STDOUT_FILENO);
    }
    else {
        fp = PIO_OPEN(interp, output_file, PIO_F_WRITE);
        if (fp == PIO_INVALID_HANDLE)
            IMCC_fatal_standalone(interp, EXCEPTION_EXTERNAL_ERROR,
                "Couldn't open %Ss\n", output_file);
    }

    if ((size != PIO_WRITE(interp, fp, (char *)packed, size)))
        IMCC_fatal_standalone(interp, EXCEPTION_EXTERNAL_ERROR,
            "Couldn't write %Ss\n", output_file);
    PIO_CLOSE(interp, fp);
    IMCC_info(interp, 1, "%Ss written.\n", output_file);
    mem_sys_free(packed);
}

/*

=item C<static PIOHANDLE determine_input_file_type(PARROT_INTERP, STRING
*sourcefile)>

Determine whether the sourcefile is a .pir or .pasm file. Sets the appropriate
flags and returns a C<FILE*> to the opened file.

=cut

*/

static PIOHANDLE
determine_input_file_type(PARROT_INTERP, ARGIN(STRING *sourcefile))
{
    ASSERT_ARGS(determine_input_file_type)

    if (STRING_length(sourcefile) == 1
    &&  STRING_ord(interp, sourcefile, 0) ==  '-') {
        PIOHANDLE handle = PIO_STDHANDLE(interp, PIO_STDIN_FILENO);

        if ((FILE *)handle == NULL) {
            /*
             * We have to dup the handle because the stdin fd is 0 on UNIX and
             * lex would think it's a NULL FILE pointer and reset it to the
             * stdin FILE pointer.
             */
            handle = Parrot_io_dup(interp, handle);
        }

        return handle;
    }
    else {
        if (imcc_string_ends_with(interp, sourcefile, ".pasm"))
            SET_STATE_PASM_FILE(interp);
        return PIO_OPEN(interp, sourcefile, PIO_F_READ);
    }
}

/*

=item C<static void determine_output_file_type(PARROT_INTERP, STRING
*output_file)>

Decide what kind of file we are to output.

=cut

*/

static void
determine_output_file_type(PARROT_INTERP, ARGIN(STRING *output_file))
{
    ASSERT_ARGS(determine_output_file_type)

    if (imcc_string_ends_with(interp, output_file, ".pbc"))
        SET_STATE_WRITE_PBC(interp);
}

/*

=item C<static PackFile * compile_to_bytecode(PARROT_INTERP, STRING *sourcefile,
STRING *output_file, yyscan_t yyscanner)>

Compile source code into bytecode (or die trying).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile *
compile_to_bytecode(PARROT_INTERP,
                    ARGIN(STRING *sourcefile),
                    ARGIN(STRING *output_file),
                    ARGIN(yyscan_t yyscanner))
{
    ASSERT_ARGS(compile_to_bytecode)
    PackFile *pf;
    const int per_pbc   = STATE_WRITE_PBC(interp) || STATE_RUN_PBC(interp);
    const int opt_level = IMCC_INFO(interp)->optimizer_level;

    /* Shouldn't be more than five, but five extra is cheap */
    char opt_desc[10];

    imcc_get_optimization_description(interp, opt_level, opt_desc);

    IMCC_info(interp, 1, "using optimization '-O%s' (%x) \n",
              opt_desc, opt_level);

    pf = PackFile_new(interp, 0);
    Parrot_pf_set_current_packfile(interp, pf);
    /* If I comment out the above two lines and replace with this one below,
       Parrot builds and all tests pass. */
    /*pf = Parrot_pf_get_current_packfile(interp);*/

    IMCC_push_parser_state(interp);
    IMCC_INFO(interp)->state->file = sourcefile;

    emit_open(interp, per_pbc, per_pbc ? STRINGNULL : output_file);

    IMCC_info(interp, 1, "Starting parse...\n");

    IMCC_INFO(interp)->state->pasm_file = STATE_PASM_FILE(interp) ? 1 : 0;

    imcc_run_compilation(interp, yyscanner);
    if (IMCC_INFO(interp)->error_code) {
        IMCC_INFO(interp)->error_code=IMCC_FATAL_EXCEPTION;
        IMCC_warning(interp, "error:imcc:%Ss", IMCC_INFO(interp)->error_message);
        IMCC_print_inc(interp);

        imc_cleanup(interp, yyscanner);
        Parrot_x_jump_out_error(interp, IMCC_FATAL_EXCEPTION);
    }

    imc_cleanup(interp, yyscanner);

    PIO_CLOSE(interp, imc_yyin_get(yyscanner));

    IMCC_info(interp, 1, "%ld lines compiled.\n", IMCC_INFO(interp)->line);
    if (per_pbc && !IMCC_INFO(interp)->write_pbc)
        PackFile_fixup_subs(interp, PBC_POSTCOMP, NULL);
    return pf;
}

/*

=item C<int imcc_run_api(PMC * interp_pmc, STRING *sourcefile, int argc, const
char **argv, PMC **pbcpmc)>

This is a wrapper around C<imcc_run> function in which the input parameter is a
PMC interpreter.

=cut

*/

PARROT_EXPORT
int
imcc_run_api(ARGMOD(PMC * interp_pmc), ARGIN(STRING *sourcefile), int argc,
        ARGIN_NULLOK(const char **argv), ARGOUT(PMC **pbcpmc))
{
    ASSERT_ARGS(imcc_run_api)

    Interp * interp = (Interp *)VTABLE_get_pointer(NULL, interp_pmc);
    STRING *output_file = imcc_parseflags(interp, argc, argv);
    return imcc_run(interp, sourcefile, output_file, pbcpmc);
}

/*

=item C<static int imcc_run(PARROT_INTERP, STRING *sourcefile, STRING
*output_file, PMC **pbcpmc)>

Entry point of IMCC, as invoked by Parrot's main function.
Compile source code (if required), write bytecode file (if required)
and run. This function always returns 0.

=cut

*/

static int
imcc_run(PARROT_INTERP, ARGIN(STRING *sourcefile),
        ARGIN(STRING *output_file), ARGOUT(PMC **pbcpmc))
{
    ASSERT_ARGS(imcc_run)

    yyscan_t           yyscanner;
    PackFile * pf_raw = NULL;
    int       is_stdin;
    int       is_stdout;

    *pbcpmc = PMCNULL;

    yylex_init_extra(interp, &yyscanner);

    /* Figure out what kind of source file we have -- if we have one */
    if (!STRING_length(sourcefile))
        IMCC_fatal_standalone(interp, 1, "main: No source file specified.\n");
    else {
        PIOHANDLE in_file = determine_input_file_type(interp, sourcefile);
        if (in_file == PIO_INVALID_HANDLE)
            IMCC_fatal_standalone(interp, EXCEPTION_EXTERNAL_ERROR,
                                  "Error reading source file %Ss.\n",
                                  sourcefile);
        imc_yyin_set(in_file, yyscanner);
    }

    if (STATE_PRE_PROCESS(interp)) {
        do_pre_process(interp, yyscanner);
        yylex_destroy(yyscanner);

        return 0;
    }

    is_stdin  = STRING_length(sourcefile) == 1
             && STRING_ord(interp, sourcefile, 0) == '-';
    is_stdout = STRING_length(output_file) == 1
             && STRING_ord(interp, output_file, 0) == '-';

    /* Do we need to produce an output file? If so, what type? */
    if (STRING_length(output_file) != 0) {
        determine_output_file_type(interp, output_file);

        if (STRING_equal(interp, sourcefile, output_file) && !is_stdin)
            IMCC_fatal_standalone(interp, 1, "main: outputfile is sourcefile\n");
    }

    IMCC_INFO(interp)->write_pbc = STATE_WRITE_PBC(interp) ? 1 : 0;

    if (IMCC_INFO(interp)->verbose) {
        IMCC_info(interp, 1, "debug = 0x%x\n", IMCC_INFO(interp)->debug);
        if (is_stdin)
            IMCC_info(interp, 1, "Reading stdin\n");
        else
            IMCC_info(interp, 1, "Reading %Ss\n", sourcefile);
    }

    /* If the input file is Parrot bytecode, then we simply read it
       into a packfile, which Parrot then loads */
    if (STATE_LOAD_PBC(interp)) {
        pf_raw = PackFile_read_pbc(interp, sourcefile, 0);
        if (!pf_raw)
            IMCC_fatal_standalone(interp, 1, "main: Packfile loading failed\n");
        Parrot_pf_set_current_packfile(interp, pf_raw);
    }
    else
        pf_raw = compile_to_bytecode(interp, sourcefile, output_file, yyscanner);

    /* Produce a PBC output file, if one was requested */
    if (STATE_WRITE_PBC(interp)) {
        if (STRING_length(output_file) == 0) {
            IMCC_fatal_standalone(interp, 1,
                    "main: NULL output_file when trying to write .pbc\n");
        }
        imcc_write_pbc(interp, output_file);

        /* If necessary, load the file written above */
        if (STATE_RUN_FROM_FILE(interp) && !is_stdout) {
            IMCC_info(interp, 1, "Loading %Ss\n", output_file);
            pf_raw = PackFile_read_pbc(interp, output_file, 0);
            if (!pf_raw)
                IMCC_fatal_standalone(interp, 1, "Packfile loading failed\n");
            Parrot_pf_set_current_packfile(interp, pf_raw);
            SET_STATE_LOAD_PBC(interp);
        }
    }

    yylex_destroy(yyscanner);

    if (pf_raw) {
        PMC * const _pbcpmc = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
        VTABLE_set_pointer(interp, _pbcpmc, pf_raw);
        *pbcpmc = _pbcpmc;
    }

    /* should the bytecode be run */
    return STATE_RUN_PBC(interp) ? 1 : 0;
}

/*

=item C<PMC * imcc_compile(PARROT_INTERP, const char *s, int pasm_file, STRING
**error_message)>

Compile a pasm or imcc string

FIXME as we have separate constants, the old constants in ghash must be deleted.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
imcc_compile(PARROT_INTERP, ARGIN(const char *s), int pasm_file,
        ARGOUT(STRING **error_message))
{
    ASSERT_ARGS(imcc_compile)
    /* imcc always compiles to interp->code
     * XXX: This is EXTREMELY bad. IMCC should not write to interp->code
     * save old cs, make new
     */
    STRING                *name;
    PackFile_ByteCode     *old_cs, *new_cs;
    PMC                   *eval_pmc = NULL;
    struct _imc_info_t    *imc_info = NULL;
    struct parser_state_t *next;
    void                  *yyscanner;
    PMC                   *ignored;
    UINTVAL regs_used[4] = {3, 3, 3, 3};
    INTVAL eval_number;

    yylex_init_extra(interp, &yyscanner);

    /* we create not yet anchored PMCs - e.g. Subs: turn off GC */
    Parrot_block_GC_mark(interp);

    if (IMCC_INFO(interp)->last_unit) {
        /* a reentrant compile */
        imc_info          = mem_gc_allocate_zeroed_typed(interp, imc_info_t);
        imc_info->ghash   = IMCC_INFO(interp)->ghash;
        imc_info->prev    = IMCC_INFO(interp);
        IMCC_INFO(interp) = imc_info;
    }

    ignored = Parrot_push_context(interp, regs_used);
    UNUSED(ignored);

    if (eval_nr == 0)
        MUTEX_INIT(eval_nr_lock);

    LOCK(eval_nr_lock);
    eval_number = ++eval_nr;
    UNLOCK(eval_nr_lock);

    name   = Parrot_sprintf_c(interp, "EVAL_" INTVAL_FMT, eval_number);
    new_cs = PF_create_default_segs(interp, name, 0, 0);
    old_cs = Parrot_switch_to_cs(interp, new_cs, 0);

    IMCC_INFO(interp)->cur_namespace = NULL;

    /* spit out the sourcefile */
    if (Interp_debug_TEST(interp, PARROT_EVAL_DEBUG_FLAG)) {
        char *buf = Parrot_str_to_cstring(interp, name);
        FILE * const fp = fopen(buf, "w");
        Parrot_str_free_cstring(buf);
        if (fp) {
            fputs(s, fp);
            fclose(fp);
        }
    }

    IMCC_push_parser_state(interp);
    next = IMCC_INFO(interp)->state->next;

    if (imc_info)
        IMCC_INFO(interp)->state->next = NULL;

    IMCC_INFO(interp)->state->pasm_file = pasm_file;
    IMCC_INFO(interp)->state->file      = name;
    IMCC_INFO(interp)->expect_pasm      = 0;

    compile_string(interp, s, yyscanner);

    Parrot_pop_context(interp);

    /*
     * compile_string NULLifies frames->next, so that yywrap
     * doesn't try to continue compiling the previous buffer
     * This OTOH prevents pop_parser-state ->
     *
     * set next here and pop
     */
    IMCC_INFO(interp)->state->next = next;
    IMCC_pop_parser_state(interp, yyscanner);

    if (!IMCC_INFO(interp)->error_code) {
        Parrot_Sub_attributes *sub_data;

        /*
         * create sub PMC
         *
         * TODO if a sub was denoted :main return that instead
         */
        eval_pmc             = Parrot_pmc_new(interp, enum_class_Eval);
        PMC_get_sub(interp, eval_pmc, sub_data);
        sub_data->seg        = new_cs;
        sub_data->start_offs = 0;
        sub_data->end_offs   = new_cs->base.size;
        sub_data->name       = name;

        *error_message = NULL;
    }
    else {
        PackFile_Segment_destroy(interp, (PackFile_Segment *)new_cs);
        *error_message = IMCC_INFO(interp)->error_message;
    }

    if (imc_info) {
        SymReg *ns                  = IMCC_INFO(interp)->cur_namespace;
        IMCC_INFO(interp)           = imc_info->prev;
        mem_sys_free(imc_info);
        imc_info                    = IMCC_INFO(interp);
        IMCC_INFO(interp)->cur_unit = imc_info->last_unit;

        if (ns && ns != imc_info->cur_namespace)
            free_sym(ns);

        IMCC_INFO(interp)->cur_namespace = imc_info->cur_namespace;
    }
    else
        imc_cleanup(interp, yyscanner);

    Parrot_unblock_GC_mark(interp);

    yylex_destroy(yyscanner);

    /* Now run any :load/:init subs. */
    if (!*error_message)
        PackFile_fixup_subs(interp, PBC_MAIN, eval_pmc);

    /* restore old byte_code, */
    if (old_cs)
        (void)Parrot_switch_to_cs(interp, old_cs, 0);

    return eval_pmc;
}

/*

=item C<PMC * IMCC_compile_pir_s(PARROT_INTERP, const char *s, STRING
**error_message)>

Compile PIR code from a C string. Returns errors in the <STRING> provided.

Called only from src/embed.c:Parrot_compile_string().

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
IMCC_compile_pir_s(PARROT_INTERP, ARGIN(const char *s),
        ARGOUT(STRING **error_message))
{
    ASSERT_ARGS(IMCC_compile_pir_s)
    return imcc_compile(interp, s, 0, error_message);
}

/*

=item C<PMC * IMCC_compile_pasm_s(PARROT_INTERP, const char *s, STRING
**error_message)>

Compile PASM code from a C string. Returns errors in the <STRING> provided.

Called only from src/embed.c:Parrot_compile_string().

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
IMCC_compile_pasm_s(PARROT_INTERP, ARGIN(const char *s),
        ARGOUT(STRING **error_message))
{
    ASSERT_ARGS(IMCC_compile_pasm_s)
    return imcc_compile(interp, s, 1, error_message);
}

/*

=item C<PMC * imcc_compile_pasm_ex(PARROT_INTERP, const char *s)>

Compile PASM code from a C string. Throws an exception upon errors.

Called only from the PASM compreg

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
imcc_compile_pasm_ex(PARROT_INTERP, ARGIN(const char *s))
{
    ASSERT_ARGS(imcc_compile_pasm_ex)
    STRING *error_message;

    PMC * const sub = imcc_compile(interp, s, 1, &error_message);

    if (sub)
        return sub;

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_SYNTAX_ERROR, "%Ss",
        error_message);
}

/*

=item C<PMC * imcc_compile_pir_ex(PARROT_INTERP, const char *s)>

Compile PIR code from a C string. Throws an exception upon errors.

Called only from the PIR compreg

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
imcc_compile_pir_ex(PARROT_INTERP, ARGIN(const char *s))
{
    ASSERT_ARGS(imcc_compile_pir_ex)
    STRING *error_message;
    PMC *sub;

    sub = imcc_compile(interp, s, 0, &error_message);
    if (sub)
        return sub;

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_SYNTAX_ERROR, "%Ss",
        error_message);
}

/*

=item C<void * imcc_compile_file(PARROT_INTERP, STRING *fullname, STRING
**error_message)>

Compile a file by filename (can be either PASM or IMCC code)

Called only from src/interp/inter_misc.c:Parrot_compile_file

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void *
imcc_compile_file(PARROT_INTERP, ARGIN(STRING *fullname),
        ARGOUT(STRING **error_message))
{
    ASSERT_ARGS(imcc_compile_file)
    PackFile_ByteCode * const cs_save = Parrot_pf_get_current_code_segment(interp);
    PackFile_ByteCode        *cs       = NULL;
    struct _imc_info_t       *imc_info = NULL;
    PIOHANDLE                 fp;
    PMC                      *newcontext;

    /* need at least 3 regs for compilation of constant math e.g.
     * add_i_ic_ic - see also IMCC_subst_constants() */
    UINTVAL regs_used[4] = {3, 3, 3, 3};

    if (IMCC_INFO(interp)->last_unit) {
        /* a reentrant compile */
        imc_info          = mem_gc_allocate_zeroed_typed(interp, imc_info_t);
        imc_info->prev    = IMCC_INFO(interp);
        imc_info->ghash   = IMCC_INFO(interp)->ghash;
        IMCC_INFO(interp) = imc_info;
    }

    if (Parrot_file_stat_intval(interp, fullname, STAT_ISDIR))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_EXTERNAL_ERROR,
            "imcc_compile_file: '%Ss' is a directory\n", fullname);

    fp = PIO_OPEN(interp, fullname, PIO_F_READ);
    if (fp == PIO_INVALID_HANDLE)
        IMCC_fatal(interp, EXCEPTION_EXTERNAL_ERROR,
                "imcc_compile_file: couldn't open '%Ss'\n", fullname);

    IMCC_push_parser_state(interp);
    IMCC_INFO(interp)->state->file = fullname;

    /* start over; let the start of line rule increment this to 1 */
    IMCC_INFO(interp)->line = 0;

    /*
     * the Parrot_str_compare() called from pmc_type() triggers GC
     * which can destroy packfiles under construction
     */
    Parrot_block_GC_mark(interp);

    /* Activate a new context and reset it to initial values */
    newcontext = Parrot_push_context(interp, regs_used);
    Parrot_pcc_set_HLL(interp, newcontext, 0);
    Parrot_pcc_set_sub(interp, newcontext, 0);
    IMCC_INFO(interp)->cur_namespace = NULL;
    interp->code                     = NULL;

    if (imcc_string_ends_with(interp, fullname, ".pasm")) {
        void *yyscanner;
        yylex_init_extra(interp, &yyscanner);

        IMCC_INFO(interp)->state->pasm_file = 1;
        /* see imcc.l */
        compile_file(interp, fp, yyscanner);

        yylex_destroy(yyscanner);
    }
    else {
        void *yyscanner;
        yylex_init_extra(interp, &yyscanner);

        IMCC_INFO(interp)->state->pasm_file = 0;
        compile_file(interp, fp, yyscanner);

        yylex_destroy(yyscanner);
    }

    Parrot_unblock_GC_mark(interp);
    Parrot_pop_context(interp);

    imc_cleanup(interp, NULL);
    PIO_CLOSE(interp, fp);

    if (!IMCC_INFO(interp)->error_code)
        cs = Parrot_pf_get_current_code_segment(interp);
    else
        *error_message = IMCC_INFO(interp)->error_message;

    if (cs_save)
        (void)Parrot_switch_to_cs(interp, cs_save, 0);

    if (imc_info) {
        IMCC_INFO(interp) = imc_info->prev;
        if (imc_info->globals)
            mem_sys_free(imc_info->globals);

        mem_sys_free(imc_info);
    }

    return cs;
}

/*

=item C<void imcc_init(PARROT_INTERP)>

Initialize IMCC with Parrot by registering it as a PIR and PASM compiler.

=cut

*/

void
imcc_init(PARROT_INTERP)
{
    ASSERT_ARGS(imcc_init)
    PARROT_ASSERT(IMCC_INFO(interp) != NULL);

    /* register PASM and PIR compilers to parrot core */
    Parrot_compreg(interp, Parrot_str_new_constant(interp, "PASM"), imcc_compile_pasm_ex);
    Parrot_compreg(interp, Parrot_str_new_constant(interp, "PIR"),  imcc_compile_pir_ex);
}

/*

=item C<void imcc_destroy(PARROT_INTERP)>

Deallocate memory associated with IMCC.

=cut

*/

void
imcc_destroy(PARROT_INTERP)
{
    ASSERT_ARGS(imcc_destroy)
    Hash * const macros = IMCC_INFO(interp)->macros;

    if (macros)
        Parrot_hash_chash_destroy_values(interp, macros, imcc_destroy_macro_values);

    if (IMCC_INFO(interp)->globals)
        mem_sys_free(IMCC_INFO(interp)->globals);

    mem_sys_free(IMCC_INFO(interp));
    IMCC_INFO(interp) = NULL;

    if (eval_nr != 0)
        MUTEX_DESTROY(eval_nr_lock);
}

/*

=item C<static void imcc_destroy_macro_values(void *value)>

A callback for Parrot_hash_chash_destroy_values() to free all macro-allocated memory.

=cut

*/

static void
imcc_destroy_macro_values(ARGMOD(void *value))
{
    ASSERT_ARGS(imcc_destroy_macro_values)
    macro_t *  const m      = (macro_t *)value;
    params_t * const params = &m->params;

    int i;

    for (i = 0; i < params->num_param; ++i) {
        char * const name = params->name[i];
        if (name)
            mem_sys_free(name);
    }

    mem_sys_free(m->expansion);
    mem_sys_free(m);
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
