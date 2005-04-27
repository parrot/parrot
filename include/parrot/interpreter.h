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

    PARROT_EXTERN_CODE_FLAG = 0x100, /* reusing another interp's code */
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
    PARROT_FAST_CORE      = 0x01,  /* fast DO_OP core */
    PARROT_SWITCH_CORE    = 0x02,  /*  P                */
    PARROT_CGP_CORE       = 0x06,  /* CP                */
    PARROT_CGOTO_CORE     = 0x04,  /* C    = cgoto      */
    PARROT_JIT_CORE       = 0x10,  /* TODO arange bits for P testing */
    PARROT_EXEC_CORE      = 0x20   /* TODO Parrot_exec_run variants */
} Parrot_Run_core_t;

/* &end_gen */
struct parrot_interp_t;

typedef struct parrot_interp_t *Parrot_Interp;

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
     PARROT_PROF_DOD_p1,        /* pass 1 mark root set */
     PARROT_PROF_DOD_p2,        /* pass 2 mark next_for_GC */
     PARROT_PROF_DOD_cp,        /* collect PMCs */
     PARROT_PROF_DOD_cb,        /* collect buffers */
     /* DOD must be 0..3 */
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
    opcode_t cur_op;
    ProfData *data;
} RunProfile;

/* Forward declaration for imc_info_t -- the actual struct is
 * defined in imcc/imc.h
 */
struct _imc_info_t;

/*
 * Parrot registers are now accessed through interpreter->ctx.bp
 * This structure is dynamically allocated in subroutine calls
 * and restored on subroutine returns on more precisely on invokation
 * of a continuation by restoring the interpreter context.
 */
struct parrot_regs_t {
#ifdef SLIDING_BP
    struct {
        INTVAL  int_reg;
        FLOATVAL num_reg;
        STRING * string_reg;
        PMC * pmc_reg;
    } registers[32];
#else
    struct IReg int_reg;
    struct NReg num_reg;
    struct SReg string_reg;
    struct PReg pmc_reg;
#endif /* SLIDING_BP */
};

typedef struct Parrot_Context {
    struct parrot_regs_t *bp;           /* indirect reg base pointer */
    struct Stack_Chunk *int_reg_stack;  /* register frame stacks */
    struct Stack_Chunk *num_reg_stack;
    struct Stack_Chunk *string_reg_stack;
    struct Stack_Chunk *pmc_reg_stack;

    struct Stack_Chunk *reg_stack;      /* all in one register stack */

    struct Stack_Chunk *pad_stack;      /* Base of the lex pad stack */
    struct Stack_Chunk *user_stack;     /* Base of the scratch stack */
    struct Stack_Chunk *control_stack;  /* Base of the flow control stack */
    IntStack intstack;                  /* Base of the regex stack */
    UINTVAL warns;             /* Keeps track of what warnings
                                 * have been activated */
    UINTVAL errors;            /* fatals that can be turned off */
    UINTVAL recursion_depth;    /* Sub call resursion depth */
    int runloop_level;                  /* for reentering run loop */
    /*
     * new call scheme and introspective variables
     */
    PMC *current_sub;           /* the Sub we are executing */
    /*
     * for now use a return continuation PMC
     */
    PMC *current_cont;          /* the return continuation PMC */
    PMC *current_object;        /* current object if a method call */
    STRING *current_method;     /* name of method */
    UINTVAL current_class_offset; /* Offset into the class array of the
                                    currently found method */
    opcode_t *current_pc;       /* program counter of Sub invocation */
    String *current_package;    /* The package we're currently in */
} parrot_context_t;

struct _Thread_data;    /* in thread.h */
struct _Caches;         /* caches .h */

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
 * The actual interpreter structure
 */
struct parrot_interp_t {
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

/* XXX kwoo:  Is this for future, or is it safe to remove? */
#if 0
    str_func_t *string_funcs;
#endif

    Interp_flags flags;         /* Various interpreter flags that */
    Run_Cores run_core;         /* type of core to run the ops */

    /* TODO profile per code segment or global */
    RunProfile *profile;        /* The structure and array where we keep the
                                 * profile counters */
    INTVAL resume_flag;
    size_t resume_offset;

    struct PackFile_ByteCode  *code;      /* The code we are executing */
    struct PackFile *initial_pf;   /* first created PF */

    struct _imc_info_t *imc_info;   /* imcc data */
    size_t current_line;        /* Which line we're executing in the
                                 * source */
    String *current_file;       /* The file we're currently in */


