/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/interpreter.c - Parrot Interpreter

=head1 DESCRIPTION

The interpreter API handles running the operations.

The predereferenced code chunk is pre-initialized with the opcode
function pointers, addresses, or opnumbers of the C<prederef__>
opcode. This opcode then calls the C<do_prederef()> function, which then
fills in the real function, address or op number.

Since the C<prederef__> opcode returns the same C<pc_prederef> it was
passed, the runops loop will re-execute the same location, which will
then have the pointer to the real C<prederef> opfunc and C<prederef>
args.

Pointer arithmetic is used to determine the index into the bytecode
corresponding to the currect opcode. The bytecode and prederef arrays
have the same number of elements since there is a one-to-one mapping.

=head2 Functions

=over 4

=cut

*/

#include <assert.h>
#include "parrot/parrot.h"
#include "parrot/interp_guts.h"
#include "parrot/oplib/core_ops.h"
#include "parrot/oplib/core_ops_prederef.h"
#include "parrot/oplib/core_ops_switch.h"
#include "parrot/runops_cores.h"
#if JIT_CAPABLE
#  include "parrot/exec.h"
#  include "parrot/jit.h"
#endif
#ifdef HAVE_COMPUTED_GOTO
#  include "parrot/oplib/core_ops_cg.h"
#  include "parrot/oplib/core_ops_cgp.h"
#endif
#include "parrot/method_util.h"
#include "parrot/dynext.h"

#include "interpreter.str"

#define ATEXIT_DESTROY

#if EXEC_CAPABLE
struct Parrot_Interp interpre;
#endif

static void setup_default_compreg(Parrot_Interp interpreter);
static void setup_event_func_ptrs(Parrot_Interp interpreter);

/*

=item C<static void
prederef_args(void **pc_prederef, Interp *interpreter,
        opcode_t *pc, op_info_t *opinfo)>

Called from C<do_prederef()> to deal with any arguments.

C<pc_prederef> is the current opcode.

=cut

*/

static void
prederef_args(void **pc_prederef, Interp *interpreter,
        opcode_t *pc, op_info_t *opinfo)
{
    struct PackFile_ConstTable * const_table
        = interpreter->code->const_table;
    int i;

    for (i = 1; i < opinfo->arg_count; i++) {
        opcode_t arg = pc[i];

        switch (opinfo->types[i]) {

        case PARROT_ARG_KI:
        case PARROT_ARG_I:
            if (arg < 0 || arg >= NUM_REGISTERS)
                internal_exception(INTERP_ERROR, "Illegal register number");
            pc_prederef[i] = (void *)&interpreter->int_reg.registers[arg];
            break;

        case PARROT_ARG_N:
            if (arg < 0 || arg >= NUM_REGISTERS)
                internal_exception(INTERP_ERROR, "Illegal register number");
            pc_prederef[i] = (void *)&interpreter->num_reg.registers[arg];
            break;

        case PARROT_ARG_K:
        case PARROT_ARG_P:
            if (arg < 0 || arg >= NUM_REGISTERS)
                internal_exception(INTERP_ERROR, "Illegal register number");
            pc_prederef[i] = (void *)&interpreter->pmc_reg.registers[arg];
            break;

        case PARROT_ARG_S:
            if (arg < 0 || arg >= NUM_REGISTERS)
                internal_exception(INTERP_ERROR, "Illegal register number");
            pc_prederef[i] = (void *)&interpreter->string_reg.registers[arg];
            break;

        case PARROT_ARG_KIC:
        case PARROT_ARG_IC:
            pc_prederef[i] = (void *)&pc[i];
            break;

        case PARROT_ARG_NC:
            if (arg < 0 || arg >= const_table->const_count)
                internal_exception(INTERP_ERROR, "Illegal constant number");
            pc_prederef[i] = (void *) &const_table->constants[arg]->u.number;
            break;

        case PARROT_ARG_PC:
            if (arg < 0 || arg >= const_table->const_count)
                internal_exception(INTERP_ERROR, "Illegal constant number");
/*        pc_prederef[i] = (void *)
                 &const_table->constants[arg]->pmc; */
            internal_exception(ARG_OP_NOT_HANDLED,
                               "PMC constants not yet supported!\n");
            break;

        case PARROT_ARG_SC:
            if (arg < 0 || arg >= const_table->const_count)
                internal_exception(INTERP_ERROR, "Illegal constant number");
            pc_prederef[i] = (void *)
                &const_table->constants[arg]->u.string;
            break;

        case PARROT_ARG_KC:
            if (arg < 0 || arg >= const_table->const_count)
                internal_exception(INTERP_ERROR, "Illegal constant number");
            pc_prederef[i] = (void *)
                &const_table->constants[arg]->u.key;
            break;
        default:
            internal_exception(ARG_OP_NOT_HANDLED,
                               "Unhandled argtype %d\n",opinfo->types[i]);
            break;
        }

        if (pc_prederef[i] == 0) {
            internal_exception(INTERP_ERROR,
                    "Prederef generated a NULL pointer for arg of type %d!\n",
                    opinfo->types[i]);
        }
    }
}

/*

=item C<void
do_prederef(void **pc_prederef, Parrot_Interp interpreter, int type)>

This is called from within the run cores to predereference the current
opcode.

C<pc_prederef> is the current opcode, and C<type> is the run core type.

=cut

*/

void
do_prederef(void **pc_prederef, Parrot_Interp interpreter, int type)
{
    size_t offset = pc_prederef - interpreter->prederef.code;
    opcode_t *pc = ((opcode_t *)interpreter->code->byte_code) + offset;
    op_func_t *prederef_op_func = interpreter->op_lib->op_func_table;
    op_info_t *opinfo;
    size_t n;

    if (*pc < 0 || *pc >= (opcode_t)interpreter->op_count)
        internal_exception(INTERP_ERROR, "Illegal opcode");
    opinfo = &interpreter->op_info_table[*pc];
    switch (type) {
        case PARROT_SWITCH_CORE:
            *pc_prederef = (void**) *pc;
            break;
        case PARROT_PREDEREF_CORE:
        case PARROT_CGP_CORE:
            *pc_prederef = ((void**)(prederef_op_func)) [*pc];
            break;
        default:
            internal_exception(1, "Tried to prederef wrong core");
            break;
    }
    /* and arguments */
    prederef_args(pc_prederef, interpreter, pc, opinfo);
    /*
     * now remember backward branches, invoke and similar opcodes
     */
    n = opinfo->arg_count;
    if (((opinfo->jump & PARROT_JUMP_RELATIVE) &&
            opinfo->types[n - 1] == PARROT_ARG_IC &&
            pc[n - 1] < 0) ||   /* relative backward branch */
            (opinfo->jump & PARROT_JUMP_ADDRESS)) {
        Prederef *pi = &interpreter->prederef;
        /*
         * first time prederef.branches == NULL:
         * estimate size to 1/16th of opcodes
         */
        if (!pi->branches) {
            size_t nb = interpreter->code->cur_cs->base.size / 16;
            if (nb < 8)
                nb = 8;
            pi->branches = mem_sys_allocate( sizeof(Prederef_branch) * nb);
            pi->n_allocated = nb;
            pi->n_branches = 0;
        }
        else if (pi->n_branches >= pi->n_allocated) {
            pi->n_allocated = (UINTVAL) pi->n_allocated * 1.5;
            pi->branches = mem_sys_realloc( pi->branches,
                    sizeof(Prederef_branch) * pi->n_allocated);
        }
        pi->branches[pi->n_branches].offs = offset;
        pi->branches[pi->n_branches].op = *pc_prederef;
        ++pi->n_branches;
    }
}

/*

=item C<static void
turn_ev_check(Parrot_Interp interpreter, int on)>

Turn on or off event checking for prederefed cores.

Fills in the C<event_checker> opcode, or restores original op in all
branch locations of the opcode stream.

Note that when C<on> is true, this is being called from the event
handler thread.

=cut

*/

static void
turn_ev_check(Parrot_Interp interpreter, int on)
{
    Prederef *pi = &interpreter->prederef;
    size_t i, offs;

    if (!pi->branches)
        return;
    for (i = 0; i < pi->n_branches; ++i) {
        offs = pi->branches[i].offs;
        if (on) {
            interpreter->prederef.code[offs] =
                ((void **)interpreter->op_lib->op_func_table)
                            [CORE_OPS_check_events__];
        }
        else
            interpreter->prederef.code[offs] = pi->branches[i].op;
    }
}

/*

=item C<static oplib_init_f
get_op_lib_init(int core_op, int which, PMC *lib)>

Returns an opcode's library C<op_lib> init function.

C<core_op> indicates whether the opcode represents a core Parrot operation.

C<which> is the run core type.

For dynamic oplibs C<core_op> will be 0 and C<lib> will be a
C<ParrotLibrary> PMC.

=cut

*/

static oplib_init_f
get_op_lib_init(int core_op, int which, PMC *lib)
{
    oplib_init_f init_func = (oplib_init_f)NULL;
    if (core_op) {
        switch (which) {
            case PARROT_SWITCH_CORE:
                init_func = PARROT_CORE_SWITCH_OPLIB_INIT;
                break;
            case PARROT_PREDEREF_CORE:
                init_func = PARROT_CORE_PREDEREF_OPLIB_INIT;
                break;
#ifdef HAVE_COMPUTED_GOTO
            case PARROT_CGP_CORE:
                init_func = PARROT_CORE_CGP_OPLIB_INIT;
                break;
            case PARROT_CGOTO_CORE:
                init_func = PARROT_CORE_CG_OPLIB_INIT;
                break;
#endif
            case PARROT_EXEC_CORE:      /* normal func core */
            case PARROT_JIT_CORE:      /* normal func core */
            case PARROT_SLOW_CORE:      /* normal func core */
            case PARROT_FAST_CORE:      /* normal func core */
                init_func = PARROT_CORE_OPLIB_INIT;
                break;
        }
        if (!init_func)
            internal_exception(1, "Couldn't find init_func for core %d", which);
        return init_func;
    }
    return (oplib_init_f) D2FPTR(PMC_struct_val(lib));
}

