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

#define IMCC_VERSION "0.0.13.0"

static int load_pbc, run_pbc, write_pbc, pre_process;
static char optimizer_opt[20];
extern FILE *yyin;

static void
usage(FILE* fp)
{
    fprintf(fp,
    "parrot -[abcCEfgGhjpPrStvVwy.] [-d [FLAGS]] [-O [level]] [-o FILE] <file>\n");
}

static void
help_debug(void)
{
    printf(
    "parrot ... -d [Flags] ...\n"
    "  Flags:\n"
    "    0x0001    parrot\n"
    "    0x0002    lexer\n"
    "    0x0004    parser\n"
    "    0x0008    imc\n"
    "    0x0010    CFG\n"
    "    0x0020    optimization 1\n"
    "    0x0040    optimization 2\n"
    "    0x1000    PBC\n"
    "    0x2000    PBC constants\n"
    "    0x4000    PBC fixups\n");
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
    "    -P --predereferenced-core\n"
    "    -S --switched-core\n"
    "    -t --trace\n"
    "   <VM options>\n"
    "    -d --debug[=HEXFLAGS]\n"
    "       --help-debug\n"
    "    -w --warnings\n"
    "    -G --no-gc\n"
    "       --gc-debug\n"
    "       --leak-test|--destroy-at-end\n"
    "    -. --wait    Read a keystroke before starting\n"
    "   <Compiler options>\n"
    "    -v --verbose\n"
    "    -E --pre-process-only\n"
    "    -o --output=FILE\n"
    "       --output-pbc\n"
    "    -O --optimize[=LEVEL]\n"
    "    -a --pasm\n"
    "    -c --pbc\n"
    "    -r --run-pbc\n"
    "    -y --yydebug\n"
    "see docs/running.pod for more\n");
}


