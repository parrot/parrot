/*
 * $Id$
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * main program
 *
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "imc.h"
#include "parrot/embed.h"
#include "parrot/longopt.h"
#include "parrot/imcc.h"
#include "pbc.h"
#include "parser.h"

static int load_pbc, run_pbc, write_pbc, pre_process_only, pasm_file;

static void
usage(FILE* fp)
{
    fprintf(fp,
            "parrot -[abcCEfgGhjprStvVwy.] [-d [FLAGS]] [-D [FLAGS]]"
            "[-O [level]] [-o FILE] <file>\n");
}

static void
help_debug(void)
{
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

static void
help(void)
{
    /* split printf for C89 compliance on string length */
    printf(
    "parrot [Options] <file>\n"
    "  Options:\n"
    "    -h --help\n"
    "    -V --version\n"
    "   <Run core options>\n"
    "    -b --bounds-checks|--slow-core\n"
    "    -C --CGP-core\n"
    "    -f --fast-core\n"
    "    -g --computed-goto-core\n"
    "    -j --jit-core\n"
    "    -p --profile\n"
    "    -S --switched-core\n"
    "    -t --trace [flags]\n"
    "   <VM options>\n"
    "    -D --parrot-debug[=HEXFLAGS]\n"
    "       --help-debug\n");
    printf(
    "    -w --warnings\n"
    "    -G --no-gc\n"
    "       --gc-debug\n"
    "       --leak-test|--destroy-at-end\n"
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


static void
Parrot_version(Interp *interp)
{
    int rev = PARROT_REVISION;
    printf("This is parrot version " PARROT_VERSION);
    if (rev != 0)
        printf(" (r%d)", rev);
    printf(" built for " PARROT_ARCHNAME ".\n");
    rev = Parrot_revision();
    if (PARROT_REVISION != rev) {
        printf( "Warning: runtime has revision %d!\n", rev);
    }
    rev = Parrot_config_revision();
    if (PARROT_REVISION != rev) {
        printf( "Warning: used Configure.pl revision %d!\n", rev);
    }
    printf("Copyright (C) 2001-2007, The Perl Foundation.\n\
\n\
Parrot may be copied only under the terms of either the Artistic License or the\
\n\
GNU General Public License, which may be found in the Parrot source kit.\n\
\n\
This program is distributed in the hope that it will be useful,\n\
but WITHOUT ANY WARRANTY; without even the implied warranty of\n\
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See either\n\
the GNU General Public License or the Artistic License for more details.\n\n");

    Parrot_exit(interp, 0);
}

#define SET_FLAG(flag)   Parrot_set_flag(interp, flag)
#define SET_DEBUG(flag)  Parrot_set_debug(interp, flag)
#define SET_TRACE(flag)  Parrot_set_trace(interp, flag)
#define SET_CORE(core)   interp->run_core |= core

#define OPT_GC_DEBUG       128
#define OPT_DESTROY_FLAG   129
#define OPT_HELP_DEBUG     130
#define OPT_PBC_OUTPUT     131
#define OPT_RUNTIME_PREFIX 132

static struct longopt_opt_decl options[] = {
    { '.', '.', (OPTION_flags)0, { "--wait" } },
    { 'C', 'C', (OPTION_flags)0, { "--CGP-core" } },
    { 'D', 'D', OPTION_optional_FLAG, { "--parrot-debug" } },
    { 'E', 'E', (OPTION_flags)0, { "--pre-process-only" } },
    { 'G', 'G', (OPTION_flags)0, { "--no-gc" } },
    { 'O', 'O', OPTION_optional_FLAG, { "--optimize" } },
    { 'S', 'S', (OPTION_flags)0, { "--switched-core" } },
    { 'V', 'V', (OPTION_flags)0, { "--version" } },
    { '\0', OPT_DESTROY_FLAG, (OPTION_flags)0,
                                 { "--leak-test", "--destroy-at-end" } },
    { '\0', OPT_GC_DEBUG, (OPTION_flags)0, { "--gc-debug" } },
    { 'a', 'a', (OPTION_flags)0, { "--pasm" } },
    { 'b', 'b', (OPTION_flags)0, { "--bounds-checks", "--slow-core" } },
    { 'c', 'c', (OPTION_flags)0, { "--pbc" } },
    { 'd', 'd', OPTION_optional_FLAG, { "--imcc-debug" } },
    { '\0', OPT_HELP_DEBUG, (OPTION_flags)0, { "--help-debug" } },
    { 'f', 'f', (OPTION_flags)0, { "--fast-core" } },
    { 'g', 'g', (OPTION_flags)0, { "--computed-goto-core" } },
    { 'h', 'h', (OPTION_flags)0, { "--help" } },
    { 'j', 'j', (OPTION_flags)0, { "--jit-core" } },
    { 'o', 'o', OPTION_required_FLAG, { "--output" } },
    { '\0', OPT_PBC_OUTPUT, (OPTION_flags)0, { "--output-pbc" } },
    { 'p', 'p', (OPTION_flags)0, { "--profile" } },
    { 'r', 'r', (OPTION_flags)0, { "--run-pbc" } },
    { '\0', OPT_RUNTIME_PREFIX, (OPTION_flags)0, { "--runtime-prefix" } },
    { 't', 't', OPTION_optional_FLAG, { "--trace" } },
    { 'v', 'v', (OPTION_flags)0, { "--verbose" } },
    { 'w', 'w', (OPTION_flags)0, { "--warnings" } },
    { 'y', 'y', (OPTION_flags)0, { "--yydebug" } },
    { 0, 0, (OPTION_flags)0, { NULL } }
};

static int
is_all_hex_digits(const char *s)
{
    for (; *s; s++)
        if (!isxdigit(*s))
            return 0;
    return 1;
}

/* most stolen from test_main.c */
char *
parseflags(Parrot_Interp interp, int *argc, char **argv[])
{
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;
    int   status;
    extern int yydebug;
    if (*argc == 1) {
        usage(stderr);
        exit(1);
    }
    run_pbc = 1;

    while ((status = longopt_get(interp, *argc, *argv, options, &opt)) > 0) {
        switch (opt.opt_id) {
            case 'b':
                SET_FLAG(PARROT_BOUNDS_FLAG);
                break;
            case 'p':
                SET_FLAG(PARROT_PROFILE_FLAG);
                break;
            case 't':
                if (opt.opt_arg && is_all_hex_digits(opt.opt_arg)) {
                    SET_TRACE(strtoul(opt.opt_arg, 0, 16));
                }
                else
                    SET_TRACE(PARROT_TRACE_OPS_FLAG);
                break;
            case 'j':
                SET_CORE(PARROT_JIT_CORE);
                break;
            case 'S':
                SET_CORE(PARROT_SWITCH_CORE);
                break;
            case 'C':
                SET_CORE(PARROT_CGP_CORE);
                break;
            case 'f':
                SET_CORE(PARROT_FAST_CORE);
                break;
            case 'g':
                SET_CORE(PARROT_CGOTO_CORE);
                break;
            case 'd':
                if (opt.opt_arg && is_all_hex_digits(opt.opt_arg)) {
                    IMCC_INFO(interp)->debug = strtoul(opt.opt_arg, 0, 16);
                }
                else {
                    IMCC_INFO(interp)->debug++;
                }
                break;
            case 'D':
                if (opt.opt_arg && is_all_hex_digits(opt.opt_arg)) {
                    SET_DEBUG(strtoul(opt.opt_arg, 0, 16));
                }
                else
                    SET_DEBUG(PARROT_MEM_STAT_DEBUG_FLAG);
                break;
            case 'w':
                Parrot_setwarnings(interp, PARROT_WARNINGS_ALL_FLAG);
                IMCC_INFO(interp)->imcc_warn = 1;
                break;
            case 'G':
                IMCC_INFO(interp)->gc_off = 1;
                break;
            case '.':  /* Give Windows Parrot hackers an opportunity to
                        * attach a debuggger. */
                fgetc(stdin);
                break;
            case 'a':
                pasm_file = 1;
                break;
            case 'h':
                help();
                exit(EX_USAGE);
                break;
            case OPT_HELP_DEBUG:
                help_debug();
                exit(EX_USAGE);
                break;
            case OPT_RUNTIME_PREFIX:
                printf("%s\n", Parrot_get_runtime_prefix(interp, NULL));
                exit(0);
                break;
            case 'V':
                Parrot_version(interp);
                break;
            case 'r':
                ++run_pbc;
                break;
            case 'c':
                load_pbc = 1;
                break;
            case 'v':
                IMCC_INFO(interp)->verbose++;
                break;
            case 'y':
                yydebug = 1;
                break;
            case 'E':
                pre_process_only = 1;
                break;
            case 'o':
                run_pbc = 0;
                interp->output_file = opt.opt_arg;
                break;

            case OPT_PBC_OUTPUT:
                run_pbc = 0;
                write_pbc = 1;
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

                IMCC_INFO(interp)->allocator = IMCC_GRAPH_ALLOCATOR;
                /* currently not ok due to different register allocation */
                if (strchr(opt.opt_arg, 'j')) {
                    SET_CORE(PARROT_JIT_CORE);
                }
                if (strchr(opt.opt_arg, '1')) {
                    IMCC_INFO(interp)->optimizer_level |= OPT_PRE;
                }
                if (strchr(opt.opt_arg, '2')) {
                    IMCC_INFO(interp)->optimizer_level |= (OPT_PRE | OPT_CFG);
                }
                if (strchr(opt.opt_arg, 't')) {
                    SET_CORE(PARROT_SWITCH_CORE);
#ifdef HAVE_COMPUTED_GOTO
                    SET_CORE(PARROT_CGP_CORE);
#endif
#if JIT_CAPABLE
                    SET_CORE(PARROT_JIT_CORE);
#endif
                }
                break;

            case OPT_GC_DEBUG:
#if DISABLE_GC_DEBUG
                Parrot_warn(interp, PARROT_WARNINGS_ALL_FLAG,
                        "PARROT_GC_DEBUG is set but the binary was "
                        "compiled with DISABLE_GC_DEBUG.");
#endif
                SET_FLAG(PARROT_GC_DEBUG_FLAG);
                break;
            case OPT_DESTROY_FLAG:
                SET_FLAG(PARROT_DESTROY_FLAG);
                break;
            default:
                internal_exception(1, "main: Invalid flag '%s' used."
                        "\n\nhelp: parrot -h\n", (*argv)[0]);
        }
    }
    if (status == -1) {
        fprintf(stderr, "%s\n", opt.opt_error);
        usage(stderr);
        exit(EX_USAGE);
    }
    /* reached the end of the option list and consumed all of argv */
    if (*argc == opt.opt_index) {
        if (interp->output_file) {
            fprintf(stderr, "Missing program name or argument for -o\n");
        }
        else {
            /* We are not looking at an option, so it must be a program name */
            fprintf(stderr, "Missing program name\n");
        }
        usage(stderr);
        exit(EX_USAGE);
    }
    *argc -= opt.opt_index;
    *argv += opt.opt_index;

    return (*argv)[0];
}

static void
do_pre_process(Parrot_Interp interp)
{
    int       c;
    YYSTYPE   val;
    yyscan_t  yyscanner;

    yyscanner   = IMCC_INFO(interp)->yyscanner;

    IMCC_push_parser_state(interp);
    while ((c = yylex(&val, yyscanner, interp))) {
        switch (c) {
            case EMIT:          printf(".emit\n"); break;
            case EOM:           printf(".eom\n"); break;
            case LOCAL:         printf(".local "); break;
            case ARG:           printf(".arg "); break;
            case SUB:           printf(".sub "); break;
            case ESUB:          printf(".end"); break;
            case RESULT:        printf(".result "); break;
            case RETURN:        printf(".return "); break;
            case NAMESPACE:     printf(".namespace "); break;
            case ENDNAMESPACE:  printf(".endnamespace"); break;
            case CONST:         printf(".const "); break;
            case PARAM:         printf(".param "); break;
            /* TODO: print out more information about the macro */
            /* case MACRO:         yylex(&val, interp, yyscanner);
                                break; */ /* swallow nl */
            case MACRO:         printf(".macro "); break;

            case GOTO:          printf("goto ");break;
            case IF:            printf("if ");break;
            case UNLESS:        printf("unless ");break;
            case INC:           printf("inc ");break;
            case DEC:           printf("dec ");break;
            case INTV:          printf("int ");break;
            case FLOATV:        printf("float ");break;
            case STRINGV:       printf("string ");break;
            case PMCV:          printf("pmc ");break;
            case NEW:           printf("new ");break;
            case ADDR:          printf("addr ");break;
            case GLOBAL:        printf("global ");break;
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
            case PCC_BEGIN:     printf(".pcc_begin "); break;
            case PCC_END:       printf(".pcc_end"); break;
            case PCC_SUB:       printf(".pcc_sub "); break;
            case PCC_CALL:      printf(".pcc_call "); break;
            case PCC_BEGIN_RETURN:    printf(".pcc_begin_return"); break;
            case PCC_END_RETURN:      printf(".pcc_end_return"); break;
            case PCC_BEGIN_YIELD:     printf(".pcc_begin_yield"); break;
            case PCC_END_YIELD:       printf(".pcc_end_yield"); break;
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
    }
    printf("\n");
    fflush(stdout);

    return;
}

static void
imcc_get_optimization_description(const Interp *interp /*NN*/, int opt_level, char *opt_desc)
{
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

    if (interp->run_core & PARROT_JIT_CORE)
        opt_desc[i++] = 'j';

    if (interp->run_core & PARROT_SWITCH_CORE)
        opt_desc[i++] = 't';

    opt_desc[i++] = '\0';
    return;
}

int
imcc_initialize(Interp *interp)
{
    yyscan_t yyscanner = IMCC_INFO(interp)->yyscanner;

    do_yylex_init(interp, &yyscanner);

    Parrot_block_DOD(interp);
    Parrot_block_GC(interp);

    IMCC_INFO(interp)->yyscanner = yyscanner;
    IMCC_INFO(interp)->allocator = IMCC_VANILLA_ALLOCATOR;

    /* Default optimization level is zero; see optimizer.c, imc.h */
    if (!IMCC_INFO(interp)->optimizer_level) {
#if 1
        IMCC_INFO(interp)->optimizer_level = 0;
#else
        /* won't even make with this: something with Data::Dumper and
         * set_i_p_i*/
        IMCC_INFO(interp)->optimizer_level = OPT_PRE;
#endif
    }

    return 1;
}

static void
imcc_run_pbc(Interp *interp, int obj_file, const char *output_file,
             int argc, char * argv[])
{
    if (IMCC_INFO(interp)->imcc_warn)
        PARROT_WARNINGS_on(interp, PARROT_WARNINGS_ALL_FLAG);
    else
        PARROT_WARNINGS_off(interp, PARROT_WARNINGS_ALL_FLAG);

    if (!IMCC_INFO(interp)->gc_off) {
        Parrot_unblock_DOD(interp);
        Parrot_unblock_GC(interp);
    }

    if (obj_file)
        IMCC_info(interp, 1, "Writing %s\n", output_file);
    else
        IMCC_info(interp, 1, "Running...\n");

    /* runs :init functions */
    PackFile_fixup_subs(interp, PBC_MAIN, NULL);

    /* XXX no return value :-( */
    Parrot_runcode(interp, argc, argv);
}

static void
imcc_write_pbc(Interp *interp, const char *output_file)
{
    size_t    size;
    opcode_t *packed;
    FILE     *fp;

    IMCC_info(interp, 1, "Writing %s\n", output_file);

    size = PackFile_pack_size(interp, interp->code->base.pf) *
        sizeof (opcode_t);
    IMCC_info(interp, 1, "packed code %d bytes\n", size);
    packed = (opcode_t*) mem_sys_allocate(size);
    PackFile_pack(interp, interp->code->base.pf, packed);
    if (strcmp(output_file, "-") == 0)
        fp = stdout;
    else if ((fp = fopen(output_file, "wb")) == 0)
        IMCC_fatal_standalone(interp, E_IOError,
            "Couldn't open %s\n", output_file);

    if ((1 != fwrite(packed, size, 1, fp)))
        IMCC_fatal_standalone(interp, E_IOError,
            "Couldn't write %s\n", output_file);
    fclose(fp);
    IMCC_info(interp, 1, "%s written.\n", output_file);
    free(packed);
}

int
imcc_run(Interp *interp, const char *sourcefile, int argc, char * argv[])
{
    int              obj_file;
    const char      *output_file;
    yyscan_t         yyscanner;

    yyscanner   = IMCC_INFO(interp)->yyscanner;
    output_file = interp->output_file;

    /* Read in the source and determine whether it's Parrot bytecode,
       PASM or a Parrot abstract syntax tree (PAST) file. If it isn't
       any of these, then we assume that it is PIR. */
    if (!sourcefile || !*sourcefile) {
        IMCC_fatal_standalone(interp, 1, "main: No source file specified.\n");
    }
    else if (!strcmp(sourcefile, "-")) {
        imc_yyin_set(stdin, yyscanner);
    }
    else {
        const char * const ext = strrchr(sourcefile, '.');

        if (ext && strcmp(ext, ".pbc") == 0) {
            load_pbc  = 1;
            write_pbc = 0;
        }
        else if (!load_pbc) {
            if (!(imc_yyin_set(fopen(sourcefile, "r"), yyscanner)))    {
                IMCC_fatal_standalone(interp, E_IOError,
                    "Error reading source file %s.\n",
                        sourcefile);
            }
            if (ext && strcmp(ext, ".pasm") == 0) {
                pasm_file = 1;
            }
        }
    }
    if (pre_process_only) {
        do_pre_process(interp);
        Parrot_destroy(interp);
        yylex_destroy(yyscanner);
        IMCC_INFO(interp)->yyscanner = NULL;

        return 0;
    }

    /* Do we need to produce an output file? If so, what type? */
    obj_file = 0;
    if (interp->output_file) {
        const char * const ext = strrchr(interp->output_file, '.');

        if (ext && strcmp(ext, ".pbc") == 0) {
            write_pbc = 1;
        }
        else if (ext && strcmp(ext, PARROT_OBJ_EXT) == 0) {
#if EXEC_CAPABLE
            load_pbc  = 1;
            write_pbc = 0;
            run_pbc   = 1;
            obj_file  = 1;
            Parrot_set_run_core(interp, PARROT_EXEC_CORE);
#else
            IMCC_fatal_standalone(interp, 1, "main: can't produce object file");
#endif
        }
        if (!strcmp(sourcefile, output_file) && strcmp(sourcefile, "-"))
            IMCC_fatal_standalone(interp, 1,
                "main: outputfile is sourcefile\n");
    }

    IMCC_INFO(interp)->write_pbc = write_pbc;

    if (IMCC_INFO(interp)->verbose) {
        IMCC_info(interp, 1,"debug = 0x%x\n", IMCC_INFO(interp)->debug);
        IMCC_info(interp, 1,"Reading %s\n",
                  imc_yyin_get(yyscanner) == stdin ? "stdin":sourcefile);
    }

    /* If the input file is Parrot bytecode, then we simply read it
       into a packfile, which Parrot then loads */
    if (load_pbc) {
        PackFile * const pf = Parrot_readbc(interp, sourcefile);

        if (!pf)
            IMCC_fatal_standalone(interp, 1, "main: Packfile loading failed\n");
        Parrot_loadbc(interp, pf);
    }
    else {
        /* Otherwise, we need to compile our input to bytecode. */
        const int per_pbc   = (write_pbc | run_pbc) != 0;
        const int opt_level = IMCC_INFO(interp)->optimizer_level;
        PackFile *pf;

        /* Shouldn't be more than five, but five extra is cheap */
        char opt_desc[10];

        imcc_get_optimization_description(interp, opt_level, opt_desc);

        IMCC_info(interp, 1, "using optimization '-O%s' (%x) \n",
                  opt_desc, opt_level);

        pf = PackFile_new(interp, 0);
        Parrot_loadbc(interp, pf);

        IMCC_push_parser_state(interp);
        IMCC_INFO(interp)->state->file = sourcefile;

        emit_open(interp, per_pbc, per_pbc ? NULL : (void*)output_file);

        IMCC_info(interp, 1, "Starting parse...\n");

        IMCC_INFO(interp)->state->pasm_file = pasm_file;
        IMCC_TRY(IMCC_INFO(interp)->jump_buf,
                 IMCC_INFO(interp)->error_code) {
            if (yyparse(yyscanner, interp))
                exit(1);

            imc_compile_all_units(interp);
        }
        IMCC_CATCH(IMCC_FATAL_EXCEPTION) {
            char *error_str = string_to_cstring(interp,
                    IMCC_INFO(interp)->error_message);

            IMCC_INFO(interp)->error_code=IMCC_FATAL_EXCEPTION;
            fprintf(stderr,"error:imcc:%s", error_str);
            IMCC_print_inc(interp);
            string_cstring_free(error_str);
            Parrot_exit(interp, IMCC_FATAL_EXCEPTION);
        }
        IMCC_CATCH(IMCC_FATALY_EXCEPTION) {
            char * const error_str = string_to_cstring(interp,
                    IMCC_INFO(interp)->error_message);

            IMCC_INFO(interp)->error_code=IMCC_FATALY_EXCEPTION;
            fprintf(stderr,"error:imcc:%s", error_str);
            IMCC_print_inc(interp);
            string_cstring_free(error_str);
            Parrot_exit(interp, IMCC_FATALY_EXCEPTION);
        }
        IMCC_END_TRY;

        imc_cleanup(interp, yyscanner);

        fclose(imc_yyin_get(yyscanner));

        IMCC_info(interp, 1, "%ld lines compiled.\n", IMCC_INFO(interp)->line);
        if (per_pbc)
            PackFile_fixup_subs(interp, PBC_POSTCOMP, NULL);
    }

    /* Produce a PBC output file, if one was requested */
    if (write_pbc) {
        imcc_write_pbc(interp, output_file);

        /* If necessary, load the file written above */
        if (run_pbc == 2 && strcmp(output_file, "-")) {
            PackFile *pf;

            IMCC_info(interp, 1, "Loading %s\n", output_file);
            pf = Parrot_readbc(interp, output_file);
            if (!pf)
                IMCC_fatal_standalone(interp, 1,
                "Packfile loading failed\n");
            Parrot_loadbc(interp, pf);
            load_pbc = 1;
        }
    }

    /* Run the bytecode */
    if (run_pbc)
        imcc_run_pbc(interp, obj_file, output_file, argc, argv);

    yylex_destroy(yyscanner);
    IMCC_INFO(interp)->yyscanner = NULL;
    return 0;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
