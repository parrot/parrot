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

#define ATEXIT_DESTROY

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
    (jit_code) (interpreter, pc);
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
    int lo_var_ptr;
    opcode_t *(*core) (struct Parrot_Interp *, opcode_t *);

    interpreter->code = code;
    interpreter->resume_offset = offset;
    interpreter->resume_flag = 1;

    while (interpreter->resume_flag) {
        unsigned int slow;
        opcode_t *pc = (opcode_t *)
            interpreter->code->byte_code + interpreter->resume_offset;

        interpreter->resume_offset = 0;
        interpreter->resume_flag = 0;

        slow = Interp_flags_TEST(interpreter, (PARROT_BOUNDS_FLAG |
                    PARROT_PROFILE_FLAG |
                    PARROT_TRACE_FLAG));

        if (slow)
            core = runops_slow_core;
        else if (Interp_flags_TEST(interpreter, PARROT_CGOTO_FLAG)) {
            core = runops_cgoto_core;
            /* clear stacktop, it gets set in runops_cgoto_core beyond the
             * opfunc table again, if the compiler supports nested funcs
             */
/* #ifdef HAVE_NESTED_FUNC */
#ifdef __GNUC__
            if (!Interp_flags_TEST(interpreter,
                        (PARROT_PREDEREF_FLAG | PARROT_JIT_FLAG)))
                interpreter->lo_var_ptr = 0;
#endif
        }
        else
            core = runops_fast_core;

        if (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
            if (interpreter->profile == NULL) {
                interpreter->profile = (ProfData *)
                    mem_sys_allocate_zeroed(interpreter->op_count *
                            sizeof(ProfData));
            }
        }

        if (!slow && Interp_flags_TEST(interpreter, PARROT_PREDEREF_FLAG)) {
            offset = pc - (opcode_t *)interpreter->code->byte_code;

            if (!interpreter->prederef_code) {
                size_t N = interpreter->code->byte_code_size;
                size_t i;
                void **temp = (void **)mem_sys_allocate(N * sizeof(void *));

                for (i = 0; i < N; i++) {
                    temp[i] = (void *)(ptrcast_t)prederef;
                }

                interpreter->prederef_code = temp;
            }

            runops_prederef(interpreter, pc,
                    interpreter->prederef_code + offset);
        }
        else if (!slow && Interp_flags_TEST(interpreter, PARROT_JIT_FLAG)) {
#if !JIT_CAPABLE
            internal_exception(JIT_UNAVAILABLE,
                    "Error: PARROT_JIT_FLAG is set, but interpreter is not JIT_CAPABLE!\n");
#endif

            runops_jit(interpreter, pc);
        }
        else {
            runops_generic(core, interpreter, pc);
        }
        /* if we have fallen out with resume and we were running CGOTO, set
         * the stacktop again to a sane value, so that restarting the runloop
         * is ok.
         */
        interpreter->lo_var_ptr = (void *)&lo_var_ptr;
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

void Parrot_really_destroy(int exit_code, void *interpreter);

/*=for api interpreter make_interpreter
 *  Create the Parrot interpreter.  Allocate memory and clear the registers.
 */

struct Parrot_Interp *
make_interpreter(Interp_flags flags)
{
    struct Parrot_Interp *interpreter;

    /* Get an empty interpreter from system memory */
    interpreter = mem_sys_allocate_zeroed(sizeof(struct Parrot_Interp));

    interpreter->DOD_block_level = 1;
    interpreter->GC_block_level = 1;

    /* Must initialize flags here so the GC_DEBUG stuff is available before
     * mem_setup_allocator() is called. */
    interpreter->flags = flags;

    if (env_var_set("PARROT_GC_DEBUG")) {
#if ! DISABLE_GC_DEBUG
        Interp_flags_SET(interpreter, PARROT_GC_DEBUG_FLAG);
       interpreter->lo_var_ptr = &interpreter;
#else
        fprintf(stderr, "PARROT_GC_DEBUG is set but the binary was compiled "
                "with DISABLE_GC_DEBUG.\n");
#endif
    }

    /* Set up the memory allocation system */
    mem_setup_allocator(interpreter);

    /* initialize classes */
    Parrot_init(interpreter, 0);

    /* Need an empty stash */
    interpreter->perl_stash = mem_sys_allocate(sizeof(struct Stash));
    interpreter->perl_stash->stash_hash =
        pmc_new(interpreter, enum_class_PerlHash);
    interpreter->perl_stash->parent_stash = NULL;

    /* Initialize interpreter's flags */
    interpreter->warns = mem_sys_allocate_zeroed(sizeof(struct warnings_t));
    PARROT_WARNINGS_off(interpreter, PARROT_WARNINGS_ALL_FLAG);

    /* Set up the initial register chunks */
    interpreter->ctx.int_reg_base =
        mem_sys_allocate_zeroed(sizeof(struct IRegChunk));
    interpreter->ctx.num_reg_base =
        mem_sys_allocate_zeroed(sizeof(struct NRegChunk));
    interpreter->ctx.string_reg_base =
        mem_sys_allocate_zeroed(sizeof(struct SRegChunk));
    interpreter->ctx.pmc_reg_base =
        mem_sys_allocate_zeroed(sizeof(struct PRegChunk));
    interpreter->ctx.int_reg_top = interpreter->ctx.int_reg_base;
    interpreter->ctx.num_reg_top = interpreter->ctx.num_reg_base;
    interpreter->ctx.string_reg_top = interpreter->ctx.string_reg_base;
    interpreter->ctx.pmc_reg_top = interpreter->ctx.pmc_reg_base;

    /* Initialize the register chunks */
    interpreter->ctx.int_reg_base->free = FRAMES_PER_INT_REG_CHUNK;
    interpreter->ctx.num_reg_base->free = FRAMES_PER_NUM_REG_CHUNK;
    interpreter->ctx.string_reg_base->free = FRAMES_PER_STR_REG_CHUNK;
    interpreter->ctx.pmc_reg_base->free = FRAMES_PER_PMC_REG_CHUNK;
    /* the SET_NULL macros are only for systems where a NULL pointer
     * isn't represented by zeroes, so don't use these for resetting
     * non-null pointers
     */
    SET_NULL(interpreter->ctx.int_reg_base->next);
    SET_NULL(interpreter->ctx.int_reg_base->prev);
    SET_NULL(interpreter->ctx.num_reg_base->next);
    SET_NULL(interpreter->ctx.num_reg_base->prev);
    SET_NULL(interpreter->ctx.string_reg_base->next);
    SET_NULL(interpreter->ctx.string_reg_base->prev);
    SET_NULL(interpreter->ctx.pmc_reg_base->next);
    SET_NULL(interpreter->ctx.pmc_reg_base->prev);

    Parrot_clear_s(interpreter);
    Parrot_clear_p(interpreter);

    /* Stack for lexical pads */
    interpreter->ctx.pad_stack = new_stack(interpreter);

    /* Need a user stack */
    interpreter->ctx.user_stack = new_stack(interpreter);
    assert(interpreter->ctx.user_stack->buffer !=
            interpreter->ctx.pad_stack->buffer);

    /* And a control stack */
    interpreter->ctx.control_stack = new_stack(interpreter);
    assert(interpreter->ctx.control_stack->buffer !=
            interpreter->ctx.user_stack->buffer);

    /* A regex stack would be nice too. */
    interpreter->ctx.intstack = intstack_new(interpreter);

    /* Load the core op func and info tables */
    interpreter->op_lib = PARROT_CORE_OPLIB_INIT();
    interpreter->op_count = interpreter->op_lib->op_count;
    interpreter->op_func_table = interpreter->op_lib->op_func_table;
    interpreter->op_info_table = interpreter->op_lib->op_info_table;

    /* Set up defaults for line/package/file */
    interpreter->current_file =
        string_make(interpreter, "(unknown file)", 14, NULL, 0, NULL);
    interpreter->current_package =
        string_make(interpreter, "(unknown package)", 18, NULL, 0, NULL);;

    SET_NULL(interpreter->piodata);
    PIO_init(interpreter);

    SET_NULL_P(interpreter->code, struct PackFile *);
    SET_NULL_P(interpreter->profile, ProfData *);
    SET_NULL_P(interpreter->prederef_code, void **);
    SET_NULL(interpreter->jit_info);

    /* Done. Return and be done with it */

    /* Okay, we've finished doing anything that might trigger GC.
     * Actually, we could enable DOD/GC earlier, but here all setup is
     * done
     */
    Parrot_unblock_DOD(interpreter);
    Parrot_unblock_GC(interpreter);

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
    UNUSED(exit_code);

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

    /* XXX walk the stash, pmc's are already dead */
    mem_sys_free(interpreter->perl_stash);
    if (interpreter->profile)
        mem_sys_free(interpreter->profile);
    if (interpreter->prederef_code)
        free(interpreter->prederef_code);
    /* TODO cleanup JIT structures */

    mem_sys_free(interpreter->warns);

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

    /* XXX move this to stacks.c */
    {
        Stack_Chunk_t *chunks[3];
        chunks[0] = interpreter->ctx.pad_stack;
        chunks[1] = interpreter->ctx.user_stack;
        chunks[2] = interpreter->ctx.control_stack;
        for (i = 0; i< 3; i++) {
            Stack_Chunk_t *top = chunks[i];
            while (top->next)
                top = top->next;
            while(top) {
                Stack_Chunk_t *next = top->prev;
                mem_sys_free(top);
                top = next;
            }
        }
    }
    /* intstack */
    intstack_free(interpreter, interpreter->ctx.intstack);

    PIO_destroy(interpreter);
#ifdef HAS_JIT
    Parrot_destroy_jit(interpreter);
#endif

    mem_sys_free(interpreter);
}

#ifdef GC_IS_MALLOC
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
extern struct mallinfo mallinfo(void);
#endif /* GC_IS_MALLOC */
INTVAL
interpinfo(struct Parrot_Interp *interpreter, INTVAL what)
{
    INTVAL ret;
    struct Small_Object_Pool *header_pool;
    int j;

    switch (what) {
        case TOTAL_MEM_ALLOC:
#ifdef GC_IS_MALLOC
            interpreter->memory_allocated = mallinfo().uordblks;
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
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