static void
imcc_version(void)
{
    printf("This is parrot version " PARROT_VERSION " built for "
            PARROT_ARCHNAME ".\n\
Copyright (C) 2001-2003 The Perl Foundation.  All Rights Reserved.\n\
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

#define setopt(flag)   Parrot_set_flag(interp, flag)
#define setcore(core)  Parrot_set_run_core(interp, core)

#define OPT_GC_DEBUG     128
#define OPT_DESTROY_FLAG 129
#define OPT_HELP_DEBUG   130
#define OPT_PBC_OUTPUT   131
static struct longopt_opt_decl options[] = {
    { '.', '.', 0, { "--wait" } },
    { 'C', 'C', 0, { "--CGP-core" } },
    { 'E', 'E', 0, { "--pre-precess-only" } },
    { 'G', 'G', 0, { "--no-gc" } },
    { 'O', 'O', OPTION_optional_FLAG, { "--optimize" } },
    { 'P', 'P', 0, { "--predereferenced-core" } },
    { 'S', 'S', 0, { "--switched-core" } },
    { 'V', 'V', 0, { "--version" } },
    { '\0', OPT_DESTROY_FLAG, 0,   { "--leak-test", "--destroy-at-end" } },
    { '\0', OPT_GC_DEBUG, 0, { "--gc-debug" } },
    { 'a', 'a', 0, { "--pasm" } },
    { 'b', 'b', 0, { "--bounds-checks", "--slow-core" } },
    { 'c', 'c', 0, { "--pbc" } },
    { 'd', 'd', OPTION_optional_FLAG, { "--debug" } },
    { '\0', OPT_HELP_DEBUG, 0, { "--help-debug" } },
    { 'f', 'f', 0, { "--fast-core" } },
    { 'g', 'g', 0, { "--computed-goto-core" } },
    { 'h', 'h', 0, { "--help" } },
    { 'j', 'j', 0, { "--jit-core" } },
    { 'o', 'o', OPTION_required_FLAG, { "--output" } },
    { '\0', OPT_PBC_OUTPUT, 0, { "--output-pbc" } },
    { 'p', 'p', 0, { "--profile" } },
    { 'r', 'r', 0, { "--run-pbc" } },
    { 't', 't', 0, { "--trace" } },
    { 'v', 'v', 0, { "--verbose" } },
    { 'w', 'w', 0, { "--warnings" } },
    { 'y', 'y', 0, { "--yydebug" } },
    { 0, 0, 0, { NULL } }
};

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
                setopt(PARROT_BOUNDS_FLAG);
                break;
            case 'p':
                setopt(PARROT_PROFILE_FLAG);
                break;
            case 't':
                setopt(PARROT_TRACE_FLAG);
                break;
            case 'j':
                setcore(PARROT_JIT_CORE);
                break;
            case 'P':
                setcore(PARROT_PREDEREF_CORE);
                break;
            case 'S':
                setcore(PARROT_SWITCH_CORE);
                break;
            case 'C':
                setcore(PARROT_CGP_CORE);
                break;
            case 'f':
                setcore(PARROT_FAST_CORE);
                break;
            case 'g':
                setcore(PARROT_CGOTO_CORE);
                break;
            case 'd':
                if (opt.opt_arg) {
                    interp->imc_info->debug = strtoul(opt.opt_arg, 0, 16);
                }
                else {
                    interp->imc_info->debug++;
                }
                if (interp->imc_info->debug & 1)
                    setopt(PARROT_DEBUG_FLAG);
                break;
            case 'w':
                Parrot_setwarnings(interp, PARROT_WARNINGS_ALL_FLAG);
                interp->imc_info->imcc_warn = 1;
                break;
            case 'G':
                gc_off = 1;
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
                interp->imc_info->verbose++;
                break;
            case 'y':
                yydebug = 1;
                break;
            case 'E':
                pre_process = 1;
                break;
            case 'o':
                run_pbc = 0;
                output = str_dup(opt.opt_arg);
                break;

            case OPT_PBC_OUTPUT:
                run_pbc = 0;
                write_pbc = 1;
                if (!output) output = str_dup("-");
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
                    optimizer_level |= OPT_PASM;
                if (strchr(optimizer_opt, 'c'))
                    optimizer_level |= OPT_SUB;
#if 0
                /* currently not ok due to different register allocation */
                if (strchr(optimizer_opt, 'j')) {
                    int one = 1;
                    optimizer_level |= (OPT_J | OPT_PASM);
                    Parrot_setflag(interp, PARROT_JIT_FLAG, &one);
                }
#endif
                if (strchr(optimizer_opt, '1')) {
                    optimizer_level |= OPT_PRE;
                    goto opt_t;
                }
                if (strchr(optimizer_opt, '2')) {
                    optimizer_level |= (OPT_CFG | OPT_PRE);
                    goto opt_t;
                }
                if (strchr(optimizer_opt, 't')) {
opt_t:
                    setcore(PARROT_SWITCH_CORE);
#ifdef HAVE_COMPUTED_GOTO
                    setcore(PARROT_CGP_CORE);
#endif
                }
                break;

            case OPT_GC_DEBUG:
#if DISABLE_GC_DEBUG
                Parrot_warn(interp, PARROT_WARNINGS_ALL_FLAG,
                        "PARROT_GC_DEBUG is set but the binary was "
                        "compiled with DISABLE_GC_DEBUG.");
#endif
                setopt(PARROT_GC_DEBUG_FLAG);
                break;
            case OPT_DESTROY_FLAG:
                setopt(PARROT_DESTROY_FLAG);
                break;

            default:
                fatal(1, "main", "Invalid flag '%s' used."
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
do_pre_process(Parrot_Interp interpreter)
{
    int c;
    YYSTYPE val;

    while ( (c = yylex(&val, interpreter)) ) {
        switch (c) {
            case EMIT:          printf(".emit\n"); break;
            case EOM:           printf(".eom\n"); break;
            case LOCAL:         printf(".local "); break;
            case ARG:           printf(".arg "); break;
            case SUB:           printf(".sub "); break;
            case ESUB:          printf(".end"); break;
            case RESULT:        printf(".result "); break;
            case RETURN:        printf(".return "); break;
            case CLASS:         printf(".class "); break;
            case ENDCLASS:      printf(".endclass"); break;
            case NAMESPACE:     printf(".namespace "); break;
            case ENDNAMESPACE:  printf(".endnamespace"); break;
            case CONST:         printf(".const "); break;
            case PARAM:         printf(".param "); break;
            case MACRO:         yylex(&val, interpreter);
                                break; /* swallow nl */

            case END:           printf("end");break;
            case GOTO:          printf("goto ");break;
            case IF:            printf("if ");break;
            case UNLESS:        printf("unless ");break;
            case INC:           printf("inc ");break;
            case DEC:           printf("dec ");break;
            case INTV:          printf("int ");break;
            case FLOATV:        printf("float ");break;
            case STRINGV:       printf("string ");break;
            case NEW:           printf("new ");break;
            case DEFINED:       printf("defined ");break;
            case ADDR:          printf("addr ");break;
            case GLOBAL:        printf("global ");break;
            case CALL:          printf("call ");break;
            case SAVEALL:       printf("saveall");break;
            case RESTOREALL:    printf("restoreall");break;
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
            case PROTOTYPED:          printf("prototyped"); break;
            case NON_PROTOTYPED:      printf("non_prototyped"); break;
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

int
main(int argc, char * argv[])
{
    struct PackFile *pf;
    int obj_file;

    struct Parrot_Interp *interpreter = Parrot_new(NULL);

    Parrot_init(interpreter);
    interpreter->imc_info = mem_sys_allocate_zeroed(sizeof(imc_info_t));

    interpreter->DOD_block_level++;
    interpreter->GC_block_level++;

    sourcefile = parseflags(interpreter, &argc, &argv);
    /* register PASM and PIR compilers to parrot core */
    register_compilers(interpreter);

    /* default optimizations, s. optimizer.c, imc.h */
    if (!*optimizer_opt) {
        strcpy(optimizer_opt, "0");
        optimizer_level = 0;
    }

    if (!sourcefile || !*sourcefile) {
        fatal(EX_NOINPUT, "main", "No source file specified.\n" );
    }
    else if (!strcmp(sourcefile, "-")) {
        yyin = stdin;
    }
    else {
        char *ext;
        if (!(yyin = fopen(sourcefile, "r")))    {
            fatal(EX_IOERR, "main", "Error reading source file %s.\n",
                    sourcefile);
        }
        ext = strrchr(sourcefile, '.');
        if (ext && strcmp (ext, ".pasm") == 0) {
            pasm_file = 1;
        }
        else if (ext && strcmp (ext, ".pbc") == 0) {
            load_pbc = 1;
            write_pbc = 0;
        }
    }
    if (pre_process) {
        do_pre_process(interpreter);
        Parrot_destroy(interpreter);
        Parrot_exit(0);
    }

    obj_file = 0;
    if (output) {
        char *ext;
        ext = strrchr(output, '.');
        if (ext && strcmp (ext, ".pbc") == 0) {
            write_pbc = 1;
        }
        else if (ext && strcmp (ext, ".o") == 0) {
#if EXEC_CAPABLE
            load_pbc = 1;
            write_pbc = 0;
            run_pbc = 1;
            obj_file = 1;
            Parrot_setup_opt(interpreter, 0, output);
            Parrot_set_run_core(interpreter, PARROT_EXEC_CORE);
#else
            fatal(1, "main", "can't produce object file");
#endif
        }
        if (!strcmp(sourcefile, output) && strcmp(sourcefile, "-"))
            fatal(1, "main", "outputfile is sourcefile\n");
    }

    if (interpreter->imc_info->verbose) {
        info(interpreter, 1,"debug = 0x%x\n", interpreter->imc_info->debug);
        info(interpreter, 1,"Reading %s\n", yyin == stdin ? "stdin":sourcefile);
    }
    if (load_pbc) {
        fclose(yyin);
        pf = Parrot_readbc(interpreter, sourcefile);
        if (!pf)
            fatal(1, "main", "Packfile loading failed\n");
        Parrot_loadbc(interpreter, pf);
    }
    else {
        int per_pbc = (write_pbc | run_pbc) != 0;
        info(interpreter, 1, "using optimization '%s' (%x) \n", optimizer_opt,
                optimizer_level);
        pf = PackFile_new(0);
        Parrot_loadbc(interpreter, pf);

        line = 1;
        emit_open(per_pbc, per_pbc ? (void*)interpreter : (void*)output);

        info(interpreter, 1, "Starting parse...\n");

        yyparse((void *) interpreter);

        imc_compile_all_units(interpreter);
        imc_cleanup(interpreter);

        emit_close(interpreter);
        fclose(yyin);

        info(interpreter, 1, "%ld lines compiled.\n", line);
    }
    if (write_pbc) {
        size_t size;
        opcode_t *packed;
        FILE *fp;
        info(interpreter, 1, "Writing %s\n", output);

        size = PackFile_pack_size(interpreter->code) * sizeof(opcode_t);
        info(interpreter, 1, "packed code %d bytes\n", size);
        packed = (opcode_t*) mem_sys_allocate(size);
        if (!packed)
            fatal(1, "main", "Out of mem\n");
        PackFile_pack(interpreter->code, packed);
        if (strcmp (output, "-") == 0)
            fp = stdout;
        else if ((fp = fopen(output, "wb")) == 0)
            fatal(1, "main", "Couldn't open %s\n", output);

        if ((1 != fwrite(packed, size, 1, fp)) )
            fatal(1, "main", "Couldn't write %s\n", output);
        fclose(fp);
        info(interpreter, 1, "%s written.\n", output);
        free(packed);
    }
    /* load the file written above */
    if (run_pbc == 2 && write_pbc && strcmp(output, "-")) {
        info(interpreter, 1, "Loading %s\n", output);
        pf = Parrot_readbc(interpreter, output);
        if (!pf)
            fatal(1, "main", "Packfile loading failed\n");
        Parrot_loadbc(interpreter, pf);
        load_pbc = 1;
    }
    if (run_pbc) {
        if (interpreter->imc_info->imcc_warn)
            PARROT_WARNINGS_on(interpreter, PARROT_WARNINGS_ALL_FLAG);
        else
            PARROT_WARNINGS_off(interpreter, PARROT_WARNINGS_ALL_FLAG);
        if (!gc_off) {
            interpreter->DOD_block_level--;
            interpreter->GC_block_level--;
        }
        if (obj_file)
            info(interpreter, 1, "Writing %s\n", output);
        else
            info(interpreter, 1, "Running...\n");
        if (!load_pbc)
            PackFile_fixup_subs(interpreter);
        Parrot_runcode(interpreter, argc, argv);
        /* XXX no return value :-( */
    }
    Parrot_destroy(interpreter);
    if (output)
        free(output);
    mem_sys_free(interpreter->imc_info);
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
