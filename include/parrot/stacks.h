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

typedef enum {
    NO_STACK_ENTRY_TYPE     = 0,
    STACK_ENTRY_INT         = 1,
    STACK_ENTRY_FLOAT       = 2,
    STACK_ENTRY_STRING      = 3,
    STACK_ENTRY_PMC         = 4,
    STACK_ENTRY_POINTER     = 5,
    STACK_ENTRY_DESTINATION = 6
} Stack_entry_type;

typedef enum {
    NO_STACK_ENTRY_FLAGS     = 0,
    STACK_ENTRY_CLEANUP_FLAG = 1 << 0
} Stack_entry_flags;

typedef enum {
    NO_STACK_CHUNK_FLAGS     = 0,
    STACK_CHUNK_COW_FLAG     = 1 << 0
} Stack_chunk_flags;

typedef struct stack_entry {
    union {
        Floatval num_val;
        Intval   int_val;
        PMC     *pmc_val;
        String  *string_val;
        void    *generic_pointer;
    } entry;
    Stack_entry_type  entry_type;
    Stack_entry_flags flags;
    void (*cleanup)(struct stack_entry *);
} Stack_entry;

typedef struct stack_chunk {
    size_t used;
    Stack_chunk_flags   flags;
    struct stack_chunk *next;
    struct stack_chunk *prev;
    Buffer *buffer;
} Stack_chunk;

typedef void (*Stack_cleanup_method)(Stack_entry *);

#define STACK_CLEANUP_NULL ((Stack_cleanup_method)NULLfunc)

Stack_chunk * new_stack(Interp *interpreter);

Stack_chunk * stack_copy(Interp *interpreter, Stack_chunk *old_stack);

void stack_mark_cow(Stack_chunk *stack_base);

size_t stack_height(Interp *interpreter, Stack_chunk *stack_base);

Stack_entry * stack_entry(Interp *intepreter, Stack_chunk *stack_base, 
                          Intval stack_depth);

void rotate_entries(Interp *interpreter, Stack_chunk *stack_base,
                    Intval num_entries);

void stack_push(Interp *interpreter, Stack_chunk **stack_base,
                void *thing, Stack_entry_type type, 
                Stack_cleanup_method cleanup);

void *stack_pop(Interp *interpreter, Stack_chunk **stack_base, 
                void *where, Stack_entry_type type);

void *pop_dest(Interp *interpreter);

void *stack_peek(Interp *interpreter, Stack_chunk *stack, 
                Stack_entry_type *type);

Stack_entry_type get_entry_type(Interp *interpreter, Stack_entry *entry);



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