/*

=item C<static void
load_prederef(Interp *interpreter, int which)>

C<< interpreter->op_lib >> = prederefed oplib.

=cut

*/

static void
load_prederef(Interp *interpreter, int which)
{
    oplib_init_f init_func = get_op_lib_init(1, which, NULL);
    int (*get_op)(const char * name, int full);

    get_op = interpreter->op_lib->op_code;
    interpreter->op_lib = init_func(1);
    /* preserve the get_op function */
    interpreter->op_lib->op_code = get_op;
    if (interpreter->op_lib->op_count != interpreter->op_count)
        internal_exception(PREDEREF_LOAD_ERROR,
                "Illegal op count (%d) in prederef oplib\n",
                (int)interpreter->op_lib->op_count);
}

/*

=item C<static void
init_prederef(Interp *interpreter, int which)>

Initialize: load prederef C<func_table>, file prederef.code.

=cut

*/

static void
init_prederef(Interp *interpreter, int which)
{
    load_prederef(interpreter, which);
    if (!interpreter->prederef.code) {
        size_t N = interpreter->code->cur_cs->base.size;
        size_t i;
        void *pred_func;
/* Parrot_memalign_if_possible in OpenBSD allocates 256 if you ask for 312 */
#if 1
        void **temp = (void **)mem_sys_allocate_zeroed(N * sizeof(void *));
#else
        void **temp = (void **)Parrot_memalign_if_possible(256,
                N * sizeof(void *));
#endif

        /* fill with the prederef__ opcode function */
        if (which == PARROT_SWITCH_CORE)
            pred_func = (void*) CORE_OPS_prederef__;
        else
            pred_func = ((void **)
                    interpreter->op_lib->op_func_table)[CORE_OPS_prederef__];
        for (i = 0; i < N; i++) {
            temp[i] = pred_func;
        }

        interpreter->prederef.code = temp;
        interpreter->code->cur_cs->prederef.code = temp;

    }
}

/*

=item C<static void
stop_prederef(Interp *interpreter)>

Restore the interpreter's op function tables to their initial state.

=cut

*/

static void
stop_prederef(Interp *interpreter)
{
    if (interpreter->resume_flag & RESUME_RESTART) {
        interpreter->op_func_table = PARROT_CORE_OPLIB_INIT(1)->op_func_table;
        if (interpreter->evc_func_table) {
            mem_sys_free(interpreter->evc_func_table);
            interpreter->evc_func_table = NULL;
        }
        setup_event_func_ptrs(interpreter);
    }
}

#if EXEC_CAPABLE

/*

=item C<void
exec_init_prederef(Interp *interpreter, void *prederef_arena)>

C<< interpreter->op_lib >> = prederefed oplib

The "normal" C<op_lib> has a copy in the interpreter structure - but get
the C<op_code> lookup function from standard core prederef has no
C<op_info_table>

=cut

*/

void
exec_init_prederef(Interp *interpreter, void *prederef_arena)
{
    load_prederef(interpreter, PARROT_CGP_CORE);

    if (!interpreter->prederef.code) {
        size_t N = interpreter->code->cur_cs->base.size;
        size_t i;
        size_t n;
        void **temp = prederef_arena;
        opcode_t *pc = interpreter->code->cur_cs->base.data;

        interpreter->prederef.code = temp;
        interpreter->code->cur_cs->prederef.code = temp;
        /* TODO */
    }
}
#endif

/*

=item C<void *
init_jit(Interp *interpreter, opcode_t *pc)>

Initializes JIT function for the specified opcode and returns it.

=cut

*/

void *
init_jit(Interp *interpreter, opcode_t *pc)
{
#if JIT_CAPABLE
    opcode_t *code_start;
    UINTVAL code_size;          /* in opcodes */
    opcode_t *code_end;
    jit_f jit_code;
    if (interpreter->jit_info)
        return ((Parrot_jit_info_t *)interpreter->jit_info)->arena.start;

    code_start = interpreter->code->byte_code;
    code_size = interpreter->code->cur_cs->base.size;
    code_end = interpreter->code->byte_code + code_size;
#  if defined HAVE_COMPUTED_GOTO && defined USE_CGP
#    ifdef __GNUC__
#      ifdef PARROT_I386
    init_prederef(interpreter, PARROT_CGP_CORE);
#      endif
#    endif
#  endif

    jit_code = build_asm(interpreter, code_start, code_start, code_end, NULL);
    interpreter->code->cur_cs->jit_info = interpreter->jit_info;
    return F2DPTR(jit_code);
#else
    return NULL;
#endif
}

/*

=item C<void
prepare_for_run(Parrot_Interp interpreter)>

Prepares to run the interpreter's run core.

=cut

*/

void
prepare_for_run(Parrot_Interp interpreter)
{
    switch (interpreter->run_core) {
        case PARROT_JIT_CORE:
            (void) init_jit(interpreter, interpreter->code->byte_code);
            break;
        case PARROT_PREDEREF_CORE:
        case PARROT_SWITCH_CORE:
        case PARROT_CGP_CORE:
            init_prederef(interpreter, interpreter->run_core);
            break;
        default:
            break;
    }
}

#ifdef PARROT_EXEC_OS_AIX
extern void* aix_get_toc( );
#endif

/*

=item C<static opcode_t *
runops_jit(Interp *interpreter, opcode_t *pc)>

Runs the JIT code for the specified opcode.

=cut

*/

static opcode_t *
runops_jit(Interp *interpreter, opcode_t *pc)
{
#if JIT_CAPABLE
#  ifdef PARROT_EXEC_OS_AIX
    /* AIX calling convention requires that function-call-by-ptr be made
       through the following struct: */
    struct { jit_f functPtr; void *toc; void *env; } ptrgl_t;
    ptrgl_t.functPtr = (jit_f) D2FPTR(init_jit(interpreter, pc));
    ptrgl_t.env = NULL;

    /* r2 (TOC) needs to point back here so we can return from non-JIT
       functions */
    ptrgl_t.toc = aix_get_toc( );

    ((jit_f) D2FPTR(&ptrgl_t)) (interpreter, pc);
#  else
    jit_f jit_code = (jit_f) D2FPTR(init_jit(interpreter, pc));
    (jit_code) (interpreter, pc);
#  endif
#endif
    return NULL;
}

/*

=item C<static opcode_t *
runops_exec(Interp *interpreter, opcode_t *pc)>

Runs the native executable version of the specified opcode.

=cut

*/

static opcode_t *
runops_exec(Interp *interpreter, opcode_t *pc)
{
#if EXEC_CAPABLE
    opcode_t *code_start;
    UINTVAL code_size;          /* in opcodes */
    opcode_t *code_end;
    extern int Parrot_exec_run;

    code_start = interpreter->code->byte_code;
    code_size = interpreter->code->cur_cs->base.size;
    code_end = interpreter->code->byte_code + code_size;
#  if defined HAVE_COMPUTED_GOTO && defined USE_CGP
#    ifdef __GNUC__
#      ifdef PARROT_I386
    init_prederef(interpreter, PARROT_CGP_CORE);
#      endif
#    endif
#  endif
    if (Parrot_exec_run == 2) {
        Parrot_exec_run = 0;
        Interp_core_SET(interpreter, PARROT_JIT_CORE);
        runops_jit(interpreter, pc);
        Interp_core_SET(interpreter, PARROT_EXEC_CORE);
    }
    else if (Parrot_exec_run == 1) {
        Parrot_exec(interpreter, pc, code_start, code_end);
    }
    else
        run_native(interpreter, pc, code_start);

#endif
    return NULL;
}

/*

=item C<static opcode_t *
runops_prederef(Interp *interpreter, opcode_t *pc)>

This runops core is used when we are in prederef mode. It works just
like the basic fast core, except it uses C<pc_prederef> instead of pc,
and calls prederef opfuncs instead of regular opfuncs.

There is code after the main while loop to resynchronize pc with
C<pc_prederef> in case we have exited the loop under restart conditions
(such as with interpreter flag changing ops).

TODO: The calls to C<init_prederef()> and C<stop_prederef()> would be
best placed elsewhere, since we would re-pay the costs of loading the
prederef oplib every time we dropped out of and back into this core. For
now, however, this implementation should do fine. Since dropping out of
and back into cores is expected to be rare (at the time of
implementation that only occurs for interpreter flag changing ops).

=cut

*/

static opcode_t *
runops_prederef(Interp *interpreter, opcode_t *pc)
{
    opcode_t *code_start = (opcode_t *)interpreter->code->byte_code;
    void **pc_prederef;

    init_prederef(interpreter, PARROT_PREDEREF_CORE);
    pc_prederef = interpreter->prederef.code + (pc - code_start);

    while (pc_prederef) {
        pc_prederef =
            ((op_func_prederef_t)(ptrcast_t)*pc_prederef) (pc_prederef,
                                                           interpreter);
    }

    stop_prederef(interpreter);
    return 0;
}

/*

=item C<static opcode_t *
runops_cgp(Interp *interpreter, opcode_t *pc)>

Runs the C C<goto>, predereferenced core.

=cut

*/

