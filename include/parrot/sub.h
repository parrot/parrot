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


typedef struct Parrot_Sub { 
    INTVAL              flags;
    Stack_Chunk_t       *user_stack;
    Stack_Chunk_t       *control_stack;
    struct Scratchpad   *lex_pad;
    opcode_t            *init;
} * parrot_sub_t;

typedef struct Parrot_Coroutine { 
    INTVAL              flags;
    struct Parrot_Context ctx;
    struct Scratchpad   *lex_pad;
    opcode_t            *init;
    opcode_t            *resume;
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

void save_context(struct Parrot_Interp * interp,
                  struct Parrot_Context * ctx);

void restore_context(struct Parrot_Interp * interp, 
                     struct Parrot_Context * ctx);

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