    PDB_t *pdb;                 /* Debug system */
    void *lo_var_ptr;           /* Pointer to memory on runops system stack */
    Interp * parent_interpreter;

    /* per interpreter global vars */
    INTVAL world_inited;        /* Parrot_init is done */
    PMC *iglobals;              /* SArray of PMCs, containing: */
/* 0:   PMC *Parrot_base_classname_hash; hash containing name->base_type */
/* 1:   PMC *Parrot_compreg_hash;    hash containing assembler/compilers */
/* 2:   PMC *Argv;                   list of argv */
/* 3:   PMC *NCI func hash           hash of NCI funcs */
/* 4:   PMC *ParrotInterpreter       that's me */
/* 5:   PMC *Dyn_libs           Array of dynamically loaded ParrotLibrary  */
    PMC* DOD_registry;          /* registered PMCs added to the root set */
    MMD_table *binop_mmd_funcs; /* Table of MMD functions */
    UINTVAL n_binop_mmd_funcs;   /* function count */
    struct _Caches * caches;            /* s. caches.h */
    STRING **const_cstring_table;       /* CONST_STRING(x) items */
    struct QUEUE* task_queue;           /* per interpreter queue */
    int sleeping;                       /* used during sleep in events */
    struct parrot_exception_t *exceptions; /* internal exception stack */
    struct parrot_exception_t *exc_free_list; /* and free list */
    PMC ** exception_list;              /* precreated exception objects */
    struct _Thread_data *thread_data;   /* thread specific items */
    UINTVAL recursion_limit;    /* Sub call resursion limit */
    UINTVAL gc_generation;      /* GC generation number */
};

/* typedef struct parrot_interp_t Interp;    done in parrot.h so that
                                             interpreter.h's prereq headers can
                                             use 'Interp' */

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
    IGLOBALS_NCI_FUNCS,
    IGLOBALS_INTERPRETER,
    IGLOBALS_DYN_LIBS,
    IGLOBALS_RUNTIME_LIBRARY,

    IGLOBALS_SIZE
} iglobals_enum;
/* &end_gen */

/*
 * Macros to make accessing registers more convenient/readable.
 */

#ifdef SLIDING_BP

#  define INTERP_REG_INT(i, x) i->ctx.bp->registers[x].int_reg
#  define INTERP_REG_NUM(i, x) i->ctx.bp->registers[x].num_reg
#  define INTERP_REG_STR(i, x) i->ctx.bp->registers[x].string_reg
#  define INTERP_REG_PMC(i, x) i->ctx.bp->registers[x].pmc_reg

#  define BP_REG_INT(bp, x) bp->registers[x].int_reg
#  define BP_REG_NUM(bp, x) bp->registers[x].num_reg
#  define BP_REG_STR(bp, x) bp->registers[x].string_reg
#  define BP_REG_PMC(bp, x) bp->registers[x].pmc_reg

#else

#  define INTERP_REG_INT(i, x) i->ctx.bp->int_reg.registers[x]
#  define INTERP_REG_NUM(i, x) i->ctx.bp->num_reg.registers[x]
#  define INTERP_REG_STR(i, x) i->ctx.bp->string_reg.registers[x]
#  define INTERP_REG_PMC(i, x) i->ctx.bp->pmc_reg.registers[x]

#  define BP_REG_INT(bp, x) bp->int_reg.registers[x]
#  define BP_REG_NUM(bp, x) bp->num_reg.registers[x]
#  define BP_REG_STR(bp, x) bp->string_reg.registers[x]
#  define BP_REG_PMC(bp, x) bp->pmc_reg.registers[x]

#endif /* SLIDING_BP */

#define REG_BASE struct parrot_regs_t

/*
 * same with the default name interpreter
 */
#define REG_INT(x) INTERP_REG_INT(interpreter, x)
#define REG_NUM(x) INTERP_REG_NUM(interpreter, x)
#define REG_STR(x) INTERP_REG_STR(interpreter, x)
#define REG_PMC(x) INTERP_REG_PMC(interpreter, x)

/*
 * and a set of macros to access a register by offset, mostly used
 * in JIT emit code
 * The offsets are relative to REG_BASE, which is REG_INT(0),
 * i.e. that what interpreter->ctx.bp is pointing to.
 */


