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
    struct stack_chunk  *user_stack;
    struct stack_chunk  *control_stack;
    struct Scratchpad   *lex_pad;
    opcode_t            *init;
} * parrot_sub_t;

typedef struct Parrot_Coroutine { 
    INTVAL              flags;
    struct stack_chunk  *user_stack;
    struct stack_chunk  *control_stack;
    struct IReg         int_reg;
    struct NReg         num_reg;
    struct SReg         string_reg;
    struct PReg         pmc_reg;
    struct Scratchpad   *lex_pad;
    opcode_t            *init;
    opcode_t            *entry;
} * parrot_coroutine_t;

struct Parrot_Sub *new_sub(struct Parrot_Interp * interp, opcode_t * address);
struct Parrot_Coroutine *new_coroutine(struct Parrot_Interp * interp, opcode_t * address);


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
