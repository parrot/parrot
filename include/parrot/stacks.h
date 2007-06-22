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

PARROT_API Stack_entry_type get_entry_type( Interp *interp,
    const Stack_Entry_t *entry /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__pure__
        __attribute__warn_unused_result__;

PARROT_API void mark_stack( Interp *interp /*NN*/,
    Stack_Chunk_t *chunk /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API Stack_Chunk_t * new_stack( Interp *interp,
    const char *name /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API void Parrot_dump_dynamic_environment( Interp *interp /*NN*/,
    Stack_Chunk_t *dynamic_env /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API void * pop_dest( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void rotate_entries( Interp *interp,
    Stack_Chunk_t **stack_p /*NN*/,
    INTVAL num_entries )
        __attribute__nonnull__(2);

PARROT_API void stack_destroy( Stack_Chunk_t *top );
PARROT_API Stack_Entry_t * stack_entry( Interp *interp /*NN*/,
    Stack_Chunk_t *stack /*NN*/,
    INTVAL depth )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API size_t stack_height( Interp *interp,
    const Stack_Chunk_t *chunk /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API void * stack_peek( Interp *interp /*NN*/,
    Stack_Chunk_t *stack_base /*NN*/,
    Stack_entry_type *type /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API void * stack_pop( Interp *interp,
    Stack_Chunk_t **stack_p /*NN*/,
    void *where /*NULLOK*/,
    Stack_entry_type type )
        __attribute__nonnull__(2);

PARROT_API void stack_push( Interp *interp,
    Stack_Chunk_t **stack_p /*NN*/,
    void *thing,
    Stack_entry_type type,
    Stack_cleanup_method cleanup )
        __attribute__nonnull__(2);

/* HEADERIZER END: src/stacks.c */
/* HEADERIZER BEGIN: src/stack_common.c */

PARROT_API Stack_Chunk_t * cst_new_stack_chunk(
    Parrot_Interp interp,
    const Stack_Chunk_t *chunk /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API Stack_Chunk_t * register_new_stack( Interp *interp,
    const char *name /*NN*/,
    size_t item_size )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API void* stack_prepare_pop( Interp *interp,
    Stack_Chunk_t **stack_p /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API void* stack_prepare_push(
    Parrot_Interp interp,
    Stack_Chunk_t **stack_p /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API void stack_system_init( Interp *interp );
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
