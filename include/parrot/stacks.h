/* stacks.h
 *  Copyright (C) 2001-2008, Parrot Foundation.
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
    void (*cleanup)(PARROT_INTERP, struct Stack_Entry *);
} Stack_Entry_t;

typedef struct Stack_Chunk {
    UnionVal            cache;
    Parrot_UInt         flags;
    const char         *name;
    struct Stack_Chunk *prev;
    Parrot_UInt         refcount;
    Stack_Entry_t       data;
} Stack_Chunk_t;

#define STACK_DATAP(chunk)    &((chunk)->data)
/* #define STACK_ITEMSIZE(chunk) PObj_buflen(chunk) */


typedef void (*Stack_cleanup_method)(Interp*, Stack_Entry_t *);

#define STACK_CLEANUP_NULL ((Stack_cleanup_method)NULLfunc)

/* HEADERIZER BEGIN: src/stacks.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Stack_Chunk_t * cst_new_stack_chunk(PARROT_INTERP,
    ARGIN(const Stack_Chunk_t *chunk))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void mark_stack(PARROT_INTERP, ARGMOD(Stack_Chunk_t *chunk))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*chunk);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Stack_Chunk_t * new_stack(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_dump_dynamic_environment(PARROT_INTERP,
    ARGIN(Stack_Chunk_t *dynamic_env))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pop_mark(PARROT_INTERP, INTVAL mark)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_push_action(PARROT_INTERP, ARGIN(PMC *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_push_mark(PARROT_INTERP, INTVAL mark)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
void * pop_dest(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Stack_Entry_t * stack_entry(SHIM_INTERP,
    ARGIN(Stack_Chunk_t *stack),
    INTVAL depth)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
size_t stack_height(SHIM_INTERP, ARGIN(const Stack_Chunk_t *chunk))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
void * stack_peek(PARROT_INTERP,
    ARGIN(Stack_Chunk_t *stack_base),
    ARGMOD_NULLOK(Stack_entry_type *type))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*type);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
void * stack_pop(PARROT_INTERP,
    ARGMOD(Stack_Chunk_t **stack_p),
    ARGOUT_NULLOK(void *where),
    Stack_entry_type type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*stack_p)
        FUNC_MODIFIES(*where);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Stack_Entry_t* stack_prepare_pop(PARROT_INTERP,
    ARGMOD(Stack_Chunk_t **stack_p))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*stack_p);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Stack_Entry_t* stack_prepare_push(PARROT_INTERP,
    ARGMOD(Stack_Chunk_t **stack_p))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*stack_p);

PARROT_EXPORT
void stack_push(PARROT_INTERP,
    ARGMOD(Stack_Chunk_t **stack_p),
    ARGIN(void *thing),
    Stack_entry_type type,
    NULLOK(Stack_cleanup_method cleanup))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*stack_p);

PARROT_EXPORT
void stack_system_init(SHIM_INTERP);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
Stack_entry_type get_entry_type(ARGIN(const Stack_Entry_t *entry))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_cst_new_stack_chunk __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(chunk)
#define ASSERT_ARGS_mark_stack __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(chunk)
#define ASSERT_ARGS_new_stack __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(name)
#define ASSERT_ARGS_Parrot_dump_dynamic_environment \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(dynamic_env)
#define ASSERT_ARGS_Parrot_pop_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_push_action __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub)
#define ASSERT_ARGS_Parrot_push_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_pop_dest __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_stack_entry __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(stack)
#define ASSERT_ARGS_stack_height __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(chunk)
#define ASSERT_ARGS_stack_peek __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(stack_base)
#define ASSERT_ARGS_stack_pop __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(stack_p)
#define ASSERT_ARGS_stack_prepare_pop __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(stack_p)
#define ASSERT_ARGS_stack_prepare_push __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(stack_p)
#define ASSERT_ARGS_stack_push __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(stack_p) \
    || PARROT_ASSERT_ARG(thing)
#define ASSERT_ARGS_stack_system_init __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_get_entry_type __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(entry)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/stacks.c */

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
