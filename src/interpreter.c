/* interpreter.c
 *  Copyright: (When this is determined...it will go here)
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
#include "parrot/runops_cores.h"
#ifdef HAS_JIT
#  include "parrot/jit.h"
#endif
#ifdef HAVE_COMPUTED_GOTO
#  include "parrot/oplib/core_ops_cg.h"
#endif

extern op_lib_t *PARROT_CORE_PREDEREF_OPLIB_INIT(void);


/*=for api interpreter runops_generic
 * TODO: Not really part of the API, but here's the docs.
 * Generic runops, which takes a function pointer for the core.
 */
static void
runops_generic(opcode_t *(*core) (struct Parrot_Interp *, opcode_t *),
               struct Parrot_Interp *interpreter, opcode_t *pc)
{
    opcode_t *code_start;
    UINTVAL code_size;          /* in opcodes */
    opcode_t *code_end;

    code_start = interpreter->code->byte_code;
    code_size = interpreter->code->byte_code_size / sizeof(opcode_t);
    code_end = interpreter->code->byte_code + code_size;

    pc = core(interpreter, pc);

    if (pc && (pc < code_start || pc >= code_end)) {
        internal_exception(INTERP_ERROR,
                           "Error: Control left bounds of byte-code block (now at location %d)!\n",
                           (int)(pc - code_start));
    }
}

/*=for api interpreter init_prederef
 *
 * interpreter->op_lib = prederefed oplib
 *
 * the "normal" op_lib has a copy in the interpreter structure
 */
static void
init_prederef(struct Parrot_Interp *interpreter)
{

    interpreter->op_lib = PARROT_CORE_PREDEREF_OPLIB_INIT();
    if (interpreter->op_lib->op_count != interpreter->op_count)
        internal_exception(PREDEREF_LOAD_ERROR,
                           "Illegal op count (%d) in prederef oplib\n",
                           (int)interpreter->op_lib->op_count);
}

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
        internal_exception(1, "Could't load oplib file '%s': %s\n",
                file, Parrot_dlerror());
    init_func =
        (oplib_init_f)(ptrcast_t)Parrot_dlsym(handle, init_func_name);
    if (!init_func)
        internal_exception(1, "Invalid oplib, '%s' not exported\n",
                init_func_name);
    oplib = init_func();
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
/*=for api interpreter stop_prederef
 *
 * Unload the prederef oplib.
 */

static void
stop_prederef(struct Parrot_Interp *interpreter)
{
    interpreter->op_lib = PARROT_CORE_OPLIB_INIT();
}

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
    op_info_t *opinfo = &interpreter->op_lib->op_info_table[*pc];
    op_func_t *prederef_op_func = interpreter->op_lib->op_func_table;
    int i;

    for (i = 0; i < opinfo->arg_count; i++) {
        switch (opinfo->types[i]) {
        case PARROT_ARG_OP:
            pc_prederef[i] = (void *)(ptrcast_t)prederef_op_func[pc[i]];
            break;

        case PARROT_ARG_KI:
        case PARROT_ARG_I:
            pc_prederef[i] = (void *)&interpreter->ctx.int_reg.registers[pc[i]];
            break;

        case PARROT_ARG_N:
            pc_prederef[i] = (void *)&interpreter->ctx.num_reg.registers[pc[i]];
            break;

        case PARROT_ARG_P:
            pc_prederef[i] = (void *)&interpreter->ctx.pmc_reg.registers[pc[i]];
            break;

        case PARROT_ARG_S:
            pc_prederef[i] = (void *)&interpreter->ctx.string_reg.registers[pc[i]];
            break;

        case PARROT_ARG_KIC:
        case PARROT_ARG_IC:
            pc_prederef[i] = (void *)&pc[i];
            break;

        case PARROT_ARG_NC:
            pc_prederef[i] = (void *)
                &interpreter->code->const_table->constants[pc[i]]->number;
            break;

        case PARROT_ARG_PC:
/*        pc_prederef[i] = (void *)
                 &interpreter->code->const_table->constants[pc[i]]->pmc; */
            internal_exception(ARG_OP_NOT_HANDLED,
                               "PMC constants not yet supported!\n");
            break;

        case PARROT_ARG_SC:
            pc_prederef[i] = (void *)
                &interpreter->code->const_table->constants[pc[i]]->string;
            break;

        case PARROT_ARG_KC:
            pc_prederef[i] = (void *)
                &interpreter->code->const_table->constants[pc[i]]->key;
            break;
        default:
            internal_exception(ARG_OP_NOT_HANDLED,
                               "Unhandled argtype %d\n",opinfo->types[i]);
            break;
        }

        if (opinfo->types[i] != PARROT_ARG_IC && pc_prederef[i] == 0) {
            internal_exception(INTERP_ERROR,
                               "Prederef generated a NULL pointer for arg of type %d!\n",
                               opinfo->types[i]);
        }
    }

    return pc_prederef;
}