static opcode_t *
runops_cgp(Interp *interpreter, opcode_t *pc)
{
#ifdef HAVE_COMPUTED_GOTO
    opcode_t *code_start = (opcode_t *)interpreter->code->byte_code;
    void **pc_prederef;
    init_prederef(interpreter, PARROT_CGP_CORE);
    pc_prederef = interpreter->prederef.code + (pc - code_start);
    pc = cgp_core((opcode_t*)pc_prederef, interpreter);
    stop_prederef(interpreter);
    return pc;
#else
    PIO_eprintf(interpreter,
            "Computed goto unavailable in this configuration.\n");
    Parrot_exit(1);
    return NULL;
#endif
}

/*

=item C<static opcode_t *
runops_switch(Interp *interpreter, opcode_t *pc)>

Runs the C<switch> core.

=cut

*/

static opcode_t *
runops_switch(Interp *interpreter, opcode_t *pc)
{
    opcode_t *code_start = (opcode_t *)interpreter->code->byte_code;
    void **pc_prederef;
    init_prederef(interpreter, PARROT_SWITCH_CORE);
    pc_prederef = interpreter->prederef.code + (pc - code_start);
    pc = switch_core((opcode_t*)pc_prederef, interpreter);
    stop_prederef(interpreter);
    return pc;
}

/*

=item C<void
runops_int(Interp *interpreter, size_t offset)>

Run parrot operations of loaded code segment until an end opcode is
reached run core is selected depending on the C<Interp_flags> when a
C<restart> opcode is encountered a different core my be selected and
evaluation of opcode continues.

=cut

*/

void
runops_int(Interp *interpreter, size_t offset)
{
    int lo_var_ptr;
    void *old_lo_var_ptr;
    opcode_t *(*core) (Interp *, opcode_t *) =
        (opcode_t *(*) (Interp *, opcode_t *)) 0;

    if (interpreter->resume_flag & RESUME_INITIAL) {
        /*
         * if we are entering the run loop the first time
         */
        interpreter->lo_var_ptr = (void *)&lo_var_ptr;
    }

    /*
     * setup event function ptrs
     */
    if (!interpreter->save_func_table) {
        setup_event_func_ptrs(interpreter);
    }

    interpreter->resume_offset = offset;
    interpreter->resume_flag |= RESUME_RESTART;

    while (interpreter->resume_flag & RESUME_RESTART) {
        opcode_t *pc = (opcode_t *)
            interpreter->code->byte_code + interpreter->resume_offset;

        old_lo_var_ptr = interpreter->lo_var_ptr;
        interpreter->resume_offset = 0;
        interpreter->resume_flag &= ~(RESUME_RESTART | RESUME_INITIAL);
        switch (interpreter->run_core) {
            case PARROT_SLOW_CORE:

                core = runops_slow_core;

                if (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
                    core = runops_profile_core;
                    if (interpreter->profile == NULL) {
                        interpreter->profile = (RunProfile *)
                            mem_sys_allocate_zeroed(sizeof(RunProfile));
                        interpreter->profile->data = (ProfData *)
                            mem_sys_allocate_zeroed((interpreter->op_count +
                                        PARROT_PROF_EXTRA) * sizeof(ProfData));
                    }
                }
                break;
            case PARROT_FAST_CORE:
                core = runops_fast_core;
                break;
            case PARROT_CGOTO_CORE:
#ifdef HAVE_COMPUTED_GOTO
                /* clear stacktop, it gets set in runops_cgoto_core beyond the
                 * opfunc table again, if the compiler supports nested funcs
                 * - but only, if we are the top running loop
                 */
                /* #ifdef HAVE_NESTED_FUNC */
#  ifdef __GNUC__
                if (old_lo_var_ptr == interpreter->lo_var_ptr)
                    interpreter->lo_var_ptr = 0;
#  endif
                core = runops_cgoto_core;
#else
                internal_exception(1, "Error: PARROT_CGOTO_CORE not available");
#endif
                break;
            case PARROT_CGP_CORE:
#ifdef HAVE_COMPUTED_GOTO
                core = runops_cgp;
#else
                internal_exception(1, "Error: PARROT_CGP_CORE not available");
#endif
                break;
            case PARROT_SWITCH_CORE:
                core = runops_switch;
                break;
            case PARROT_PREDEREF_CORE:
                core = runops_prederef;
                break;
            case PARROT_JIT_CORE:
#if !JIT_CAPABLE
                internal_exception(JIT_UNAVAILABLE,
                        "Error: PARROT_JIT_FLAG is set, "
                        "but interpreter is not JIT_CAPABLE!\n");
#endif
                core = runops_jit;
                break;
            case PARROT_EXEC_CORE:
#if !EXEC_CAPABLE
                internal_exception(EXEC_UNAVAILABLE,
                        "Error: PARROT_EXEC_FLAG is set, "
                        "but interpreter is not EXEC_CAPABLE!\n");
#endif
                core = runops_exec;
                break;
        }


        /* run it finally */
        core(interpreter, pc);
        /* if we have fallen out with resume and we were running CGOTO, set
         * the stacktop again to a sane value, so that restarting the runloop
         * is ok.
         */
        interpreter->lo_var_ptr = old_lo_var_ptr;
        if ((interpreter->resume_flag & RESUME_RESTART) &&
                (int)interpreter->resume_offset < 0)
                internal_exception(1, "branch_cs: illegal resume offset");
    }
}

/*

=item C<void
runops(Interp *interpreter, size_t offset)>

Run parrot ops. Set exception handler and/or resume after exception.

=cut

*/

#define STACKED_EXCEPTIONS 1

void
runops(Interp *interpreter, size_t offset)
{
    /*
     * having stacked exceptions for each runlevel didn't work always
     * (after a longjmp the interpreter was totally messed up)
     *
     * But these are necessary to catch exceptions in reentered
     * run loops, e.g. if a delegate methods throws an exception
     */
#if ! STACKED_EXCEPTIONS
    if (!interpreter->exceptions)
#endif
    {
        new_internal_exception(interpreter);
        if (setjmp(interpreter->exceptions->destination)) {
            /* an exception was thrown */
            offset = handle_exception(interpreter);
        }
    }
    if (interpreter->profile &&
            Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
        RunProfile *profile = interpreter->profile;
        if (profile->cur_op == PARROT_PROF_EXCEPTION) {
            profile->data[PARROT_PROF_EXCEPTION].time +=
                Parrot_floatval_time() - profile->starttime;
        }
    }
    runops_int(interpreter, offset);
    /*
     * pop off exception and put it onto the free list
     * s. above
     */
    if (STACKED_EXCEPTIONS) {
        Parrot_exception *e = interpreter->exceptions;
        interpreter->exceptions = e->prev;
        interpreter->exc_free_list = e;
    }
    /*
     * not yet - this needs classifying of exceptions and handlers
     * so that only an exit handler does catch this exception
     */
#if 0
    do_exception(interpreter, EXCEPT_exit, 0);
#endif
}

/*

=item C<void
Parrot_runops_fromc(Parrot_Interp interpreter, PMC *sub)>

Runs the Parrot ops, called from C code. The function arguments are
already setup according to Parrot calling conventions, the C<sub> argument
is an invocable C<Sub> PMC.

=cut

*/

#define DO_DOD_REGISTER 0
void
Parrot_runops_fromc(Parrot_Interp interpreter, PMC *sub)
{
    PMC *ret_c, *old_c;
    opcode_t offset, *dest;

    /*
     * the caller doesn't know, that a subroutine is called
     * so P1 isn't copied up to the upper half of the register
     * frames and isn't stored with savetop - it's totally unachored
     *
     * we have to dod_register the caller's return continuation
     * to prevent it from sudden death
     */
    old_c = REG_PMC(1);
#if DO_DOD_REGISTER
    /* XXX it should be visible on the stack here */
    dod_register_pmc(interpreter, old_c);
#endif
    /* we need one return continuation with a NULL offset */
    REG_PMC(1) = ret_c = new_ret_continuation_pmc(interpreter, NULL);
#if GC_VERBOSE
    PObj_report_SET(ret_c);     /* s. also dod.c */
#endif
    /*
     * also be sure that this continuation isn't destroyed
     */
#if DO_DOD_REGISTER
    dod_register_pmc(interpreter, ret_c);
#endif
    /* invoke the sub, which places the context of the sub in the
     * interpreter, and switches code segments if needed
     */
    dest = VTABLE_invoke(interpreter, sub, NULL);
    if (dest) {
        offset = dest - interpreter->code->byte_code;
        runops(interpreter, offset);
    }
    REG_PMC(1) = old_c;
#if DO_DOD_REGISTER
    dod_unregister_pmc(interpreter, ret_c);
    dod_unregister_pmc(interpreter, old_c);
#endif
}

/*

=item C<PARROT_INLINE static regsave *
save_regs(Parrot_Interp interp, sub)>

=item C<PARROT_INLINE static void
restore_regs(Parrot_Interp interp, regsave *data)>

Save/restore all registers.

=cut

*/

/*
 * calculate size to store with save_regs
 *
 * this checks the opcodes in the sub an the reg usage
 * XXX don't do it here - the compiler has all the info
 * TODO attach that information in the metadata of the sub
 * XXX consider e.g. invoke (calling another sub)
 */
#define SAVE_ALL_REGS 1

#if SAVE_ALL_REGS

#  define used_size(i, s) sizeof(reg_store)
#  define SAVE_S0_P2 \
    REG_PMC(2) = obj; \
    REG_STR(0) = meth

#  define RESTORE_S0_P2

#else

#  define SAVE_S0_P2 \
    PMC * p2 = REG_PMC(2); \
    STRING *s0 = REG_STR(0); \
    REG_PMC(2) = obj; \
    REG_STR(0) = meth

#  define RESTORE_S0_P2 \
    REG_PMC(2) = p2; \
    REG_STR(0) = s0

