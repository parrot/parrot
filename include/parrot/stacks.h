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

typedef struct Stack_Entry {
    union {
        Floatval num_val;
        Intval   int_val;
        PMC     *pmc_val;
        String  *string_val;
        void    *generic_pointer;
    } entry;
    Stack_entry_type  entry_type;
    Stack_entry_flags flags;
    void (*cleanup)(struct Stack_Entry *);
} Stack_Entry_t;

typedef struct Stack_Chunk {
    size_t used;
    Stack_chunk_flags   flags;
    struct Stack_Chunk *next;
    struct Stack_Chunk *prev;
    Buffer *buffer;
} Stack_Chunk_t;

typedef struct Stack {
    Stack_Chunk_t * base;
    Stack_Chunk_t * top;
} Stack_t;


typedef void (*Stack_cleanup_method)(Stack_Entry_t *);

#define STACK_CLEANUP_NULL ((Stack_cleanup_method)NULLfunc)

Stack_Chunk_t * new_stack(Interp *interpreter);

Stack_Chunk_t * stack_copy(Interp *interpreter, Stack_Chunk_t *old_stack);

void stack_mark_cow(Stack_Chunk_t *stack_base);

size_t stack_height(Interp *interpreter, Stack_Chunk_t *stack_base);

Stack_Entry_t * stack_entry(Interp *intepreter, Stack_Chunk_t *stack_base, 
                          Intval stack_depth);

void rotate_entries(Interp *interpreter, Stack_Chunk_t *stack_base,
                    Intval num_entries);

void stack_push(Interp *interpreter, Stack_Chunk_t **stack_base,
                void *thing, Stack_entry_type type, 
                Stack_cleanup_method cleanup);

void *stack_pop(Interp *interpreter, Stack_Chunk_t **stack_base, 
                void *where, Stack_entry_type type);

void *pop_dest(Interp *interpreter);

void *stack_peek(Interp *interpreter, Stack_Chunk_t *stack, 
                Stack_entry_type *type);

Stack_entry_type get_entry_type(Interp *interpreter, Stack_Entry_t *entry);



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
