/*
 * $Id$
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 * Copyright (C) 2003-2010, Parrot Foundation.
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
#include "parrot/imcc.h"
#include "parrot/runcore_api.h"
#include "pmc/pmc_callcontext.h"
#include "pbc.h"
#include "parser.h"

extern int yydebug;

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void compile_to_bytecode(PARROT_INTERP,
    ARGIN(const char * const sourcefile),
    ARGIN_NULLOK(const char * const output_file),
    ARGIN(yyscan_t yyscanner))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

static void determine_input_file_type(PARROT_INTERP,
    ARGIN(const char * const sourcefile),
    ARGIN(yyscan_t yyscanner))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void determine_output_file_type(PARROT_INTERP,
    ARGIN(const char *output_file))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void do_pre_process(PARROT_INTERP, yyscan_t yyscanner)
        __attribute__nonnull__(1);

static void imcc_get_optimization_description(
    const PARROT_INTERP,
    int opt_level,
    ARGMOD(char *opt_desc))
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*opt_desc);

static void imcc_parseflags(PARROT_INTERP,
    int argc,
    ARGIN(const char **argv))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static void imcc_write_pbc(PARROT_INTERP, ARGIN(const char *output_file))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int is_all_hex_digits(ARGIN(const char *s))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_compile_to_bytecode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sourcefile) \
    , PARROT_ASSERT_ARG(yyscanner))
#define ASSERT_ARGS_determine_input_file_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sourcefile) \
    , PARROT_ASSERT_ARG(yyscanner))
#define ASSERT_ARGS_determine_output_file_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(output_file))
#define ASSERT_ARGS_do_pre_process __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_imcc_get_optimization_description \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(opt_desc))
#define ASSERT_ARGS_imcc_parseflags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(argv))
#define ASSERT_ARGS_imcc_write_pbc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(output_file))
#define ASSERT_ARGS_is_all_hex_digits __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


#define OPT_GC_DEBUG       128
#define OPT_DESTROY_FLAG   129
#define OPT_HELP_DEBUG     130
#define OPT_PBC_OUTPUT     131
#define OPT_RUNTIME_PREFIX 132

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

=item C<static void imcc_parseflags(PARROT_INTERP, int argc, const char **argv)>

Parse flags ans set approptiate state(s)

=cut

*/

