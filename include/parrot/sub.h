/* subroutine.h
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
#define PARROT_SUB_GUARD

#include "parrot/parrot.h"

/* Used by Scratchpad PMC */
typedef struct Parrot_Lexicals {
    List * values;    /* lexicals go here */
    List * names;     /* names of lexicals go here */
} * parrot_lexicals_t;

/*
 * Sub, Closure, COntinuation have the same structure
 */
typedef struct Parrot_Sub {
    struct Parrot_Context ctx;
    struct PackFile_ByteCode *seg;
    opcode_t *end;      /* end of bytecode in normal (bounds_check run loop */
    char *packed;       /* to simplify packing Constant Subs */
} * parrot_sub_t;

#define PMC_sub(pmc) LVALUE_CAST(parrot_sub_t, PMC_pmc_val(pmc))

/* the first entries must match Parrot_Sub, so we can cast
 * these two to the other type
 */
typedef struct Parrot_Coroutine {
    struct Parrot_Context ctx;
    struct PackFile_ByteCode *seg;
    opcode_t *end;      /* end of bytecode in normal (bounds_check run loop */
    char *packed;       /* to simplify packing Constant Subs */
    struct Stack_Chunk *co_control_base;
    struct Stack_Chunk *co_control_stack;  /* control stack top of the cor.*/
} * parrot_coroutine_t;

struct Parrot_Sub * new_sub(struct Parrot_Interp * interp, size_t);
struct Parrot_Sub * new_closure(struct Parrot_Interp * interp);
struct Parrot_Sub * new_coroutine(struct Parrot_Interp * interp);
struct Parrot_Sub * new_continuation(struct Parrot_Interp * interp);
struct Parrot_Sub * new_ret_continuation(struct Parrot_Interp * interp);

PMC * new_ret_continuation_pmc(struct Parrot_Interp *, opcode_t * address);

void save_context(struct Parrot_Interp *, struct Parrot_Context *);
void cow_copy_context(struct Parrot_Interp*,
        struct Parrot_Context *dest, struct Parrot_Context *src);
void swap_context(struct Parrot_Interp *, PMC *);
void restore_context(struct Parrot_Interp *, struct Parrot_Context *);
void mark_context(struct Parrot_Interp *, struct Parrot_Context *);

PMC * scratchpad_new(struct Parrot_Interp * interp, PMC * base, INTVAL depth);

PMC * scratchpad_get_current(struct Parrot_Interp * interp);

void scratchpad_store(struct Parrot_Interp * interp, PMC * pad,
                      STRING * name, INTVAL position, PMC* value);

void scratchpad_store_index(struct Parrot_Interp * interp, PMC * pad, INTVAL pad_index,
                            STRING * name, INTVAL position, PMC* value);

PMC * scratchpad_get(struct Parrot_Interp * interp, PMC * pad, STRING * name,
                     INTVAL position);

PMC * scratchpad_get_index(struct Parrot_Interp * interp, PMC * pad, INTVAL pad_index,
                           STRING * name, INTVAL position);

void lexicals_mark(struct Parrot_Interp * interp, struct Parrot_Lexicals *lex);
void scratchpad_delete(Parrot_Interp interp, PMC *pad, STRING *name);

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
