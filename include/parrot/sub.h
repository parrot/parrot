/* subroutine.h
 *  Copyright: (When this is determined...it will go here)
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

typedef struct Parrot_Sub {
    INTVAL              flags;
    PMC                 *lex_pad;
    opcode_t            *init;
} * parrot_sub_t;

typedef struct Parrot_Coroutine {
    INTVAL               flags;
    struct Parrot_Context ctx;
    opcode_t             *resume;
} * parrot_coroutine_t;

typedef struct Parrot_Continuation {
    struct Parrot_Context ctx;
    opcode_t            *continuation;
} * parrot_continuation_t;

struct Parrot_Sub * new_sub(struct Parrot_Interp * interp,
                            opcode_t * address);

struct Parrot_Coroutine * new_coroutine(struct Parrot_Interp * interp,
                                        opcode_t * address);

struct Parrot_Continuation * new_continuation(struct Parrot_Interp * interp,
                                              opcode_t * address);

PMC * new_continuation_pmc(struct Parrot_Interp * interp,
                           opcode_t * address);

void save_context(struct Parrot_Interp * interp,
                  struct Parrot_Context * ctx);

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
