/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/embed.c - The Parrot embedding interface

=head1 DESCRIPTION

This file implements the Parrot embedding interface.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/embed.h"

/*

=item C<Parrot_Interp Parrot_new(Parrot_Interp parent)>

Returns a new Parrot interpreter.

The first created interpreter (C<parent> is C<NULL>) is the last one
to get destroyed.

=cut

*/

#ifdef JIT_CAPABLE
#if EXEC_CAPABLE
#  include "parrot/exec.h"
#endif /* EXEC_CAPABLE */
#include "parrot/jit.h"
#endif
Parrot_Interp
Parrot_new(Parrot_Interp parent)
{
    /* interpreter.c:make_interpreter builds a new Parrot_Interp. */
    return make_interpreter(parent, PARROT_NO_FLAGS);
}

extern void Parrot_initialize_core_pmcs(Interp *interp);

/*

=item C<void Parrot_init(Interp *interpreter)>

Initializes the new interpreter. This function only has effect the first
time it is called. Use this function when you intend to enter the run loop,
which automatically sets the top of stack pointer.

=item C<void Parrot_init_stacktop(Interp *interpreter, void *stack_top)>

Like above. Additionally sets the stack top, so that Parrot objects created
in inner stack frames will be visible during DODs stack walking code.
B<stack_top> should be the address of an automatic variable in the caller's
stack frame. All unanchored Parrot objects (PMCs) must live in inner stack
frames so that they are not destroyed during DOD runs.

Use this function when you call into Parrot before entering a run loop.

=cut

*/

void
Parrot_init(Interp *interpreter)
{

    if (!interpreter->world_inited) {
        /* global_setup.c:init_world sets up some vtable stuff.
         * It must only be called once.
         */

        interpreter->world_inited = 1;
        init_world(interpreter);
    }
}

void
Parrot_init_stacktop(Interp *interpreter, void *stack_top)
{
    interpreter->lo_var_ptr = stack_top;
    interpreter->resume_flag &= ~RESUME_INITIAL;
    Parrot_init(interpreter);
}

/*

=item C<void Parrot_set_flag(Interp *interpreter, Parrot_Interp_flag flag)>

Sets a flag in the interpreter specified by C<flag>, any of
C<PARROT_BOUNDS_FLAG>, or C<PARROT_PROFILE_FLAG> to enable profiling, and
bounds checking respectively or C<PARROT_THR_TYPE_1>, C<PARROT_THR_TYPE_2>, or
C<PARROT_THR_TYPE_3> to disable thread communication and variable sharing,
disable variable sharing but enable thread communication, or to enable variable
sharing.

=item C<void Parrot_set_debug(Interp *interpreter, UINTVAL flag)>

Set a debug flag: C<PARROT_DEBUG_FLAG>.

=item C<void Parrot_set_trace(Interp *interpreter, UINTVAL flag)>

Set a trace flag: C<PARROT_TRACE_FLAG>

=cut

*/

void
Parrot_set_flag(Interp *interpreter, Parrot_Interp_flag flag)
{
    /* These two macros (from interpreter.h) do exactly what they look like. */

    Interp_flags_SET(interpreter, flag);
    switch (flag) {
        case PARROT_BOUNDS_FLAG:
        case PARROT_PROFILE_FLAG:
            Interp_core_SET(interpreter, PARROT_SLOW_CORE);
            break;
        default:
            break;
    }
}

void
Parrot_set_debug(Interp *interpreter, UINTVAL flag)
{
    interpreter->debug_flags |= flag;
}

void
Parrot_set_trace(Interp *interpreter, UINTVAL flag)
{

    interpreter->ctx.trace_flags |= flag;
    Interp_core_SET(interpreter, PARROT_SLOW_CORE);
}

/*

=item C<void Parrot_clear_flag(Interp *, Parrot_Interp_flag flag)>

=item C<void Parrot_clear_debug(Interp *, UINTVAL flag)>

=item C<void Parrot_clear_trace(Interp *, UINTVAL flag)>

Clears a flag in the interpreter.

=cut

*/

void
Parrot_clear_flag(Parrot_Interp interpreter, Parrot_Interp_flag flag)
{
    Interp_flags_CLEAR(interpreter, flag);
}

void
Parrot_clear_debug(Interp *interpreter, UINTVAL flag)
{
    interpreter->debug_flags &= ~flag;
}

void
Parrot_clear_trace(Interp *interpreter, UINTVAL flag)
{
    interpreter->ctx.trace_flags &= ~flag;
}

