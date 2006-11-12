/*
Copyright (C) 2001-2006, The Perl Foundation.
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
#include "parrot/oplib/ops.h"

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
#include "jit.h"
#endif
Parrot_Interp
Parrot_new(Parrot_Interp parent)
{
    /* interpreter.c:make_interpreter builds a new Parrot_Interp. */
    return make_interpreter(parent, PARROT_NO_FLAGS);
}

extern void Parrot_initialize_core_pmcs(Interp *interp);

/*

=item C<void Parrot_init(Interp *interp)>

Initializes the new interpreter. This function only has effect the first
time it is called. Therefore Parrot_init() doesn't have to be called
on an interpreter returned from Parrot_new().

Use this function when you intend to enter the run loop,
which automatically sets the top of stack pointer.

=item C<void Parrot_init_stacktop(Interp *interp, void *stack_top)>

Like above. Additionally sets the stack top, so that Parrot objects created
in inner stack frames will be visible during DODs stack walking code.
B<stack_top> should be the address of an automatic variable in the caller's
stack frame. All unanchored Parrot objects (PMCs) must live in inner stack
frames so that they are not destroyed during DOD runs.

Use this function when you call into Parrot before entering a run loop.

=cut

*/

void
Parrot_init(Interp *interp)
{
    if (!interp->world_inited) {
        /* global_setup.c:init_world sets up some vtable stuff.
         * It must only be called once.
         */

        interp->world_inited = 1;
        init_world(interp);
    }
}

void
Parrot_init_stacktop(Interp *interp, void *stack_top)
{
    interp->lo_var_ptr = stack_top;
    Parrot_init(interp);
}

/*

=item C<void Parrot_set_flag(Interp *interp, Parrot_Interp_flag flag)>

Sets a flag in the interpreter specified by C<flag>, any of
C<PARROT_BOUNDS_FLAG>, or C<PARROT_PROFILE_FLAG> to enable profiling, and
bounds checking respectively or C<PARROT_THR_TYPE_1>, C<PARROT_THR_TYPE_2>, or
C<PARROT_THR_TYPE_3> to disable thread communication and variable sharing,
disable variable sharing but enable thread communication, or to enable variable
sharing.

=item C<void Parrot_set_debug(Interp *interp, UINTVAL flag)>

Set a debug flag: C<PARROT_DEBUG_FLAG>.

=item C<void Parrot_set_trace(Interp *interp, UINTVAL flag)>

Set a trace flag: C<PARROT_TRACE_FLAG>

=cut

*/

void
Parrot_set_flag(Interp *interp, Parrot_Interp_flag flag)
{
    /* These two macros (from interpreter.h) do exactly what they look like. */

    Interp_flags_SET(interp, flag);
    switch (flag) {
        case PARROT_BOUNDS_FLAG:
        case PARROT_PROFILE_FLAG:
            Interp_core_SET(interp, PARROT_SLOW_CORE);
            break;
        default:
            break;
    }
}

void
Parrot_set_debug(Interp *interp, UINTVAL flag)
{
    interp->debug_flags |= flag;
}

void
Parrot_set_trace(Interp *interp, UINTVAL flag)
{

    CONTEXT(interp->ctx)->trace_flags |= flag;
    Interp_core_SET(interp, PARROT_SLOW_CORE);
}

/*

=item C<void Parrot_clear_flag(Interp *, Parrot_Interp_flag flag)>

=item C<void Parrot_clear_debug(Interp *, UINTVAL flag)>

=item C<void Parrot_clear_trace(Interp *, UINTVAL flag)>

Clears a flag in the interpreter.

=cut

*/

void
Parrot_clear_flag(Parrot_Interp interp, Parrot_Interp_flag flag)
{
    Interp_flags_CLEAR(interp, flag);
}

void
Parrot_clear_debug(Interp *interp, UINTVAL flag)
{
    interp->debug_flags &= ~flag;
}

