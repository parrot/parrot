/* stacks.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Stack handling routines for Parrot
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_STACKS_H_GUARD)
#define PARROT_STACKS_H_GUARD

#include "parrot/parrot.h"

#define STACK_CHUNK_DEPTH 256

struct Stack_Entry {
    INTVAL entry_type;
    INTVAL flags;
    void (*cleanup)(struct Stack_Entry *);
    union {
        FLOATVAL num_val;
        INTVAL int_val;
        PMC *pmc_val;
        STRING *string_val;
        void *generic_pointer;
    } entry;
};

struct Stack {
  INTVAL used;
  INTVAL free;
  struct StackChunk *next;
  struct StackChunk *prev;
  struct Stack_Entry entry[STACK_CHUNK_DEPTH];
};

struct Stack_Entry *push_generic_entry(void *thing, INTVAL type, void *cleanup);
void pop_generic_entry(void *where, INTVAL type);

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
