/* interpreter.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The interpreter api handles running the operations
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
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

#define ATEXIT_DESTROY

#define PREDEREF_NORMAL         0
#define PREDEREF_FOR_CGP        1
#define PREDEREF_FOR_SWITCH     2

#if EXEC_CAPABLE
struct Parrot_Interp interpre;
#endif

static void setup_default_compreg(Parrot_Interp interpreter);

/*=for api interpreter load_oplib
 *
 * dynamically load an op_lib extension
 * returns dll handle on success, else 0
 *
 * TODO how do we run these ops
     */
#if 0
void *
load_oplib(struct Parrot_Interp * interpreter,
        const char *file, const char *init_func_name)
{
    void *handle = Parrot_dlopen(file);
    oplib_init_f init_func;
    op_lib_t *oplib;

    if (!handle)
        internal_exception(1, "Couldn't load oplib file '%s': %s\n",
                file, Parrot_dlerror());
    init_func =
        (oplib_init_f)(ptrcast_t)Parrot_dlsym(handle, init_func_name);
    if (!init_func)
        internal_exception(1, "Invalid oplib, '%s' not exported\n",
                init_func_name);
    oplib = init_func(1);
    /* XXX now what
     * if oplib is a prederefed oplib, and matches the current
     * oplib, we would run it */
    return handle;
}
#endif

/*=for api interpreter unload_oplib
 *
 * unload op_lib extension
     */
#if 0
void
unload_oplib(void *handle)
{
    Parrot_dlclose(handle);
}
#endif


/*=for api interpreter prederef
 *
 * Predereference the current opcode. Note that this function has the
 * same signature as a prederef opfunc. This is important because the
 * prederef code chunk is pre-initialized with pointers to this
 * function, so that as ops that have not yet been predereferenced are
 * encountered, execution is automatically vectored here so the
 * predereferencing can be performed. Since this function returns the
 * same pc_prederef it was passed, the runops loop will re-execute
 * the same location, which will then have the pointer to the real
 * prederef opfunc and prederef args.
 *
 * The initial few lines of pointer arithmetic are used to determine
 * the index into the bytecode corresponding to the currect pc_prederef.
 * The bytecode and prederef arrays have the same number of elements
 * since there is a one-to-one mapping.
 */