#if defined(PARROT_HAS_I386_SSE) || defined(PARROT_HAS_I386_SSE2)
#  define MIN_SIZE_ALIGN 0x1f
#else
#  define MIN_SIZE_ALIGN 0x0f
#endif
static size_t
used_size(Parrot_Interp interpreter, PMC *sub)
{
    struct Parrot_Sub *s = PMC_sub(sub);
    op_info_t *op_info;
    opcode_t *start, *end, op, arg;
    int i, n;
    size_t size, offs;

    if (s->use_reg_offs)
        return s->use_reg_offs;
    start = PMC_struct_val(sub);
    end = s->end;
    if (!end || start == end)
        return sizeof(reg_store);
    size = 0;
    while (start < end) {
        op = *start;
        op_info = &interpreter->op_info_table[op];
        n = op_info->arg_count;
        /* printf("# %s\n", op_info->full_name); */
        for (i = 1; i < n; ++i) {
            if (!(op_info->dirs[i] & PARROT_ARGDIR_OUT))
                continue;
            arg = start[i];
            switch (op_info->types[i]) {
                case PARROT_ARG_I:
                    offs = offsetof(Interp, int_reg.registers[arg]) +
                        sizeof(INTVAL);
                    break;
                case PARROT_ARG_P:
                    offs = offsetof(Interp, pmc_reg.registers[arg]) +
                        sizeof(PMC *);
                    break;
                case PARROT_ARG_S:
                    offs = offsetof(Interp, string_reg.registers[arg]) +
                        sizeof(STRING *);
                    break;
                case PARROT_ARG_N:
                    offs = offsetof(Interp, num_reg.registers[arg]) +
                        sizeof(FLOATVAL);
                    break;
            }
            if (offs > size)
                size = offs;
        }
        start += n;
    }

    /* always preserve PCC vars */
    if (size < 5 * sizeof(INTVAL))
        size = 5 * sizeof(INTVAL);
    /* round up for memcpy_aligned */
    size = (size + MIN_SIZE_ALIGN) & ~MIN_SIZE_ALIGN;
    s->use_reg_offs = size;
    return size;
}

#endif

PARROT_INLINE static regsave *
save_regs(Parrot_Interp interpreter, PMC *sub)
{
    regsave *save;
    size_t size = used_size(interpreter, sub);
    Regs_cache * rc = &interpreter->caches->regs_cache;

    if (rc->reg_save_top) {
        save = rc->reg_save_top;
        rc->reg_save_top = save->prev;
    }
    else {
        save = mem_sys_allocate(sizeof(regsave));
        save->prev = NULL;
    }
    save->next = rc->reg_save_mark;
    rc->reg_save_mark = save;
    save->size = size;
    Parrot_memcpy_aligned(&save->regs, interpreter, size);
    return save;
}

PARROT_INLINE static void
restore_regs(Parrot_Interp interpreter, regsave *data)
{

    Regs_cache * rc = &interpreter->caches->regs_cache;

    Parrot_memcpy_aligned(interpreter, &data->regs, data->size);
    data->prev = rc->reg_save_top;
    rc->reg_save_top = data;
    assert(rc->reg_save_mark == data);
    rc->reg_save_mark = data->next;
}

/*

=item C<void
mark_saved_regs(Parrot_Interp interpreter)

Mark saved register aread live during DOD

=cut

*/

void
mark_saved_regs(Parrot_Interp interpreter)
{
    regsave *p = interpreter->caches->regs_cache.reg_save_mark;
    int j;
    PObj *reg;
    size_t offs;

    for (; p; p = p->next) {
        struct PReg *pf = &p->regs.pmc_reg;
        struct SReg *sf = &p->regs.string_reg;
        for (j = 0; j < NUM_REGISTERS; j++) {
            offs = offsetof(Interp, pmc_reg.registers[j]);
            if (offs >= p->size)
                break;
            reg = (PObj*) pf->registers[j];
            if (reg)
                pobject_lives(interpreter, reg);
            offs = offsetof(Interp, string_reg.registers[j]);
            if (offs >= p->size)
                break;
            reg = (PObj*) sf->registers[j];
            if (reg)
                pobject_lives(interpreter, reg);
        }
    }
}

/*

=item C<void
Parrot_runops_fromc_save(Parrot_Interp, PMC *sub)>

Like above but preserve registers.

=item C<void
Parrot_run_meth_fromc_save(Parrot_Interp, PMC *sub, PMC *obj, STRING *meth)>
=cut

Run a method sub from C.

*/

void
Parrot_runops_fromc_save(Parrot_Interp interpreter, PMC *sub)
{
    regsave *data = save_regs(interpreter, sub);
    /*
     * TODO install exception handler in _save variants
     *      so that we can restore the registers
     */
    Parrot_runops_fromc(interpreter, sub);
    restore_regs(interpreter, data);
}

void
Parrot_run_meth_fromc_save(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth)
{
    regsave *data = save_regs(interpreter, sub);
    SAVE_S0_P2;
    REG_INT(0) = 0;     /* non-prototyped */
    REG_INT(3) = 0;     /* no args */
    Parrot_runops_fromc(interpreter, sub);
    RESTORE_S0_P2;

    restore_regs(interpreter, data);
}

/*

=item C<void *
Parrot_runops_fromc_args(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)>

=item C<void *
Parrot_runops_fromc_args_save(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)>

=item C<INTVAL
Parrot_runops_fromc_args_save_reti(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)>

=item C<FLOATVAL
Parrot_runops_fromc_args_save_retf(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)>

=item C<void *
Parrot_run_meth_fromc_args_save(Parrot_Interp interpreter, PMC *sub,
        PMC* obj, STRING* meth, const char *sig, ...)>

=item C<INTVAL
Parrot_run_meth_fromc_args_save_reti(Parrot_Interp interpreter, PMC *sub,
        PMC* obj, STRING* meth, const char *sig, ...)>

=item C<FLOATVAL
Parrot_run_meth_fromc_args_save_retf(Parrot_Interp interpreter, PMC *sub,
        PMC* obj, STRING* meth, const char *sig, ...)>

Run parrot ops, called from C code, function arguments are passed as
C<va_args> according to signature the C<sub> argument is an invocable
C<Sub> PMC. The C<_save> variants preserve registers.

Signatures are similar to NCI:

    v ... void return
    I ... INTVAL (not Interpreter)
    N ... NUMVAL
    S ... STRING*
    P ... PMC*

=cut

*/

static void* set_retval(Parrot_Interp interpreter, int seg_ret);

static void
runops_args(Parrot_Interp interpreter, PMC *sub, const char* sig, va_list ap)
{
    /* *sig is retval like in NCI */
    int ret;
    int next[4];
    int i;

    for (i = 0; i < 4; i++)
        next[i] = 5;

    REG_INT(0) = 1;     /* kind of a prototyped call */
    REG_INT(1) = 0;     /* # of I params */
    REG_INT(2) = 0;     /* # of S params */
    REG_INT(3) = 0;     /* # of P params */
    REG_INT(4) = 0;     /* # of N params */

    ret = *sig++;

    while (*sig) {
        switch (*sig++) {
            case 'v':       /* void func, no params */
                break;
            case 'I':       /* REG_INT */
                REG_INT(next[0]++) = va_arg(ap, INTVAL);
                ++REG_INT(1);
                break;
            case 'S':       /* REG_STR */
                REG_STR(next[1]++) = va_arg(ap, STRING*);
                ++REG_INT(2);
                break;
            case 'P':       /* REG_PMC */
                REG_PMC(next[2]++) = va_arg(ap, PMC*);
                ++REG_INT(3);
                break;
            case 'N':       /* REG_NUM */
                REG_NUM(next[3]++) = va_arg(ap, FLOATVAL);
                ++REG_INT(4);
                break;
            default:
                internal_exception(1,
                        "unhandle signature '%c' in Parrot_runops_fromc_args",
                        sig[-1]);
        }
    }

    Parrot_runops_fromc(interpreter, sub);
}

static void*
set_retval(Parrot_Interp interpreter, int sig_ret)
{
    void *retval;
    retval = NULL;
    /*
     * XXX should we trust the signature or the registers set
     *     by the subroutine or both if possible, i.e. extract
     *     e.g. an INTVAL from a returned PMC?
     */
    REG_INT(0) = 1;     /* prototyped */
    REG_INT(1) = 0;     /* I */
    REG_INT(2) = 0;     /* S */
    REG_INT(3) = 0;     /* P */
    REG_INT(4) = 0;     /* N */
    switch (sig_ret) {
        case 'v': break;
        case 'I': retval = (void* )&REG_INT(5); REG_INT(1) = 1; break;
        case 'S': retval = (void* ) REG_STR(5); REG_INT(2) = 1; break;
        case 'P': retval = (void* ) REG_PMC(5); REG_INT(3) = 1; break;
        case 'N': retval = (void* )&REG_NUM(5); REG_INT(4) = 1; break;
        default:
            internal_exception(1,
                    "unhandle signature '%c' in Parrot_runops_fromc_args",
                    sig_ret);
    }
    return retval;
}

void *
Parrot_runops_fromc_args(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)
{
    va_list args;
    void *ret;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    return set_retval(interpreter, *sig);
}

/*
 * generic return pointer or void
 */
void *
Parrot_runops_fromc_args_save(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)
{
    regsave *data = save_regs(interpreter, sub);
    va_list args;
    void *ret;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    ret = set_retval(interpreter, *sig);
    restore_regs(interpreter, data);
    return ret;
}

INTVAL
Parrot_runops_fromc_args_save_reti(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)
{
    regsave *data = save_regs(interpreter, sub);
    va_list args;
    void *ret;
    INTVAL ri;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    ret = set_retval(interpreter, *sig);
    ri = *(INTVAL*) ret;
    restore_regs(interpreter, data);
    return ri;
}

