/* interpreter.h
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

#if !defined(PARROT_INTERPRETER_H_GUARD)
#define PARROT_INTERPRETER_H_GUARD

/* These should be visible to embedders. */

/* General flags */
/* &gen_from_enum(interpflags.pasm) prefix(INTERPFLAG_) */
typedef enum {
    NO_FLAGS                = 0x00,
    PARROT_DEBUG_FLAG       = 0x01,  /* We're debugging */
    PARROT_TRACE_FLAG       = 0x02,  /* We're tracing execution */
    PARROT_BOUNDS_FLAG      = 0x04,  /* We're tracking byte code bounds */
    PARROT_PROFILE_FLAG     = 0x08,  /* gathering profile information */
    PARROT_GC_DEBUG_FLAG    = 0x10,  /* debugging memory management */

    PARROT_EXTERN_CODE_FLAG = 0x100, /* reusing anothers interps code */
    PARROT_DESTROY_FLAG     = 0x200, /* the last interpreter shall cleanup */

    PARROT_IS_THREAD        = 0x1000, /* interpreter is a thread */
    PARROT_THR_COPY_INTERP  = 0x2000, /* thread start copies interp state */
    PARROT_THR_THREAD_POOL  = 0x4000, /* type3 threads */

    PARROT_THR_TYPE_1 = PARROT_IS_THREAD,
    PARROT_THR_TYPE_2 = PARROT_IS_THREAD | PARROT_THR_COPY_INTERP,
    PARROT_THR_TYPE_3 = PARROT_IS_THREAD | PARROT_THR_COPY_INTERP |
                        PARROT_THR_THREAD_POOL
} Parrot_Interp_flag;

/* &end_gen */

/* &gen_from_enum(interpcores.pasm) */
typedef enum {
    PARROT_SLOW_CORE,           /* slow bounds/trace/profile core */
    PARROT_FUNCTION_CORE = PARROT_SLOW_CORE,
    PARROT_FAST_CORE      = 1,  /* fast DO_OP core */
    PARROT_PREDEREF_CORE  = 2,  /*  P   = prederefed */
    PARROT_SWITCH_CORE    = 3,  /*  P                */
    PARROT_CGP_CORE       = 4,  /* CP                */
    PARROT_CGOTO_CORE     = 5,  /* C    = cgoto      */
    PARROT_JIT_CORE       = 6,  /* TODO arange bits for P testing */
    PARROT_EXEC_CORE      = 7   /* TODO Parrot_exec_run variants */
} Parrot_Run_core_t;

/* &end_gen */
struct Parrot_Interp;

typedef struct Parrot_Interp *Parrot_Interp;

#if defined(PARROT_IN_CORE)

typedef Parrot_Interp_flag Interp_flags;
typedef Parrot_Run_core_t Run_Cores;

#define Interp_flags_SET(interp, flag)   (/*@i1@*/ (interp)->flags |= (flag))
#define Interp_flags_CLEAR(interp, flag) (/*@i1@*/ (interp)->flags &= ~(flag))
#define Interp_flags_TEST(interp, flag)  (/*@i1@*/ (interp)->flags & (flag))

#define Interp_core_SET(interp, core)   (/*@i1@*/ (interp)->run_core = (core))
#define Interp_core_TEST(interp, core)  (/*@i1@*/ (interp)->run_core == (core))

#include "parrot/register.h"
#include "parrot/parrot.h"
#include "parrot/warnings.h"

#include "parrot/op.h"
#include "parrot/oplib.h"

#include "parrot/rxstacks.h"

#include "parrot/debug.h"
#include "parrot/mmd.h"

typedef struct warnings_t {
    Warnings_classes classes;
} *Warnings;

#if 0
typedef STRING_FUNCS *(str_func_t)();
typedef opcode_t *(**op_func_table)(); /* Opcode function table */
typedef STRING_FUNCS *(**string_funcs)();      /* String function table */
#endif

/*
 * ProfData have these extra items in front followed by
 * one entry per op at (op + extra)
 */

typedef enum {
     PARROT_PROF_DOD,
     PARROT_PROF_GC,
     PARROT_PROF_EXCEPTION,
     PARROT_PROF_EXTRA
} profile_extra_enum;

/*
 * data[op_count] is time spent for exception handling
 */
typedef struct ProfData {
    int op;
    UINTVAL numcalls;
    FLOATVAL time;
} ProfData;

typedef struct _RunProfile {
    FLOATVAL starttime;
    FLOATVAL dod_time;
    FLOATVAL gc_time;
    opcode_t cur_op;
    ProfData *data;
} RunProfile;

