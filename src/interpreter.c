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

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>, F<src/inter_cb.c>, F<src/inter_create.c>,
 F<src/inter_misc.c>, F<src/inter_run.c>.

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
