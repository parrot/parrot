/* runcore_api.h
 *  Copyright (C) 2001-2009, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Functions and macros to dispatch opcodes.
 */

#ifndef PARROT_RUNCORE_API_H_GUARD
#define PARROT_RUNCORE_API_H_GUARD

struct runcore_t;
typedef struct runcore_t Parrot_runcore_t;

#include "parrot/parrot.h"
#include "parrot/op.h"

#  define DO_OP(PC, INTERP) ((PC) = (((INTERP)->op_func_table)[*(PC)])((PC), (INTERP)))

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
    RUNCORE_FUNC_TABLE_FLAG   = 1 << 1,
    RUNCORE_EVENT_CHECK_FLAG  = 1 << 2,
    RUNCORE_PREDEREF_OPS_FLAG = 1 << 3,
    RUNCORE_CGOTO_OPS_FLAG    = 1 << 4,
    RUNCORE_JIT_OPS_FLAG      = 1 << 5
} Parrot_runcore_flags;


#define Runcore_flag_SET(runcore, flag) \
    ((runcore)->flags |= flag)
#define Runcore_flag_TEST(runcore, flag) \
    ((runcore)->flags & flag)

#define PARROT_RUNCORE_FUNC_TABLE_TEST(runcore) \
    Runcore_flag_TEST(runcore, RUNCORE_FUNC_TABLE_FLAG)
#define PARROT_RUNCORE_FUNC_TABLE_SET(runcore) \
    Runcore_flag_SET(runcore, RUNCORE_FUNC_TABLE_FLAG)

#define PARROT_RUNCORE_EVENT_CHECK_TEST(runcore) \
    Runcore_flag_TEST(runcore, RUNCORE_EVENT_CHECK_FLAG)
#define PARROT_RUNCORE_EVENT_CHECK_SET(runcore) \
    Runcore_flag_SET(runcore, RUNCORE_EVENT_CHECK_FLAG)

#define PARROT_RUNCORE_PREDEREF_OPS_TEST(runcore) \
    Runcore_flag_TEST(runcore, RUNCORE_PREDEREF_OPS_FLAG)
#define PARROT_RUNCORE_PREDEREF_OPS_SET(runcore) \
    Runcore_flag_SET(runcore, RUNCORE_PREDEREF_OPS_FLAG)

#define PARROT_RUNCORE_CGOTO_OPS_TEST(runcore) \
    Runcore_flag_TEST(runcore, RUNCORE_CGOTO_OPS_FLAG)
#define PARROT_RUNCORE_CGOTO_OPS_SET(runcore) \
    Runcore_flag_SET(runcore, RUNCORE_CGOTO_OPS_FLAG)

#define PARROT_RUNCORE_JIT_OPS_TEST(runcore) \
    Runcore_flag_TEST(runcore, RUNCORE_JIT_OPS_FLAG)
#define PARROT_RUNCORE_JIT_OPS_SET(runcore) \
    Runcore_flag_SET(runcore, RUNCORE_JIT_OPS_FLAG)

/* HEADERIZER BEGIN: src/runcore/main.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void disable_event_checking(PARROT_INTERP)
        __attribute__nonnull__(1);

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

void dynop_register(PARROT_INTERP, ARGIN(PMC *lib_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_runcore_destroy(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_runcore_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_setup_event_func_ptrs(PARROT_INTERP)
        __attribute__nonnull__(1);

void prepare_for_run(PARROT_INTERP)
        __attribute__nonnull__(1);

void runops_int(PARROT_INTERP, size_t offset)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_disable_event_checking __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_enable_event_checking __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_register __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(coredata))
#define ASSERT_ARGS_Parrot_runcore_switch __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_dynop_register __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(lib_pmc))
#define ASSERT_ARGS_Parrot_runcore_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_setup_event_func_ptrs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
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
oplib_init_f get_core_op_lib_init(SHIM_INTERP,
    ARGIN(Parrot_runcore_t *runcore))
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
void * init_prederef(PARROT_INTERP, ARGIN(Parrot_runcore_t *runcore))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void load_prederef(PARROT_INTERP, ARGIN(Parrot_runcore_t *runcore))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_runcore_cgoto_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_runcore_cgp_init(PARROT_INTERP)
        __attribute__nonnull__(1);

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

void Parrot_runcore_switch_init(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_get_core_op_lib_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(runcore))
#define ASSERT_ARGS_init_prederef __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore))
#define ASSERT_ARGS_load_prederef __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore))
#define ASSERT_ARGS_Parrot_runcore_cgoto_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_cgp_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
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
#define ASSERT_ARGS_Parrot_runcore_switch_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/runcore/cores.c */

#endif /* PARROT_RUNCORE_API_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