/* Forward decl for imc_info_t */
struct _imc_info_t;

typedef struct Parrot_Context {
    struct RegStack int_reg_stack;
    struct RegStack num_reg_stack;
    struct RegStack string_reg_stack;
    struct RegStack pmc_reg_stack;

    struct Stack_Chunk *pad_stack;      /* Base of the lex pad stack */
    struct Stack_Chunk *user_stack;     /* Base of the scratch stack */
    struct Stack_Chunk *control_stack;  /* Base of the flow control stack */
    IntStack intstack;                  /* Base of the regex stack */
    Buffer * warns;             /* Keeps track of what warnings
                                 * have been activated */
    Buffer * errors;            /* fatals that can be turned off */


} parrot_context_t;

struct _Thread_data;    /* in thread.h */

typedef struct _Prederef_branch {       /* item for recording branches */
    size_t offs;                        /* offset in code */
    void  *op;                          /* opcode at that position */
} Prederef_branch;

typedef struct _Prederef {
    void **code;                        /* prederefed code */
    Prederef_branch *branches;          /* list of branches in code */
    size_t n_branches;                  /* entries in that list */
    size_t n_allocated;                 /* allocated size of it */
} Prederef;

/*
 * TODO: Parrot_Interp can use a Parrot_Context inline and we
 * can save/restore context with a single memcpy
 */
typedef struct Parrot_Interp {
    struct IReg int_reg;
    struct NReg num_reg;
    struct SReg string_reg;
    struct PReg pmc_reg;
    struct Parrot_Context ctx;          /* All the registers and stacks that
                                           matter when context switching */

    struct Stash *globals;              /* Pointer to the global variable
                                         * area */
    struct Arenas *arena_base;          /* Pointer to this interpreter's
                                         * arena */
    PMC *class_hash;                    /* Hash of classes */
    struct _ParrotIOData *piodata;              /* interpreter's IO system */

    op_lib_t  *op_lib;                  /* Opcode library */
    size_t     op_count;                /* The number of ops */
    op_info_t *op_info_table; /* Opcode info table (name, nargs, arg types) */

    op_func_t *op_func_table;   /* opcode dispatch table (functios, labels,
                                   or nothing (e.g. switched core), which
                                   the interpreter is currently running */
    op_func_t *evc_func_table;  /* opcode dispatch for event checking */
    op_func_t *save_func_table; /* for restoring op_func_table */

    int         n_libs;                  /* count of libs below */
    op_lib_t  **all_op_libs;             /* all loaded opcode libraries */

#if 0
    str_func_t *string_funcs;
#endif

    Interp_flags flags;         /* Various interpreter flags that */
    Run_Cores run_core;         /* type of core to run the ops */

    RunProfile *profile;        /* The structure and array where we keep the
                                 * profile counters */
    opcode_t *cur_pc;           /* for profile and warnings */

    INTVAL resume_flag;
    size_t resume_offset;

    struct PackFile *code;      /* The code we are executing */
    /* the next items point to the real thngs, which are
     * in the byte_code_segment, that is currently executed */
    struct _Prederef prederef;  /* The predereferenced code and info */
    void *jit_info;             /* JITs data */

    struct _imc_info_t *imc_info;   /* imcc data */
    size_t current_line;        /* Which line we're executing in the
                                 * source */
    String *current_file;       /* The file we're currently in */
    String *current_package;    /* The package we're currently in */

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
                                                 * blocks allocated from
                                                 * the system since the last
                                                 * DOD run */
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

    PDB_t *pdb;                 /* Debug system */
    void *lo_var_ptr;           /* Pointer to memory on runops system stack */
    struct Parrot_Interp * parent_interpreter;

    /* per interpreter global vars */
    INTVAL world_inited;        /* Parrot_init is done */
    PMC *iglobals;              /* SArray of PMCs, containing: */
/* 0:   PMC *Parrot_base_classname_hash; hash containing name->base_type */
/* 1:   PMC *Parrot_compreg_hash;    hash containing assembler/compilers */
/* 2:   PMC *Argv;                   list of argv */
/* 3:   PMC *Env;                    hash_like Env PMC */
/* 4:   PMC *ParrotInterpreter       that's me */
/* 5:   PMC *Dyn_libs           Array of dynamically loaded ParrotLibrary  */
    UINTVAL num_early_DOD_PMCs;         /* how many PMCs want immediate destruction */
    UINTVAL num_early_PMCs_seen;        /* how many such PMCs has DOD seen */
    PMC* dod_mark_ptr;                  /* last PMC marked during a DOD run */
    PMC* dod_trace_ptr;                 /* last PMC trace_children was called on */
    int lazy_dod;                       /* flag that indicates whether we should stop
                                           when we've seen all impatient PMCs */
    PMC* DOD_registry;          /* registered PMCs added to the root set */
    struct MMD_table *binop_mmd_funcs; /* Table of MMD function pointers */
    PMC** nci_method_table;       /* Method table PMC for NCI stubs per class */
    size_t nci_method_table_size;       /* allocated size of this table */
    struct QUEUE* task_queue;           /* per interpreter queue */
    struct parrot_exception_t *exceptions; /* internal exception stack */
    struct parrot_exception_t *exc_free_list; /* and free list */
    struct _Thread_data *thread_data;   /* thread specific items */
} Interp;

