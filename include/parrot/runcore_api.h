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

/* HEADERIZER BEGIN: src/runops_cores.c */
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
/* HEADERIZER END: src/runops_cores.c */

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
