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
 * all subroutines have the same structure, mainly a interpreter->ctx
 */
typedef struct Parrot_Sub {
    struct Parrot_Context ctx;
    struct PackFile_ByteCode *seg;
    opcode_t *end;      /* end of bytecode in normal (bounds_check run loop */
    char *packed;       /* to simplify packing Constant Subs */
} * parrot_sub_t;

struct Parrot_Sub * new_sub(struct Parrot_Interp * interp);
struct Parrot_Sub * new_closure(struct Parrot_Interp * interp);
struct Parrot_Sub * new_coroutine(struct Parrot_Interp * interp);
struct Parrot_Sub * new_continuation(struct Parrot_Interp * interp);

PMC * new_continuation_pmc(struct Parrot_Interp * interp, opcode_t * address);

void save_context(struct Parrot_Interp * interp, struct Parrot_Context * ctx);
void swap_context(struct Parrot_Interp * interp, struct Parrot_Context * ctx);
void restore_context(struct Parrot_Interp * interp,
                     struct Parrot_Context * ctx);

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