#ifdef SLIDING_BP
#  define REG_OFFS_INT(x) offsetof(REG_BASE, registers[x].int_reg)
#  define REG_OFFS_NUM(x) offsetof(REG_BASE, registers[x].num_reg)
#  define REG_OFFS_STR(x) offsetof(REG_BASE, registers[x].string_reg)
#  define REG_OFFS_PMC(x) offsetof(REG_BASE, registers[x].pmc_reg)
#else
#  define REG_OFFS_INT(x) offsetof(REG_BASE, int_reg.registers[x])
#  define REG_OFFS_NUM(x) offsetof(REG_BASE, num_reg.registers[x])
#  define REG_OFFS_STR(x) offsetof(REG_BASE, string_reg.registers[x])
#  define REG_OFFS_PMC(x) offsetof(REG_BASE, pmc_reg.registers[x])
#endif /* SLIDING_BP */

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
#endif /* PARROT_CATCH_NULL */

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

Interp *make_interpreter(Interp * parent, Interp_flags);
void Parrot_init(Interp *);
void Parrot_destroy(Interp *);

INTVAL interpinfo(Interp *interpreter, INTVAL what);
PMC*   interpinfo_p(Interp *interpreter, INTVAL what);
STRING*interpinfo_s(Interp *interpreter, INTVAL what);

void runops(Interp *, size_t offset);
void runops_int(Interp *, size_t offset);
struct parrot_regs_t* Parrot_runops_fromc(Interp *, PMC *sub);
void* Parrot_runops_fromc_args(Interp *, PMC *sub, const char *sig, ...);
INTVAL Parrot_runops_fromc_args_reti(Interp *, PMC *, const char *, ...);
FLOATVAL Parrot_runops_fromc_args_retf(Interp *, PMC *, const char *, ...);

void* Parrot_runops_fromc_arglist(Interp *, PMC *, const char *sig, va_list);
INTVAL Parrot_runops_fromc_arglist_reti(Interp *, PMC *, const char *, va_list);
FLOATVAL Parrot_runops_fromc_arglist_retf(Interp *, PMC *, const char *,
        va_list);

void* Parrot_run_meth_fromc(Interp *, PMC *sub, PMC* obj, STRING *meth);
void* Parrot_run_meth_fromc_args(Interp *, PMC *sub,
        PMC* obj, STRING *meth, const char *signature, ...);
INTVAL Parrot_run_meth_fromc_args_reti(Interp *, PMC *sub,
        PMC* obj, STRING *meth, const char *signature, ...);
FLOATVAL Parrot_run_meth_fromc_args_retf(Interp *, PMC *sub,
        PMC* obj, STRING *meth, const char *signature, ...);

void* Parrot_run_meth_fromc_arglist(Interp *, PMC *sub,
        PMC* obj, STRING *meth, const char *signature, va_list);
INTVAL Parrot_run_meth_fromc_arglist_reti(Interp *, PMC *sub,
        PMC* obj, STRING *meth, const char *signature, va_list);
FLOATVAL Parrot_run_meth_fromc_arglist_retf(Interp *, PMC *sub,
        PMC* obj, STRING *meth, const char *signature, va_list);

void Parrot_callback_C(void *external_data, PMC *callback_info);
void Parrot_callback_D(PMC *callback_info, void *external_data);
PMC* Parrot_make_cb(Interp * interpreter, PMC* sub, PMC* user_data,
        STRING* cb_signature);

typedef opcode_t *(*native_func_t)(Interp * interpreter,
                                   opcode_t * cur_opcode,
                                   opcode_t * start_code);

VAR_SCOPE native_func_t run_native;

typedef PMC *(*Parrot_compiler_func_t)(Parrot_Interp interpreter,
                                       const char * program );

void Parrot_compreg(Interp * interpreter, STRING *, Parrot_compiler_func_t func);
INTVAL sysinfo_i(Interp * interpreter, INTVAL info_wanted);
STRING *sysinfo_s(Interp * interpreter, INTVAL info_wanted);
void exec_init_prederef(Interp *interpreter,
    void *prederef_arena);

void prepare_for_run(Interp * interpreter);
void *init_jit(Interp * interpreter, opcode_t *pc);
void dynop_register(Interp * interpreter, PMC* op_lib);
void do_prederef(void **pc_prederef, Interp * interpreter, int type);

void clone_interpreter(PMC* dest, PMC* self);

void enter_nci_method(Interp *, int type,
		 void *func, const char *name, const char *proto);

void parrot_PIC_prederef(Interp *, opcode_t op, void **pc_pred, int type);

#else

typedef void * *(*native_func_t)(Parrot_Interp interpreter,
                                 void *cur_opcode,
                                 void *start_code);

#endif   /* PARROT_IN_CORE */
#endif   /* PARROT_INTERPRETER_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