void
Parrot_clear_trace(Interp *interp, UINTVAL flag)
{
    CONTEXT(interp->ctx)->trace_flags &= ~flag;
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
Parrot_test_flag(Interp* interp, Parrot_Interp_flag flag)
{
    return Interp_flags_TEST(interp, flag);
}

UINTVAL
Parrot_test_debug(Interp *interp, UINTVAL flag)
{
    return interp->debug_flags & flag;
}

UINTVAL
Parrot_test_trace(Interp *interp, UINTVAL flag)
{
    return CONTEXT(interp->ctx)->trace_flags & flag;
}

/*

=item C<void
Parrot_set_run_core(Interp *interp, Parrot_Run_core_t core)>

Sets the specified run core.

=cut

*/

void
Parrot_set_run_core(Interp *interp, Parrot_Run_core_t core)
{
    Interp_core_SET(interp, core);
}

/*

=item C<void
Parrot_setwarnings(Interp *interp, Parrot_warnclass wc)>

Activates the given warnings.

=cut

*/

void
Parrot_setwarnings(Interp *interp, Parrot_warnclass wc)
{
    /* Activates the given warnings.  (Macro from warnings.h.) */
    PARROT_WARNINGS_on(interp, wc);
}

/*

=item C<struct PackFile *
Parrot_readbc(Interp *interp, const char *filename)>

Read in a bytecode, unpack it into a C<PackFile> structure, and do fixups.

=cut

*/

struct PackFile *
Parrot_readbc(Interp *interp, const char *fullname)
{
    INTVAL program_size, wanted;
    char *program_code;
    struct PackFile *pf;
    FILE * io = NULL;
    INTVAL is_mapped = 0;
#ifdef PARROT_HAS_HEADER_SYSMMAN
    int fd = -1;
#endif

    if (fullname == NULL || strcmp(fullname, "-") == 0) {
        /* read from STDIN */
        io = stdin;
        /* read 1k at a time */
        program_size = 0;
    }
    else {
        STRING *fs = string_make(interp, fullname,
                strlen(fullname), NULL, 0);
        if (!Parrot_stat_info_intval(interp, fs, STAT_EXISTS)) {
            PIO_eprintf(interp, "Parrot VM: Can't stat %s, code %i.\n",
                    fullname, errno);
            return NULL;
        }
        /*
         * TODO check for regular file
         */

        program_size = Parrot_stat_info_intval(interp, fs, STAT_FILESIZE);

#ifndef PARROT_HAS_HEADER_SYSMMAN
        io = fopen(fullname, "rb");
        if (!io) {
            PIO_eprintf(interp, "Parrot VM: Can't open %s, code %i.\n",
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
                PIO_eprintf(interp,
                            "Parrot VM: Could not reallocate buffer "
                            "while reading packfile from PIO.\n");
                return NULL;
            }

            cursor = (char *)program_code + program_size;
        }

        if (read_result < 0) {
            PIO_eprintf(interp,
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
            PIO_eprintf(interp, "Parrot VM: Can't open %s, code %i.\n",
                    fullname, errno);
            return NULL;
        }

        program_code =
            mmap(0, program_size, PROT_READ, MAP_SHARED, fd, (off_t)0);

        if (program_code == (void *)MAP_FAILED) {
            Parrot_warn(interp, PARROT_WARNINGS_IO_FLAG,
                    "Parrot VM: Can't mmap file %s, code %i.\n",
                    fullname, errno);
            /* try again, now with IO reading the file */
            io = fopen(fullname, "rb");
            if (!io) {
                PIO_eprintf(interp,
                        "Parrot VM: Can't open %s, code %i.\n",
                        fullname, errno);
                return NULL;
            }
            goto again;
        }
        is_mapped = 1;

#else   /* PARROT_HAS_HEADER_SYSMMAN */

        PIO_eprintf(interp, "Parrot VM: uncaught error occurred reading "
                    "file or mmap not available.\n");
        return NULL;

#endif  /* PARROT_HAS_HEADER_SYSMMAN */

    }

    /* Now that we have the bytecode, let's unpack it. */

    pf = PackFile_new(interp, is_mapped);

    if (!PackFile_unpack
        (interp, pf, (opcode_t *)program_code, program_size)) {
        PIO_eprintf(interp, "Parrot VM: Can't unpack packfile %s.\n",
                fullname);
        return NULL;
    }

    /*
     * Set :main routine
     */
    do_sub_pragmas(interp, pf->cur_cs, PBC_PBC, NULL);
    /*
     * JITting and/or prederefing the sub/the bytecode is done
     * in switch_to_cs before actual usage of the segment
     */

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
Parrot_loadbc(Interp *interp, struct PackFile *pf)>

Loads the C<PackFile> returned by C<Parrot_readbc()>.

=cut

*/

void
Parrot_loadbc(Interp *interp, struct PackFile *pf)
{
    if (pf == NULL) {
        PIO_eprintf(interp, "Invalid packfile\n" );
        return;
    }
    interp->initial_pf = pf;
    interp->code = pf->cur_cs;
}

/*

=item C<static PMC*
setup_argv(Interp *interp, int argc, char ** argv)>

Creates and returns C<ARGS> array PMC.

=cut

*/

static PMC*
setup_argv(Interp *interp, int argc, char ** argv)
{
    INTVAL i;
    PMC *userargv;

    if (Interp_debug_TEST(interp, PARROT_START_DEBUG_FLAG)) {
        PIO_eprintf(interp,
                "*** Parrot VM: Setting up ARGV array."
                " Current argc: %d ***\n",
                argc);
    }

    userargv = pmc_new_noinit(interp, enum_class_ResizableStringArray);
    /* immediately anchor pmc to root set */
    VTABLE_set_pmc_keyed_int(interp, interp->iglobals,
            (INTVAL)IGLOBALS_ARGV_LIST, userargv);
    VTABLE_init(interp, userargv);

    for (i = 0; i < argc; i++) {
        /* Run through argv, adding everything to @ARGS. */
        STRING *arg = string_make(interp, argv[i], strlen(argv[i]),
                NULL, PObj_external_FLAG);

        if (Interp_debug_TEST(interp, PARROT_START_DEBUG_FLAG)) {
            PIO_eprintf(interp, "\t%vd: %s\n", i, argv[i]);
        }

        VTABLE_push_string(interp, userargv, arg);
    }
    return userargv;
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
op_name(Parrot_Interp interp, int k)>

Returns the name of the opcode.

=cut

*/

static const char *
op_name(Parrot_Interp interp, int k)
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
    return interp->op_info_table[k - PARROT_PROF_EXTRA].full_name;
}

/*

=item C<static FLOATVAL
calibrate(Parrot_Interp interp)>

With this calibration, reported times of C<parrot -p> almost match those
measured with time C<parrot -b>.

=cut

*/

static FLOATVAL
calibrate(Parrot_Interp interp)
{
    size_t n = interp->op_count;
    size_t i;
    FLOATVAL start, empty;
    opcode_t code[] = { 1 };      /* noop */
    opcode_t *pc = code;

    if (n < 1000000)    /* minimum opcode count for calibration */
        n = 1000000;
    start = Parrot_floatval_time();
    for (empty = 0.0, i = 0; i < n; i++)
       pc =  (interp->op_func_table[*code])(pc, interp);
    empty += Parrot_floatval_time() - start;
    return empty / (FLOATVAL)n;
}

/*

=item C<static void print_profile(Interp*, int status, void *p)>

Prints out a profile listing.

=cut

*/

static void
print_profile(Interp *interp, int status, void *p)
{
    if (interp->profile != NULL) {
        UINTVAL j;
        int k;
        int jit;
        UINTVAL op_count = 0;
        UINTVAL call_count = 0;
        FLOATVAL sum_time = 0.0;
        RunProfile *profile = interp->profile;
        FLOATVAL empty = calibrate(interp);

        PIO_printf(interp,
                   " Code J Name                         "
                   "Calls  Total/s       Avg/ms\n");
        for (j = 0; j < interp->op_count + PARROT_PROF_EXTRA; j++) {
            UINTVAL n = profile->data[j].numcalls;
            profile->data[j].op = j;
            if (j >= PARROT_PROF_EXTRA) {
                profile->data[j].time -= empty * n;
                if (profile->data[j].time < 0.0) /* faster than noop */
                    profile->data[j].time = 0.0;
            }
        }
        qsort(profile->data, interp->op_count +
                PARROT_PROF_EXTRA,
                sizeof(ProfData), prof_sort_f);
        for (j = 0; j < interp->op_count + PARROT_PROF_EXTRA; j++) {
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
                PIO_printf(interp, " %4d %c %-25s %8vu  %10vf  %10.6vf\n",
                        k - PARROT_PROF_EXTRA,
                        jit,
                        op_name(interp, k),
                        n,
                        t,
                        (FLOATVAL)(t * 1000.0 / (FLOATVAL)n)
                        );
            }
        }

        PIO_printf(interp, " %4vu - %-25s %8vu  %10vf  %10.6vf\n",
                op_count,
                "-",
                call_count,
                sum_time,
                (FLOATVAL)(sum_time * 1000.0 / (FLOATVAL)call_count)
                );
    }
}

/*

=item C<static void print_debug(Interp*, int status, void *p)>

Prints GC info.

=cut

*/

static void
print_debug(Interp *interp, int status, void *p)
{
    if (Interp_debug_TEST(interp, PARROT_MEM_STAT_DEBUG_FLAG)) {
        /* Give the souls brave enough to activate debugging an earful
         * about GC. */

        PIO_eprintf(interp, "*** Parrot VM: Dumping GC info ***\n");
        PDB_info(interp);
    }
}

static PMC*
set_current_sub(Interp *interp)
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

    cur_cs = interp->code;
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
                offs = sub->start_offs;
                if (offs == interp->resume_offset) {
                    CONTEXT(interp->ctx)->current_sub = sub_pmc;
                    CONTEXT(interp->ctx)->current_HLL = sub->HLL_id;
                    return sub_pmc;
                }
                break;
        }
    }
    /*
     * if we didn't find anything put a dummy PMC into current_sub
     */
    sub_pmc = pmc_new(interp, enum_class_Sub);
    PMC_sub(sub_pmc)->start_offs = 0;
    CONTEXT(interp->ctx)->current_sub = sub_pmc;
    return sub_pmc;
}