FLOATVAL
Parrot_runops_fromc_args_save_retf(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)
{
    regsave *data = save_regs(interpreter, sub);
    va_list args;
    void *ret;
    FLOATVAL rf;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    ret = set_retval(interpreter, *sig);
    rf = *(FLOATVAL*) ret;
    restore_regs(interpreter, data);
    return rf;
}

void*
Parrot_run_meth_fromc_args_save(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, ...)
{
    regsave *data = save_regs(interpreter, sub);
    va_list args;
    void *ret;
    SAVE_S0_P2;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    ret = set_retval(interpreter, *sig);
    restore_regs(interpreter, data);
    RESTORE_S0_P2;
    return ret;
}

INTVAL
Parrot_run_meth_fromc_args_save_reti(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, ...)
{
    regsave *data = save_regs(interpreter, sub);
    va_list args;
    void *ret;
    INTVAL ri;
    SAVE_S0_P2;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    ret = set_retval(interpreter, *sig);
    ri = *(INTVAL*) ret;
    restore_regs(interpreter, data);
    RESTORE_S0_P2;
    return ri;
}

FLOATVAL
Parrot_run_meth_fromc_args_save_retf(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, ...)
{
    regsave *data = save_regs(interpreter, sub);
    va_list args;
    void *ret;
    FLOATVAL rf;
    SAVE_S0_P2;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    ret = set_retval(interpreter, *sig);
    rf = *(FLOATVAL*) ret;
    restore_regs(interpreter, data);
    RESTORE_S0_P2;
    return rf;
}

/*

=item C<PMC* Parrot_make_cb(Parrot_Interp interpreter, PMC* sub, PMC* user
        STRING* cb_signature)>

Create a callback function according to pdd16.

=cut

*/

PMC*
Parrot_make_cb(Parrot_Interp interpreter, PMC* sub, PMC* user_data,
        STRING *cb_signature)
{
    PMC* interp_pmc, *cb, *cb_sig;
    int type = '?';     /* avoid -Ox warning */
    char * sig_str;
    STRING *sc;
    /*
     * we stuff all the information into the user_data PMC and pass that
     * on to the external sub
     */
    interp_pmc = VTABLE_get_pmc_keyed_int(interpreter, interpreter->iglobals,
            (INTVAL) IGLOBALS_INTERPRETER);
    /* be sure __LINE__ is consistent */
    sc = CONST_STRING(interpreter, "_interpreter");
    VTABLE_setprop(interpreter, user_data, sc, interp_pmc);
    sc = CONST_STRING(interpreter, "_sub");
    VTABLE_setprop(interpreter, user_data, sc, sub);
    /* only ASCII sigs supported */
    sig_str = cb_signature->strstart;
    if (*sig_str == 'U') {
        type = 'D';
    }
    else {
        ++sig_str;
        if (*sig_str == 'U') {
            type = 'C';
        }
        else {
            internal_exception(1, "unhandled signature '%Ss' in make_cb",
                    cb_signature);
        }
    }

    cb_sig = pmc_new(interpreter, enum_class_PerlString);
    VTABLE_set_string_native(interpreter, cb_sig, cb_signature);
    sc = CONST_STRING(interpreter, "_signature");
    VTABLE_setprop(interpreter, user_data, sc, cb_sig);
    /*
     * we are gonna passing this PMC to external code, the PMCs
     * might get out of scope until the callback is called -
     * we don't know, when the callback will be called
     *
     * so anchor the PMC
     */
    dod_register_pmc(interpreter, user_data);

    /*
     * finally the external lib awaits a function pointer
     * create a PMC that points to Parrot_callback_C (or _D)
     * it can be passed on with signature 'p'
     */
    cb = pmc_new(interpreter, enum_class_UnManagedStruct);
    /*
     * we handle currently 2 types only:
     * _C ... user_data is 2nd param
     * _D ... user_data is 1st param
     */
    if (type == 'C')
        PMC_data(cb) = F2DPTR(Parrot_callback_C);
    else
        PMC_data(cb) = F2DPTR(Parrot_callback_D);
    dod_register_pmc(interpreter, cb);

    return cb;
}

/*

=item C<static void verify_CD(void *external_data, PMC *callback_info)>

Verify callback_info PMC then continue with callback_CD

=cut

*/

static void callback_CD(Parrot_Interp, void *, PMC *callback_info);

static void
verify_CD(void *external_data, PMC *callback_info)
{
    Parrot_Interp interpreter = NULL;
    size_t i;

    /*
     * 1.) callback_info is from external code so:
     *     verify that we get a PMC that is one that we have passed in
     *     as user data, when we prepared the callback
     */

    /* a NULL pointer or a pointer not aligned is very likely wrong */
    if (!callback_info || ((UINTVAL)callback_info & 3))
        PANIC("callback_info doesn't look like a pointer");

    /*
     * we don't have an interpreter yet, where this PMC might be
     * located so run through interpreters and check their PMC pools
     */
    LOCK(interpreter_array_mutex);
    for (i = 0; i < n_interpreters; ++i) {
        if (interpreter_array[i] == NULL)
            continue;
        interpreter = interpreter_array[i];
        if (interpreter)
            if (contained_in_pool(interpreter,
                        interpreter->arena_base->pmc_pool, callback_info))
                break;
    }
    UNLOCK(interpreter_array_mutex);
    if (!interpreter)
        PANIC("interpreter not found for callback");

    /*
     * 2) some more checks
     * now we should have the interpreter where that callback
     * did originate - do some further checks on the PMC
     */

    /* if that doesn't look like a PMC we are still lost */
    if (!PObj_is_PMC_TEST(callback_info))
        PANIC("callback_info isn't a PMC");

    if (!callback_info->vtable)
        PANIC("callback_info hasn't a vtable");
    /*
     * ok fine till here
     */
    callback_CD(interpreter, external_data, callback_info);
}

/*

=item C<static void
callback_CD(Parrot_Interp, void *external_data, PMC *callback_info)>

Common callback function handler s. pdd16

=cut

*/

static void
callback_CD(Parrot_Interp interpreter, void *external_data, PMC *callback_info)
{

    PMC *passed_interp;         /* the interp that originated the CB */
    int async = 1;              /* cb is hitting this sub somewhen inmidst */
    STRING *sc;
    /*
     * 3) check interpreter ...
     */
    sc = CONST_STRING(interpreter, "_interpreter");
    passed_interp = VTABLE_getprop(interpreter, callback_info, sc);
    if (PMC_data(passed_interp) != interpreter)
        PANIC("callback gone to wrong interpreter");
    /*
     * 4) check if the call_back is synchronous:
     *    - if yes we are inside the NCI call
     *      we could run the Sub immediately now (I think)
     *    - if no, and that's always safe, post a CALLBACK_EVENT
     */

    if (async) {
        /*
         * create a CB_EVENT, put user_data and data inside and finito
         *
         * *if* this function is finally no void, i.e. the calling
         * C program awaits a return result from the callback,
         * then wait for the CB_EVENT_xx to finish and return the
         * result
         */
        Parrot_new_cb_event(interpreter, callback_info, external_data);
    }
    else {
        /*
         * just call the sub
         */
    }
}

/*

=item C<void
Parrot_run_callback(Parrot_Interp interpreter, PMC* cbi, void* ext)>

Run a callback function. The PMC* cbi (callback_info) holds all
necessary items in its props.

=cut

*/

void
Parrot_run_callback(Parrot_Interp interpreter, PMC* cbi, void* ext)
{
    PMC* user_data, *sig, *sub;
    STRING* sig_str;
    char *p;
    char pasm_sig[4];
    INTVAL   i_param;
    void*    param = NULL;      /* avoid -Ox warning */
    STRING *sc;

    sc = CONST_STRING(interpreter, "_sub");
    sub = VTABLE_getprop(interpreter, cbi, sc);
    sc = CONST_STRING(interpreter, "_signature");
    sig = VTABLE_getprop(interpreter, cbi, sc);
    user_data = cbi;

    sig_str = VTABLE_get_string(interpreter, sig);
    p = sig_str->strstart;

    pasm_sig[0] = 'v';  /* no return value supported yet */
    pasm_sig[1] = 'P';
    if (*p == 'U') /* user_data Z in pdd16 */
        ++p;    /* p is now type of external data */
    switch (*p) {
        case 'v':
            pasm_sig[2] = 'v';
            break;
#if 0
        case '2':
        case '3':
        case '4':
#endif
        case 'l':
            i_param = (INTVAL)(long) ext;
            goto case_I;
        case 'i':
            i_param = (INTVAL)(int)(long) ext;
            goto case_I;
        case 's':
            i_param = (INTVAL)(short)(long) ext;
            goto case_I;
        case 'c':
            i_param = (INTVAL)(char)(long)ext;
case_I:
            pasm_sig[2] = 'I';
            param = (void*) i_param;
            break;
#if 0
        case 'f':
        case 'd':
            /* these types don't fit into a pointer, they will not
             * work
             */
            break;
        case 'p':
            /* TODO created UnManagedStruct */
        case 'P':
            pasm_sig[2] = 'P';
            break;
#endif
        case 't':
            pasm_sig[2] = 'S';
            param = string_from_cstring(interpreter, ext, 0);
            break;
        default:
            internal_exception(1, "unhandled sig char '%c' in run_cb");
    }
    pasm_sig[3] = '\0';
    Parrot_runops_fromc_args_save(interpreter, sub, pasm_sig,
            user_data, param);
}
/*

=item C<void Parrot_callback_C(void *external_data, PMC *callback_info)>

=item C<void Parrot_callback_D(PMC *callback_info, void *external_data)>

NCI callback functions s. ppd16

=cut

*/