/*

=item C<Parrot_Int
Parrot_test_flag(Interp*, Parrot_Interp_flag flag)>

=item C<UINTVAL
Parrot_test_debug(Interp*, UINTVAL flag)>

=item C<UINTVAL
Parrot_test_trace(Interp*, UINTVAL flag)>

Test the interpreter flags specified in C<flag>.

=cut

*/

Parrot_Int
Parrot_test_flag(Interp* interpreter, Parrot_Interp_flag flag)
{
    return Interp_flags_TEST(interpreter, flag);
}

UINTVAL
Parrot_test_debug(Interp *interpreter, UINTVAL flag)
{
    return interpreter->debug_flags & flag;
}

UINTVAL
Parrot_test_trace(Interp *interpreter, UINTVAL flag)
{
    return interpreter->ctx.trace_flags & flag;
}

/*

=item C<void
Parrot_set_run_core(Interp *interpreter, Parrot_Run_core_t core)>

Sets the specified run core.

=cut

*/

void
Parrot_set_run_core(Interp *interpreter, Parrot_Run_core_t core)
{
    Interp_core_SET(interpreter, core);
}

/*

=item C<void
Parrot_setwarnings(Interp *interpreter, Parrot_warnclass wc)>

Activates the given warnings.

=cut

*/

void
Parrot_setwarnings(Interp *interpreter, Parrot_warnclass wc)
{
    /* Activates the given warnings.  (Macro from warnings.h.) */
    PARROT_WARNINGS_on(interpreter, wc);
}

/*

=item C<struct PackFile *
Parrot_readbc(Interp *interpreter, const char *filename)>

Read in a bytecode, unpack it into a C<PackFile> structure, and do fixups.

=cut

*/

struct PackFile *
Parrot_readbc(Interp *interpreter, const char *filename)
{
    INTVAL program_size, wanted;
    char *program_code;
    struct PackFile *pf;
    FILE * io = NULL;
    INTVAL is_mapped = 0;
#ifdef PARROT_HAS_HEADER_SYSMMAN
    int fd = -1;
#endif
    const char *fullname;

    if (filename == NULL || strcmp(filename, "-") == 0) {
        /* read from STDIN */
        io = stdin;
        /* read 1k at a time */
        program_size = 0;
        fullname = filename;    /* gcc -O3 warn */
    }
    else {

        STRING *fs;

        fullname = Parrot_locate_runtime_file(interpreter, filename,
                PARROT_RUNTIME_FT_PBC);
        if (fullname == NULL) {
            PIO_eprintf(interpreter, "Parrot VM: Can't locate %s, code %i.\n",
                        filename, errno);
            return NULL;
        }
        fs = interpreter->current_file = string_make(interpreter, fullname,
                strlen(fullname), NULL, 0);
        if (!Parrot_stat_info_intval(interpreter, fs, STAT_EXISTS)) {
            PIO_eprintf(interpreter, "Parrot VM: Can't stat %s, code %i.\n",
                    fullname, errno);
            return NULL;
        }
        /*
         * TODO check for regular file
         */

        program_size = Parrot_stat_info_intval(interpreter, fs, STAT_FILESIZE);

#ifndef PARROT_HAS_HEADER_SYSMMAN
        io = fopen(fullname, "rb");
        if (!io) {
            PIO_eprintf(interpreter, "Parrot VM: Can't open %s, code %i.\n",
                    fullname, errno);
            return NULL;
        }
#endif  /* PARROT_HAS_HEADER_SYSMMAN */

    }
#ifdef PARROT_HAS_HEADER_SYSMMAN
again:
#endif
    /* if we've opened a file (or stdin) with PIO, read it in */
    if (io) {
        size_t chunk_size;
        char *cursor;
        INTVAL read_result;

        chunk_size = program_size > 0 ? program_size : 1024;
        program_code = (char *)mem_sys_allocate(chunk_size);
        wanted = program_size;
        program_size = 0;
        cursor = (char *)program_code;

        while ((read_result =
                fread(cursor, 1, chunk_size, io)) > 0) {
            program_size += read_result;
            if (program_size == wanted)
                break;
            chunk_size = 1024;
            program_code =
                mem_sys_realloc(program_code, program_size + chunk_size);

            if (!program_code) {
                PIO_eprintf(interpreter,
                            "Parrot VM: Could not reallocate buffer while reading packfile from PIO.\n");
                return NULL;
            }

            cursor = (char *)program_code + program_size;
        }

        if (read_result < 0) {
            PIO_eprintf(interpreter,
                    "Parrot VM: Problem reading packfile from PIO.\n");
            return NULL;
        }
        fclose(io);
    }
    else {
        /* if we've gotten here, we opted not to use PIO to read the file.
         * use mmap */

#ifdef PARROT_HAS_HEADER_SYSMMAN

        fd = open(fullname, O_RDONLY | O_BINARY);
        if (!fd) {
            PIO_eprintf(interpreter, "Parrot VM: Can't open %s, code %i.\n",
                    fullname, errno);
            return NULL;
        }

        program_code =
            mmap(0, program_size, PROT_READ, MAP_SHARED, fd, (off_t)0);

        if (program_code == (void *)MAP_FAILED) {
            Parrot_warn(interpreter, PARROT_WARNINGS_IO_FLAG,
                    "Parrot VM: Can't mmap file %s, code %i.\n",
                    fullname, errno);
            /* try again, now with IO reading the file */
            io = fopen(fullname, "rb");
            if (!io) {
                PIO_eprintf(interpreter,
                        "Parrot VM: Can't open %s, code %i.\n",
                        fullname, errno);
                return NULL;
            }
            goto again;
        }
        is_mapped = 1;

#else   /* PARROT_HAS_HEADER_SYSMMAN */

        PIO_eprintf(interpreter, "Parrot VM: uncaught error occurred reading "
                    "file or mmap not available.\n");
        return NULL;

#endif  /* PARROT_HAS_HEADER_SYSMMAN */

    }

    /* Now that we have the bytecode, let's unpack it. */

    pf = PackFile_new(interpreter, is_mapped);

    if (!PackFile_unpack
        (interpreter, pf, (opcode_t *)program_code, program_size)) {
        PIO_eprintf(interpreter, "Parrot VM: Can't unpack packfile %s.\n",
                fullname);
        return NULL;
    }

#ifdef PARROT_HAS_HEADER_SYSMMAN

    if (fd >= 0) {
        close(fd);   /* the man page states, it's ok to close a mmaped file */
    }
#else
/* XXX Parrot_exec uses this
    mem_sys_free(program_code); */
#endif

    return pf;
}

