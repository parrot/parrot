/* memory.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the memory subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_MEMORY_H_GUARD)
#define PARROT_MEMORY_H_GUARD

void *
mem_allocate_aligned(UINTVAL);

void *
mem_sys_allocate(UINTVAL);

void *
mem_realloc(void *, UINTVAL, UINTVAL);

void *
mem_sys_realloc(void *, UINTVAL);

void
mem_sys_free(void *);

void
mem_setup_allocator(struct Parrot_Interp *);

#define mem_allocate_new_stash() NULL
#define mem_allocate_new_stack() NULL
#define mem_sys_memcopy memcpy

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