void
Parrot_callback_C(void *external_data, PMC *callback_info)
{
    verify_CD(external_data, callback_info);
}

void
Parrot_callback_D(PMC *callback_info, void *external_data)
{
    verify_CD(external_data, callback_info);
}

/*

=item C<static int is_env_var_set(const char* var)>

Checks whether the specified environment variable is set.

=cut

*/

static int
is_env_var_set(const char* var)
{
    int free_it, retval;
    char* value = Parrot_getenv(var, &free_it);
    if (value == NULL)
        retval = 0;
    else if (*value == '\0')
        retval = 0;
    else
        retval = ! (strcmp(value, "0") == 0);
    if (free_it)
        mem_sys_free(value);
    return retval;
}

/*

=item C<static void
setup_event_func_ptrs(Parrot_Interp interpreter)>

Setup a C<func_table> containing pointers (or addresses) of the
C<check_event__> opcode.

TODO: Free it at destroy. Handle run-core changes.

=cut

*/

static void
setup_event_func_ptrs(Parrot_Interp interpreter)
{
    size_t i, n = interpreter->op_count;
    oplib_init_f init_func = get_op_lib_init(1, interpreter->run_core, NULL);
    op_lib_t *lib = init_func(1);
    /*
     * remember op_func_table
     */
    interpreter->save_func_table = lib->op_func_table;
    if (!lib->op_func_table)
        return;
    /* function or CG core - prepare func_table */
    if (!interpreter->evc_func_table) {
        interpreter->evc_func_table = mem_sys_allocate(sizeof(void *) * n);
        for (i = 0; i < n; ++i)
            interpreter->evc_func_table[i] = (op_func_t)
                D2FPTR(((void**)lib->op_func_table)[CORE_OPS_check_events__]);
    }
}

/*

=item C<Parrot_Interp
make_interpreter(Parrot_Interp parent, Interp_flags flags)>

Create the Parrot interpreter. Allocate memory and clear the registers.

=cut

*/

void Parrot_really_destroy(int exit_code, void *interpreter);

Parrot_Interp
make_interpreter(Parrot_Interp parent, Interp_flags flags)
{
    Interp *interpreter;
#if EXEC_CAPABLE
    extern int Parrot_exec_run;
#endif

    /* Get an empty interpreter from system memory */
#if EXEC_CAPABLE
    if (Parrot_exec_run)
        interpreter = &interpre;
    else
#endif
        interpreter = mem_sys_allocate_zeroed(sizeof(struct Parrot_Interp));

    /*
     * the last interpreter (w/o) parent has to cleanup globals
     * so remember parent if any
     */
    if (parent) {
        interpreter->parent_interpreter = parent;
        interpreter->lo_var_ptr = parent->lo_var_ptr;
    }
    else {
        SET_NULL(interpreter->parent_interpreter);
        SET_NULL(interpreter->lo_var_ptr);
    }
    interpreter->resume_flag = RESUME_INITIAL;

    interpreter->DOD_block_level = 1;
    interpreter->GC_block_level = 1;

    /* Must initialize flags here so the GC_DEBUG stuff is available before
     * mem_setup_allocator() is called. */
    interpreter->flags = flags;

    /* PANIC will fail until this is done */
    SET_NULL(interpreter->piodata);
    PIO_init(interpreter);

    if (is_env_var_set("PARROT_GC_DEBUG")) {
#if ! DISABLE_GC_DEBUG
        Interp_flags_SET(interpreter, PARROT_GC_DEBUG_FLAG);
#else
        fprintf(stderr, "PARROT_GC_DEBUG is set but the binary was compiled "
                "with DISABLE_GC_DEBUG.\n");
#endif
    }

    /* Set up the memory allocation system */
    mem_setup_allocator(interpreter);
    /*
     * Set up the string subsystem
     * This also generates the constant string tables
     */
    string_init(interpreter);

    /* Set up the MMD struct */
    interpreter->binop_mmd_funcs = NULL;

    /* Go and init the MMD tables */
    register_fallback_methods(interpreter);

    /* initialize classes - this needs mmd func table */
    Parrot_init(interpreter);

#if PARROT_CATCH_NULL
    /* Initialize once only. For now all interpreters share the NULL PMC.
     * Adding to interpreter-local storage will add a deref overhead.
     * init_null will return the NULL PMC, but ignore for now since it is global.
     */
    pmc_init_null(interpreter);
#endif

    /* Need an empty stash */
    interpreter->globals = mem_sys_allocate(sizeof(struct Stash));
    interpreter->globals->stash_hash =
        pmc_new(interpreter, enum_class_PerlHash);
    interpreter->globals->parent_stash = NULL;

    /* context data */
    /* Initialize interpreter's flags */
    interpreter->ctx.warns = new_buffer_header(interpreter);
    Parrot_allocate(interpreter, interpreter->ctx.warns,
        sizeof(struct warnings_t));
    PARROT_WARNINGS_off(interpreter, PARROT_WARNINGS_ALL_FLAG);

    /* same with errors */
    interpreter->ctx.errors = new_buffer_header(interpreter);
    Parrot_allocate(interpreter, interpreter->ctx.errors,
        sizeof(struct warnings_t));
    PARROT_ERRORS_off(interpreter, PARROT_ERRORS_ALL_FLAG);
    /* undefined globals are errors by default */
    PARROT_ERRORS_on(interpreter, PARROT_ERRORS_GLOBALS_FLAG);

    /* create caches structure */
    init_object_cache(interpreter);
    /* allocate stack chunk cache */
    stack_system_init(interpreter);
    /* Set up the initial register chunks */
    setup_register_stacks(interpreter, &interpreter->ctx);

    Parrot_clear_s(interpreter);
    Parrot_clear_p(interpreter);

    /* Stack for lexical pads */
    interpreter->ctx.pad_stack = new_stack(interpreter, "Pad");

    /* Need a user stack */
    interpreter->ctx.user_stack = new_stack(interpreter, "User");

    /* And a control stack */
    interpreter->ctx.control_stack = new_stack(interpreter, "Control");

    /* A regex stack would be nice too. */
    interpreter->ctx.intstack = intstack_new(interpreter);

    /* Load the core op func and info tables */
    interpreter->op_lib = get_op_lib_init(1, 0, NULL)(1);
    interpreter->op_count = interpreter->op_lib->op_count;
    interpreter->op_func_table = interpreter->op_lib->op_func_table;
    interpreter->op_info_table = interpreter->op_lib->op_info_table;
    SET_NULL_P(interpreter->all_op_libs, op_lib_t **);
    SET_NULL_P(interpreter->evc_func_table, op_func_t *);
    SET_NULL_P(interpreter->save_func_table, op_func_t *);

    /* Set up defaults for line/package/file */
    interpreter->current_file =
        string_make(interpreter, "(unknown file)", 14, "iso-8859-1", 0);
    interpreter->current_package =
        string_make(interpreter, "(unknown package)", 18, "iso-8859-1", 0);;

    SET_NULL_P(interpreter->code, struct PackFile *);
    SET_NULL_P(interpreter->profile, ProfData *);

    /* next two are pointers to the real thing in the current code seg */
    SET_NULL_P(interpreter->prederef.code, void **);
    SET_NULL_P(interpreter->prederef.branches, Prederef_btanch*);
    SET_NULL(interpreter->jit_info);

    /* null out the root set registry */
    SET_NULL_P(interpreter->DOD_registry, PMC *);


    /* register assembler/compilers */
    setup_default_compreg(interpreter);

    /* setup stdio PMCs */
    PIO_init(interpreter);
    /* Done. Return and be done with it */

    /* Add in the class hash. Bit of a hack, probably, as there's
       altogether too much overlap with the PMC classes */
    interpreter->class_hash = pmc_new(interpreter, enum_class_PerlHash);

    /* Okay, we've finished doing anything that might trigger GC.
     * Actually, we could enable DOD/GC earlier, but here all setup is
     * done
     */
    Parrot_unblock_DOD(interpreter);
    Parrot_unblock_GC(interpreter);

    /* all sys running, init the event and signal stuff
     * the first or "master" interpreter is handling events and signals
     */
    SET_NULL_P(interpreter->task_queue, QUEUE*);
    SET_NULL_P(interpreter->thread_data, _Thread_data *);

    Parrot_init_events(interpreter);

#ifdef ATEXIT_DESTROY
    /*
     * if this is not a threaded interpreter, push the interpreter
     * destruction.
     * Threaded interpreters are destructed when the thread ends
     */
    if (!Interp_flags_TEST(interpreter, PARROT_IS_THREAD))
        Parrot_on_exit(Parrot_really_destroy, (void*)interpreter);
#endif

    return interpreter;
}

/*

=item C<void
Parrot_destroy(Interp *interpreter)>

Does nothing if C<ATEXIT_DESTROY> is defined. Otherwise calls
C<Parrot_really_destroy()> with exit code 0.

This function is not currently used.

=cut

*/

void
Parrot_destroy(Interp *interpreter)
{
#ifdef ATEXIT_DESTROY
    UNUSED(interpreter);
#else
    Parrot_really_destroy(0, (void*) interpreter);
#endif
}

/*

=item C<void
Parrot_really_destroy(int exit_code, void *vinterp)>

Waits for any threads to complete, then frees all allocated memory, and
closes any open file handles, etc.

Note that C<exit_code> is ignored.

=cut

*/

