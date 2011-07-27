/* memory.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
 *  Overview:
 *     This is the API header for the memory subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_MEMORY_H_GUARD
#define PARROT_MEMORY_H_GUARD
#include <assert.h>

/* Use these macros instead of calling the functions listed below. */
/* They protect against things like passing null to mem__sys_realloc, */
/* which is not portable. */

/* It was decided that having a second set of memory allocation functions
   is a waste. These macros were rewritten to use the much more prevalent
   mem_sys_* functions and then the mem__internal_* functions were
   eliminated. */

#define mem_internal_allocate(x) mem_sys_allocate(x)

#define mem_internal_allocate_typed(type) (type *)mem_sys_allocate(sizeof (type))

#define mem_internal_allocate_zeroed(x) mem_sys_allocate_zeroed(x)

#define mem_internal_allocate_zeroed_typed(type) \
    (type *)mem_sys_allocate_zeroed(sizeof (type))

#define mem_internal_allocate_n_zeroed_typed(n, type) \
    (type *)mem_sys_allocate_zeroed((n) * sizeof (type))

#define mem_internal_realloc(x, y) mem_sys_realloc((x), (y))

#define mem_internal_realloc_zeroed(p, x, y) mem_sys_realloc_zeroed((p), (x), (y))

#define mem_internal_realloc_n_zeroed_typed(p, x, y, type) \
  (type *)mem_sys_realloc_zeroed((p), (x) * sizeof (type), (y) * sizeof (type))

#define mem_internal_free(x) mem_sys_free(x)


#define mem_sys_memcopy memcpy
#define mem_sys_memmove memmove

#define mem_allocate_typed(type)            (type *)mem_sys_allocate(sizeof (type))
#define mem_allocate_n_typed(n, type)       (type *)mem_sys_allocate((n) * sizeof (type))
#define mem_allocate_zeroed_typed(type)     (type *)mem_sys_allocate_zeroed(sizeof (type))
#define mem_allocate_n_zeroed_typed(n, type) (type *)mem_sys_allocate_zeroed((n) * sizeof (type))
#define mem_realloc_n_typed(p, n, type)     (p) = (type *)mem_sys_realloc((p), (n) * sizeof (type))

#define mem_gc_allocate_typed(i, type) \
        (type *)Parrot_gc_allocate_memory_chunk((i), sizeof (type))
#define mem_gc_allocate_n_typed(i, n, type) \
        (type *)Parrot_gc_allocate_memory_chunk((i), (n) * sizeof (type))
#define mem_gc_realloc_n_typed(i, p, n, type) \
        (type *)Parrot_gc_reallocate_memory_chunk((i), (p), (n) * sizeof (type))
#define mem_gc_allocate_zeroed_typed(i, type) \
        (type *)Parrot_gc_allocate_memory_chunk_with_interior_pointers((i), sizeof (type))
#define mem_gc_allocate_n_zeroed_typed(i, n, type) \
        (type *)Parrot_gc_allocate_memory_chunk_with_interior_pointers((i), (n) * sizeof (type))
#define mem_gc_realloc_n_typed_zeroed(i, p, n, o, type) \
        (type *)Parrot_gc_reallocate_memory_chunk_with_interior_pointers((i), (p), (n) * sizeof (type), (o) * sizeof (type))
#define mem_gc_free(i, p) \
        Parrot_gc_free_memory_chunk((i), (p))

#define mem_copy_n_typed(dest, src, n, type) memcpy((dest), (src), (n)*sizeof (type))

/* HEADERIZER BEGIN: src/gc/alloc_memory.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void * mem_sys_allocate(size_t size);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void * mem_sys_allocate_zeroed(size_t size);

PARROT_EXPORT
void mem_sys_free(ARGFREE(void *from));

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void * mem_sys_realloc(ARGFREE(void *from), size_t size);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void * mem_sys_realloc_zeroed(
    ARGFREE(void *from),
    size_t size,
    size_t old_size);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char * mem_sys_strdup(ARGIN(const char *src))
        __attribute__nonnull__(1);
        
PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char * mem_sys_strndup(ARGIN(const char *src), size_t size)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_mem_sys_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_mem_sys_allocate_zeroed __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_mem_sys_free __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_mem_sys_realloc __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_mem_sys_realloc_zeroed __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_mem_sys_strdup __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_mem_sys_strndup __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(src))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/alloc_memory.c */

#endif /* PARROT_MEMORY_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
