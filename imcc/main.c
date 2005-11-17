/*
 * main.c
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
#include "pbc.h"
#include "parser.h"

#define IMCC_VERSION "0.3.1"

static int load_pbc, run_pbc, write_pbc, pre_process, pasm_file;
static char optimizer_opt[20];
extern FILE *yyin;

static void
usage(FILE* fp)
{
    fprintf(fp,
    "parrot -[abcCEfgGhjprStvVwy.] [-d [FLAGS]] [-O [level]] [-o FILE] <file>\n");
}

static void
help_debug(void)
{
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
    "\n"
    "--parrot-debug -D [Flags] ...\n"
    "    0001    memory statistics\n"
    "    0002    print backtrace on exception\n"
    "    0004    JIT debugging\n"
    "    0008    interpreter startup\n"
    "    0010    thread debugging\n"
    "    0020    eval/compile\n"
    "    0040    fill I, N registers with garbage\n"
    "    0080    show, when a context is destroyed\n"
    "\n"
    "--trace -t [Flags] ...\n"
    "    0001    opcodes\n"
    "    0002    find_method\n"
    "    0004    function calls\n"
    );
}

static void
help(void)
{
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
    "       --help-debug\n"
    "    -w --warnings\n"
    "    -G --no-gc\n"
    "       --gc-debug\n"
    "       --leak-test|--destroy-at-end\n"
    "    -. --wait    Read a keystroke before starting\n"
    "       --runtime-prefix\n"
    "   <Compiler options>\n"
    "    -d --imcc_debug[=HEXFLAGS]\n"
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
imcc_version(void)
{
    int rev = PARROT_REVISION;
    printf("This is parrot version " PARROT_VERSION);
    if (rev != 0)
	printf(" (r%d)", rev);
    printf(" built for " PARROT_ARCHNAME ".\n");
    rev = Parrot_revision();
    if (PARROT_REVISION != rev) {
	printf( "Warning: runtime has revision %d!\n", rev );
    }
    rev = Parrot_config_revision();
    if (PARROT_REVISION != rev) {
	printf( "Warning: used Configure.pl revision %d!\n", rev );
    }
    printf("Copyright (C) 2001-2005 The Perl Foundation.  All Rights Reserved.\n\
\n\
Parrot may be copied only under the terms of either the Artistic License or the\n\
GNU General Public License, which may be found in the Parrot source kit.\n\
\n\
This program is distributed in the hope that it will be useful,\n\
but WITHOUT ANY WARRANTY; without even the implied warranty of\n\
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See either\n\
the GNU General Public License or the Artistic License for more details.\n\n");

    printf("PASM/PIR compiler version " IMCC_VERSION ".\n\n");
    Parrot_exit(0);
}

#define SET_FLAG(flag)   Parrot_set_flag(interp, flag)
#define SET_DEBUG(flag)  Parrot_set_debug(interp, flag)
#define SET_TRACE(flag)  Parrot_set_trace(interp, flag)
#define SET_CORE(core)   Parrot_set_run_core(interp, core)

#define OPT_GC_DEBUG     128
#define OPT_DESTROY_FLAG 129
#define OPT_HELP_DEBUG   130
#define OPT_PBC_OUTPUT   131
#define OPT_RUNTIME_PREFIX  132

static struct longopt_opt_decl options[] = {
    { '.', '.', 0, { "--wait" } },
    { 'C', 'C', 0, { "--CGP-core" } },
    { 'D', 'D', OPTION_optional_FLAG, { "--parrot-debug" } },
    { 'E', 'E', 0, { "--pre-process-only" } },
    { 'G', 'G', 0, { "--no-gc" } },
    { 'O', 'O', OPTION_optional_FLAG, { "--optimize" } },
    { 'S', 'S', 0, { "--switched-core" } },
    { 'V', 'V', 0, { "--version" } },
    { '\0', OPT_DESTROY_FLAG, 0,   { "--leak-test", "--destroy-at-end" } },
    { '\0', OPT_GC_DEBUG, 0, { "--gc-debug" } },
    { 'a', 'a', 0, { "--pasm" } },
    { 'b', 'b', 0, { "--bounds-checks", "--slow-core" } },
    { 'c', 'c', 0, { "--pbc" } },
    { 'd', 'd', OPTION_optional_FLAG, { "--imcc-debug" } },
    { '\0', OPT_HELP_DEBUG, 0, { "--help-debug" } },
    { 'f', 'f', 0, { "--fast-core" } },
    { 'g', 'g', 0, { "--computed-goto-core" } },
    { 'h', 'h', 0, { "--help" } },
    { 'j', 'j', 0, { "--jit-core" } },
    { 'o', 'o', OPTION_required_FLAG, { "--output" } },
    { '\0', OPT_PBC_OUTPUT, 0, { "--output-pbc" } },
    { 'p', 'p', 0, { "--profile" } },
    { 'r', 'r', 0, { "--run-pbc" } },
    { '\0', OPT_RUNTIME_PREFIX, 0, { "--runtime-prefix" } },
    { 't', 't', OPTION_optional_FLAG, { "--trace" } },
    { 'v', 'v', 0, { "--verbose" } },
    { 'w', 'w', 0, { "--warnings" } },
    { 'y', 'y', 0, { "--yydebug" } },
    { 0, 0, 0, { NULL } }
};

static int
is_all_hex_digitis(const char *s)
{
    for (; *s; s++)
        if (!isxdigit(*s) )
            return 0;
    return 1;
}

/* most stolen from test_main.c */
static char *
parseflags(Parrot_Interp interp, int *argc, char **argv[])
{
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;
    int status;
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
                if (opt.opt_arg && is_all_hex_digitis(opt.opt_arg)) {
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
                if (opt.opt_arg && is_all_hex_digitis(opt.opt_arg)) {
                    IMCC_INFO(interp)->debug = strtoul(opt.opt_arg, 0, 16);
                }
                else {
                    IMCC_INFO(interp)->debug++;
                }
                break;
            case 'D':
                if (opt.opt_arg && is_all_hex_digitis(opt.opt_arg)) {
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
                imcc_version();
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
                pre_process = 1;
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
                if (opt.opt_arg) {
                    strncpy(optimizer_opt, opt.opt_arg, sizeof(optimizer_opt));
                    optimizer_opt[sizeof(optimizer_opt)-1] = '\0';
                }
                else {
                    strcpy(optimizer_opt, "1");
                }
                if (strchr(optimizer_opt, 'p'))
                    IMCC_INFO(interp)->optimizer_level |= OPT_PASM;
                if (strchr(optimizer_opt, 'c'))
                    IMCC_INFO(interp)->optimizer_level |= OPT_SUB;
#if 0
                /* currently not ok due to different register allocation */
                if (strchr(optimizer_opt, 'j')) {
                    int one = 1;
                    optimizer_level |= (OPT_J | OPT_PASM);
                    Parrot_setflag(interp, PARROT_JIT_FLAG, &one);
                }
#endif
                if (strchr(optimizer_opt, '1')) {
                    IMCC_INFO(interp)->optimizer_level |= OPT_PRE;
                }
                if (strchr(optimizer_opt, '2')) {
                    /* FIXME -O2 is borken */
#if 0
                    optimizer_level |= (OPT_CFG | OPT_PRE);
#else
                    IMCC_INFO(interp)->optimizer_level |= OPT_PRE;
#endif
                }
                if (strchr(optimizer_opt, 't')) {
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
                IMCC_fatal(interp, 1, "main: Invalid flag '%s' used."
                        "\n\nhelp: parrot -h\n", (*argv)[0]);
        }
    }
    if (status == -1) {
        fprintf(stderr, "%s\n", opt.opt_error);
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
    int c;
    YYSTYPE val;

    IMCC_push_parser_state(interp);
    while ( (c = yylex(&val, interp)) ) {
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
            case MACRO:         yylex(&val, interp);
                                break; /* swallow nl */

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

            default:
                     if (c < 255)
                         printf("%c", c);
                     else
                         printf("%s ", val.s);
                     break;
        }
    }
}

extern void imcc_init(Parrot_Interp interp);

int
main(int argc, char * argv[])
{
    struct PackFile *pf;
    int obj_file, ast_file = 0;
    char *sourcefile;
    const char *output_file;

    Interp *interp = Parrot_new(NULL);

    Parrot_init(interp);

    Parrot_block_DOD(interp);
    Parrot_block_GC(interp);

    imcc_init(interp);
    IMCC_ast_init(interp);

    sourcefile = parseflags(interp, &argc, &argv);
    output_file = interp->output_file;

    /* Default optimization level is zero; see optimizer.c, imc.h */
    if (!*optimizer_opt) {
        strcpy(optimizer_opt, "0");
        IMCC_INFO(interp)->optimizer_level = 0;
    }

    /* Read in the source and determine whether it's Parrot bytecode,
       PASM or a Parrot abstract syntax tree (PAST) file. If it isn't
       any of these, then we assume that it is PIR. */
    if (!sourcefile || !*sourcefile) {
        IMCC_fatal(interp, 1, "main: No source file specified.\n" );
    }
    else if (!strcmp(sourcefile, "-")) {
        yyin = stdin;
    }
    else {
        char *ext;
        ext = strrchr(sourcefile, '.');
        if (ext && strcmp (ext, ".pbc") == 0) {
            load_pbc = 1;
            write_pbc = 0;
        }
        else if (!load_pbc) {
            if (!(yyin = fopen(sourcefile, "r")))    {
                IMCC_fatal(interp, E_IOError,
                    "Error reading source file %s.\n",
                        sourcefile);
            }
            if (ext && strcmp (ext, ".pasm") == 0) {
                pasm_file = 1;
            }
            else if (ext && strcmp (ext, ".past") == 0) {
                ast_file = 1;
            }
        }
    }
    if (pre_process) {
        do_pre_process(interp);
        Parrot_destroy(interp);
        Parrot_exit(0);
    }

    /* Do we need to produce an output file? If so, what type? */
    obj_file = 0;
    if (interp->output_file) {
        char *ext;
        ext = strrchr(interp->output_file, '.');
        if (ext && strcmp (ext, ".pbc") == 0) {
            write_pbc = 1;
        }
        else if (ext && strcmp (ext, PARROT_OBJ_EXT) == 0) {
#if EXEC_CAPABLE
            load_pbc = 1;
            write_pbc = 0;
            run_pbc = 1;
            obj_file = 1;
            Parrot_set_run_core(interp, PARROT_EXEC_CORE);
#else
            IMCC_fatal(interp, 1, "main: can't produce object file");
#endif
        }
        if (!strcmp(sourcefile, output_file) && strcmp(sourcefile, "-"))
            IMCC_fatal(interp, 1,
                "main: outputfile is sourcefile\n");
    }

    IMCC_INFO(interp)->write_pbc = write_pbc;

    if (IMCC_INFO(interp)->verbose) {
        IMCC_info(interp, 1,"debug = 0x%x\n", IMCC_INFO(interp)->debug);
        IMCC_info(interp, 1,"Reading %s\n", yyin == stdin ? "stdin":sourcefile);
    }

    /* If the input file is Parrot bytecode, then we simply read it
       into a packfile, which Parrot then loads */
    if (load_pbc) {
        pf = Parrot_readbc(interp, sourcefile);
        if (!pf)
            IMCC_fatal(interp, 1,
                "main: Packfile loading failed\n");
        Parrot_loadbc(interp, pf);
    }
    else {
        /* Otherwise, we need to compile our input to bytecode. */
        int per_pbc = (write_pbc | run_pbc) != 0;
        IMCC_info(interp, 1, "using optimization '%s' (%x) \n", optimizer_opt,
                IMCC_INFO(interp)->optimizer_level);
        pf = PackFile_new(interp, 0);
        Parrot_loadbc(interp, pf);

        IMCC_push_parser_state(interp);
        IMCC_INFO(interp)->state->file = sourcefile;

        emit_open(interp, per_pbc, per_pbc ? NULL : (void*)output_file);

        IMCC_info(interp, 1, "Starting parse...\n");

        if (ast_file) {
            IMCC_ast_compile(interp, yyin);
            imc_compile_all_units_for_ast(interp);
        }
        else {
            IMCC_INFO(interp)->state->pasm_file = pasm_file;
            yyparse((void *) interp);
        }
        imc_compile_all_units(interp);

        imc_cleanup(interp);

        fclose(yyin);

        IMCC_info(interp, 1, "%ld lines compiled.\n", line);
    }

    /* Produce a PBC output file, if one was requested */
    if (write_pbc) {
        size_t size;
        opcode_t *packed;
        FILE *fp;
        IMCC_info(interp, 1, "Writing %s\n", output_file);

        size = PackFile_pack_size(interp, interp->code->base.pf) *
            sizeof(opcode_t);
        IMCC_info(interp, 1, "packed code %d bytes\n", size);
        packed = (opcode_t*) mem_sys_allocate(size);
        PackFile_pack(interp, interp->code->base.pf, packed);
        if (strcmp (output_file, "-") == 0)
            fp = stdout;
        else if ((fp = fopen(output_file, "wb")) == 0)
            IMCC_fatal(interp, E_IOError,
                "Couldn't open %s\n", output_file);

        if ((1 != fwrite(packed, size, 1, fp)) )
            IMCC_fatal(interp, E_IOError,
                "Couldn't write %s\n", output_file);
        fclose(fp);
        IMCC_info(interp, 1, "%s written.\n", output_file);
        free(packed);
        /* TODO */
        if (run_pbc != 2)
            PackFile_fixup_subs(interp, PBC_POSTCOMP, NULL);
    }

    /* If necessary, load the file written above */
    if (run_pbc == 2 && write_pbc && strcmp(output_file, "-")) {
        IMCC_info(interp, 1, "Loading %s\n", output_file);
        pf = Parrot_readbc(interp, output_file);
        if (!pf)
            IMCC_fatal(interp, 1,
            "Packfile loading failed\n");
        Parrot_loadbc(interp, pf);
        load_pbc = 1;
    }

    /* Run the bytecode */
    if (run_pbc) {

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
        if (!load_pbc)
            PackFile_fixup_subs(interp, PBC_MAIN, NULL);
        Parrot_runcode(interp, argc, argv);
        /* XXX no return value :-( */
    }

    /* Clean-up after ourselves */
    Parrot_destroy(interp);
    mem_sys_free(IMCC_INFO(interp));
    Parrot_exit(0);

    return 0;
}


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
