/*  sub.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Sub-routines, co-routines and other fun stuff...
 *  Data Structure and Algorithms:
 *  History:
 *     Initial version by Melvin on 2002/06/6
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"


struct Parrot_Sub * new_sub(struct Parrot_Interp * interp,
                            opcode_t * address) {
    /* Using system memory until I figure out GC issues */
    struct Parrot_Sub * newsub = mem_sys_allocate(sizeof(struct Parrot_Sub));
    newsub->init = address;
    newsub->user_stack = new_stack(interp);
    newsub->control_stack = new_stack(interp);
    newsub->lex_pad = NULL;
    return newsub;
}


struct Parrot_Coroutine * new_coroutine(struct Parrot_Interp * interp,
                                        opcode_t * address) {
    /* Using system memory until I figure out GC issues */
    struct Parrot_Coroutine * newco = mem_sys_allocate(sizeof(struct Parrot_Coroutine));
    newco->init = address;
    newco->entry = NULL;
    newco->user_stack = new_stack(interp);
    newco->control_stack = new_stack(interp);
    newco->lex_pad = NULL;
    return newco;
}


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
