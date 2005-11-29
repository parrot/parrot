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

union parrot_context_t;

/*
 * a flag to signal a Sub that a new RetContinuation should be created
 */

#define NEED_CONTINUATION ((void*)1)

/*
 * Sub and Closure share a Parrot_sub structure.
 * Closures have additionally an 'outer_ctx'
 */
typedef struct Parrot_sub {
    struct PackFile_ByteCode *seg;      /* bytecode segment */
    opcode_t *address;          /* start of bytecode, addr to continue */
    opcode_t *end;              /* end of bytecode */

    INTVAL   HLL_id;            /* see src/hll.c XXX or per segment? */
    PMC      *namespace;       /* where this Sub is in */
    STRING   *name;             /* name of the sub */
    PMC      *multi_signature;  /* list of types for MMD */
    INTVAL   n_regs_used[4];	/* INSP in PBC */

    PMC      *lex_info;         /* LexInfo PMC */
    PMC      *outer_sub;        /* :outer for closures */
    PMC      *eval_pmc;         /* eval container / NULL */
    parrot_context_t *ctx;      /* the context this sub is in */

    /* - end common */
    struct Parrot_Context *outer_ctx;   /* outer context, if a closure */
} * parrot_sub_t;

#define PMC_sub(pmc)		  ((parrot_sub_t)PMC_struct_val(pmc))
#define PMC_sub_ASSIGN(pmc,sub)	  VOIDPTR_ASSIGN(parrot_sub_t, PMC_struct_val(pmc), sub)

/* the first entries must match Parrot_sub, so we can cast
 * these two to the other type
 */
typedef struct Parrot_coro {
    struct PackFile_ByteCode *seg;      /* bytecode segment */
    opcode_t *address;          /* start of bytecode, addr to continue */
    opcode_t *end;              /* end of bytecode */

    INTVAL   HLL_id;            /* see src/hll.c XXX or per segment? */
    PMC      *namespace;       /* where this Sub is in */
    STRING   *name;             /* name of the sub */
    PMC      *multi_signature;  /* list of types for MMD */
    INTVAL   n_regs_used[4];	/* INSP in PBC */

    PMC      *lex_info;         /* LexInfo PMC */
    PMC      *outer_sub;        /* :outer for closures */
    PMC      *eval_pmc;         /* eval container / NULL */
    struct Parrot_Context  *ctx;          /* coroutine context */

    /* - end common */

    struct PackFile_ByteCode *caller_seg;  /* bytecode segment */
} * parrot_coro_t;

#define PMC_coro(pmc) 		  ((parrot_coro_t)PMC_struct_val(pmc))
#define PMC_coro_ASSIGN(pmc,coro) VOIDPTR_ASSIGN(parrot_coro_t, PMC_struct_val(pmc), coro)

typedef struct Parrot_cont {
    /* continuation destination */
    struct PackFile_ByteCode *seg;   /* bytecode segment */
    opcode_t *address;               /* start of bytecode, addr to continue */
    struct Parrot_Context *to_ctx;   /* pointer to dest context */
    /* a Continuation keeps the from_ctx alive */
    struct Parrot_Context *from_ctx;  /* sub, this cont is returning from */
    opcode_t *current_results;    /* ptr into code with get_results opcode
                                    full continuation only */
} * parrot_cont_t;

#define PMC_cont(pmc)		  ((parrot_cont_t)PMC_struct_val(pmc))
#define PMC_cont_ASSIGN(pmc,cont) VOIDPTR_ASSIGN(parrot_cont_t, PMC_struct_val(pmc), cont)

struct Parrot_Context_info {
    STRING* subname;
    STRING* nsname;
    STRING* fullname;
    int pc;
    const char *file;
    int line;
    opcode_t *address;
};

struct Parrot_sub * new_sub(Interp * interp);
struct Parrot_sub * new_closure(Interp * interp);
struct Parrot_coro * new_coroutine(Interp * interp);
struct Parrot_cont * new_continuation(Interp * interp, struct Parrot_cont *to);
struct Parrot_cont * new_ret_continuation(Interp * interp);

PMC * new_ret_continuation_pmc(Interp *, opcode_t * address);

void mark_context(Interp *, parrot_context_t *);

void invalidate_retc_context(Interp *interpreter, PMC *cont);

STRING* Parrot_full_sub_name(Interp* interpreter, PMC* sub);
int Parrot_Context_info(Interp *interpreter, parrot_context_t *, struct Parrot_Context_info *);
STRING* Parrot_Context_infostr(Interp *interpreter, parrot_context_t *);

PMC* Parrot_find_pad(Interp*, STRING *lex_name, parrot_context_t *);
PMC* parrot_new_closure(Interp*, PMC*);

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
