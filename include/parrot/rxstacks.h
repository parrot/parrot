/* stacks.h
 *  Copyright: (When this is determined...it will go here)
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

typedef struct rxStack_entry_t {
    INTVAL value;
}* rxStack_Entry;

typedef struct rxStack_chunk_t {
  INTVAL used;
  struct rxStack_chunk_t *next;
  struct rxStack_chunk_t *prev;
  struct rxStack_entry_t entry[STACK_CHUNK_DEPTH];
}* rxStack_Chunk;

typedef rxStack_Chunk rxStack;

rxStack
rxstack_new(struct Parrot_Interp *);

INTVAL
rxstack_depth(struct Parrot_Interp *, rxStack);

void
rxstack_push(struct Parrot_Interp *, rxStack, INTVAL);

INTVAL
rxstack_pop(struct Parrot_Interp *, rxStack);

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