typedef enum {
    RESUME_NONE         = 0x00,
    RESUME_RESTART      = 0x01,
    RESUME_ISJ          = 0x02,
    RESUME_INITIAL      = 0x04
} resume_flag_enum;

/* &gen_from_enum(iglobals.pasm) */
typedef enum {
    IGLOBALS_CLASSNAME_HASH,
    IGLOBALS_COMPREG_HASH,
    IGLOBALS_ARGV_LIST,
    IGLOBALS_ENV_HASH,
    IGLOBALS_INTERPRETER,
    IGLOBALS_DYN_LIBS,

    IGLOBALS_SIZE
} iglobals_enum;
/* &end_gen */

/*
 * Macros to make accessing registers more convenient/readable.
 */
#define REG_INT(x) interpreter->int_reg.registers[x]
#define REG_NUM(x) interpreter->num_reg.registers[x]
#define REG_STR(x) interpreter->string_reg.registers[x]
#define REG_PMC(x) interpreter->pmc_reg.registers[x]

#define PCONST(i) PF_CONST(interpreter->code, (i))
#define PNCONST   PF_NCONST(interpreter->code)

/* Make this a config option */
#define PARROT_CATCH_NULL 1

#if PARROT_CATCH_NULL
extern PMC * PMCNULL;                     /* Holds single Null PMC         */
#  define PMC_IS_NULL(p) (!(p) || (p) == PMCNULL)
#else
#  define PMCNULL NULL
#  define PMC_IS_NULL(p) (!(p))
#endif

/* &gen_from_def(sysinfo.pasm) prefix(SYSINFO_) */

#define PARROT_INTSIZE               1
#define PARROT_FLOATSIZE             2
#define PARROT_POINTERSIZE           3
#define PARROT_OS                    4
#define PARROT_OS_VERSION            5
#define PARROT_OS_VERSION_NUMBER     6
#define CPU_ARCH                     7
#define CPU_TYPE                     8

/* &end_gen */

struct Parrot_Interp *make_interpreter(Parrot_Interp parent, Interp_flags);
void Parrot_init(Parrot_Interp);
void Parrot_destroy(Parrot_Interp);
INTVAL interpinfo(struct Parrot_Interp *interpreter, INTVAL what);

void runops(struct Parrot_Interp *, size_t offset);
void runops_int(struct Parrot_Interp *, size_t offset);
void Parrot_runops_fromc(Parrot_Interp, PMC *sub);
void Parrot_runops_fromc_save(Parrot_Interp, PMC *sub);
void* Parrot_runops_fromc_args(Parrot_Interp, PMC *sub, const char *sig, ...);

typedef opcode_t *(*native_func_t)(struct Parrot_Interp * interpreter,
                                  opcode_t * cur_opcode,
                                  opcode_t * start_code);

VAR_SCOPE native_func_t run_native;

void Parrot_compreg(Parrot_Interp interpreter, STRING *type, PMC *func);
INTVAL sysinfo_i(Parrot_Interp interpreter, INTVAL info_wanted);
STRING *sysinfo_s(Parrot_Interp interpreter, INTVAL info_wanted);
void exec_init_prederef(struct Parrot_Interp *interpreter,
    void *prederef_arena);

void prepare_for_run(Parrot_Interp interpreter);
void *init_jit(Parrot_Interp interpreter, opcode_t *pc);
void dynop_register(Parrot_Interp interpreter, PMC* op_lib);
void do_prederef(void **pc_prederef, Parrot_Interp interpreter, int type);

void clone_interpreter(PMC* dest, PMC* self);

void enter_nci_method(Parrot_Interp, int type,
		 void *func, const char *name, const char *proto);
#else

typedef void * *(*native_func_t)(struct Parrot_Interp *interpreter,
                                 void *cur_opcode,
                                 void *start_code);

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