/*

=item C<void
Parrot_loadbc(Interp *interpreter, struct PackFile *pf)>

Loads the C<PackFile> returned by C<Parrot_readbc()>.

=cut

*/

void
Parrot_loadbc(Interp *interpreter, struct PackFile *pf)
{
    interpreter->initial_pf = pf;
    interpreter->code = pf->cur_cs;
}

/*

=item C<static void
setup_argv(Interp *interpreter, int argc, char ** argv)>

Sets up the C<ARGS> array in P5.

=cut

*/

static void
setup_argv(Interp *interpreter, int argc, char ** argv)
{
    INTVAL i;
    PMC *userargv;

    if (Interp_debug_TEST(interpreter, PARROT_START_DEBUG_FLAG)) {
        PIO_eprintf(interpreter,
                "*** Parrot VM: Setting up ARGV array in P5.  Current argc: %d ***\n",
                argc);
    }

    /* XXX @ARGS should propably be a ResizableStringArray */
    userargv = pmc_new_noinit(interpreter, enum_class_SArray);
    /* immediately anchor pmc to root set */
    REG_PMC(5) = userargv;
    VTABLE_set_pmc_keyed_int(interpreter, interpreter->iglobals,
            (INTVAL)IGLOBALS_ARGV_LIST, userargv);
    VTABLE_init(interpreter, userargv);
    VTABLE_set_integer_native(interpreter, userargv, argc);

    for (i = 0; i < argc; i++) {
        /* Run through argv, adding everything to @ARGS. */
        STRING *arg = string_make(interpreter, argv[i], strlen(argv[i]),
                                  NULL, PObj_external_FLAG);

        if (Interp_debug_TEST(interpreter, PARROT_START_DEBUG_FLAG)) {
            PIO_eprintf(interpreter, "\t%vd: %s\n", i, argv[i]);
        }

        VTABLE_push_string(interpreter, userargv, arg);
    }
    /*
     * place empty return continuation in context, so that returncc
     * will terminate the main run loop
     * XXX for now still place in P1 until return opcodes are everywhere
     */
    REG_PMC(1) =
        interpreter->ctx.current_cont =
        new_ret_continuation_pmc(interpreter, NULL);
    /* clear segment to denote the end of chain */
    PMC_cont(interpreter->ctx.current_cont)->seg = NULL;
    REG_INT(3) = 1; /* pdd03 - one PMC arg, if code really inspects that */
}

