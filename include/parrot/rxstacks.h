/* rxstacks.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Regex stack handling routines for Parrot
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_RXSTACKS_H_GUARD)
#define PARROT_RXSTACKS_H_GUARD

#include "parrot/parrot.h"

#define STACK_CHUNK_DEPTH 256

typedef struct IntStack_entry_t {
    INTVAL value;
} *IntStack_Entry;

typedef struct IntStack_chunk_t {
    INTVAL used;
    struct IntStack_chunk_t *next;
    struct IntStack_chunk_t *prev;
    struct IntStack_entry_t entry[STACK_CHUNK_DEPTH];
} *IntStack_Chunk;

typedef IntStack_Chunk IntStack;

IntStack intstack_new(Interp *);

INTVAL intstack_depth(Interp *, IntStack);

void intstack_push(Interp *, IntStack, INTVAL);

INTVAL intstack_pop(Interp *, IntStack);

void intstack_free(Interp *, IntStack);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
