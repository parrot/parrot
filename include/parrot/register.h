/* register.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Defines the register api
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_REGISTER_H_GUARD
#define PARROT_REGISTER_H_GUARD

#include "parrot/string.h"
#include "parrot/compiler.h"
#include "parrot/stacks.h"

/*
 * Macros to make accessing registers more convenient/readable.
 */

#define INTERP_REG_NUM(i, x) (i)->ctx.bp.regs_n[-1L-(x)]
#define INTERP_REG_INT(i, x) (i)->ctx.bp.regs_i[x]
#define INTERP_REG_PMC(i, x) (i)->ctx.bp_ps.regs_p[-1L-(x)]
#define INTERP_REG_STR(i, x) (i)->ctx.bp_ps.regs_s[x]

#define CTX_REG_NUM(ctx, x) (ctx)->bp.regs_n[-1L-(x)]
#define CTX_REG_INT(ctx, x) (ctx)->bp.regs_i[x]
#define CTX_REG_PMC(ctx, x) (ctx)->bp_ps.regs_p[-1L-(x)]
#define CTX_REG_STR(ctx, x) (ctx)->bp_ps.regs_s[x]
/*
 * and a set of macros to access a register by offset, used
 * in JIT emit prederef code
 * The offsets are relative to interp->ctx.bp.
 *
 * Reg order in imcc/reg_alloc.c is "INSP"   TODO make defines
 */

#define REGNO_INT 0
#define REGNO_NUM 1
#define REGNO_STR 2
#define REGNO_PMC 3

#define __CTX interp->ctx.state
#define _SIZEOF_INTS    (sizeof (INTVAL) * __CTX->n_regs_used[REGNO_INT])
#define _SIZEOF_NUMS    (sizeof (FLOATVAL) * __CTX->n_regs_used[REGNO_NUM])
#define _SIZEOF_PMCS    (sizeof (PMC*) * __CTX->n_regs_used[REGNO_PMC])
#define _SIZEOF_STRS    (sizeof (STRING*) * __CTX->n_regs_used[REGNO_STR])

#define REG_OFFS_NUM(x) (sizeof (FLOATVAL) * (-1L - (x)))
#define REG_OFFS_INT(x) (sizeof (INTVAL) * (x))
#define REG_OFFS_PMC(x) (_SIZEOF_INTS + sizeof (PMC*) * \
        (__CTX->n_regs_used[REGNO_PMC] - 1L - (x)))
#define REG_OFFS_STR(x) (sizeof (STRING*) * (x) + _SIZEOF_INTS + _SIZEOF_PMCS)


/*
 * same with the default name interpreter
 */
/* XXX Redfine these to explicitly pass interp, rather than assuming it's there */
#define REG_INT(x) INTERP_REG_INT(interp, x)
#define REG_NUM(x) INTERP_REG_NUM(interp, x)
#define REG_STR(x) INTERP_REG_STR(interp, x)
#define REG_PMC(x) INTERP_REG_PMC(interp, x)


struct Stack_Chunk;
struct Parrot_Context;        /* parrot/interpreter.h */

/* HEADERIZER BEGIN: src/gc/register.c */

PARROT_API void Parrot_clear_i( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_clear_n( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_clear_p( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_clear_s( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_free_context( Interp *interp /*NN*/,
    struct Parrot_Context *ctxp /*NN*/,
    int re_use )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API void parrot_gc_context( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_pop_context( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_pop_regs( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API struct Parrot_Context * Parrot_push_context( Interp *interp /*NN*/,
    INTVAL *n_regs_used /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API void Parrot_push_regs( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_set_context_threshold( Interp *interp,
    struct Parrot_Context *ctxp );

void create_initial_context( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

void destroy_context( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

void mark_register_stack( Parrot_Interp interp, Stack_Chunk_t* chunk /*NN*/ )
        __attribute__nonnull__(2);

struct Parrot_Context * Parrot_alloc_context( Interp *interp /*NN*/,
    INTVAL *n_regs_used /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

struct Parrot_Context * Parrot_dup_context( Interp *interp /*NN*/,
    const struct Parrot_Context *old /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void setup_register_stacks( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/gc/register.c */

#endif /* PARROT_REGISTER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
