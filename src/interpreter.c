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


/*=for api interpreter check_fingerprint
 * TODO: Not really part of the API, but here's the docs.
 * Check the bytecode's opcode table fingerprint.
 */
static void
check_fingerprint(struct Parrot_Interp *interpreter)
{
    /* if (PNCONST == 0) { */
    UNUSED(interpreter);
    return;

#if 0
    if (interpreter->code->const_table->const_count == 0) {
        fprintf(stderr,
                "Warning: Bytecode does not include opcode table fingerprint!\n");
    }
    else {
        const char *fp_data;
        INTVAL fp_len;

        fp_data = PCONST(0)->string->bufstart;
        fp_len = PCONST(0)->string->buflen;

        if (strncmp(OPCODE_FINGERPRINT, fp_data, fp_len)) {
            fprintf(stderr,
                    "Error: Opcode table fingerprint in bytecode does not match interpreter!\n");
            fprintf(stderr, "       Bytecode:    %*s\n", (int)-fp_len,
                    fp_data);
            fprintf(stderr, "       Interpreter: %s\n", OPCODE_FINGERPRINT);
            exit(1);
        }
    }
#endif

}


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

    check_fingerprint(interpreter);

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
 * Dynamically load the prederef oplib so its opfuncs can be used in
 * place of the standard ones.
 *
 * TODO: These static variables need to be moved into the interpreter
 * structure, or something else smarter than this needs to be done
 * with them.
 */

static void *prederef_oplib_handle = NULL;
static oplib_init_f prederef_oplib_init = (oplib_init_f)NULLfunc;
static op_lib_t *prederef_oplib = NULL;
static INTVAL prederef_op_count = 0;
static op_info_t *prederef_op_info = NULL;
static op_func_t *prederef_op_func = NULL;

static void
init_prederef(struct Parrot_Interp *interpreter)
{
#ifndef DYNAMIC_OPLIBS
    extern op_lib_t * PARROT_CORE_PREDEREF_OPLIB_INIT(void);
#endif
    char file_name[50];
    char func_name[50];

    UNUSED(interpreter);

    sprintf(file_name, "lib%s_prederef.so.%s", PARROT_CORE_OPLIB_NAME,
            PARROT_VERSION);

    sprintf(func_name, "Parrot_DynOp_%s_prederef_%d_%d_%d",
            PARROT_CORE_OPLIB_NAME, PARROT_MAJOR_VERSION,
            PARROT_MINOR_VERSION, PARROT_PATCH_VERSION);

    /*
     * Get a handle to the library file:
     */

#ifdef DYNAMIC_OPLIBS
    prederef_oplib_handle = Parrot_dlopen(file_name);

    if (!prederef_oplib_handle) {
        internal_exception(PREDEREF_LOAD_ERROR,
                           "Unable to dynamically load oplib file '%s' for oplib '%s_prederef' version %s!\n",
                           file_name, PARROT_CORE_OPLIB_NAME, PARROT_VERSION);
    }

    /*
     * Look up the init function:
     */

    prederef_oplib_init =
        (oplib_init_f)(ptrcast_t)Parrot_dlsym(prederef_oplib_handle,func_name);
#else
    prederef_oplib_init = PARROT_CORE_PREDEREF_OPLIB_INIT;
#endif

    if (!prederef_oplib_init) {
        internal_exception(PREDEREF_LOAD_ERROR,
                           "No exported symbol for oplib init function '%s' from oplib file '%s' for oplib '%s_prederef' version %s!\n",
                           func_name, file_name, PARROT_CORE_OPLIB_NAME,
                           PARROT_VERSION);
    }

    /*
     * Run the init function to get the oplib info:
     */

    prederef_oplib = prederef_oplib_init();

    if (!prederef_oplib) {
        internal_exception(PREDEREF_LOAD_ERROR,
                           "No oplib info returned by oplib init function '%s' from oplib file '%s' for oplib '%s_prederef' version %s!\n",
                           func_name, file_name, PARROT_CORE_OPLIB_NAME,
                           PARROT_VERSION);
    }

    /*
     * Validate the op count:
     */

    prederef_op_count = prederef_oplib->op_count;

    if (prederef_op_count <= 0) {
        internal_exception(PREDEREF_LOAD_ERROR,
                           "Illegal op count (%d) from oplib file '%s' for oplib '%s_prederef' version %s!\n",
                           (int)prederef_op_count, file_name,
                           PARROT_CORE_OPLIB_NAME, PARROT_VERSION);
    }

    /*
     * Validate the op info table:
     */

    prederef_op_info = prederef_oplib->op_info_table;

    if (!prederef_op_info) {
        internal_exception(PREDEREF_LOAD_ERROR,
                           "No op info table in oplib file '%s' for oplib '%s_prederef' version %s!\n",
                           file_name, PARROT_CORE_OPLIB_NAME, PARROT_VERSION);
    }

    /*
     * Validate the op func table:
     */

    prederef_op_func = prederef_oplib->op_func_table;

    if (!prederef_op_func) {
        internal_exception(PREDEREF_LOAD_ERROR,
                           "No op func table in oplib file '%s' for oplib '%s_prederef' version %s!\n",
                           file_name, PARROT_CORE_OPLIB_NAME, PARROT_VERSION);
    }
}

/*=for api interpreter stop_prederef
 *
 * Unload the prederef oplib.
 */

