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

/* defined in imcc.l */
PIOHANDLE determine_input_file_type(imc_info_t * imcc, STRING *sourcefile);

/* XXX non-reentrant */
static Parrot_mutex eval_nr_lock;
static INTVAL       eval_nr  = 0;

/* HEADERIZER HFILE: include/imcc/embed.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void do_pre_process(
    ARGMOD(imc_info_t *imcc),
    ARGIN(STRING * sourcefile),
    yyscan_t yyscanner)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc);

static void imcc_destroy_macro_values(ARGMOD(void *value))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*value);

static PMC * imcc_run_compilation_internal(
    ARGMOD(imc_info_t *imcc),
    ARGIN(STRING *source),
    int is_file,
    int is_pasm)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc);

static PMC * imcc_run_compilation_reentrant(
    ARGMOD(imc_info_t *imcc),
    ARGIN(STRING *fullname),
    int is_file,
    int is_pasm)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc);

PARROT_CAN_RETURN_NULL
static struct _imc_info_t* prepare_reentrant_compile(
    ARGMOD(imc_info_t * imcc))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(* imcc);

#define ASSERT_ARGS_do_pre_process __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(sourcefile))
#define ASSERT_ARGS_imcc_destroy_macro_values __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(value))
#define ASSERT_ARGS_imcc_run_compilation_internal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(source))
#define ASSERT_ARGS_imcc_run_compilation_reentrant \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(fullname))
#define ASSERT_ARGS_prepare_reentrant_compile __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<>

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
imc_info_t *
imcc_new(PARROT_INTERP)
{
    imc_info_t * const imcc = (imc_info_t *)mem_sys_allocate_zeroed(sizeof(imc_info_t));
    imcc->interp = interp;
    return imcc;
}

PARROT_EXPORT
void
imcc_reset(ARGMOD(imc_info_t *imcc))
{
    Interp * interp = imcc->interp;
    memset(imcc, 0, sizeof(imc_info_t));
    imcc->interp = interp;
}

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
STRING*
imcc_last_error_message(ARGIN(imc_info_t *imcc))
{
    return imcc->error_message;
}

PARROT_EXPORT
INTVAL
imcc_last_error_code(ARGIN(imc_info_t *imcc))
{
    return imcc->error_code;
}

PARROT_EXPORT
void
imcc_set_debug_mode(ARGMOD(imc_info_t *imcc), INTVAL dflags, INTVAL yflags)
{
    imcc->debug = dflags;
    yydebug = yflags ? 1 : 0;
}

PARROT_EXPORT
void
imcc_set_warning_mode(ARGMOD(imc_info_t *imcc), INTVAL warnings)
{
}

PARROT_EXPORT
void
imcc_set_verbosity(ARGMOD(imc_info_t *imcc), INTVAL verbose)
{
    imcc->verbose = verbose;
}

PARROT_EXPORT
void
imcc_set_optimization_level(ARGMOD(imc_info_t *imcc), ARGIN(const char *opts))
{
    if (!opts || !*opts || opts[0] == '0')
        return;
    if (strchr(opts, 'p'))
        imcc->optimizer_level |= OPT_PASM;
    if (strchr(opts, 'c'))
        imcc->optimizer_level |= OPT_SUB;

    /* OLD DEFAULT: 1 */

    /* currently not ok due to different register allocation */
    if (strchr(opts, '1')) {
        imcc->optimizer_level |= OPT_PRE;
    }
    if (strchr(opts, '2')) {
        imcc->optimizer_level |= (OPT_PRE | OPT_CFG);
    }
}

yyscan_t
imcc_get_scanner(ARGMOD(imc_info_t *imcc))
{
    yyscan_t yyscanner;
    yylex_init_extra(imcc, &yyscanner);
    return yyscanner;
}

void
imcc_destroy_scanner(ARGMOD(imc_info_t *imcc), yyscan_t yyscanner)
{
    yylex_destroy(yyscanner);
}

PARROT_EXPORT
void
imcc_preprocess(ARGMOD(imc_info_t *imcc), ARGIN(STRING * const sourcefile))
{
    yyscan_t yyscanner = imcc_get_scanner(imcc);

    /* TODO: THIS! */
    /* Figure out what kind of source file we have -- if we have one */
    if (!STRING_length(sourcefile))
        IMCC_fatal_standalone(imcc, 1, "main: No source file specified.\n");
    else {
        PIOHANDLE in_file = determine_input_file_type(imcc, sourcefile);
        if (in_file == PIO_INVALID_HANDLE)
            IMCC_fatal_standalone(imcc, EXCEPTION_EXTERNAL_ERROR,
                                  "Error reading source file %Ss.\n",
                                  sourcefile);
        imc_yyin_set(in_file, yyscanner);
    }

    do_pre_process(imcc, sourcefile, yyscanner);
}


static void
do_pre_process(ARGMOD(imc_info_t *imcc), ARGIN(STRING * sourcefile),
        yyscan_t yyscanner)
{
    ASSERT_ARGS(do_pre_process)
    int       c;
    YYSTYPE   val;

    /* TODO: THIS! */

    IMCC_push_parser_state(imcc, sourcefile, 0);
    c = yylex(&val, yyscanner, imcc); /* is reset at end of while loop */
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
        c = yylex(&val, yyscanner, imcc);
    }
    printf("\n");
    fflush(stdout);

    return;
}

