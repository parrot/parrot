/* stacks.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Stack handling routines for Parrot
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References: See also enums.h
 */

#ifndef PARROT_STACKS_H_GUARD
#define PARROT_STACKS_H_GUARD

#include "parrot/parrot.h"
#include "parrot/compiler.h"

#define STACK_CHUNK_LIMIT 100000

typedef struct Stack_Entry {
    UnionVal entry;
    Stack_entry_type  entry_type;
    void (*cleanup)(Interp *, struct Stack_Entry *);
} Stack_Entry_t;

typedef struct Stack_Chunk {
    pobj_t obj;
    int size;
    const char * name;
    struct Stack_Chunk *prev;
    union { /* force appropriate alignment of 'data'.  If alignment
               is necessary, assume double is good enough.  27-04-2007. */
        void *data;
#if PARROT_PTR_ALIGNMENT > 1
        double d_dummy;
#endif
    } u;
} Stack_Chunk_t;

#define STACK_DATAP(chunk)    &chunk->u.data
/* #define STACK_ITEMSIZE(chunk) PObj_buflen(chunk) */


typedef void (*Stack_cleanup_method)(Interp*, Stack_Entry_t *);

#define STACK_CLEANUP_NULL ((Stack_cleanup_method)NULLfunc)

/* HEADERIZER BEGIN: src/stacks.c */

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
Stack_entry_type get_entry_type( SHIM_INTERP,
    NOTNULL(const Stack_Entry_t *entry) )
        __attribute__nonnull__(2);

PARROT_API
void mark_stack( PARROT_INTERP, NOTNULL(Stack_Chunk_t *chunk) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
Stack_Chunk_t * new_stack( PARROT_INTERP, NOTNULL(const char *name) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void Parrot_dump_dynamic_environment( PARROT_INTERP,
    NOTNULL(Stack_Chunk_t *dynamic_env) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
void * pop_dest( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
void rotate_entries( PARROT_INTERP,
    NOTNULL(Stack_Chunk_t **stack_p),
    INTVAL num_entries )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void stack_destroy( Stack_Chunk_t *top );

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Stack_Entry_t * stack_entry( PARROT_INTERP,
    NOTNULL(Stack_Chunk_t *stack),
    INTVAL depth )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
size_t stack_height( SHIM_INTERP, NOTNULL(const Stack_Chunk_t *chunk) )
        __attribute__nonnull__(2);

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
void * stack_peek( PARROT_INTERP,
    NOTNULL(Stack_Chunk_t *stack_base),
    NULLOK(Stack_entry_type *type) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_CAN_RETURN_NULL
void * stack_pop( PARROT_INTERP,
    NOTNULL(Stack_Chunk_t **stack_p),
    NULLOK(void *where),
    Stack_entry_type type )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void stack_push( PARROT_INTERP,
    NOTNULL(Stack_Chunk_t **stack_p),
    NOTNULL(void *thing),
    Stack_entry_type type,
    NULLOK(Stack_cleanup_method cleanup) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

/* HEADERIZER END: src/stacks.c */
/* HEADERIZER BEGIN: src/stack_common.c */

PARROT_API
PARROT_WARN_UNUSED_RESULT
Stack_Chunk_t * cst_new_stack_chunk( PARROT_INTERP,
    NOTNULL(const Stack_Chunk_t *chunk) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
Stack_Chunk_t * register_new_stack( PARROT_INTERP,
    NOTNULL(const char *name),
    size_t item_size )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
void* stack_prepare_pop( PARROT_INTERP, NOTNULL(Stack_Chunk_t **stack_p) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
void* stack_prepare_push( PARROT_INTERP, NOTNULL(Stack_Chunk_t **stack_p) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void stack_system_init( SHIM_INTERP );

/* HEADERIZER END: src/stack_common.c */


#define ERROR_STACK_EMPTY 1
#define ERROR_STACK_SHALLOW 1
#define ERROR_BAD_STACK_TYPE 1

#endif /* PARROT_STACKS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
