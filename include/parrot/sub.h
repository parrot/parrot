/* sub.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *  Data Structure and Algorithms:
 *     Subroutine, coroutine, closure and continuation structures
 *     and related routines.
 *  History:
 *     Initial version by Melvin on on 2002/06/6
 *  Notes:
 *  References:
 */

#if !defined(PARROT_SUB_H_GUARD)
#define PARROT_SUB_H_GUARD

#include "parrot/parrot.h"

/*
 * Sub and Closure share a Parrot_Sub structure, Closure has additionally
 * a lexical pad stack
 */
typedef struct Parrot_sub {
    struct PackFile_ByteCode *seg;      /* bytecode segment */
    opcode_t *end;              /* end of bytecode */
    STRING   *name;             /* name of the sub */
    char *packed;               /* to simplify packing Constant Subs
                                   that's a hack, until we use freeze
                                */
    size_t use_reg_offs;        /* offset of highest changed register*/
    struct Stack_Chunk *pad_stack;      /* only for closure */
} * parrot_sub_t;

#define PMC_sub(pmc) LVALUE_CAST(parrot_sub_t, PMC_pmc_val(pmc))

/* the first entries must match Parrot_sub, so we can cast
 * these two to the other type
 */
typedef struct Parrot_coro {
    struct PackFile_ByteCode *seg;
    opcode_t *end;
    STRING   *name;
    char *packed;
    size_t use_reg_offs;
    /* - end common */
    struct Parrot_Context ctx;          /* XXX 2 continuations */
    struct Stack_Chunk *co_control_base;
    struct Stack_Chunk *co_control_stack;  /* control stack top of the cor.*/
} * parrot_coro_t;

#define PMC_coro(pmc) LVALUE_CAST(parrot_coro_t, PMC_pmc_val(pmc))

typedef struct Parrot_cont {
    struct Parrot_Context ctx;  /* copy of interpreter context */
    struct PackFile_ByteCode *seg;      /* bytecode segment */
} * parrot_cont_t;

#define PMC_cont(pmc) LVALUE_CAST(parrot_cont_t, PMC_pmc_val(pmc))

struct Parrot_sub * new_sub(struct Parrot_Interp * interp);
struct Parrot_sub * new_closure(struct Parrot_Interp * interp);
struct Parrot_coro * new_coroutine(struct Parrot_Interp * interp);
struct Parrot_cont * new_continuation(struct Parrot_Interp * interp);
struct Parrot_cont * new_ret_continuation(struct Parrot_Interp * interp);

PMC * new_ret_continuation_pmc(struct Parrot_Interp *, opcode_t * address);

void save_context(struct Parrot_Interp *, struct Parrot_Context *);
void swap_context(struct Parrot_Interp *, PMC *);
void restore_context(struct Parrot_Interp *, struct Parrot_Context *);
void mark_context(struct Parrot_Interp *, struct Parrot_Context *);


#endif /* PARROT_SUB_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
