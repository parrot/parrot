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

typedef struct Stack_entry_t {
    union {
        FLOATVAL num_val;
        INTVAL int_val;
        PMC *pmc_val;
        STRING *string_val;
        void *generic_pointer;
    } entry;
    INTVAL entry_type;
    INTVAL flags;
    void (*cleanup)(struct Stack_entry_t *);
}* Stack_Entry;

typedef struct Stack_chunk_t {
  INTVAL used;
  struct Stack_chunk_t *next;
  struct Stack_chunk_t *prev;
  struct Stack_entry_t entry[STACK_CHUNK_DEPTH];
}* Stack_Chunk;

typedef Stack_Chunk Stack;

typedef void (*stack_cleanup_method_t)(Stack_Entry);
#define STACK_CLEANUP_NULL (stack_cleanup_method_t)NULLfunc

Stack
new_stack(struct Parrot_Interp *);

INTVAL
stack_depth(struct Parrot_Interp *, Stack);

Stack_Entry
stack_entry(struct Parrot_Interp *, Stack, INTVAL);

void
rotate_entries(struct Parrot_Interp *, Stack, INTVAL depth);

void
stack_push(struct Parrot_Interp *, Stack,
           void *thing, INTVAL type, stack_cleanup_method_t cleanup);

void *
stack_pop(struct Parrot_Interp *, Stack, void *where, INTVAL type);

void *
pop_dest(struct Parrot_Interp *interpreter);

void *
stack_peek(struct Parrot_Interp *interpreter, Stack stack, INTVAL* type);

INTVAL
get_entry_type(struct Parrot_Interp *interpreter, Stack_Entry entry);

#define STACK_ENTRY_INT 1
#define STACK_ENTRY_FLOAT 2
#define STACK_ENTRY_STRING 3
#define STACK_ENTRY_PMC 4
#define STACK_ENTRY_POINTER 5
#define STACK_ENTRY_DESTINATION 6

#define STACK_ENTRY_CLEANUP 0x01

#define ERROR_STACK_EMPTY 1
#define ERROR_STACK_SHALLOW 1
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
