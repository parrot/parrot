/* interpreter.h
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

#if !defined(PARROT_INTERPRETER_H_GUARD)
#define PARROT_INTERPRETER_H_GUARD

/* These should be visible to embedders. */

/* General flags */
typedef enum {
    NO_FLAGS             = 0x00,
    PARROT_DEBUG_FLAG    = 0x01,  /* We're debugging */
    PARROT_TRACE_FLAG    = 0x02,  /* We're tracing execution */
    PARROT_BOUNDS_FLAG   = 0x04,  /* We're tracking byte code bounds */
    PARROT_PROFILE_FLAG  = 0x08,  /* We're gathering profile information */
    PARROT_PREDEREF_FLAG = 0x10,  /* We're using the prederef runops */
    PARROT_JIT_FLAG      = 0x20,  /* We're using the jit runops */
    PARROT_CGOTO_FLAG    = 0x40   /* We're using the computed goto runops */
} Interp_flags;

#define Interp_flags_SET(interp, flag)   (/*@i1@*/ (interp)->flags |= (flag))
#define Interp_flags_CLEAR(interp, flag) (/*@i1@*/ (interp)->flags &= ~(flag))
#define Interp_flags_TEST(interp, flag)  (/*@i1@*/ (interp)->flags & (flag))

#if defined(PARROT_IN_CORE)

#include "parrot/register.h"
#include "parrot/parrot.h"
#include "parrot/warnings.h"

#include "parrot/op.h"
#include "parrot/oplib.h"

typedef struct warnings_t {
    Warnings_classes classes;
} *Warnings;

#if 0
typedef STRING_FUNCS *(str_func_t)();
typedef opcode_t *(**op_func_table)(); /* Opcode function table */
typedef STRING_FUNCS *(**string_funcs)();      /* String function table */
#endif

typedef struct ProfData {
    UINTVAL numcalls;
    FLOATVAL time;
} ProfData;


typedef struct Parrot_Interp {
    struct IReg int_reg;
    struct NReg num_reg;
    struct SReg string_reg;
    struct PReg pmc_reg;
    struct IRegChunk *int_reg_top;    /* Current top chunk of int reg stack */
    struct NRegChunk *num_reg_top;    /* Current top chunk of the float reg
                                       * stack */
    struct SRegChunk *string_reg_top; /* Current top chunk of the string 
                                       * stack */
    struct PRegChunk *pmc_reg_top;    /* Current top chunk of the PMC stack */
    struct IRegChunk *int_reg_base;     /* base of the int reg stack */
    struct NRegChunk *num_reg_base;     /* Base of the float reg stack */
    struct SRegChunk *string_reg_base;  /* Base of the string stack */
    struct PRegChunk *pmc_reg_base;     /* Base of the PMC stack */
    struct stack_chunk *user_stack;     /* Base of the scratch stack */
    struct stack_chunk *control_stack;  /* Base of the flow control stack */
    struct Stash *perl_stash;           /* Pointer to the global variable
                                         * area */
    struct Scratchpad *cur_pad;         /* The current scratchpad */
    struct Arenas *arena_base;          /* Pointer to this interpreter's 
                                         * arena */
    void *piodata;                      /* interpreter's IO system */

    op_lib_t  *op_lib;                  /* Opcode library */
    size_t     op_count;                /* The number of ops */
    op_info_t *op_info_table; /* Opcode info table (name, nargs, arg types) */

    op_func_t *op_func_table;

#if 0
    str_func_t *string_funcs;
#endif

    Interp_flags flags;         /* Various interpreter flags that
                                 * signal that runops should do
                                 * something */

    Warnings warns;             /* Keeps track of what warnings
                                 * have been activated */

    ProfData *profile;          /* The array where we keep the
                                 * profile counters */

    INTVAL resume_flag;
    size_t resume_offset;

    struct PackFile *code;      /* The code we are executing */
    void **prederef_code;       /* The predereferenced code */
    size_t current_line;        /* Which line we're executing in the
                                 * source */
    void *current_file;         /* The file we're currently in */
    void *current_package;      /* The package we're currently in */

    /* Some counters for the garbage collector.xs */
    size_t  dod_runs;           /* Number of times we've
                                 * done a DOD sweep */
    size_t  collect_runs;       /* Number of times we've
                                 * done a memory compaction
                                 */
    size_t  mem_allocs_since_last_collect;      /* The number of memory
                                                 * allocations from the
                                                 * system since the last
                                                 * compaction run */
    size_t  header_allocs_since_last_collect;   /* The number of header
                                                 * allocs from the
                                                 * system since the last
                                                 * DOD run */
    size_t  active_PMCs;        /* The number of live PMCs */
    size_t  active_Buffers;     /* The number of live
                                 * Buffers */
    size_t  total_PMCs;         /* The total number of PMCs
                                 * allocated */
    size_t  total_Buffers;      /* The total number of
                                 * buffers allocated */
    size_t  memory_allocated;   /* The total amount of
                                 * allocatable memory
                                 * allocated. Doesn't count
                                 * memory for headers or
                                 * internal structures or
                                 * anything */
    UINTVAL memory_collected;   /* Total amount of memory copied
                                   during collection */
    UINTVAL DOD_block_level;    /* How many outstanding DOD block
                                   requests are there? */
    UINTVAL GC_block_level;     /* How many outstanding GC block
                                   requests are there? */
} Interp;

#define PCONST(i) PF_CONST(interpreter->code, (i))
#define PNCONST   PF_NCONST(interpreter->code)

struct Parrot_Interp *make_interpreter(Interp_flags);

#if 0
void runops_generic();
#endif

void runops(struct Parrot_Interp *, struct PackFile *, size_t offset);

VAR_SCOPE opcode_t *(*run_native)(struct Parrot_Interp * interpreter,
                                  opcode_t * cur_opcode,
                                  opcode_t * start_code);

#endif   /* Parrot core */

#endif   /* header guard */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