/*

=item C<PMC * imcc_compile_string(imc_info_t *imcc, STRING *source, int
is_pasm)>

Entry point of IMCC, as invoked by Parrot's main function.
Compile source code (if required), write bytecode file (if required)
and run. This function always returns 0.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC *
imcc_compile_string(ARGMOD(imc_info_t *imcc), ARGIN(STRING *source), int is_pasm)
{
    ASSERT_ARGS(imcc_compile_string)
    return imcc_run_compilation_reentrant(imcc, source, 0, is_pasm);
}

/*

=item C<PMC * imcc_compile_file(imc_info_t *imcc, STRING *fullname, int
is_pasm)>

Compile a file by filename (can be either PASM or IMCC code)

Called only from src/interp/inter_misc.c:Parrot_compile_file

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
imcc_compile_file(ARGMOD(imc_info_t *imcc), ARGIN(STRING *fullname), int is_pasm)
{
    ASSERT_ARGS(imcc_compile_file)
    return imcc_run_compilation_reentrant(imcc, fullname, 1, is_pasm);
}

static PMC *
imcc_run_compilation_reentrant(ARGMOD(imc_info_t *imcc), ARGIN(STRING *fullname),
        int is_file, int is_pasm)
{
    struct _imc_info_t * const imc_save = imcc; //prepare_reentrant_compile(imcc);
    struct _imc_info_t * imcc_use = imc_save ? imc_save : imcc;
    PMC * const result = imcc_run_compilation_internal(imcc, fullname, is_file, is_pasm);
    //exit_reentrant_compile(imcc, imc_save);
    return result;
}

static PMC *
imcc_run_compilation_internal(ARGMOD(imc_info_t *imcc), ARGIN(STRING *source),
        int is_file, int is_pasm)
{
    yyscan_t yyscanner = imcc_get_scanner(imcc);
    PackFile * const pf_raw = PackFile_new(imcc->interp, 0);
    INTVAL success = 0;

    /* TODO: Don't set current packfile in the interpreter. Leave the
             interpreter alone */

    if (is_file)
        pf_raw->cur_cs = Parrot_pf_create_default_segments(imcc->interp, pf_raw, source, 1);
    else {
        const INTVAL eval_number = eval_nr++;
        STRING * const evalname = Parrot_sprintf_c(imcc->interp, "EVAL_" INTVAL_FMT, eval_number);
        pf_raw->cur_cs = Parrot_pf_create_default_segments(imcc->interp, pf_raw, evalname, 1);
    }

    Parrot_pf_set_current_packfile(imcc->interp, pf_raw);

    IMCC_push_parser_state(imcc, source, is_pasm);

    success = imcc_compile_buffer_safe(imcc, yyscanner, source, is_file, is_pasm);

    if (imcc->error_code) {
        imcc->error_code = IMCC_FATAL_EXCEPTION;
        IMCC_warning(imcc, "error:imcc:%Ss", imcc->error_message);
        //if (is_file)
            IMCC_print_inc(imcc);

        yylex_destroy(yyscanner);
        imc_cleanup(imcc, NULL);

        return PMCNULL;
    }

    yylex_destroy(yyscanner);
    imc_cleanup(imcc, NULL);

    IMCC_info(imcc, 1, "%ld lines compiled.\n", imcc->line);
    PackFile_fixup_subs(imcc->interp, PBC_IMMEDIATE, NULL);
    PackFile_fixup_subs(imcc->interp, PBC_POSTCOMP, NULL);

    /* TODO: Return a real PackFile PMC */
    if (success && pf_raw) {
        PMC * const pbcpmc = Parrot_pmc_new(imcc->interp, enum_class_UnManagedStruct);
        VTABLE_set_pointer(imcc->interp, pbcpmc, pf_raw);
        return pbcpmc;
    }
    return PMCNULL;
}

/*

=item C<static struct _imc_info_t* prepare_reentrant_compile(imc_info_t * imcc)>

Prepare IMCC for a reentrant compile. Push a new imc_info_t structure onto the
list and set the new one as the current one. Return the new info structure.
returns NULL if not in a reentrant situation. The return value of this I<MUST>
be passed to C<exit_reentrant_compile>.

=item C<imc_info_t * exit_reentrant_compile(imc_info_t * imcc, struct
_imc_info_t *imc_info)>

Exit reentrant compile. Restore compiler state back to what it was for the
previous compile, if any.

*/

PARROT_CAN_RETURN_NULL
static struct _imc_info_t*
prepare_reentrant_compile(ARGMOD(imc_info_t * imcc))
{
    ASSERT_ARGS(prepare_reentrant_compile)
    struct _imc_info_t * imc_info = NULL;
    if (imcc->last_unit) {
        /* a reentrant compile */
        imc_info        = (imc_info_t*) calloc(1, sizeof(imc_info_t));
        imc_info->prev  = imcc;
        imc_info->ghash = imcc->ghash;
        /* start over; let the start of line rule increment this to 1 */
        imc_info->line = 0;
        imc_info->cur_namespace = NULL;
        imc_info->interp->code = NULL;
        return imc_info;
    }
    return NULL;
}

imc_info_t *
exit_reentrant_compile(ARGMOD(imc_info_t * imcc),
        ARGMOD_NULLOK(struct _imc_info_t *imc_info))
{
    ASSERT_ARGS(exit_reentrant_compile)
    if (imc_info) {
        PARROT_ASSERT(imcc == imc_info->prev);
        if (imc_info->globals)
            mem_sys_free(imc_info->globals);

        mem_sys_free(imc_info);
    }
    return imcc;
}

/*

=item C<void imcc_destroy(imc_info_t * imcc)>

Deallocate memory associated with IMCC.

=cut

*/

void
imcc_destroy(ARGMOD(imc_info_t * imcc))
{
    ASSERT_ARGS(imcc_destroy)
    Hash * const macros = imcc->macros;

    if (macros)
        Parrot_hash_chash_destroy_values(imcc->interp, macros, imcc_destroy_macro_values);

    if (imcc->globals)
        mem_sys_free(imcc->globals);

    mem_sys_free(imcc);

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