/*

=item C<void
Parrot_setup_opt(Interp *interpreter, int n, char *argv)>

XXX This allows a command line option to be visible from inside the
Parrot core. This is done using the pointers in the interpreter
structure, and the subsystems using this arguments must clear them
before running.

=cut

*/

void
Parrot_setup_opt(Interp *interpreter, int n, char *argv)
{
    REG_STR(n) = (STRING *)argv;
}

/*

=item C<static int
prof_sort_f(const void *a, const void *b)>

Sort function for profile data. Sorts by time.

=cut

*/

static int
prof_sort_f(const void *a, const void *b)
{
    const ProfData *pa = (const ProfData *) a;
    const ProfData *pb = (const ProfData *) b;
    if (pa->time < pb->time)
        return 1;
    if (pa->time > pb->time)
        return -1;
    return 0;
}

/*

=item C<static const char *
op_name(Parrot_Interp interpreter, int k)>

Returns the name of the opcode.

=cut

*/

static const char *
op_name(Parrot_Interp interpreter, int k)
{
    switch (k) {
        case PARROT_PROF_DOD_p1:
            return "DOD_mark_root";
        case PARROT_PROF_DOD_p2:
            return "DOD_mark_next";
        case PARROT_PROF_DOD_cp:
            return "DOD_collect_PMC";
        case PARROT_PROF_DOD_cb:
            return "DOD_collect_buffers";
        case PARROT_PROF_GC:
            return "GC";
        case PARROT_PROF_EXCEPTION:
            return "EXCEPTION";
        default:
            break;
    }
    return interpreter->op_info_table[k - PARROT_PROF_EXTRA].full_name;
}

/*

=item C<static FLOATVAL
calibrate(Parrot_Interp interpreter)>

With this calibration, reported times of C<parrot -p> almost match those
measured with time C<parrot -b>.

=cut

*/

static FLOATVAL
calibrate(Parrot_Interp interpreter)
{
    size_t n = interpreter->op_count;
    size_t i;
    FLOATVAL start, empty;
    opcode_t code[] = { 1 };      /* noop */
    opcode_t *pc = code;

    if (n < 1000000)	/* minimum opcode count for calibration */
        n = 1000000;
    start = Parrot_floatval_time();
    for (empty = 0.0, i = 0; i < n; i++)
       pc =  (interpreter->op_func_table[*code])(pc, interpreter);
    empty += Parrot_floatval_time() - start;
    return empty / (FLOATVAL)n;
}

/*

=item C<static void print_profile(int status, void *p)>

Prints out a profile listing.

=cut

*/

static void
print_profile(int status, void *p)
{
    Parrot_Interp interpreter = (Parrot_Interp) p;

    if (interpreter->profile != NULL) {
        UINTVAL j;
        int k;
        int jit;
        UINTVAL op_count = 0;
        UINTVAL call_count = 0;
        FLOATVAL sum_time = 0.0;
        RunProfile *profile = interpreter->profile;
        FLOATVAL empty = calibrate(interpreter);

        PIO_printf(interpreter, " Code J Name                         Calls  Total/s       Avg/ms\n");
        for (j = 0; j < interpreter->op_count + PARROT_PROF_EXTRA; j++) {
            UINTVAL n = profile->data[j].numcalls;
            profile->data[j].op = j;
            if (j >= PARROT_PROF_EXTRA) {
                profile->data[j].time -= empty * n;
                if (profile->data[j].time < 0.0) /* faster than noop */
                    profile->data[j].time = 0.0;
            }
        }
        qsort(profile->data, interpreter->op_count +
                PARROT_PROF_EXTRA,
                sizeof(ProfData), prof_sort_f);
        for (j = 0; j < interpreter->op_count + PARROT_PROF_EXTRA; j++) {
            UINTVAL n = profile->data[j].numcalls;
            FLOATVAL t = profile->data[j].time;
            if (n > 0) {
                op_count++;
                call_count += n;
                sum_time += t;

                k = profile->data[j].op;
                jit = '-';
#if JIT_CAPABLE
                if (k >= PARROT_PROF_EXTRA &&
                    op_jit[k - PARROT_PROF_EXTRA].extcall != 1)
                    jit = 'j';
#endif
                PIO_printf(interpreter, " %4d %c %-25s %8vu  %10vf  %10.6vf\n",
                        k - PARROT_PROF_EXTRA,
                        jit,
                        op_name(interpreter, k),
                        n,
                        t,
                        (FLOATVAL)(t * 1000.0 / (FLOATVAL)n)
                        );
            }
        }

        PIO_printf(interpreter, " %4vu - %-20s %8vu  %10vf  %10.6vf\n",
                op_count,
                "-",
                call_count,
                sum_time,
                (FLOATVAL)(sum_time * 1000.0 / (FLOATVAL)call_count)
                );
    }
}

