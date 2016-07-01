/* runcore_api.h
 *  Copyright (C) 2001-2009, Parrot Foundation.
 *  Overview:
 *     Functions and macros to dispatch opcodes.
 */

#ifndef PARROT_RUNCORE_API_H_GUARD
#define PARROT_RUNCORE_API_H_GUARD

struct runcore_t;
typedef struct runcore_t Parrot_runcore_t;

#include "parrot/parrot.h"
#include "parrot/op.h"

#  define DO_OP(PC, INTERP) ((PC) = (((INTERP)->code->op_func_table)[*(PC)])((PC), (INTERP)))

typedef opcode_t * (*runcore_runops_fn_type) (PARROT_INTERP, ARGIN(Parrot_runcore_t *), ARGIN(opcode_t *pc));
typedef       void (*runcore_destroy_fn_type)(PARROT_INTERP, ARGIN(Parrot_runcore_t *));
typedef     void * (*runcore_prepare_fn_type)(PARROT_INTERP, ARGIN(Parrot_runcore_t *));

typedef runcore_runops_fn_type  Parrot_runcore_runops_fn_t;
typedef runcore_destroy_fn_type Parrot_runcore_destroy_fn_t;
typedef runcore_prepare_fn_type Parrot_runcore_prepare_fn_t;

struct runcore_t {
    STRING                  *name;
    int                      id;
    oplib_init_f             opinit;
    runcore_runops_fn_type   runops;
    runcore_destroy_fn_type  destroy;
    runcore_prepare_fn_type  prepare_run;
    INTVAL                   flags;
};

typedef enum Parrot_runcore_flags {
    RUNCORE_REENTRANT_FLAG    = 1 << 0,
    RUNCORE_FUNC_TABLE_FLAG   = 1 << 1
} Parrot_runcore_flags;


#define Runcore_flag_SET(runcore, flag) \
    ((runcore)->flags |= flag)
#define Runcore_flag_TEST(runcore, flag) \
    ((runcore)->flags & flag)

#define PARROT_RUNCORE_FUNC_TABLE_TEST(runcore) \
    Runcore_flag_TEST(runcore, RUNCORE_FUNC_TABLE_FLAG)
#define PARROT_RUNCORE_FUNC_TABLE_SET(runcore) \
    Runcore_flag_SET(runcore, RUNCORE_FUNC_TABLE_FLAG)

/* HEADERIZER BEGIN: src/runcore/main.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void disable_event_checking(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void dynop_register(PARROT_INTERP, ARGIN(PMC *lib_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void enable_event_checking(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
INTVAL Parrot_runcore_register(PARROT_INTERP,
    ARGIN(Parrot_runcore_t *coredata))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_runcore_switch(PARROT_INTERP, ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void parrot_hash_oplib(PARROT_INTERP, ARGIN(op_lib_t *lib))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_runcore_destroy(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_runcore_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void prepare_for_run(PARROT_INTERP)
        __attribute__nonnull__(1);

void runops_int(PARROT_INTERP, size_t offset)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_disable_event_checking __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_dynop_register __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(lib_pmc))
#define ASSERT_ARGS_enable_event_checking __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_register __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(coredata))
#define ASSERT_ARGS_Parrot_runcore_switch __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_parrot_hash_oplib __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(lib))
#define ASSERT_ARGS_Parrot_runcore_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_prepare_for_run __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_runops_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/runcore/main.c */

/* HEADERIZER BEGIN: src/runcore/cores.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
oplib_init_f get_core_op_lib_init(PARROT_INTERP,
    ARGIN(Parrot_runcore_t *runcore))
        __attribute__nonnull__(2);

void Parrot_runcore_debugger_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_runcore_exec_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_runcore_fast_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_runcore_gc_debug_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_runcore_slow_init(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_get_core_op_lib_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(runcore))
#define ASSERT_ARGS_Parrot_runcore_debugger_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_exec_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_fast_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_gc_debug_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_slow_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/runcore/cores.c */

#endif /* PARROT_RUNCORE_API_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
