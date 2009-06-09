/* runcore_api.h
 *  Copyright (C) 2001-2009, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Functions and macros to dispatch opcodes.
 */

#ifndef PARROT_RUNCORE_API_H_GUARD
#define PARROT_RUNCORE_API_H_GUARD

#include "parrot/parrot.h"
#include "parrot/op.h"

#  define DO_OP(PC, INTERP) ((PC) = (((INTERP)->op_func_table)[*(PC)])((PC), (INTERP)))

/* HEADERIZER BEGIN: src/runcore/main.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void disable_event_checking(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void enable_event_checking(PARROT_INTERP)
        __attribute__nonnull__(1);

void do_prederef(ARGIN(void **pc_prederef), PARROT_INTERP, int type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void dynop_register(PARROT_INTERP, ARGIN(PMC *lib_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void exec_init_prederef(PARROT_INTERP, ARGIN(void *prederef_arena))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void * init_jit(PARROT_INTERP, SHIM(opcode_t *pc))
        __attribute__nonnull__(1);

void Parrot_runcore_destroy(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_setup_event_func_ptrs(PARROT_INTERP)
        __attribute__nonnull__(1);

void prepare_for_run(PARROT_INTERP)
        __attribute__nonnull__(1);

void runops_int(PARROT_INTERP, size_t offset)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_disable_event_checking __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_enable_event_checking __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_do_prederef __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(pc_prederef) \
    || PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_dynop_register __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(lib_pmc)
#define ASSERT_ARGS_exec_init_prederef __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(prederef_arena)
#define ASSERT_ARGS_init_jit __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_runcore_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_setup_event_func_ptrs __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_prepare_for_run __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_runops_int __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/runcore/main.c */

/* HEADERIZER BEGIN: src/runcore/cores.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t * runops_cgoto_core(PARROT_INTERP, ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t * runops_debugger_core(PARROT_INTERP, ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t * runops_fast_core(PARROT_INTERP, ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t * runops_gc_debug_core(PARROT_INTERP, ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t * runops_profile_core(PARROT_INTERP, ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t * runops_slow_core(PARROT_INTERP, ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_runops_cgoto_core __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pc)
#define ASSERT_ARGS_runops_debugger_core __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pc)
#define ASSERT_ARGS_runops_fast_core __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pc)
#define ASSERT_ARGS_runops_gc_debug_core __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pc)
#define ASSERT_ARGS_runops_profile_core __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pc)
#define ASSERT_ARGS_runops_slow_core __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pc)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/runcore/cores.c */

opcode_t *runops_fast_core(PARROT_INTERP, opcode_t *);

opcode_t *runops_cgoto_core(PARROT_INTERP, opcode_t *);

opcode_t *runops_slow_core(PARROT_INTERP, opcode_t *);

opcode_t *runops_profile_core(PARROT_INTERP, opcode_t *);

#endif /* PARROT_RUNCORE_API_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