/*

=item C<static void print_debug(int status, void *p)>

Prints GC info.

=cut

*/

static void
print_debug(int status, void *p)
{
    Parrot_Interp interpreter = (Parrot_Interp) p;
    if (Interp_debug_TEST(interpreter, PARROT_MEM_STAT_DEBUG_FLAG)) {
        /* Give the souls brave enough to activate debugging an earful
         * about GC. */

        PIO_eprintf(interpreter, "*** Parrot VM: Dumping GC info ***\n");
        PDB_info(interpreter);
    }
}

static void
set_current_sub(Interp *interpreter)
{
    opcode_t i, ci;
    struct PackFile_ByteCode *cur_cs;
    struct PackFile_FixupTable *ft;
    struct PackFile_ConstTable *ct;
    struct Parrot_sub *sub;
    PMC *sub_pmc;
    opcode_t *code_start;
    size_t offs;

    /*
     * Walk the fixup table.  The first Sub-like entry should be our
     * entry point with the address at our resume_offset.
     */

    cur_cs = interpreter->code;
    ft = cur_cs->fixups;
    ct = cur_cs->const_table;
    for (i = 0; i < ft->fixup_count; i++) {
        switch (ft->fixups[i]->type) {
            case enum_fixup_sub:
                ci = ft->fixups[i]->offset;
                sub_pmc = ct->constants[ci]->u.key;
                sub = PMC_sub(sub_pmc);
                if (sub->seg != cur_cs)
                    continue;
                code_start = (opcode_t*) sub->seg->base.data;
                offs = sub->address - code_start;
                if (offs == interpreter->resume_offset) {
                    interpreter->ctx.current_sub = sub_pmc;
                    interpreter->ctx.current_HLL = sub->HLL_id;
                    return;
                }
                break;
        }
    }
    /*
     * if we didn't find anything put an Undef PMC into current_sub
     */
    sub_pmc = pmc_new(interpreter, enum_class_Undef);
    interpreter->ctx.current_sub = sub_pmc;
}

/*

=item C<void
Parrot_runcode(Interp *interpreter, int argc, char *argv[])>

Sets up C<ARGV> and runs the ops.

=cut

*/

void
Parrot_runcode(Interp *interpreter, int argc, char *argv[])
{
    if (!interpreter->lo_var_ptr) {
        int top;
        if (Interp_debug_TEST(interpreter, PARROT_START_DEBUG_FLAG)) {
            PIO_eprintf(interpreter,
                    "*** Parrot VM: Setting stack top. ***\n");
        }
        interpreter->lo_var_ptr = &top;
        Parrot_runcode(interpreter, argc, argv);
        interpreter->lo_var_ptr = NULL;
        return;
    }
    /* Debugging mode nonsense. */
    if (Interp_debug_TEST(interpreter, PARROT_START_DEBUG_FLAG)) {
        if (Interp_flags_TEST(interpreter, PARROT_BOUNDS_FLAG)) {
            PIO_eprintf(interpreter,
                    "*** Parrot VM: Bounds checking enabled. ***\n");
        }
        if (Interp_trace_TEST(interpreter, PARROT_TRACE_OPS_FLAG)) {
            PIO_eprintf(interpreter, "*** Parrot VM: Tracing enabled. ***\n");
        }
        PIO_eprintf(interpreter, "*** Parrot VM: ");
        switch (interpreter->run_core) {
            case PARROT_SLOW_CORE:
                PIO_eprintf(interpreter, "Slow core");
                break;
            case PARROT_FAST_CORE:
                PIO_eprintf(interpreter, "Fast core");
                break;
            case PARROT_SWITCH_CORE:
                PIO_eprintf(interpreter, "Switch core");
                break;
            case PARROT_CGP_CORE:
                PIO_eprintf(interpreter, "CGP core");
                break;
            case PARROT_CGOTO_CORE:
                PIO_eprintf(interpreter, "CGoto core");
                break;
            case PARROT_JIT_CORE:
                PIO_eprintf(interpreter, "JIT core");
                break;
            case PARROT_EXEC_CORE:
                PIO_eprintf(interpreter, "EXEC core");
                break;
        }
        PIO_eprintf(interpreter, " ***\n");
    }

    /* Set up @ARGS (or whatever this language calls it) in P5. */
    setup_argv(interpreter, argc, argv);

#if EXEC_CAPABLE

    /* s. runops_exec interpreter.c */
    if (Interp_core_TEST(interpreter, PARROT_EXEC_CORE)) {
        extern int Parrot_exec_run;
        Parrot_exec_run = 1;
    }

#endif

    /*
     * If any profile information was gathered, print it out
     * before exiting, then print debug infos if turned on.
     */
    Parrot_on_exit(print_debug,   interpreter);
    Parrot_on_exit(print_profile, interpreter);

    /*
     * set current subroutine
     */
    set_current_sub(interpreter);

    /* Let's kick the tires and light the fires--call interpreter.c:runops. */
    runops(interpreter,  interpreter->resume_offset);
}


