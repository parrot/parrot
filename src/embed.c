/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/embed.c - The Parrot embedding interface

=head1 DESCRIPTION

This file implements the Parrot embedding interface.

=head2 Functions

*/

#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/oplib/ops.h"

/* HEADERIZER HFILE: include/parrot/embed.h */

/* HEADERIZER BEGIN: static */

static FLOATVAL calibrate( PARROT_INTERP )
        __attribute__nonnull__(1);

static const char * op_name( PARROT_INTERP, int k )
        __attribute__nonnull__(1);

static void print_debug( PARROT_INTERP, int status, void *p )
        __attribute__nonnull__(1);

static void print_profile( PARROT_INTERP, int status, void *p )
        __attribute__nonnull__(1);

static int prof_sort_f( NOTNULL(const void *a), NOTNULL(const void *b) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static PMC* set_current_sub( PARROT_INTERP )
        __attribute__nonnull__(1);

static PMC* setup_argv( PARROT_INTERP, int argc, char ** argv )
        __attribute__nonnull__(1);

/* HEADERIZER END: static */

/*

FUNCDOC: Parrot_new

Returns a new Parrot interpreter.

The first created interpreter (C<parent> is C<NULL>) is the last one
to get destroyed.

*/

#ifdef JIT_CAPABLE
#  if EXEC_CAPABLE
#    include "parrot/exec.h"
#  endif /* EXEC_CAPABLE */
#  include "jit.h"
#endif

PARROT_API
Parrot_Interp
Parrot_new(Parrot_Interp parent)
{
    /* inter_create.c:make_interpreter builds a new Parrot_Interp. */
    return make_interpreter(parent, PARROT_NO_FLAGS);
}

extern void Parrot_initialize_core_pmcs(PARROT_INTERP);

/*

FUNCDOC: Parrot_init

Initializes the new interpreter. This function only has effect the first
time it is called. Therefore Parrot_init() doesn't have to be called
on an interpreter returned from Parrot_new().

Use this function when you intend to enter the run loop,
which automatically sets the top of stack pointer.

FUNCDOC: Parrot_init_stacktop

Like above. Additionally sets the stack top, so that Parrot objects created
in inner stack frames will be visible during DODs stack walking code.
B<stack_top> should be the address of an automatic variable in the caller's
stack frame. All unanchored Parrot objects (PMCs) must live in inner stack
frames so that they are not destroyed during DOD runs.

Use this function when you call into Parrot before entering a run loop.

*/

/* XXX Parrot_init() should be removed, no longer required for embedders */
PARROT_API
void
Parrot_init(PARROT_INTERP)
{
    if (!interp->world_inited) {
        /* global_setup.c:init_world sets up some vtable stuff.
         * It must only be called once.
         */

        interp->world_inited = 1;
        init_world(interp);
    }
}

PARROT_API
void
Parrot_init_stacktop(PARROT_INTERP, void *stack_top)
{
    interp->lo_var_ptr = stack_top;
    Parrot_init(interp);
}

/*

FUNCDOC: Parrot_set_flag

Sets a flag in the interpreter specified by C<flag>, any of
C<PARROT_BOUNDS_FLAG>, or C<PARROT_PROFILE_FLAG> to enable profiling, and
bounds checking respectively or C<PARROT_THR_TYPE_1>, C<PARROT_THR_TYPE_2>, or
C<PARROT_THR_TYPE_3> to disable thread communication and variable sharing,
disable variable sharing but enable thread communication, or to enable variable
sharing.

FUNCDOC: Parrot_set_debug

Set a debug flag: C<PARROT_DEBUG_FLAG>.

FUNCDOC: Parrot_set_trace

Set a trace flag: C<PARROT_TRACE_FLAG>

*/

PARROT_API
void
Parrot_set_flag(PARROT_INTERP, INTVAL flag)
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

PARROT_API
void
Parrot_set_debug(PARROT_INTERP, UINTVAL flag)
{
    interp->debug_flags |= flag;
}

PARROT_API
void
Parrot_set_trace(PARROT_INTERP, UINTVAL flag)
{
    CONTEXT(interp->ctx)->trace_flags |= flag;
    Interp_core_SET(interp, PARROT_SLOW_CORE);
}

/*

FUNCDOC: Parrot_clear_flag

Clears a flag in the interpreter.

FUNCDOC: Parrot_clear_debug

Clears a flag in the interpreter.

FUNCDOC: Parrot_clear_trace

Clears a flag in the interpreter.

*/

PARROT_API
void
Parrot_clear_flag(PARROT_INTERP, INTVAL flag)
{
    Interp_flags_CLEAR(interp, flag);
}

PARROT_API
void
Parrot_clear_debug(PARROT_INTERP, UINTVAL flag)
{
    interp->debug_flags &= ~flag;
}

PARROT_API
void
Parrot_clear_trace(PARROT_INTERP, UINTVAL flag)
{
    CONTEXT(interp->ctx)->trace_flags &= ~flag;
}

/*

FUNCDOC: Parrot_test_flag

Test the interpreter flags specified in C<flag>.

FUNCDOC: Parrot_test_debug

Test the interpreter flags specified in C<flag>.

FUNCDOC: Parrot_test_trace

Test the interpreter flags specified in C<flag>.

*/

PARROT_API
Parrot_Int
Parrot_test_flag(PARROT_INTERP, INTVAL flag)
{
    return Interp_flags_TEST(interp, flag);
}

PARROT_API
UINTVAL
Parrot_test_debug(PARROT_INTERP, UINTVAL flag)
{
    return interp->debug_flags & flag;
}

PARROT_API
UINTVAL
Parrot_test_trace(PARROT_INTERP, UINTVAL flag)
{
    return CONTEXT(interp->ctx)->trace_flags & flag;
}

/*

FUNCDOC: Parrot_set_run_core

Sets the specified run core.

*/

PARROT_API
void
Parrot_set_run_core(PARROT_INTERP, Parrot_Run_core_t core)
{
    Interp_core_SET(interp, core);
}

/*

FUNCDOC: Parrot_setwarnings

Activates the given warnings.

*/

PARROT_API
void
Parrot_setwarnings(PARROT_INTERP, Parrot_warnclass wc)
{
    /* Activates the given warnings.  (Macro from warnings.h.) */
    PARROT_WARNINGS_on(interp, wc);
}

/*

FUNCDOC: Parrot_readbc

Read in a bytecode, unpack it into a C<PackFile> structure, and do fixups.

*/

PARROT_API
PackFile *
Parrot_readbc(PARROT_INTERP, NULLOK(const char *fullname))
{
    INTVAL program_size, wanted;
    char *program_code;
    PackFile *pf;
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
        STRING * const fs = string_make(interp, fullname,
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
                (char *)mem_sys_realloc(program_code, program_size + chunk_size);

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
            (char *)mmap(0, program_size, PROT_READ, MAP_SHARED, fd, (off_t)0);

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

    if (!PackFile_unpack(interp, pf, (opcode_t *)program_code, program_size)) {
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

FUNCDOC: Parrot_loadbc

Loads the C<PackFile> returned by C<Parrot_readbc()>.

*/

PARROT_API
void
Parrot_loadbc(PARROT_INTERP, NOTNULL(PackFile *pf))
{
    if (pf == NULL) {
        PIO_eprintf(interp, "Invalid packfile\n");
        return;
    }
    interp->initial_pf = pf;
    interp->code = pf->cur_cs;
}

/*

FUNCDOC: setup_argv

Creates and returns C<ARGS> array PMC.

*/

static PMC*
setup_argv(PARROT_INTERP, int argc, char ** argv)
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

FUNCDOC: prof_sort_f

Sort function for profile data. Sorts by time.

*/

static int
prof_sort_f(NOTNULL(const void *a), NOTNULL(const void *b))
{
    const FLOATVAL timea = ((const ProfData *)a)->time;
    const FLOATVAL timeb = ((const ProfData *)b)->time;

    if (timea < timeb)
        return 1;
    if (timea > timeb)
        return -1;
    return 0;
}

/*

FUNCDOC: op_name

Returns the name of the opcode.

*/

static const char *
op_name(PARROT_INTERP, int k)
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

FUNCDOC: calibrate

With this calibration, reported times of C<parrot -p> almost match those
measured with time C<parrot -b>.

*/

static FLOATVAL
calibrate(PARROT_INTERP)
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

FUNCDOC: print_profile

Prints out a profile listing.

*/

static void
print_profile(PARROT_INTERP, SHIM(int status), SHIM(void *p))
{
    RunProfile * const profile = interp->profile;

    if (profile) {
        UINTVAL j;
        int k;
        int jit;
        UINTVAL op_count = 0;
        UINTVAL call_count = 0;
        FLOATVAL sum_time = 0.0;
        const FLOATVAL empty = calibrate(interp);

        PIO_printf(interp,
                   " Code J Name                         "
                   "Calls  Total/s       Avg/ms\n");
        for (j = 0; j < interp->op_count + PARROT_PROF_EXTRA; j++) {
            const UINTVAL n = profile->data[j].numcalls;
            profile->data[j].op = j;
            if (j >= PARROT_PROF_EXTRA) {
                profile->data[j].time -= empty * n;
                if (profile->data[j].time < 0.0) /* faster than noop */
                    profile->data[j].time = 0.0;
            }
        }
        qsort(profile->data, interp->op_count +
                PARROT_PROF_EXTRA,
                sizeof (ProfData), prof_sort_f);
        for (j = 0; j < interp->op_count + PARROT_PROF_EXTRA; j++) {
            const UINTVAL n = profile->data[j].numcalls;

            if (n > 0) {
                const FLOATVAL t = profile->data[j].time;

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
                        (FLOATVAL)(t * 1000.0 / (FLOATVAL)n));
            }
        }

        PIO_printf(interp, " %4vu - %-25s %8vu  %10vf  %10.6vf\n",
                op_count,
                "-",
                call_count,
                sum_time,
                (FLOATVAL)(sum_time * 1000.0 / (FLOATVAL)call_count));
    }
}

/*

FUNCDOC: print_debug

Prints GC info.

*/

static void
print_debug(PARROT_INTERP, SHIM(int status), SHIM(void *p))
{
    if (Interp_debug_TEST(interp, PARROT_MEM_STAT_DEBUG_FLAG)) {
        /* Give the souls brave enough to activate debugging an earful
         * about GC. */

        PIO_eprintf(interp, "*** Parrot VM: Dumping GC info ***\n");
        PDB_info(interp);
    }
}

static PMC*
set_current_sub(PARROT_INTERP)
{
    opcode_t i, ci;
    Parrot_sub *sub;
    PMC *sub_pmc;
    size_t offs;

    PackFile_ByteCode * const cur_cs = interp->code;
    PackFile_FixupTable * const ft = cur_cs->fixups;
    PackFile_ConstTable * const ct = cur_cs->const_table;

    /*
     * Walk the fixup table.  The first Sub-like entry should be our
     * entry point with the address at our resume_offset.
     */

    for (i = 0; i < ft->fixup_count; i++) {
        switch (ft->fixups[i]->type) {
            case enum_fixup_sub:
                ci = ft->fixups[i]->offset;
                sub_pmc = ct->constants[ci]->u.key;
                sub = PMC_sub(sub_pmc);
                if (sub->seg != cur_cs)
                    continue;
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

FUNCDOC: Parrot_runcode

Sets up C<ARGV> and runs the ops.

*/

PARROT_API
void
Parrot_runcode(PARROT_INTERP, int argc, char *argv[])
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

FUNCDOC: Parrot_debug

Runs the interpreter's bytecode in debugging mode.

*/

PARROT_API
opcode_t *
Parrot_debug(NOTNULL(Parrot_Interp debugger), opcode_t * pc)
{
    const char *command;
    Interp *interp;

    PDB_t * const pdb = debugger->pdb;

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

FUNCDOC: Parrot_disassemble

Disassembles and prints out the interpreter's bytecode.

This is used by the Parrot disassembler.

*/

PARROT_API
void
Parrot_disassemble(PARROT_INTERP)
{
    PDB_t      *pdb             = mem_allocate_zeroed_typed(PDB_t);
    PDB_line_t *line;
    int         debugs;
    int         num_mappings    = 0;
    int         curr_mapping    = 0;
    int         op_code_seq_num = 0;

    interp->pdb     = pdb;
    pdb->cur_opcode = interp->code->base.data;

    PDB_disassemble(interp, NULL);

    line   = pdb->file->line;
    debugs = (interp->code->debugs != NULL);

    PIO_printf(interp, "%12s-%12s", "Seq_Op_Num", "Relative-PC");

    if ( debugs ) {
        PIO_printf(interp, " %6s:\n","SrcLn#");
        num_mappings = interp->code->debugs->num_mappings;
    }
    else {
        PIO_printf(interp, "\n");
    }

    while (line->next) {
        const char *c;

        /* PIO_printf(interp, "%i < %i %i == %i \n", curr_mapping,
         * num_mappings, op_code_seq_num,
         * interp->code->debugs->mappings[curr_mapping]->offset); */

        if (debugs && curr_mapping < num_mappings) {
            if ( op_code_seq_num == interp->code->debugs->mappings[curr_mapping]->offset) {
                const int filename_const_offset = interp->code->debugs->mappings[curr_mapping]->u.filename;
                PIO_printf(interp, "Current Source Filename %Ss\n", interp->code->const_table->constants[filename_const_offset]->u.string);
                curr_mapping++;
            }
        }

        PIO_printf(interp, "%012i-%012i", op_code_seq_num, line->opcode - interp->code->base.data);

        if ( debugs )
            PIO_printf(interp, " %06i: ",interp->code->debugs->base.data[op_code_seq_num]);

        /* If it has a label print it */
        if (line->label)
            PIO_printf(interp, "L%li:\t", line->label->number);
        else
            PIO_printf(interp, "\t");

        c = pdb->file->source + line->source_offset;

        while (c && *c != '\n')
            PIO_printf(interp, "%c", *(c++));

        PIO_printf(interp, "\n");
        line = line->next;
        op_code_seq_num++;
    }

    return;
}

/*

FUNCDOC: Parrot_run_native

Run the C function C<func> through the program C<[enternative, end]>.
This ensures that the function is run with the same setup as in other
run loops.

This function is used in some of the source tests in F<t/src> which use
the interpreter outside a runloop.

*/

PARROT_API
void
Parrot_run_native(PARROT_INTERP, native_func_t func)
{
    static opcode_t program_code[2];
    PackFile *          pf;

    program_code[0] = interp->op_lib->op_code("enternative", 0);
    program_code[1] = 0; /* end */
    pf = PackFile_new(interp, 0);
    pf->cur_cs = (PackFile_ByteCode *)
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

=head1 SEE ALSO

F<include/parrot/embed.h> and F<docs/embed.pod>.

=head1 HISTORY

Initial version by Brent Dax on 2002.1.28.

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
