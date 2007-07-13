/* trace.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Tracing support for runops_cores.c.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_TRACE_H_GUARD
#define PARROT_TRACE_H_GUARD

#include "parrot/parrot.h"

/* HEADERIZER BEGIN: src/trace.c */

int trace_key_dump( PARROT_INTERP, NOTNULL(const PMC *key) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void trace_op( PARROT_INTERP,
    NOTNULL(const opcode_t *code_start),
    NOTNULL(const opcode_t *code_end),
    NULLOK(const opcode_t *pc) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void trace_op_dump( PARROT_INTERP,
    NOTNULL(const opcode_t *code_start),
    NOTNULL(const opcode_t *pc) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void trace_pmc_dump( PARROT_INTERP, NOTNULL(PMC *pmc) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/trace.c */

#endif /* PARROT_TRACE_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