/*

=item C<static char *argv_join(char **argv)>

XXX Doesn't handle arguments with spaces.

=cut

*/

static char*
argv_join(char ** argv)
{
    char* command;
    char* p;
    int space = 0;
    int i;

    for (i = 0; argv[i]; i++)
        space += strlen(argv[i]) + 1;

    command = (char*) mem_sys_allocate(space == 0 ? 1 : space);
    p = command;
    for (i = 0; argv[i]; i++) {
        strcpy(p, argv[i]);
        p += strlen(argv[i]);
        *(p++) = ' ';
    }
    if (p > command) p--;
    *p = '\0';
    return command;
}

/*

=item C<void
Parrot_debug(Interp *interpreter, int argc, char **argv)>

Runs the interpreter's bytecode in debugging mode.

=cut

*/

void
Parrot_debug(Interp *interpreter, int argc, char ** argv)
{
    PDB_t *pdb;
    const char *command;

    pdb = (PDB_t *)mem_sys_allocate_zeroed(sizeof(PDB_t));

    interpreter->pdb = pdb;
    pdb->cur_opcode = interpreter->code->base.data;

    /* Parrot_setup_argv(interpreter, argc, argv); */
    PDB_init(interpreter, argv_join(argv));
    PDB_disassemble(interpreter,NULL);
    while (!(pdb->state & PDB_EXIT)) {
        PDB_get_command(interpreter);
        command = pdb->cur_command;
        PDB_run_command(interpreter, command);
    }
}

/*

=item C<void
Parrot_disassemble(Interp *interpreter)>

Disassembles and prints out the interpreter's bytecode.

This is used by the Parrot disassembler.

=cut

*/

void
Parrot_disassemble(Interp *interpreter)
{
    PDB_t *pdb;
    PDB_line_t *line;
    char *c;

    pdb = (PDB_t *)mem_sys_allocate_zeroed(sizeof(PDB_t));

    interpreter->pdb = pdb;
    pdb->cur_opcode = interpreter->code->base.data;

    PDB_disassemble(interpreter, NULL);
    line = pdb->file->line;

    while (line->next) {
        /* If it has a label print it */
        if (line->label)
            PIO_printf(interpreter, "L%li:\t", line->label->number);
        c = pdb->file->source + line->source_offset;
        while (*c != '\n' && c)
            PIO_printf(interpreter, "%c", *(c++));
        PIO_printf(interpreter, "\n");
        line = line->next;
    }
    return;
}

/*

=item C<void
Parrot_run_native(Parrot_Interp interpreter, native_func_t func)>

Run the C function C<func> through the program C<[enternative, end]>.
This ensures that the function is run with the same setup as in other
run loops.

This function is used in some of the source tests in F<t/src> which use
the interpreter outside a runloop.

=cut

*/

void
Parrot_run_native(Parrot_Interp interpreter, native_func_t func)
{
    static opcode_t program_code[2];
    struct PackFile *          pf;

    program_code[0] = interpreter->op_lib->op_code("enternative", 0);
    program_code[1] = 0; /* end */
    pf = PackFile_new(interpreter, 0);
    pf->cur_cs = (struct PackFile_ByteCode *)
	(pf->PackFuncs[PF_BYTEC_SEG].new_seg)(interpreter, pf, "code", 1);
    pf->cur_cs->base.data = program_code;
    pf->cur_cs->base.size = 2;
    Parrot_loadbc(interpreter, pf);
    run_native = func;
    runops(interpreter, interpreter->resume_offset);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/embed.h> and F<docs/embed.pod>.

=head1 HISTORY

Initial version by Brent Dax on 2002.1.28.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