/*=for api interpreter runops_jit
 */
static void
runops_jit(struct Parrot_Interp *interpreter, opcode_t *pc)
{
#ifdef HAS_JIT
    opcode_t *code_start;
    UINTVAL code_size;          /* in opcodes */
    opcode_t *code_end;
    jit_f jit_code;

    code_start = interpreter->code->byte_code;
    code_size = interpreter->code->byte_code_size / sizeof(opcode_t);
    code_end = interpreter->code->byte_code + code_size;

    jit_code = build_asm(interpreter, pc, code_start, code_end);
    (jit_code) (interpreter);
    /* if we fall out of runloop with restart, there is
     * currently no way, to continue in JIT, so stop it
     *
     * This is borken too, but better as endless loops
     */
    Interp_flags_CLEAR(interpreter, PARROT_JIT_FLAG);
#endif
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
static void
runops_prederef(struct Parrot_Interp *interpreter, opcode_t *pc,
                void **pc_prederef)
{
    opcode_t *code_start;
    UINTVAL code_size;          /* in opcodes */
    opcode_t *code_end;
    void **code_start_prederef;

    code_start = interpreter->code->byte_code;
    code_size = interpreter->code->byte_code_size / sizeof(opcode_t);
    code_end = interpreter->code->byte_code + code_size;

    code_start_prederef = pc_prederef;

    init_prederef(interpreter);

    while (pc_prederef) {
        pc_prederef =
            ((op_func_prederef_t)(ptrcast_t)*pc_prederef) (pc_prederef,
                                                           interpreter);
    }

    stop_prederef(interpreter);

    if (pc_prederef == 0) {
        pc = 0;
    }
    else {
        pc = code_start + (pc_prederef - code_start_prederef);
    }

    if (pc && (pc < code_start || pc >= code_end)) {
        internal_exception(INTERP_ERROR,
                           "Error: Control left bounds of byte-code block (now at location %d)!\n",
                           (int)(pc - code_start));
    }
}


/*=for api interpreter runops
 * run parrot operations until the program is complete
 */
void
runops(struct Parrot_Interp *interpreter, struct PackFile *code, size_t offset)
{
    opcode_t *(*core) (struct Parrot_Interp *, opcode_t *);

    interpreter->code = code;
    interpreter->resume_offset = offset;
    interpreter->resume_flag = 1;
    
    while (interpreter->resume_flag) {
        unsigned int which = 0;
        opcode_t *pc = (opcode_t *)
            interpreter->code->byte_code + interpreter->resume_offset;

        interpreter->resume_offset = 0;
        interpreter->resume_flag = 0;

        which |= (Interp_flags_TEST(interpreter, PARROT_BOUNDS_FLAG))  ? 0x01 : 0x00;
        which |= (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) ? 0x02 : 0x00;
        which |= (Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG))   ? 0x04 : 0x00;

        if (which)
            core = runops_slow_core;
        else if (Interp_flags_TEST(interpreter, PARROT_CGOTO_FLAG))
            core = runops_cgoto_core;
        else
            core = runops_fast_core;

        if (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
            unsigned int i;

            if (interpreter->profile == NULL) {
                interpreter->profile = (ProfData *)
                    mem_sys_allocate(interpreter->op_count * sizeof(ProfData));
            }

            for (i = 0; i < interpreter->op_count; i++) {
                interpreter->profile[i].numcalls = 0;
                interpreter->profile[i].time = 0.0;
            }
        }

        if (!which && Interp_flags_TEST(interpreter, PARROT_PREDEREF_FLAG)) {
            offset = pc - (opcode_t *)interpreter->code->byte_code;

            if (!interpreter->prederef_code) {
                size_t N = interpreter->code->byte_code_size;
                size_t i;
                void **temp = (void **)malloc(N * sizeof(void *));

                for (i = 0; i < N; i++) {
                    temp[i] = (void *)(ptrcast_t)prederef;
                }

                interpreter->prederef_code = temp;
            }

            runops_prederef(interpreter, pc,
                            interpreter->prederef_code + offset);
        }
        else if (Interp_flags_TEST(interpreter, PARROT_JIT_FLAG)) {
#if !JIT_CAPABLE
            internal_exception(JIT_UNAVAILABLE,
                               "Error: PARROT_JIT_FLAG is set, but interpreter is not JIT_CAPABLE!\n");
#endif

            runops_jit(interpreter, pc);
        }
        else {
            runops_generic(core, interpreter, pc);
        }
    }

    if (interpreter->prederef_code) {
        free(interpreter->prederef_code);
        interpreter->prederef_code = NULL;
    }
}

