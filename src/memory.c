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

/*=for api mem mem_allocate_aligned
   Allocate a chunk of memory aligned on a power-of-2 boundary
*/
void *
mem_allocate_aligned(IV size) {
    IV max_to_alloc;
    IV mask;
    IV i;
    void *mem = NULL;
    
    /* Okay, we just brute-force things here. Yeah it's stupid, but it
       works */
    for (i = 1; i < 0xffffff; i <<= 1) {
        if (size > i) {
            mask = ~(i*2 - 1);
            max_to_alloc = i*4;
        }
        else {
            break;
        }
    }
    
    mem = malloc(max_to_alloc);
    if (((IV)mem & mask) < (IV)mem) {
        mem = (void *)(((IV)mem & mask) + ~mask + 1);
    } 
    return mem;
}

/*=for api mem mem_sys_allocate
   uses malloc to allocate system memory
*/
void *
mem_sys_allocate(IV size) {
    return malloc(size);
}

/*=for api mem mem_setup_allocator
   initializes the allocator
*/
void
mem_setup_allocator(struct Parrot_Interp *interpreter) {
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