static void **
prederef(void **pc_prederef, struct Parrot_Interp *interpreter)
{
    size_t offset = pc_prederef - interpreter->prederef_code;
    opcode_t *pc = ((opcode_t *)interpreter->code->byte_code) + offset;
    op_info_t *opinfo = &interpreter->op_info_table[*pc];
    op_func_t *prederef_op_func = interpreter->op_lib->op_func_table;
    int i;

    for (i = 0; i < opinfo->arg_count; i++) {
        switch (opinfo->types[i]) {
        case PARROT_ARG_OP:
            pc_prederef[i] = (void *)(ptrcast_t)prederef_op_func[pc[i]];
            break;

        case PARROT_ARG_KI:
        case PARROT_ARG_I:
            pc_prederef[i] = (void *)&interpreter->int_reg.registers[pc[i]];
            break;

        case PARROT_ARG_N:
            pc_prederef[i] = (void *)&interpreter->num_reg.registers[pc[i]];
            break;

        case PARROT_ARG_K:
        case PARROT_ARG_P:
            pc_prederef[i] = (void *)&interpreter->pmc_reg.registers[pc[i]];
            break;

        case PARROT_ARG_S:
            pc_prederef[i] =
                (void *)&interpreter->string_reg.registers[pc[i]];
            break;

        case PARROT_ARG_KIC:
        case PARROT_ARG_IC:
            pc_prederef[i] = (void *)&pc[i];
            break;

        case PARROT_ARG_NC:
            pc_prederef[i] = (void *)
                &interpreter->code->const_table->constants[pc[i]]->u.number;
            break;

        case PARROT_ARG_PC:
/*        pc_prederef[i] = (void *)
                 &interpreter->code->const_table->constants[pc[i]]->pmc; */
            internal_exception(ARG_OP_NOT_HANDLED,
                               "PMC constants not yet supported!\n");
            break;

        case PARROT_ARG_SC:
            pc_prederef[i] = (void *)
                &interpreter->code->const_table->constants[pc[i]]->u.string;
            break;

        case PARROT_ARG_KC:
            pc_prederef[i] = (void *)
                &interpreter->code->const_table->constants[pc[i]]->u.key;
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

    return pc_prederef;
}

/*=for api interpreter init_prederef
 *
 * interpreter->op_lib = prederefed oplib
 *
 * the "normal" op_lib has a copy in the interpreter structure
 * - but get the op_code lookup function from standard core
 *   prederef has no op_info_table
 */
static void
init_prederef(struct Parrot_Interp *interpreter, int cgp)
{
#ifdef HAVE_COMPUTED_GOTO
    oplib_init_f init_func = cgp ?
        PARROT_CORE_CGP_OPLIB_INIT :
        PARROT_CORE_PREDEREF_OPLIB_INIT;
#else
    oplib_init_f init_func = PARROT_CORE_PREDEREF_OPLIB_INIT;
    UNUSED(cgp);
#endif
    interpreter->op_lib = init_func(1);
    interpreter->op_lib->op_code = PARROT_CORE_OPLIB_INIT(1)->op_code;
    if (interpreter->op_lib->op_count != interpreter->op_count)
        internal_exception(PREDEREF_LOAD_ERROR,
                "Illegal op count (%d) in prederef oplib\n",
                (int)interpreter->op_lib->op_count);
    if (!interpreter->prederef_code) {
        size_t N = interpreter->code->cur_cs->base.size;
        size_t i;
/* Parrot_memalign_if_possible in OpenBSD allocates 256 if you ask for 312 */
#if 1
        void **temp = (void **)mem_sys_allocate_zeroed(N * sizeof(void *));
#else
        void **temp = (void **)Parrot_memalign_if_possible(256,
                N * sizeof(void *));
#endif

        for (i = 0; i < N; i++) {
            temp[i] = (void *)(ptrcast_t)prederef;
        }

        interpreter->prederef_code = temp;
        interpreter->code->cur_cs->prederef_code = temp;
        if (cgp == PREDEREF_FOR_SWITCH) {
            opcode_t *pc = interpreter->code->cur_cs->base.data;
            size_t n;
            for (i = 0; i < N; ) {
                prederef(temp, interpreter);
                *temp = (void**) *pc;
                n = interpreter->op_info_table[*pc].arg_count;
                pc += n;
                i += n;
                temp += n;
            }
        }
#ifdef HAVE_COMPUTED_GOTO
        if (cgp == PREDEREF_FOR_CGP) {
            opcode_t *pc = interpreter->code->cur_cs->base.data;
            size_t n;
            for (i = 0; i < N; ) {
                prederef(temp, interpreter);
                *temp = ((void**)(interpreter->op_lib->op_func_table)) [*pc];
                n = interpreter->op_info_table[*pc].arg_count;
                pc += n;
                i += n;
                temp += n;
            }
        }
#endif
    }
}

/*=for api interpreter stop_prederef
 *
 * Unload the prederef oplib.
 */

static void
stop_prederef(struct Parrot_Interp *interpreter)
{
    (void) PARROT_CORE_PREDEREF_OPLIB_INIT(0);
}

#if EXEC_CAPABLE
static void **
exec_prederef(void **pc_prederef, struct Parrot_Interp *interpreter)
{
    size_t offset = pc_prederef - interpreter->prederef_code;
    opcode_t *pc = ((opcode_t *)interpreter->code->byte_code) + offset;
    op_info_t *opinfo = &interpreter->op_info_table[*pc];
    op_func_t *prederef_op_func = interpreter->op_lib->op_func_table;
    int i;

    for (i = 0; i < opinfo->arg_count; i++) {
        switch (opinfo->types[i]) {
        case PARROT_ARG_OP:
            if ((int)pc_prederef[i] == 1)
                pc_prederef[i] = ((op_func_t*)interpreter->op_lib->op_func_table)[2];
            else
                pc_prederef[i] = (void *)(ptrcast_t)prederef_op_func[pc[i]];
            break;

        case PARROT_ARG_KI:
        case PARROT_ARG_I:
            pc_prederef[i] = (void *)&interpreter->int_reg.registers[pc[i]];
            break;

        case PARROT_ARG_N:
            pc_prederef[i] = (void *)&interpreter->num_reg.registers[pc[i]];
            break;

        case PARROT_ARG_K:
        case PARROT_ARG_P:
            pc_prederef[i] = (void *)&interpreter->pmc_reg.registers[pc[i]];
            break;

        case PARROT_ARG_S:
            pc_prederef[i] =
                (void *)&interpreter->string_reg.registers[pc[i]];
            break;

        case PARROT_ARG_KIC:
        case PARROT_ARG_IC:
            pc_prederef[i] = (void *)&pc[i];
            break;

        case PARROT_ARG_NC:
            pc_prederef[i] = (void *)
                &interpreter->code->const_table->constants[pc[i]]->u.number;
            break;

        case PARROT_ARG_PC:
/*        pc_prederef[i] = (void *)
                 &interpreter->code->const_table->constants[pc[i]]->pmc; */
            internal_exception(ARG_OP_NOT_HANDLED,
                               "PMC constants not yet supported!\n");
            break;

        case PARROT_ARG_SC:
            pc_prederef[i] = (void *)
                &interpreter->code->const_table->constants[pc[i]]->u.string;
            break;

        case PARROT_ARG_KC:
            pc_prederef[i] = (void *)
                &interpreter->code->const_table->constants[pc[i]]->u.key;
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

    return pc_prederef;
}

/*=for api interpreter init_prederef
 *
 * interpreter->op_lib = prederefed oplib
 *
 * the "normal" op_lib has a copy in the interpreter structure
 * - but get the op_code lookup function from standard core
 *   prederef has no op_info_table
 */
void
exec_init_prederef(struct Parrot_Interp *interpreter, void *prederef_arena)
{
#if HAVE_COMPUTED_GOTO
    oplib_init_f init_func = PARROT_CORE_CGP_OPLIB_INIT;
#else  /* HAVE_COMPUTED_GOTO */
    oplib_init_f init_func = PARROT_CORE_OPLIB_INIT;
#endif /* HAVE_COMPUTED_GOTO */

    interpreter->op_lib = init_func(1);
    interpreter->op_lib->op_code = PARROT_CORE_OPLIB_INIT(1)->op_code;
    if (interpreter->op_lib->op_count != interpreter->op_count)
        internal_exception(PREDEREF_LOAD_ERROR,
                "Illegal op count (%d) in prederef oplib\n",
                (int)interpreter->op_lib->op_count);
    if (!interpreter->prederef_code) {
        size_t N = interpreter->code->cur_cs->base.size;
        size_t i;
        size_t n;
        void **temp = prederef_arena;
        opcode_t *pc = interpreter->code->cur_cs->base.data;

        for (i = 0; i < N; i++)
            if (temp[i])
                temp[i] = (void *)1;
            else
                temp[i] = (void *)(ptrcast_t)exec_prederef;

        interpreter->prederef_code = temp;
        interpreter->code->cur_cs->prederef_code = temp;
        for (i = 0; i < N; ) {
            exec_prederef(temp, interpreter);
            n = interpreter->op_info_table[*pc].arg_count;
            pc += n;
            i += n;
            temp += n;
        }
    }
}
#endif

static opcode_t *
runops_jit(struct Parrot_Interp *interpreter, opcode_t *pc)
{
#if JIT_CAPABLE
    opcode_t *code_start;
    UINTVAL code_size;          /* in opcodes */
    opcode_t *code_end;
    jit_f jit_code;

    code_start = interpreter->code->byte_code;
    code_size = interpreter->code->cur_cs->base.size;
    code_end = interpreter->code->byte_code + code_size;
#  ifdef HAVE_COMPUTED_GOTO
#    ifdef __GNUC__
#      ifdef PARROT_I386
    init_prederef(interpreter, PREDEREF_FOR_CGP);
#      endif
#    endif
#  endif

    jit_code = build_asm(interpreter, pc, code_start, code_end, NULL);
    interpreter->code->cur_cs->jit_info = interpreter->jit_info;
    (jit_code) (interpreter, pc);
#endif
    return NULL;
}

static opcode_t *
runops_exec(struct Parrot_Interp *interpreter, opcode_t *pc)
{
#if EXEC_CAPABLE
    opcode_t *code_start;
    UINTVAL code_size;          /* in opcodes */
    opcode_t *code_end;
    extern int Parrot_exec_run;

    code_start = interpreter->code->byte_code;
    code_size = interpreter->code->cur_cs->base.size;
    code_end = interpreter->code->byte_code + code_size;
#  ifdef HAVE_COMPUTED_GOTO
#    ifdef __GNUC__
#      ifdef PARROT_I386
    init_prederef(interpreter, PREDEREF_FOR_CGP);
#      endif
#    endif
#  endif
    if (Parrot_exec_run == 2) {
        Parrot_exec_run = 0;
        Interp_flags_CLEAR(interpreter, PARROT_EXEC_FLAG);
        runops_jit(interpreter, pc);
        Interp_flags_SET(interpreter, PARROT_EXEC_FLAG);
    }
    else if (Parrot_exec_run == 1) {
        Parrot_exec(interpreter, pc, code_start, code_end);
    }
    else
        run_native(interpreter, pc, code_start);

#endif
    return NULL;
}


/*=for api interpreter runops_prederef
 *
 * This runops core is used when we are in prederef mode. It works
 * just like the basic fast core, except it uses pc_prederef instead
 * of pc, and calls prederef opfuncs instead of regular opfuncs.
 *
 * There is code after the main while loop to resynchronize pc with
 * pc_prederef in case we have exited the loop under restart
 * conditions (such as with interpreter flag changing ops).
 *
 * TODO: The calls to init_prederef() and stop_prederef() would be
 * best placed elsewhere, since we would re-pay the costs of loading
 * the prederef oplib every time we dropped out of and back into
 * this core. For now, however, this implementation should do fine.
 * Since dropping out of and back into cores is expected to be rare
 * (at the time of implementation that only occurs for interpreter
 * flag changing ops).
 */
static opcode_t *
runops_prederef(struct Parrot_Interp *interpreter, opcode_t *pc)
{
    opcode_t *code_start = (opcode_t *)interpreter->code->byte_code;
    void **pc_prederef;

    init_prederef(interpreter, PREDEREF_NORMAL);
    pc_prederef = interpreter->prederef_code + (pc - code_start);

    while (pc_prederef) {
        pc_prederef =
            ((op_func_prederef_t)(ptrcast_t)*pc_prederef) (pc_prederef,
                                                           interpreter);
    }

    stop_prederef(interpreter);
    return 0;
}

static opcode_t *
runops_cgp(struct Parrot_Interp *interpreter, opcode_t *pc)
{
#ifdef HAVE_COMPUTED_GOTO
    opcode_t *code_start = (opcode_t *)interpreter->code->byte_code;
    void **pc_prederef;
    init_prederef(interpreter, PREDEREF_FOR_CGP);
    pc_prederef = interpreter->prederef_code + (pc - code_start);
    pc = cgp_core((opcode_t*)pc_prederef, interpreter);
    return pc;
#else
    PIO_eprintf(interpreter,
            "Computed goto unavailable in this configuration.\n");
    Parrot_exit(1);
    return NULL;
#endif
}

static opcode_t *
runops_switch(struct Parrot_Interp *interpreter, opcode_t *pc)
{
    opcode_t *code_start = (opcode_t *)interpreter->code->byte_code;
    void **pc_prederef;
    init_prederef(interpreter, PREDEREF_FOR_SWITCH);
    pc_prederef = interpreter->prederef_code + (pc - code_start);
    pc = switch_core((opcode_t*)pc_prederef, interpreter);
    return pc;
}

/*=for api interpreter runops
 * run parrot operations of loaded code segment until an end opcode is reached
 * run core is selected depending on the Interp_flags
 * when a restart opcode is encountered a different core my be selected
 * and evaluation of opcode continues
 */
void
runops_int(struct Parrot_Interp *interpreter, size_t offset)
{
    int lo_var_ptr;
    opcode_t *(*core) (struct Parrot_Interp *, opcode_t *);

    interpreter->resume_offset = offset;
    interpreter->resume_flag = 1;

    while (interpreter->resume_flag & 1) {
        unsigned int slow;
        opcode_t *pc = (opcode_t *)
            interpreter->code->byte_code + interpreter->resume_offset;

        interpreter->lo_var_ptr = (void *)&lo_var_ptr;
        interpreter->resume_offset = 0;
        interpreter->resume_flag = 0;

        slow = Interp_flags_TEST(interpreter, (PARROT_BOUNDS_FLAG |
                    PARROT_PROFILE_FLAG |
                    PARROT_TRACE_FLAG));

        if (slow) {
            core = runops_slow_core;

            if (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
                if (interpreter->profile == NULL) {
                    interpreter->profile = (RunProfile *)
                        mem_sys_allocate(sizeof(RunProfile));
                    interpreter->profile->data = (ProfData *)
                        mem_sys_allocate_zeroed((interpreter->op_count +
                                    PARROT_PROF_EXTRA) * sizeof(ProfData));
                }
            }
        }
        /* CGOTO is set per default, so test other cores first */
        else if (Interp_flags_TEST(interpreter, PARROT_SWITCH_FLAG)) {
            core = runops_switch;
        }
        else if (Interp_flags_TEST(interpreter, PARROT_PREDEREF_FLAG)) {
            if  (Interp_flags_TEST(interpreter, PARROT_CGOTO_FLAG))
                core = runops_cgp;
            else
                core = runops_prederef;
        }
        else if (Interp_flags_TEST(interpreter, PARROT_JIT_FLAG)) {
#if !JIT_CAPABLE
            internal_exception(JIT_UNAVAILABLE,
                    "Error: PARROT_JIT_FLAG is set, "
                    "but interpreter is not JIT_CAPABLE!\n");
#endif
            core = runops_jit;
        }
        else if (Interp_flags_TEST(interpreter, PARROT_EXEC_FLAG)) {
#if !EXEC_CAPABLE
            internal_exception(EXEC_UNAVAILABLE,
                    "Error: PARROT_EXEC_FLAG is set, "
                    "but interpreter is not EXEC_CAPABLE!\n");
#endif
            core = runops_exec;
        }
        else if (Interp_flags_TEST(interpreter, PARROT_CGOTO_FLAG)) {
            core = runops_cgoto_core;
            /* clear stacktop, it gets set in runops_cgoto_core beyond the
             * opfunc table again, if the compiler supports nested funcs
             */
/* #ifdef HAVE_NESTED_FUNC */
#ifdef __GNUC__
            interpreter->lo_var_ptr = 0;
#endif
        }
        else
            core = runops_fast_core;


        /* run it finally */
        core(interpreter, pc);
        /* if we have fallen out with resume and we were running CGOTO, set
         * the stacktop again to a sane value, so that restarting the runloop
         * is ok.
         */
        interpreter->lo_var_ptr = (void *)&lo_var_ptr;
        if ((interpreter->resume_flag & 1) &&
                (int)interpreter->resume_offset < 0)
                internal_exception(1, "branch_cs: illegal resume offset");
    }
}

static void
runops_ex(struct Parrot_Interp *interpreter, size_t offset)
{
    interpreter->resume_flag = 2;

    while (interpreter->resume_flag & 2) {
        interpreter->resume_flag = 0;
        runops_int(interpreter, offset);

        if (interpreter->resume_flag & 2) {
            /* inter segment jump
             * resume_offset = entry of name in current const_table
             */
            struct PackFile_Constant * c;
            struct PackFile_FixupEntry *fe;
            struct PackFile *pf = interpreter->code;
            char *s;

            if ((int)interpreter->resume_offset >= PF_NCONST(pf) ||
                (int)interpreter->resume_offset < 0)
                internal_exception(1, "branch_cs: illegal resume offset");
            c = PF_CONST(pf, interpreter->resume_offset);
            if (c->type != PFC_STRING)
                internal_exception(1, "branch_cs: not a string\n");
            s = c->u.string->strstart;
            fe = PackFile_find_fixup_entry(interpreter, enum_fixup_label, s);
            if (!fe)
                internal_exception(1, "branch_cs: fixup not found\n");
            offset = fe->offset;
            Parrot_switch_to_cs(interpreter, fe->seg);
            if (Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG)) {
                PIO_eprintf(interpreter, "*** Resume at seg %s ofs %d\n",
                        fe->seg->base.name, (int)offset);
            }
        }
    }
}

#ifdef PARROT_HAS_HEADER_SETJMP
/* XXX s. exception.c */
extern Parrot_exception the_exception;
#endif
void
runops(struct Parrot_Interp *interpreter, size_t offset)
{
#ifdef PARROT_HAS_HEADER_SETJMP
    if (setjmp(the_exception.destination)) {
        /* an exception was thrown */
        offset = handle_exception(interpreter);
    }
    if (interpreter->profile &&
            interpreter->cur_pc == (opcode_t*)&interpreter->op_count &&
            Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
        interpreter->profile->data[*interpreter->cur_pc].time +=
            Parrot_floatval_time() - interpreter->profile->starttime;
    }
#endif
    runops_ex(interpreter, offset);
    /*
     * not yet - this needs classifying of exceptions and handlers
     * so that only an exit handler does catch this exception
     */
#if 0
    do_exception(EXCEPT_exit, 0);
#endif
}

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

void Parrot_really_destroy(int exit_code, void *interpreter);

/*=for api interpreter make_interpreter
 *  Create the Parrot interpreter.  Allocate memory and clear the registers.
 */

struct Parrot_Interp *
make_interpreter(Interp_flags flags)
{
    struct Parrot_Interp *interpreter;
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

    /* must be set after if this is not the first interpreter */
    SET_NULL(interpreter->parent_interpreter);

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

    /* initialize classes */
    Parrot_init(interpreter);

    /* Need an empty stash */
    interpreter->perl_stash = mem_sys_allocate(sizeof(struct Stash));
    interpreter->perl_stash->stash_hash =
        pmc_new(interpreter, enum_class_PerlHash);
    interpreter->perl_stash->parent_stash = NULL;

    /* context data */
    /* Initialize interpreter's flags */
    interpreter->ctx.warns = new_buffer_header(interpreter);
    Parrot_allocate(interpreter, interpreter->ctx.warns,
        sizeof(struct warnings_t));
    PARROT_WARNINGS_off(interpreter, PARROT_WARNINGS_ALL_FLAG);

    /* Set up the initial register chunks */
    interpreter->ctx.int_reg_top =
        mem_sys_allocate_zeroed(sizeof(struct IRegChunk));
    interpreter->ctx.num_reg_top =
        mem_sys_allocate_zeroed(sizeof(struct NRegChunk));
    interpreter->ctx.string_reg_top =
        mem_sys_allocate_zeroed(sizeof(struct SRegChunk));
    interpreter->ctx.pmc_reg_top =
        mem_sys_allocate_zeroed(sizeof(struct PRegChunk));

    /* Set up the MMD struct */
    interpreter->binop_mmd_funcs =
        mem_sys_allocate_zeroed(sizeof(struct MMD_table));
    /* Go and init the MMD tables */
    register_fallback_methods(interpreter);

    /* the SET_NULL macros are only for systems where a NULL pointer
     * isn't represented by zeroes, so don't use these for resetting
     * non-null pointers
     */
    SET_NULL(interpreter->ctx.int_reg_top->next);
    SET_NULL(interpreter->ctx.int_reg_top->prev);
    SET_NULL(interpreter->ctx.num_reg_top->next);
    SET_NULL(interpreter->ctx.num_reg_top->prev);
    SET_NULL(interpreter->ctx.string_reg_top->next);
    SET_NULL(interpreter->ctx.string_reg_top->prev);
    SET_NULL(interpreter->ctx.pmc_reg_top->next);
    SET_NULL(interpreter->ctx.pmc_reg_top->prev);

    Parrot_clear_s(interpreter);
    Parrot_clear_p(interpreter);

    stack_system_init(interpreter);
    /* Stack for lexical pads */
    interpreter->ctx.pad_stack = new_stack(interpreter, "Pad");

    /* Need a user stack */
    interpreter->ctx.user_stack = new_stack(interpreter, "User");

    /* And a control stack */
    interpreter->ctx.control_stack = new_stack(interpreter, "Control");

    /* A regex stack would be nice too. */
    interpreter->ctx.intstack = intstack_new(interpreter);

    /* Load the core op func and info tables */
    interpreter->op_lib = PARROT_CORE_OPLIB_INIT(1);
    interpreter->op_count = interpreter->op_lib->op_count;
    interpreter->op_func_table = interpreter->op_lib->op_func_table;
    interpreter->op_info_table = interpreter->op_lib->op_info_table;

    /* Set up defaults for line/package/file */
    interpreter->current_file =
        string_make(interpreter, "(unknown file)", 14, NULL, 0, NULL);
    interpreter->current_package =
        string_make(interpreter, "(unknown package)", 18, NULL, 0, NULL);;

    SET_NULL_P(interpreter->code, struct PackFile *);
    SET_NULL_P(interpreter->profile, ProfData *);

    /* next two are pointers to the real thing in the current code seg */
    SET_NULL_P(interpreter->prederef_code, void **);
    SET_NULL(interpreter->jit_info);

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

    /* all sys running, init the signal stuff */
    Parrot_init_signals();

#ifdef ATEXIT_DESTROY
    Parrot_on_exit(Parrot_really_destroy, (void*)interpreter);
#endif

    return interpreter;
}
void
Parrot_destroy(struct Parrot_Interp *interpreter)
{
#ifdef ATEXIT_DESTROY
    UNUSED(interpreter);
#else
    Parrot_really_destroy(0, (void*) interpreter);
#endif
}

void
Parrot_really_destroy(int exit_code, void *vinterp)
{
    int i;
    Interp *interpreter = (Interp*) vinterp;
    struct Stash *stash, *next_stash;

    UNUSED(exit_code);
    /* if something needs timely destruction (e.g. closing PIOs)
     * we must destroy it now:
     * no DOD run, so everything is considered dead
     */

    /* XXX boe: This hack explicitly marks the piodata, these filehandles
     *          need to be open until PIO_finish is called
     */
    Parrot_IOData_mark(interpreter, interpreter->piodata);

    if (interpreter->has_early_DOD_PMCs)
        free_unused_pobjects(interpreter, interpreter->arena_base->pmc_pool);

    /* we destroy all child interpreters and the last one too,
     * if the --leak-test commandline was given
     */

    /* Now the PIOData gets also cleared */
    PIO_finish(interpreter);

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
    stash = interpreter->perl_stash;
    while (stash) {
        next_stash = stash->parent_stash;
        mem_sys_free(stash);
        stash = next_stash;
    }
    /* free vtables */
    for (i = 1; i < (int)enum_class_max; i++)
        Parrot_destroy_vtable(interpreter, Parrot_base_vtables[i]);

    if (interpreter->profile)
        mem_sys_free(interpreter->profile);

    /* deinit op_lib */
    (void) PARROT_CORE_OPLIB_INIT(0);

    /* XXX move this to register.c */
    {
        struct IRegChunk *stacks[4];
        struct IRegChunk *top, *next;
        stacks[0] = interpreter->ctx.int_reg_top;
        stacks[1] = (struct IRegChunk*) interpreter->ctx.num_reg_top;
        stacks[2] = (struct IRegChunk*) interpreter->ctx.string_reg_top;
        stacks[3] = (struct IRegChunk*) interpreter->ctx.pmc_reg_top;
        for (i = 0; i< 4; i++) {
            top = stacks[i];
            for (; top ; ) {
                next = top->next;
                mem_sys_free(top);
                top = next;
            }
        }
    }

    stack_destroy(interpreter->ctx.pad_stack);
    stack_destroy(interpreter->ctx.user_stack);
    stack_destroy(interpreter->ctx.control_stack);
    /* intstack */
    intstack_free(interpreter, interpreter->ctx.intstack);

    /* chartype, encodings */
    chartype_destroy();
    encoding_destroy();

    mem_sys_free(interpreter);
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
INTVAL
interpinfo(struct Parrot_Interp *interpreter, INTVAL what)
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
    }
    return ret;
}

/*=for api interpreter Parrot_compreg
 * register a parser/compiler function
 */

void Parrot_compreg(Parrot_Interp interpreter, STRING *type, PMC *func)
{
    PMC* key, *hash, *nci;
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
    key = key_new_string(interpreter, type);
    VTABLE_set_pmc_keyed(interpreter, hash, key, nci);
    /* build native call interface fir the C sub in "func" */
    VTABLE_set_string_keyed(interpreter, nci, func,
            string_from_cstring(interpreter, "pIt", 0));
}


static void setup_default_compreg(Parrot_Interp interpreter)
{
    STRING *pasm1 = string_from_cstring(interpreter, "PASM1", 0);

    Parrot_csub_t p = (Parrot_csub_t) PDB_compile;
    /* register the nci ccompiler object */
    Parrot_compreg(interpreter, pasm1, (PMC*)F2DPTR(p));
}

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
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