/*

=item C<void
Parrot_runcode(Interp *interp, int argc, char *argv[])>

Sets up C<ARGV> and runs the ops.

=cut

*/

void
Parrot_runcode(Interp *interp, int argc, char *argv[])
{
    PMC *userargv, *main_sub;

        if (Interp_debug_TEST(interp, PARROT_START_DEBUG_FLAG)) {
            PIO_eprintf(interp,
                    "*** Parrot VM: Setting stack top. ***\n");
        }
    /* Debugging mode nonsense. */
    if (Interp_debug_TEST(interp, PARROT_START_DEBUG_FLAG)) {
        if (Interp_flags_TEST(interp, PARROT_BOUNDS_FLAG)) {
            PIO_eprintf(interp,
                    "*** Parrot VM: Bounds checking enabled. ***\n");
        }
        if (Interp_trace_TEST(interp, PARROT_TRACE_OPS_FLAG)) {
            PIO_eprintf(interp, "*** Parrot VM: Tracing enabled. ***\n");
        }
        PIO_eprintf(interp, "*** Parrot VM: ");
        switch (interp->run_core) {
            case PARROT_SLOW_CORE:
                PIO_eprintf(interp, "Slow core");
                break;
            case PARROT_FAST_CORE:
                PIO_eprintf(interp, "Fast core");
                break;
            case PARROT_SWITCH_CORE:
            case PARROT_SWITCH_JIT_CORE:
                PIO_eprintf(interp, "Switch core");
                break;
            case PARROT_CGP_CORE:
            case PARROT_CGP_JIT_CORE:
                PIO_eprintf(interp, "CGP core");
                break;
            case PARROT_CGOTO_CORE:
                PIO_eprintf(interp, "CGoto core");
                break;
            case PARROT_JIT_CORE:
                PIO_eprintf(interp, "JIT core");
                break;
            case PARROT_EXEC_CORE:
                PIO_eprintf(interp, "EXEC core");
                break;
        }
        PIO_eprintf(interp, " ***\n");
    }

    /* Set up @ARGS (or whatever this language calls it) in userargv. */
    userargv = setup_argv(interp, argc, argv);

#if EXEC_CAPABLE

    /* s. runops_exec interpreter.c */
    if (Interp_core_TEST(interp, PARROT_EXEC_CORE)) {
        extern int Parrot_exec_run;
        Parrot_exec_run = 1;
    }

#endif

    /*
     * If any profile information was gathered, print it out
     * before exiting, then print debug infos if turned on.
     */
    Parrot_on_exit(interp, print_debug,   NULL);
    Parrot_on_exit(interp, print_profile, NULL);

    /* Let's kick the tires and light the fires--call interpreter.c:runops. */
    main_sub = CONTEXT(interp->ctx)->current_sub;
    /*
     * if no sub was marked being :main, we create a dummy sub with offset 0
     */
    if (!main_sub) {
        main_sub = set_current_sub(interp);
    }
    CONTEXT(interp->ctx)->current_sub = NULL;
    CONTEXT(interp->ctx)->constants =
        interp->code->const_table->constants;
    Parrot_runops_fromc_args(interp, main_sub, "vP", userargv);
}


