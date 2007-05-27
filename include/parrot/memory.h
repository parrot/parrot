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

#ifndef PARROT_MEMORY_H_GUARD
#define PARROT_MEMORY_H_GUARD
#include <assert.h>
PARROT_API void *mem_sys_allocate(size_t);

PARROT_API void *mem_sys_allocate_zeroed(size_t);

PARROT_API void *mem__sys_realloc(void *, size_t);
#define mem_sys_realloc(x,y) (assert(x!=NULL), mem__sys_realloc(x,y))
PARROT_API void mem_sys_free(void *);

void *mem__internal_allocate(size_t, const char *, int);
#define mem_internal_allocate(x) mem__internal_allocate(x, __FILE__, __LINE__)
#define mem_internal_allocate_typed(t) \
    (t *)mem__internal_allocate(sizeof (t), __FILE__, __LINE__)

void *mem__internal_allocate_zeroed(size_t, const char *, int);
#define mem_internal_allocate_zeroed(x) mem__internal_allocate_zeroed(x, \
    __FILE__, __LINE__)
#define mem_internal_allocate_zeroed_typed(t) \
    (t *)mem__internal_allocate_zeroed(sizeof (t), __FILE__, __LINE__)

void *mem__internal_realloc(void *, size_t, const char *, int);
#define mem_internal_realloc(x, y) mem__internal_realloc(x, y, __FILE__, __LINE__)

void mem__internal_free(void *, const char *, int);
#define mem_internal_free(x) mem__internal_free(x, __FILE__, __LINE__)


void mem_setup_allocator(Interp *);

#define mem_allocate_new_stash() NULL
#define mem_allocate_new_stack() NULL
#define mem_sys_memcopy memcpy
#define mem_sys_memmove memmove

#define mem_allocate_typed(type)    (type *)mem_sys_allocate(sizeof(type))
#define mem_allocate_zeroed_typed(type) (type *)mem_sys_allocate_zeroed(sizeof(type))

#endif /* PARROT_MEMORY_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
