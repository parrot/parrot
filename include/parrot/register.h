/* register.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Defines the register api
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_REGISTER_H_GUARD)
#define PARROT_REGISTER_H_GUARD

#include "parrot/string.h"

/*
 * Macros to make accessing registers more convenient/readable.
 */

#  define INTERP_REG_NUM(i, x) i->ctx.bp.regs_n[-1L-(x)]
#  define INTERP_REG_INT(i, x) i->ctx.bp.regs_i[x]
#  define INTERP_REG_PMC(i, x) i->ctx.bp_ps.regs_p[-1L-(x)]
#  define INTERP_REG_STR(i, x) i->ctx.bp_ps.regs_s[x]

#  define CTX_REG_NUM(ctx, x) (ctx)->bp.regs_n[-1L-(x)]
#  define CTX_REG_INT(ctx, x) (ctx)->bp.regs_i[x]
#  define CTX_REG_PMC(ctx, x) (ctx)->bp_ps.regs_p[-1L-(x)]
#  define CTX_REG_STR(ctx, x) (ctx)->bp_ps.regs_s[x]
/*
 * and a set of macros to access a register by offset, used
 * in JIT emit prederef code
 * The offsets are relative to interpreter->ctx.bp.
 *
 * Reg order in imcc/reg_alloc.c is "INSP"   TODO make defines
 */

#define REGNO_INT 0
#define REGNO_NUM 1
#define REGNO_STR 2
#define REGNO_PMC 3

#  define __CTX interpreter->ctx.state
#  define _SIZEOF_INTS    (sizeof(INTVAL) * __CTX->n_regs_used[REGNO_INT])
#  define _SIZEOF_NUMS    (sizeof(FLOATVAL) * __CTX->n_regs_used[REGNO_NUM])
#  define _SIZEOF_PMCS    (sizeof(PMC*) * __CTX->n_regs_used[REGNO_PMC])
#  define _SIZEOF_STRS    (sizeof(STRING*) * __CTX->n_regs_used[REGNO_STR])

#  define REG_OFFS_NUM(x) (sizeof(FLOATVAL) * (-1L - (x)))
#  define REG_OFFS_INT(x) (sizeof(INTVAL) * (x))
#  define REG_OFFS_PMC(x) (_SIZEOF_INTS + sizeof(PMC*) * \
        (__CTX->n_regs_used[REGNO_PMC] - 1L - (x)))
#  define REG_OFFS_STR(x) (sizeof(STRING*) * (x) + _SIZEOF_INTS + _SIZEOF_PMCS )


/*
 * same with the default name interpreter
 */
#define REG_INT(x) INTERP_REG_INT(interpreter, x)
#define REG_NUM(x) INTERP_REG_NUM(interpreter, x)
#define REG_STR(x) INTERP_REG_STR(interpreter, x)
#define REG_PMC(x) INTERP_REG_PMC(interpreter, x)


struct Stack_Chunk;

void Parrot_push_regs(Interp *);
void Parrot_pop_regs(Interp *);

void Parrot_clear_i(Interp *);
void Parrot_clear_s(Interp *);
void Parrot_clear_p(Interp *);
void Parrot_clear_n(Interp *);

struct Parrot_Context;        /* parrot/interpreter.h */
void Parrot_alloc_context(Interp *, INTVAL *n_regs_used);
void Parrot_realloc_context(Interp *, INTVAL *n_regs_used);
void Parrot_free_context(Interp *, struct Parrot_Context *, int re_use);
void Parrot_set_context_threshold(Interp *, struct Parrot_Context *);
void parrot_gc_context(Interp *);

void create_initial_context(Interp *);
void destroy_context(Interp *);

void setup_register_stacks(Interp*);
void mark_register_stack(Interp* interpreter,
                             struct Stack_Chunk* stack);

#endif /* PARROT_REGISTER_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
