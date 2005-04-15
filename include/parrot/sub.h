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
 * Subroutine flags
 */
typedef enum {
    SUB_FLAG_CORO_FF      = PObj_private0_FLAG,
    SUB_FLAG_C_HANDLER    = PObj_private0_FLAG,

    SUB_FLAG_FIXUP_DONE   = PObj_private1_FLAG,
    SUB_FLAG_TAILCALL     = PObj_private2_FLAG,
    SUB_FLAG_GENERATOR    = PObj_private3_FLAG,

    /* from packfile */
    SUB_FLAG_PF_ANON      = PObj_private3_FLAG,
    SUB_FLAG_PF_MAIN      = PObj_private4_FLAG,
    SUB_FLAG_PF_LOAD      = PObj_private5_FLAG,
    SUB_FLAG_PF_IMMEDIATE = PObj_private6_FLAG,
    SUB_FLAG_PF_POSTCOMP  = PObj_private7_FLAG,

    SUB_FLAG_PF_MASK      = 0xf8   /* anon ... postcomp */

} sub_flags_enum;


/*
 * Sub and Closure share a Parrot_sub structure, Closure has additionally
 * a lexical pad stack
 */
typedef struct Parrot_sub {
    struct PackFile_ByteCode *seg;      /* bytecode segment */
    opcode_t *address;          /* start of bytecode, addr to continue */
    opcode_t *end;              /* end of bytecode */
    STRING   *name;             /* name of the sub */
    PMC *name_space;            /* where this Sub is in */
    PMC *multi_signature;       /* list of types for MMD */
    /* - end common */
    struct Stack_Chunk *pad_stack;      /* only for closure */
} * parrot_sub_t;

#define PMC_sub(pmc) LVALUE_CAST(parrot_sub_t, PMC_struct_val(pmc))

/* the first entries must match Parrot_sub, so we can cast
 * these two to the other type
 */
typedef struct Parrot_coro {
    struct PackFile_ByteCode *seg;
    opcode_t *address;          /* start of bytecode, addr to continue */
    opcode_t *end;
    STRING   *name;
    PMC *name_space;         /* where this Sub is in */
    PMC *multi_signature;       /* list of types for MMD */
    /* - end common */
    struct Parrot_Context ctx;          /* XXX 2 continuations */
    struct Stack_Chunk *co_control_base;
    struct Stack_Chunk *co_control_stack;  /* control stack top of the cor.*/
    struct PackFile_ByteCode *caller_seg;      /* bytecode segment */
} * parrot_coro_t;

#define PMC_coro(pmc) LVALUE_CAST(parrot_coro_t, PMC_struct_val(pmc))

typedef struct Parrot_cont {
    struct PackFile_ByteCode *seg;      /* bytecode segment */
    opcode_t *address;          /* start of bytecode, addr to continue */
    struct Parrot_Context ctx;  /* copy of interpreter context */
} * parrot_cont_t;

#define PMC_cont(pmc) LVALUE_CAST(parrot_cont_t, PMC_struct_val(pmc))

struct Parrot_sub * new_sub(Interp * interp);
struct Parrot_sub * new_closure(Interp * interp);
struct Parrot_coro * new_coroutine(Interp * interp);
struct Parrot_cont * new_continuation(Interp * interp);
struct Parrot_cont * new_ret_continuation(Interp * interp);

PMC * new_ret_continuation_pmc(Interp *, opcode_t * address);

void save_context(Interp *, struct Parrot_Context *);
void swap_context(Interp *, PMC *);
void restore_context(Interp *, struct Parrot_Context *);
void mark_context(Interp *, struct Parrot_Context *);

void copy_regs(Interp *, struct parrot_regs_t *caller_regs);
void mark_reg_stack(Interp *, Stack_Chunk_t *);

void invalidate_retc_context(Interp *interpreter, struct Parrot_Context *);
void add_to_retc_cache(Interp *interpreter, PMC *pmc);
void mark_retc_cache(Interp *);
STRING* Parrot_full_sub_name(Interp* interpreter, PMC* sub);

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
