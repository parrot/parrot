/* memory.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The memory (mem) API handles memory allocation
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/*=for api mem mem_sys_allocate
   uses malloc to allocate system memory
*/
void *
mem_sys_allocate(size_t size)
{
    return calloc(1, (size_t)size);
}

/*=for api mem mem_sys_realloc
   resize a chunk of system memory
*/
void *
mem_sys_realloc(void *from, size_t size)
{
    return realloc(from, size);
}

/*=for api mem mem_sys_free
   free a chunk of memory back to the system
*/
void
mem_sys_free(void *from)
{
    free(from);
}

/*=for api mem mem_setup_allocator
   initializes the allocator
*/
void
mem_setup_allocator(struct Parrot_Interp *interpreter)
{
    interpreter->arena_base = mem_sys_allocate(sizeof(struct Arenas));
    interpreter->arena_base->sized_header_pools = NULL;
    interpreter->arena_base->num_sized = 0;

    Parrot_initialize_memory_pools(interpreter);
    Parrot_initialize_header_pools(interpreter);
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