static int
env_var_set(const char* var)
{
    char* value = getenv(var);
    if (value == NULL) return 0;
    if (*value == '\0') return 0;
    return ! (strcmp(value, "0") == 0);
}

/*=for api interpreter make_interpreter
 *  Create the Parrot interpreter.  Allocate memory and clear the registers.
 */
struct Parrot_Interp *
make_interpreter(Interp_flags flags)
{
    struct Parrot_Interp *interpreter;

    /* Get an empty interpreter from system memory */
    interpreter = mem_sys_allocate((UINTVAL)sizeof(struct Parrot_Interp));

    /* zero our counters */
    interpreter->dod_runs = 0;
    interpreter->collect_runs = 0;
    interpreter->mem_allocs_since_last_collect = 0;
    interpreter->header_allocs_since_last_collect = 0;
    interpreter->active_PMCs = 0;
    interpreter->active_Buffers = 0;
    interpreter->total_PMCs = 0;
    interpreter->total_Buffers = 0;
    interpreter->memory_allocated = 0;
    interpreter->memory_collected = 0;
    interpreter->DOD_block_level = 1;
    interpreter->GC_block_level = 1;

    /* Must initialize flags here so the GC_DEBUG stuff is available before
     * mem_setup_allocator() is called. */
    interpreter->flags = flags;

    if (env_var_set("PARROT_GC_DEBUG")) {
#if ! DISABLE_GC_DEBUG
        Interp_flags_SET(interpreter, PARROT_GC_DEBUG_FLAG);
#else
        fprintf(stderr, "PARROT_GC_DEBUG is set but the binary was compiled "
                "with DISABLE_GC_DEBUG.\n");
#endif
    }

    /* Set up the memory allocation system */
    mem_setup_allocator(interpreter);

    /* Need an empty stash */
    interpreter->perl_stash = mem_sys_allocate(sizeof(struct Stash));
    interpreter->perl_stash->stash_hash =
        pmc_new(interpreter, enum_class_PerlHash);
    interpreter->perl_stash->parent_stash = NULL;

    /* Initialize interpreter's flags */
    interpreter->warns = mem_sys_allocate(sizeof(struct warnings_t));
    memset(interpreter->warns, 0, sizeof(struct warnings_t));
    PARROT_WARNINGS_off(interpreter, PARROT_WARNINGS_ALL_FLAG);

    /* Set up the initial register chunks */
    interpreter->ctx.int_reg_base = mem_sys_allocate(sizeof(struct IRegChunk));
    interpreter->ctx.num_reg_base = mem_sys_allocate(sizeof(struct NRegChunk));
    interpreter->ctx.string_reg_base =
        mem_sys_allocate(sizeof(struct SRegChunk));
    interpreter->ctx.pmc_reg_base = mem_sys_allocate(sizeof(struct PRegChunk));
    interpreter->ctx.int_reg_top = interpreter->ctx.int_reg_base;
    interpreter->ctx.num_reg_top = interpreter->ctx.num_reg_base;
    interpreter->ctx.string_reg_top = interpreter->ctx.string_reg_base;
    interpreter->ctx.pmc_reg_top = interpreter->ctx.pmc_reg_base;

    /* Set up the initial registers */
    memset(&interpreter->ctx.int_reg, 0, sizeof(struct IReg));
    memset(&interpreter->ctx.num_reg, 0, sizeof(struct NReg));
    memset(&interpreter->ctx.string_reg, 0, sizeof(struct SReg));
    memset(&interpreter->ctx.pmc_reg, 0, sizeof(struct PReg));

    /* Initialize the integer register chunk */
    interpreter->ctx.int_reg_base->used = 0;
    interpreter->ctx.int_reg_base->free = FRAMES_PER_INT_REG_CHUNK;
    interpreter->ctx.int_reg_base->next = NULL;
    interpreter->ctx.int_reg_base->prev = NULL;

    /* Initialize the initial numeric register chunk */
    interpreter->ctx.num_reg_base->used = 0;
    interpreter->ctx.num_reg_base->free = FRAMES_PER_NUM_REG_CHUNK;
    interpreter->ctx.num_reg_base->next = NULL;
    interpreter->ctx.num_reg_base->prev = NULL;

    /* Initialize the inital string register chunk, be sure to
     * NULL out the strings because string functions rely
     * on NULL strings */
    interpreter->ctx.string_reg_base->used = 0;
    interpreter->ctx.string_reg_base->free = FRAMES_PER_STR_REG_CHUNK;
    interpreter->ctx.string_reg_base->next = NULL;
    interpreter->ctx.string_reg_base->prev = NULL;
    Parrot_clear_s(interpreter);

    /* Initialize the initial PMC register chunk. Gotta NULL them out,
     * too, otherwise we might GC Wrong Things later */
    interpreter->ctx.pmc_reg_base->used = 0;
    interpreter->ctx.pmc_reg_base->free = FRAMES_PER_PMC_REG_CHUNK;
    interpreter->ctx.pmc_reg_base->next = NULL;
    interpreter->ctx.pmc_reg_base->prev = NULL;
    Parrot_clear_p(interpreter);

    /* Stack for lexical pads */
    interpreter->ctx.pad_stack = new_stack(interpreter);

    /* Need a user stack */
    interpreter->ctx.user_stack = new_stack(interpreter);
    assert(interpreter->ctx.user_stack->buffer != interpreter->ctx.pad_stack->buffer);

    /* And a control stack */
    interpreter->ctx.control_stack = new_stack(interpreter);
    assert(interpreter->ctx.control_stack->buffer != interpreter->ctx.user_stack->buffer);

    /* A regex stack would be nice too. */
    interpreter->ctx.intstack = intstack_new(interpreter);

    /* Load the core op func and info tables */
    interpreter->op_lib = PARROT_CORE_OPLIB_INIT();
    interpreter->op_count = interpreter->op_lib->op_count;
    interpreter->op_func_table = interpreter->op_lib->op_func_table;
    interpreter->op_info_table = interpreter->op_lib->op_info_table;

    /* Set up defaults for line/package/file */
    interpreter->current_line = 0;
    interpreter->current_file =
        string_make(interpreter, "(unknown file)", 14, NULL, 0, NULL);
    interpreter->current_package =
        string_make(interpreter, "(unknown package)", 18, NULL, 0, NULL);;

    /* Okay, we've finished doing anything that might trigger GC. (The
     * top of the stack hasn't been set yet, so we cannot allow GC to
     * run up until now -- we might miss system stack values. */
    interpreter->DOD_block_level--;
    interpreter->GC_block_level--;

    /* Set I/O data to NULL first or else PIO_init will
     * assume this interpreter is already initialized.
     */
    interpreter->piodata = NULL;
    PIO_init(interpreter);

    /* Done. Return and be done with it */

    interpreter->code = (struct PackFile *)NULL;
    interpreter->profile = (ProfData *)NULL;

    interpreter->resume_flag = 0;
    interpreter->resume_offset = 0;

    interpreter->prederef_code = (void **)NULL;

    return interpreter;
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