/*

=item C<void
Parrot_debug(Interp *interp, int argc, char **argv)>

Runs the interpreter's bytecode in debugging mode.

=cut

*/

opcode_t *
Parrot_debug(Interp *debugger, opcode_t * pc)
{
    PDB_t *pdb;
    const char *command;
    Interp *interp;

    pdb = debugger->pdb;

    pdb->cur_opcode = pc;

    PDB_init(debugger, NULL);
    /* disassemble needs this for now */
    interp = pdb->debugee;
    interp->pdb = pdb;
    debugger->lo_var_ptr = interp->lo_var_ptr;

    PDB_disassemble(interp, NULL);

    while (!(pdb->state & PDB_EXIT)) {
        PDB_get_command(debugger);
        command = pdb->cur_command;
        PDB_run_command(debugger, command);
    }
    return NULL;
}

/*

=item C<void
Parrot_disassemble(Interp *interp)>

Disassembles and prints out the interpreter's bytecode.

This is used by the Parrot disassembler.

=cut

*/

void
Parrot_disassemble(Interp *interp)
{
    PDB_t *pdb;
    PDB_line_t *line;
    char *c;

    pdb = (PDB_t *)mem_sys_allocate_zeroed(sizeof(PDB_t));

    interp->pdb = pdb;
    pdb->cur_opcode = interp->code->base.data;

    PDB_disassemble(interp, NULL);
    line = pdb->file->line;

    while (line->next) {
        /* If it has a label print it */
        if (line->label)
            PIO_printf(interp, "L%li:\t", line->label->number);
        c = pdb->file->source + line->source_offset;
        while (*c != '\n' && c)
            PIO_printf(interp, "%c", *(c++));
        PIO_printf(interp, "\n");
        line = line->next;
    }
    return;
}

/*

=item C<void
Parrot_run_native(Parrot_Interp interp, native_func_t func)>

Run the C function C<func> through the program C<[enternative, end]>.
This ensures that the function is run with the same setup as in other
run loops.

This function is used in some of the source tests in F<t/src> which use
the interpreter outside a runloop.

=cut

*/

void
Parrot_run_native(Parrot_Interp interp, native_func_t func)
{
    static opcode_t program_code[2];
    struct PackFile *          pf;

    program_code[0] = interp->op_lib->op_code("enternative", 0);
    program_code[1] = 0; /* end */
    pf = PackFile_new(interp, 0);
    pf->cur_cs = (struct PackFile_ByteCode *)
        (pf->PackFuncs[PF_BYTEC_SEG].new_seg)(interp, pf, "code", 1);
    pf->cur_cs->base.data = program_code;
    pf->cur_cs->base.size = 2;
    Parrot_loadbc(interp, pf);
    run_native = func;
    if (interp->code && interp->code->const_table) {
        CONTEXT(interp->ctx)->constants =
            interp->code->const_table->constants;
    }
    runops(interp, interp->resume_offset);
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
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