static void
imcc_parseflags(PARROT_INTERP, int argc, ARGIN(const char **argv))
{
    ASSERT_ARGS(imcc_parseflags)
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;

    /* default state: run pbc */
    SET_STATE_RUN_PBC(interp);

    while (longopt_get(interp, argc, argv, Parrot_cmd_options(), &opt) > 0) {
        switch (opt.opt_id) {
          case 'd':
            if (opt.opt_arg && is_all_hex_digits(opt.opt_arg)) {
                IMCC_INFO(interp)->debug = strtoul(opt.opt_arg, NULL, 16);
            }
            else {
                IMCC_INFO(interp)->debug++;
            }
            break;
          case 'w':
            /* FIXME It's not best way to set warnings... */
            Parrot_setwarnings(interp, PARROT_WARNINGS_ALL_FLAG);
            IMCC_INFO(interp)->imcc_warn = 1;
            break;
          case 'G':
            IMCC_INFO(interp)->gc_off = 1;
            break;
          case 'a':
            SET_STATE_PASM_FILE(interp);
            break;
          case 'r':
            if (STATE_RUN_PBC(interp))
                SET_STATE_RUN_FROM_FILE(interp);
            SET_STATE_RUN_PBC(interp);
            break;
          case 'c':
            SET_STATE_LOAD_PBC(interp);
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
            interp->output_file = opt.opt_arg;
            break;

          case OPT_PBC_OUTPUT:
            UNSET_STATE_RUN_PBC(interp);
            SET_STATE_WRITE_PBC(interp);
            if (!interp->output_file)
                interp->output_file = "-";
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

            case UNIQUE_REG:    printf(":unique_reg");break;
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

=item C<void imcc_run_pbc(PARROT_INTERP, const char *output_file, int argc,
const char **argv)>

Write out or run Parrot bytecode.

=cut

*/

void
imcc_run_pbc(PARROT_INTERP, ARGIN_NULLOK(const char *output_file),
        int argc, ARGIN(const char **argv))
{
    /* ASSERT_ARGS(imcc_run_pbc) */

    IMCC_info(interp, 1, "Running...\n");

    /* runs :init functions */
    PackFile_fixup_subs(interp, PBC_IMMEDIATE, NULL);
    PackFile_fixup_subs(interp, PBC_POSTCOMP, NULL);
    PackFile_fixup_subs(interp, PBC_MAIN, NULL);

    Parrot_runcode(interp, argc, argv);
}

/*

=item C<static void imcc_write_pbc(PARROT_INTERP, const char *output_file)>

Output packed bytecode file.

=cut

*/

static void
imcc_write_pbc(PARROT_INTERP, ARGIN(const char *output_file))
{
    ASSERT_ARGS(imcc_write_pbc)
    size_t    size;
    opcode_t *packed;
    FILE     *fp;

    IMCC_info(interp, 1, "Writing %s\n", output_file);

    size = PackFile_pack_size(interp, interp->code->base.pf) *
        sizeof (opcode_t);
    IMCC_info(interp, 1, "packed code %d bytes\n", size);
    packed = (opcode_t*) mem_sys_allocate(size);
    PackFile_pack(interp, interp->code->base.pf, packed);
    if (STREQ(output_file, "-"))
        fp = stdout;
    else if ((fp = fopen(output_file, "wb")) == NULL)
        IMCC_fatal_standalone(interp, EXCEPTION_EXTERNAL_ERROR,
            "Couldn't open %s\n", output_file);

    if ((1 != fwrite(packed, size, 1, fp)))
        IMCC_fatal_standalone(interp, EXCEPTION_EXTERNAL_ERROR,
            "Couldn't write %s\n", output_file);
    fclose(fp);
    IMCC_info(interp, 1, "%s written.\n", output_file);
    mem_sys_free(packed);
}

/*

=item C<static void determine_input_file_type(PARROT_INTERP, const char * const
sourcefile, yyscan_t yyscanner)>

Read in the source and determine whether it's Parrot bytecode or PASM

=cut

*/

static void
determine_input_file_type(PARROT_INTERP, ARGIN(const char * const sourcefile),
                            ARGIN(yyscan_t yyscanner))
{
    ASSERT_ARGS(determine_input_file_type)

    /* Read in the source and check the file extension for the input type;
       a file extension .pbc means it's parrot bytecode;
       a file extension .pasm means it's parrot assembly (PASM);
       otherwise, it's assumed to be PIR.
     */
    if (STREQ(sourcefile, "-")) {
        imc_yyin_set(stdin, yyscanner);
    }
    else {
        const char * const ext = strrchr(sourcefile, '.');

        if (ext && (STREQ(ext, ".pbc"))) { /* a PBC file */
            SET_STATE_LOAD_PBC(interp);
            UNSET_STATE_WRITE_PBC(interp);
        }
        else if (!STATE_LOAD_PBC(interp)) {
            if (!(imc_yyin_set(fopen(sourcefile, "r"), yyscanner)))    {
                IMCC_fatal_standalone(interp, EXCEPTION_EXTERNAL_ERROR,
                                      "Error reading source file %s.\n",
                                      sourcefile);
            }

            if (ext && STREQ(ext, ".pasm"))
                SET_STATE_PASM_FILE(interp);
        }
    }
}

/*

=item C<static void determine_output_file_type(PARROT_INTERP, const char
*output_file)>

Decide what kind of file we are to output.

=cut

*/

static void
determine_output_file_type(PARROT_INTERP, ARGIN(const char *output_file))
{
    ASSERT_ARGS(determine_output_file_type)
    const char * const ext = strrchr(output_file, '.');

    if (ext) {
        if (STREQ(ext, ".pbc"))
            SET_STATE_WRITE_PBC(interp);
    }
}

/*

=item C<static void compile_to_bytecode(PARROT_INTERP, const char * const
sourcefile, const char * const output_file, yyscan_t yyscanner)>

Compile source code into bytecode (or die trying).

=cut

*/

static void
compile_to_bytecode(PARROT_INTERP,
                    ARGIN(const char * const sourcefile),
                    ARGIN_NULLOK(const char * const output_file),
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
    Parrot_pbc_load(interp, pf);

    IMCC_push_parser_state(interp);
    IMCC_INFO(interp)->state->file = mem_sys_strdup(sourcefile);

    emit_open(interp, per_pbc, per_pbc ? NULL : output_file);

    IMCC_info(interp, 1, "Starting parse...\n");

    IMCC_INFO(interp)->state->pasm_file = STATE_PASM_FILE(interp) ? 1 : 0;

    imcc_run_compilation(interp, yyscanner);
    if (IMCC_INFO(interp)->error_code) {
        char * const error_str = Parrot_str_to_cstring(interp,
                                                   IMCC_INFO(interp)->error_message);

        IMCC_INFO(interp)->error_code=IMCC_FATAL_EXCEPTION;
        fprintf(stderr, "error:imcc:%s", error_str);
        IMCC_print_inc(interp);
        Parrot_str_free_cstring(error_str);
        Parrot_exit(interp, IMCC_FATAL_EXCEPTION);
    }

    imc_cleanup(interp, yyscanner);

    fclose(imc_yyin_get(yyscanner));

    IMCC_info(interp, 1, "%ld lines compiled.\n", IMCC_INFO(interp)->line);
    if (per_pbc && !IMCC_INFO(interp)->write_pbc)
        PackFile_fixup_subs(interp, PBC_POSTCOMP, NULL);
}

/*

=item C<int imcc_run(PARROT_INTERP, const char *sourcefile, int argc, const char
**argv)>

Entry point of IMCC, as invoked by Parrot's main function.
Compile source code (if required), write bytecode file (if required)
and run. This function always returns 0.

=cut

*/

int
imcc_run(PARROT_INTERP, ARGIN(const char *sourcefile), int argc,
        ARGIN(const char **argv))
{
    yyscan_t           yyscanner;
    const char * const output_file = interp->output_file;

    imcc_parseflags(interp, argc, argv);

    /* PMCs in IMCC_INFO won't get marked */
    Parrot_block_GC_mark(interp);
    Parrot_block_GC_sweep(interp);

    yylex_init_extra(interp, &yyscanner);

    /* Figure out what kind of source file we have -- if we have one */
    if (!sourcefile || !*sourcefile)
        IMCC_fatal_standalone(interp, 1, "main: No source file specified.\n");
    else
        determine_input_file_type(interp, sourcefile, yyscanner);

    if (STATE_PRE_PROCESS(interp)) {
        do_pre_process(interp, yyscanner);
        Parrot_destroy(interp);
        yylex_destroy(yyscanner);

        return 0;
    }

    /* Do we need to produce an output file? If so, what type? */
    if (output_file) {
        determine_output_file_type(interp, output_file);

        if (STREQ(sourcefile, output_file) && !STREQ(sourcefile, "-"))
            IMCC_fatal_standalone(interp, 1, "main: outputfile is sourcefile\n");
    }

    IMCC_INFO(interp)->write_pbc = STATE_WRITE_PBC(interp) ? 1 : 0;

    if (IMCC_INFO(interp)->verbose) {
        IMCC_info(interp, 1, "debug = 0x%x\n", IMCC_INFO(interp)->debug);
        IMCC_info(interp, 1, "Reading %s\n",
                  imc_yyin_get(yyscanner) == stdin ? "stdin":sourcefile);
    }

    /* If the input file is Parrot bytecode, then we simply read it
       into a packfile, which Parrot then loads */
    if (STATE_LOAD_PBC(interp)) {
        PackFile * const pf = Parrot_pbc_read(interp, sourcefile, 0);

        if (!pf)
            IMCC_fatal_standalone(interp, 1, "main: Packfile loading failed\n");
        Parrot_pbc_load(interp, pf);
    }
    else
        compile_to_bytecode(interp, sourcefile, output_file, yyscanner);

    /* Produce a PBC output file, if one was requested */
    if (STATE_WRITE_PBC(interp)) {
        if (!output_file) {
            IMCC_fatal_standalone(interp, 1,
                    "main: NULL output_file when trying to write .pbc\n");
        }
        imcc_write_pbc(interp, output_file);

        /* If necessary, load the file written above */
        if (STATE_RUN_FROM_FILE(interp) && !STREQ(output_file, "-")) {
            PackFile *pf;

            IMCC_info(interp, 1, "Loading %s\n", output_file);
            pf = Parrot_pbc_read(interp, output_file, 0);
            if (!pf)
                IMCC_fatal_standalone(interp, 1, "Packfile loading failed\n");
            Parrot_pbc_load(interp, pf);
            SET_STATE_LOAD_PBC(interp);
        }
    }

    /* tear down the compilation context */
    if (IMCC_INFO(interp)->imcc_warn)
        PARROT_WARNINGS_on(interp, PARROT_WARNINGS_ALL_FLAG);
    else
        PARROT_WARNINGS_off(interp, PARROT_WARNINGS_ALL_FLAG);

    if (!IMCC_INFO(interp)->gc_off) {
        Parrot_unblock_GC_mark(interp);
        Parrot_unblock_GC_sweep(interp);
    }

    yylex_destroy(yyscanner);

    /* should the bytecode be run */
    if (STATE_RUN_PBC(interp))
        return 1;
    else
        return 0;
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