void
Parrot_really_destroy(int exit_code, void *vinterp)
{
    int i;
    Interp *interpreter = (Interp*) vinterp;
    struct Stash *stash, *next_stash;

    UNUSED(exit_code);

    /*
     * wait for threads to complete if needed
     */
    if (!interpreter->parent_interpreter) {
        pt_join_threads(interpreter);
    }
    /* if something needs destruction (e.g. closing PIOs)
     * we must destroy it now:
     * no DOD run, so everything is considered dead
     */

    free_unused_pobjects(interpreter, interpreter->arena_base->pmc_pool);

    /* Now the PIOData gets also cleared */
    PIO_finish(interpreter);

    /*
     * now all objects that need timely destruction should be finalized
     * so terminate the event loop
     */
    if (!interpreter->parent_interpreter) {
        Parrot_kill_event_loop();
    }

    /* we destroy all child interpreters and the last one too,
     * if the --leak-test commandline was given
     */
    if (! (interpreter->parent_interpreter ||
                Interp_flags_TEST(interpreter, PARROT_DESTROY_FLAG)))
        return;

    /* buffer headers, PMCs */
    Parrot_destroy_header_pools(interpreter);
    /* memory pools in resources */
    Parrot_destroy_memory_pools(interpreter);
    /* mem subsystem is dead now */
    mem_sys_free(interpreter->arena_base);
    /* packfile */

    if (!Interp_flags_TEST(interpreter, PARROT_EXTERN_CODE_FLAG))  {
        struct PackFile *pf = interpreter->code;
        if (pf)
            PackFile_destroy(pf);
    }

    /* walk and free the stash, pmc's are already dead */
    stash = interpreter->globals;
    while (stash) {
        next_stash = stash->parent_stash;
        mem_sys_free(stash);
        stash = next_stash;
    }
    /* free vtables */
    if (!interpreter->parent_interpreter)
        for (i = 1; i < (int)enum_class_max; i++)
            Parrot_destroy_vtable(interpreter, Parrot_base_vtables[i]);
    mmd_destroy(interpreter);

    if (interpreter->profile) {
        mem_sys_free(interpreter->profile->data);
        mem_sys_free(interpreter->profile);
    }

    /* deinit op_lib */
    (void) PARROT_CORE_OPLIB_INIT(0);

    stack_destroy(interpreter->ctx.pad_stack);
    stack_destroy(interpreter->ctx.user_stack);
    stack_destroy(interpreter->ctx.control_stack);
    /* intstack */
    intstack_free(interpreter, interpreter->ctx.intstack);

    /* chartype, encodings */
    if (!interpreter->parent_interpreter) {
/*
        chartype_destroy();
        encoding_destroy();
*/
    }

    else {
        /* don't free a thread interpreter, if it isn't joined yet */
        if (!interpreter->thread_data || (
                    interpreter->thread_data &&
                    (interpreter->thread_data->state & THREAD_STATE_JOINED))) {
            if (interpreter->thread_data )
                mem_sys_free(interpreter->thread_data);
            mem_sys_free(interpreter);
        }
    }
}

#ifdef GC_IS_MALLOC
#  if 0
struct mallinfo {
    int arena;                  /* non-mmapped space allocated from system */
    int ordblks;                /* number of free chunks */
    int smblks;                 /* number of fastbin blocks */
    int hblks;                  /* number of mmapped regions */
    int hblkhd;                 /* space in mmapped regions */
    int usmblks;                /* maximum total allocated space */
    int fsmblks;                /* space available in freed fastbin blocks */
    int uordblks;               /* total allocated space */
    int fordblks;               /* total free space */
    int keepcost;               /* top-most, releasable (via malloc_trim)
                                 * space */
};
#  endif
extern struct mallinfo mallinfo(void);
#endif /* GC_IS_MALLOC */

/*

=item C<INTVAL
interpinfo(Interp *interpreter, INTVAL what)>

C<what> specifies the type of information you want about the
interpreter.

=cut

*/

INTVAL
interpinfo(Interp *interpreter, INTVAL what)
{
    INTVAL ret = 0;
    struct Small_Object_Pool *header_pool;
    int j;

    switch (what) {
        case TOTAL_MEM_ALLOC:
#ifdef GC_IS_MALLOC
#if 0
            interpreter->memory_allocated = mallinfo().uordblks;
#endif
#endif
            ret = interpreter->memory_allocated;
            break;
        case DOD_RUNS:
            ret = interpreter->dod_runs;
            break;
        case COLLECT_RUNS:
            ret = interpreter->collect_runs;
            break;
        case ACTIVE_PMCS:
            ret = interpreter->arena_base->pmc_pool->total_objects -
                interpreter->arena_base->pmc_pool->num_free_objects;
            break;
        case ACTIVE_BUFFERS:
            ret = 0;
            for (j = 0; j < (INTVAL)interpreter->arena_base->num_sized; j++) {
                header_pool = interpreter->arena_base->sized_header_pools[j];
                if (header_pool)
                    ret += header_pool->total_objects -
                        header_pool->num_free_objects;
            }
            break;
        case TOTAL_PMCS:
            ret = interpreter->arena_base->pmc_pool->total_objects;
            break;
        case TOTAL_BUFFERS:
            ret = 0;
            for (j = 0; j < (INTVAL)interpreter->arena_base->num_sized; j++) {
                header_pool = interpreter->arena_base->sized_header_pools[j];
                if (header_pool)
                    ret += header_pool->total_objects;
            }
            break;
        case HEADER_ALLOCS_SINCE_COLLECT:
            ret = interpreter->header_allocs_since_last_collect;
            break;
        case MEM_ALLOCS_SINCE_COLLECT:
            ret = interpreter->mem_allocs_since_last_collect;
            break;
        case TOTAL_COPIED:
            ret = interpreter->memory_collected;
            break;
        case IMPATIENT_PMCS:
            ret = interpreter->num_early_DOD_PMCs;
            break;
    }
    return ret;
}

/*

=item C<void
Parrot_compreg(Parrot_Interp interpreter, STRING *type, PMC *func)>

Register a parser/compiler function.

=cut

*/

void Parrot_compreg(Parrot_Interp interpreter, STRING *type, PMC *func)
{
    PMC *hash, *nci;
    PMC* iglobals = interpreter->iglobals;
    hash = VTABLE_get_pmc_keyed_int(interpreter, interpreter->iglobals,
            IGLOBALS_COMPREG_HASH);
    if (!hash) {
        hash = pmc_new_noinit(interpreter, enum_class_PerlHash);
        VTABLE_init(interpreter, hash);
        VTABLE_set_pmc_keyed_int(interpreter, iglobals,
                (INTVAL)IGLOBALS_COMPREG_HASH, hash);
    }
    nci = pmc_new(interpreter, enum_class_Compiler);
    VTABLE_set_pmc_keyed_str(interpreter, hash, type, nci);
    /* build native call interface fir the C sub in "func" */
    VTABLE_set_string_keyed(interpreter, nci, func,
            string_from_cstring(interpreter, "pIt", 0));
}

/*

=item C<static void setup_default_compreg(Parrot_Interp interpreter)>

Setup default compiler for PASM.

=cut

*/

static void setup_default_compreg(Parrot_Interp interpreter)
{
    STRING *pasm1 = string_from_cstring(interpreter, "PASM1", 0);

    Parrot_csub_t p = (Parrot_csub_t) PDB_compile;
    /* register the nci ccompiler object */
    Parrot_compreg(interpreter, pasm1, (PMC*)F2DPTR(p));
}

/*

=item C<INTVAL
sysinfo_i(Parrot_Interp interpreter, INTVAL info_wanted)>

Returns the system info.

C<info_wanted> is one of:

    PARROT_INTSIZE
    PARROT_FLOATSIZE
    PARROT_POINTERSIZE

In unknown info is requested then -1 is returned.

=cut

*/

INTVAL
sysinfo_i(Parrot_Interp interpreter, INTVAL info_wanted)
{
    switch (info_wanted) {
    case PARROT_INTSIZE:
        return sizeof(INTVAL);
    case PARROT_FLOATSIZE:
        return sizeof(FLOATVAL);
    case PARROT_POINTERSIZE:
        return sizeof(void *);
    default:
        return -1;
    }
}

/*

=item C<STRING *
sysinfo_s(Parrot_Interp interpreter, INTVAL info_wanted)>

Returns the system info string.

C<info_wanted> is one of:

    PARROT_OS
    PARROT_OS_VERSION
    PARROT_OS_VERSION_NUMBER
    CPU_ARCH
    CPU_TYPE

If unknown info is requested then and empty string is returned.

=cut

*/

STRING *
sysinfo_s(Parrot_Interp interpreter, INTVAL info_wanted)
{
    switch (info_wanted) {
    case PARROT_OS:
        return string_from_cstring(interpreter, BUILD_OS_NAME, 0);
    case PARROT_OS_VERSION:
    case PARROT_OS_VERSION_NUMBER:
    case CPU_ARCH:
    case CPU_TYPE:
    default:
        return string_from_cstring(interpreter, "", 0);
    }
}

/*

=back

=head2 Dynamic Loading Functions

=over 4

=cut

*/

static void dynop_register_xx(Parrot_Interp, PMC*, size_t, size_t,
        oplib_init_f init_func);
static void dynop_register_switch(Parrot_Interp, PMC*, size_t, size_t);

/*

=item C<void
dynop_register(Parrot_Interp interpreter, PMC* lib_pmc)>

Register a dynamic oplib.

=cut

*/

