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
    union {
        FLOATVAL num_val;
        INTVAL int_val;
        PMC *pmc_val;
        STRING *string_val;
        void *generic_pointer;
    } entry;
    INTVAL entry_type;
    INTVAL flags;
    void (*cleanup)(struct Stack_Entry *);
};

struct StackChunk {
  INTVAL used;
  INTVAL free;
  struct StackChunk *next;
  struct StackChunk *prev;
  struct Stack_Entry entry[STACK_CHUNK_DEPTH];
};

struct Stack_Entry *push_generic_entry(struct Parrot_Interp *, void *thing, INTVAL type, void *cleanup);
void *pop_generic_entry(struct Parrot_Interp *, void *where, INTVAL type);
void toss_generic_entry(struct Parrot_Interp *, INTVAL type);

#define STACK_ENTRY_INT 1
#define STACK_ENTRY_FLOAT 2
#define STACK_ENTRY_STRING 3
#define STACK_ENTRY_PMC 4
#define STACK_ENTRY_POINTER 5
#define STACK_ENTRY_DESTINATION 6

#define STACK_ENTRY_CLEANUP 0x01

#define STACK_CHUNK_BASE(x) (void *)(MASK_STACK_CHUNK_LOW_BITS & (ptrcast_t)x)

#define ERROR_STACK_EMPTY 1
#define ERROR_BAD_STACK_TYPE 1

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
