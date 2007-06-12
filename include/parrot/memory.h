/* memory.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for the memory subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#pragma once
#ifndef PARROT_MEMORY_H_GUARD
#define PARROT_MEMORY_H_GUARD
#include <assert.h>

/* HEADER: src/gc/memory.c */

/* Use these macros instead of calling the functions listed below. */
/* They protect against things like passing null to mem__sys_realloc, */
/* which is not portable. */
#define mem_sys_realloc(x,y) (assert(x!=NULL), mem__sys_realloc(x,y))
#define mem_sys_realloc_zeroed(x,y,z) (assert(x!=NULL), mem__sys_realloc_zeroed(x,y,z))
#define mem_internal_allocate(x) mem__internal_allocate(x, __FILE__, __LINE__)
#define mem_internal_allocate_typed(t) \
    (t *)mem__internal_allocate(sizeof (t), __FILE__, __LINE__)
#define mem_internal_allocate_zeroed(x) mem__internal_allocate_zeroed(x, \
    __FILE__, __LINE__)
#define mem_internal_allocate_zeroed_typed(t) \
    (t *)mem__internal_allocate_zeroed(sizeof (t), __FILE__, __LINE__)

#define mem_internal_realloc(x, y) mem__internal_realloc(x, y, __FILE__, __LINE__)
#define mem_internal_free(x) mem__internal_free(x, __FILE__, __LINE__)

#define mem_allocate_new_stash() NULL
#define mem_allocate_new_stack() NULL
#define mem_sys_memcopy memcpy
#define mem_sys_memmove memmove

#define mem_allocate_typed(type)    (type *)mem_sys_allocate(sizeof(type))
#define mem_allocate_zeroed_typed(type) (type *)mem_sys_allocate_zeroed(sizeof(type))

/* HEADERIZER BEGIN: src/gc/memory.c */

PARROT_API void * mem__sys_realloc( void *from /*NULLOK*/, size_t size )
        __attribute__malloc__
        __attribute__warn_unused_result__;

PARROT_API void * mem__sys_realloc_zeroed(
    void *from /*NULLOK*/,
    size_t size,
    size_t old_size )
        __attribute__malloc__
        __attribute__warn_unused_result__;

PARROT_API void * mem_sys_allocate( size_t size )
        __attribute__malloc__
        __attribute__warn_unused_result__;

PARROT_API void * mem_sys_allocate_zeroed( size_t size )
        __attribute__malloc__
        __attribute__warn_unused_result__;

PARROT_API void mem_sys_free( void * from );
void * mem__internal_allocate( size_t size, const char *file, int line )
        __attribute__malloc__
        __attribute__warn_unused_result__;

void * mem__internal_allocate_zeroed(
    size_t size,
    const char *file,
    int line )
        __attribute__malloc__
        __attribute__warn_unused_result__;

void mem__internal_free( void *from, const char *file /*NN*/, int line )
        __attribute__nonnull__(2);

void * mem__internal_realloc(
    void *from /*NN*/,
    size_t size,
    const char *file /*NN*/,
    int line )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__malloc__
        __attribute__warn_unused_result__;

void mem_setup_allocator( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/gc/memory.c */

PARROT_API void *mem_sys_allocate(size_t);

PARROT_API void *mem_sys_allocate_zeroed(size_t);

PARROT_API void *mem__sys_realloc(void *, size_t);

PARROT_API void *mem__sys_realloc_zeroed(void *, size_t, size_t);

PARROT_API void mem_sys_free(void *);

void *mem__internal_allocate(size_t, const char *, int);

void *mem__internal_allocate_zeroed(size_t, const char *, int);

void *mem__internal_realloc(void *, size_t, const char *, int);

void mem__internal_free(void *, const char *, int);

void mem_setup_allocator(Interp *);


#endif /* PARROT_MEMORY_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