static void
stop_prederef(void)
{
    prederef_op_func = NULL;
    prederef_op_info = NULL;
    prederef_op_count = 0;

#ifdef DYNAMIC_OPLIBS
    Parrot_dlclose(prederef_oplib_handle);
#endif

    prederef_oplib = NULL;
    prederef_oplib_init = (oplib_init_f)NULLfunc;
    prederef_oplib_handle = NULL;
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
    op_info_t *opinfo = &prederef_op_info[*pc];
    int i;

    for (i = 0; i < opinfo->arg_count; i++) {
        switch (opinfo->types[i]) {
        case PARROT_ARG_OP:
            pc_prederef[i] = (void *)(ptrcast_t)prederef_op_func[pc[i]];
            break;

        case PARROT_ARG_I:
            pc_prederef[i] = (void *)&interpreter->int_reg.registers[pc[i]];
            break;

        case PARROT_ARG_N:
            pc_prederef[i] = (void *)&interpreter->num_reg.registers[pc[i]];
            break;

        case PARROT_ARG_P:
            pc_prederef[i] = (void *)&interpreter->pmc_reg.registers[pc[i]];
            break;

        case PARROT_ARG_S:
            pc_prederef[i] = (void *)&interpreter->string_reg.registers[pc[i]];
            break;

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

        default:
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

    check_fingerprint(interpreter);

    code_start = interpreter->code->byte_code;
    code_size = interpreter->code->byte_code_size / sizeof(opcode_t);
    code_end = interpreter->code->byte_code + code_size;

    jit_code = build_asm(interpreter, pc, code_start, code_end);
    (jit_code) (interpreter);
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

    check_fingerprint(interpreter);

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

    stop_prederef();

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

        if (Interp_flags_TEST(interpreter, PARROT_PREDEREF_FLAG)) {
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

    /* Set up the memory allocation system */
    mem_setup_allocator(interpreter);

    /* Need an empty stash */
    interpreter->perl_stash = mem_sys_allocate(sizeof(struct Stash));
    interpreter->perl_stash->stash_hash =
        pmc_new(interpreter, enum_class_PerlHash);
    interpreter->perl_stash->parent_stash = NULL;

    /* Initialize interpreter's flags */
    interpreter->flags = flags;
    interpreter->warns = mem_sys_allocate(sizeof(struct warnings_t));
    memset(interpreter->warns, 0, sizeof(struct warnings_t));
    PARROT_WARNINGS_off(interpreter, PARROT_WARNINGS_ALL_FLAG);

    /* Set up the initial register chunks */
    interpreter->int_reg_base = mem_allocate_aligned(sizeof(struct IRegChunk));
    interpreter->num_reg_base = mem_allocate_aligned(sizeof(struct NRegChunk));
    interpreter->string_reg_base =
        mem_allocate_aligned(sizeof(struct SRegChunk));
    interpreter->pmc_reg_base = mem_allocate_aligned(sizeof(struct PRegChunk));
    interpreter->int_reg_top = interpreter->int_reg_base;
    interpreter->num_reg_top = interpreter->num_reg_base;
    interpreter->string_reg_top = interpreter->string_reg_base;
    interpreter->pmc_reg_top = interpreter->pmc_reg_base;

    /* Set up the initial registers */
    memset(&interpreter->int_reg, 0, sizeof(struct IReg));
    memset(&interpreter->num_reg, 0, sizeof(struct NReg));
    memset(&interpreter->string_reg, 0, sizeof(struct SReg));
    memset(&interpreter->pmc_reg, 0, sizeof(struct PReg));

    /* Initialize the integer register chunk */
    interpreter->int_reg_base->used = 0;
    interpreter->int_reg_base->free = FRAMES_PER_INT_REG_CHUNK;
    interpreter->int_reg_base->next = NULL;
    interpreter->int_reg_base->prev = NULL;

    /* Initialize the initial numeric register chunk */
    interpreter->num_reg_base->used = 0;
    interpreter->num_reg_base->free = FRAMES_PER_NUM_REG_CHUNK;
    interpreter->num_reg_base->next = NULL;
    interpreter->num_reg_base->prev = NULL;

    /* Initialize the inital string register chunk, be sure to
     * NULL out the strings because string functions rely
     * on NULL strings */
    interpreter->string_reg_base->used = 0;
    interpreter->string_reg_base->free = FRAMES_PER_STR_REG_CHUNK;
    interpreter->string_reg_base->next = NULL;
    interpreter->string_reg_base->prev = NULL;
    Parrot_clear_s(interpreter);

    /* Initialize the initial PMC register chunk. Gotta NULL them out,
     * too, otherwise we might GC Wrong Things later */
    interpreter->pmc_reg_base->used = 0;
    interpreter->pmc_reg_base->free = FRAMES_PER_PMC_REG_CHUNK;
    interpreter->pmc_reg_base->next = NULL;
    interpreter->pmc_reg_base->prev = NULL;
    Parrot_clear_p(interpreter);

    interpreter->DOD_block_level--;
    interpreter->GC_block_level--;

    /* Need a user stack */
    interpreter->user_stack = new_stack(interpreter);

    /* And a control stack */
    interpreter->control_stack = new_stack(interpreter);

    /* A regex stack would be nice too. */
    interpreter->intstack = intstack_new(interpreter);

    /* Load the core op func and info tables */
    interpreter->op_lib = PARROT_CORE_OPLIB_INIT();
    interpreter->op_count = interpreter->op_lib->op_count;
    interpreter->op_func_table = interpreter->op_lib->op_func_table;
    interpreter->op_info_table = interpreter->op_lib->op_info_table;

    /* Set I/O data to NULL first or else PIO_init will
     * assume this interpreter is already initialized.
     */
    interpreter->piodata = NULL;
    PIO_init(interpreter);

    /* Set up defaults for line/package/file */
    interpreter->current_line = 0;
    interpreter->current_file =
        string_make(interpreter, "(unknown file)", 14, NULL, 0, NULL);
    interpreter->current_package =
        string_make(interpreter, "(unknown package)", 18, NULL, 0, NULL);;

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