void
dynop_register(Parrot_Interp interpreter, PMC* lib_pmc)
{
    op_lib_t *lib, *core;
    oplib_init_f init_func;
    op_func_t *new_func_table, *new_evc_func_table;
    op_info_t *new_info_table;
    size_t i, n_old, n_new, n_tot;

    interpreter->all_op_libs = mem_sys_realloc(interpreter->all_op_libs,
            sizeof(op_lib_t *) * (interpreter->n_libs + 1));

    init_func = get_op_lib_init(0, 0, lib_pmc);
    lib = init_func(1);

    interpreter->all_op_libs[interpreter->n_libs++] = lib;
    /*
     * if we are registering an op_lib variant, called from below
     * the base names of this lib and the previous one are the same
     */
    if (interpreter->n_libs >= 2 &&
            !strcmp(interpreter->all_op_libs[interpreter->n_libs-2]->name,
                lib->name)) {
        /* registering is handled below */
        return;
    }
    /*
     * when called from yyparse, we have to set up the evc_func_table
     */
    setup_event_func_ptrs(interpreter);

    n_old = interpreter->op_count;
    n_new = lib->op_count;
    n_tot = n_old + n_new;
    core = PARROT_CORE_OPLIB_INIT(1);

    assert(interpreter->op_count == core->op_count);
    new_evc_func_table = mem_sys_realloc(interpreter->evc_func_table,
            sizeof (void *) * n_tot);
    if (core->flags & OP_FUNC_IS_ALLOCATED) {
        new_func_table = mem_sys_realloc(core->op_func_table,
                sizeof (void *) * n_tot);
        new_info_table = mem_sys_realloc(core->op_info_table,
                sizeof (op_info_t) * n_tot);
    }
    else {
        /*
         * allocate new op_func and info tables
         */
        new_func_table = mem_sys_allocate(sizeof (void *) * n_tot);
        new_info_table = mem_sys_allocate(sizeof (op_info_t) * n_tot);
        /* copy old */
        for (i = 0; i < n_old; ++i) {
            new_func_table[i] = interpreter->op_func_table[i];
            new_info_table[i] = interpreter->op_info_table[i];
        }
    }
    /* add new */
    for (i = n_old; i < n_tot; ++i) {
        new_func_table[i] = ((op_func_t*)lib->op_func_table)[i - n_old];
        new_info_table[i] = lib->op_info_table[i - n_old];
        /*
         * fill new ops of event checker func table
         * if we are running a different core, entries are
         * changed below
         */
        new_evc_func_table[i] =
            interpreter->op_func_table[CORE_OPS_check_events__];
    }
    interpreter->evc_func_table = new_evc_func_table;
    interpreter->save_func_table = new_func_table;
    /*
     * deinit core, so that it gets rehashed
     */
    (void) PARROT_CORE_OPLIB_INIT(0);
    /* set table */
    core->op_func_table = interpreter->op_func_table = new_func_table;
    core->op_info_table = interpreter->op_info_table = new_info_table;
    core->op_count = interpreter->op_count = n_tot;
    core->flags = OP_FUNC_IS_ALLOCATED | OP_INFO_IS_ALLOCATED;
    /* done for plain core */
#if defined HAVE_COMPUTED_GOTO
    dynop_register_xx(interpreter, lib_pmc, n_old, n_new,
            PARROT_CORE_CGP_OPLIB_INIT);
    dynop_register_xx(interpreter, lib_pmc, n_old, n_new,
            PARROT_CORE_CG_OPLIB_INIT);
#endif
    dynop_register_xx(interpreter, lib_pmc, n_old, n_new,
            PARROT_CORE_PREDEREF_OPLIB_INIT);
    dynop_register_switch(interpreter, lib_pmc, n_old, n_new);
}

/*

=item C<static void
dynop_register_xx(Parrot_Interp interpreter, PMC* lib_pmc,
        size_t n_old, size_t n_new, oplib_init_f init_func)>

Register C<op_lib> with other cores.

=cut

*/

static void
dynop_register_xx(Parrot_Interp interpreter, PMC* lib_pmc,
        size_t n_old, size_t n_new, oplib_init_f init_func)
{
    op_lib_t *cg_lib, *new_lib;
    void **ops_addr = NULL;
    size_t i, n_tot;
    STRING *op_variant;
    oplib_init_f new_init_func;
    PMC *lib_variant;

    n_tot = n_old + n_new;
    cg_lib = init_func(1);

    if (cg_lib->flags & OP_FUNC_IS_ALLOCATED) {
        ops_addr = mem_sys_realloc(cg_lib->op_func_table,
                n_tot * sizeof(void *));
    }
    else {
        ops_addr = mem_sys_allocate(n_tot * sizeof(void *));
        cg_lib->flags = OP_FUNC_IS_ALLOCATED;
        for (i = 0; i < n_old; ++i)
            ops_addr[i] = ((void **)cg_lib->op_func_table)[i];
    }
    /* check if the lib_pmc exists with a _xx flavor */
    new_init_func = get_op_lib_init(0, 0, lib_pmc);
    new_lib = new_init_func(1);
    op_variant = Parrot_sprintf_c(interpreter, "%s_ops%s",
            new_lib->name, cg_lib->suffix);
    lib_variant = Parrot_load_lib(interpreter, op_variant, NULL);
    if (lib_variant) {
        new_init_func = get_op_lib_init(0, 0, lib_variant);
        new_lib = new_init_func(1);
        for (i = n_old; i < n_tot; ++i)
            ops_addr[i] = ((void **)new_lib->op_func_table)[i - n_old];
        new_lib->op_func_table = (void *) ops_addr;
        new_lib->op_count = n_tot;
        new_init_func((long) ops_addr);
    }
    else {
        /* if not install wrappers */
        /* fill new entries with the wrapper op */
        for (i = n_old; i < n_tot; ++i)
            ops_addr[i] = ((void **)cg_lib->op_func_table)[CORE_OPS_wrapper__];
    }
    /*
     * if we are running this core, update event check ops
     */
    if ((int)interpreter->run_core == cg_lib->core_type) {
        for (i = n_old; i < n_tot; ++i)
            interpreter->evc_func_table[i] =
                (op_func_t)D2FPTR(ops_addr[CORE_OPS_check_events__]);
        interpreter->save_func_table = (void *) ops_addr;
    }
    /*
     * tell the cg_core about the new jump table
     */
    cg_lib->op_func_table = (void *) ops_addr;
    cg_lib->op_count = n_tot;
    init_func((long) ops_addr);
}

/*

=item C<static void
dynop_register_switch(Parrot_Interp interpreter, PMC* lib_pmc,
        size_t n_old, size_t n_new)>

Description.

=cut

*/

static void
dynop_register_switch(Parrot_Interp interpreter, PMC* lib_pmc,
        size_t n_old, size_t n_new)
{
    op_lib_t *lib = PARROT_CORE_SWITCH_OPLIB_INIT(1);
    lib->op_count = n_old + n_new;
}

/*

=item C<static void
notify_func_table(Parrot_Interp interpreter, void* table, int on)>

Tell the interpreter's running core about the new function table.

=cut

*/

static void
notify_func_table(Parrot_Interp interpreter, void* table, int on)
{
    oplib_init_f init_func = get_op_lib_init(1, interpreter->run_core, NULL);
    op_lib_t *lib = init_func(1);
    init_func((long) table);
    switch (interpreter->run_core) {
        case PARROT_SLOW_CORE:      /* normal func core */
        case PARROT_FAST_CORE:      /* normal func core */
            interpreter->op_func_table = table;
            break;
        case PARROT_PREDEREF_CORE:  /* predrefed cores except switch */
        case PARROT_CGP_CORE:
            turn_ev_check(interpreter, on);
            break;
        default:
            break;
    }
}

/*

=item C<void
disable_event_checking(Parrot_Interp interpreter)>

Restore old function table.

XXX This is only implemented for the function core at present.

=cut

*/

void
disable_event_checking(Parrot_Interp interpreter)
{
    /*
     * restore func table
     */
    notify_func_table(interpreter, interpreter->save_func_table, 0);
}

/*

=item C<void
enable_event_checking(Parrot_Interp interpreter)>

Replace func table with one that does event checking for all opcodes.

NOTE: C<enable_event_checking()> is called async by the event handler
thread. All action done from here has to be async safe.

XXX This is only implemented for the function core at present.

=cut

*/

void
enable_event_checking(Parrot_Interp interpreter)
{
    /*
     * put table in place
     */
    notify_func_table(interpreter, interpreter->evc_func_table, 1);
}

/*

=item C<void
enter_nci_method(Parrot_Interp interpreter, int type,
		 void *func, const char *name, const char *proto)>

Create an entry in the C<nci_method_table> for the given NCI method of PMC
class C<type>.

=cut

*/

void
enter_nci_method(Parrot_Interp interpreter, int type,
		 void *func, const char *name, const char *proto)
{
    PMC *method, *method_table, **table;
    int i;

    if (type >= (int)interpreter->nci_method_table_size) {
        if (!interpreter->nci_method_table_size) {
            table = interpreter->nci_method_table =
                mem_sys_allocate_zeroed((enum_class_max) * sizeof(PMC*));
            for (i = 0; i < enum_class_max; ++i)
                SET_NULL_P(table[i], PMC*);
            interpreter->nci_method_table_size = enum_class_max;
        }
        else {
            table = interpreter->nci_method_table =
                mem_sys_realloc(interpreter->nci_method_table,
                        (type + 1) * sizeof(PMC*));
            for (i = interpreter->nci_method_table_size; i < type + 1; ++i)
                table[i] = NULL;
            interpreter->nci_method_table_size = type + 1;
        }
    }
    else
        table = interpreter->nci_method_table;
    if (!table[type])
        table[type] = pmc_new(interpreter, enum_class_PerlHash);
    method_table = table[type];

    method = pmc_new(interpreter, enum_class_NCI);
    VTABLE_set_string_keyed(interpreter, method, func,
            string_make(interpreter, proto, strlen(proto),
                "iso-8859-1", PObj_constant_FLAG|PObj_external_FLAG));
    VTABLE_set_pmc_keyed_str(interpreter, method_table,
            string_make(interpreter, name,
                strlen(name), "iso-8859-1",
                PObj_constant_FLAG|PObj_external_FLAG),
            method);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>.

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
