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
 
   This is a boundary for which all the low bits of the address 
   are zeroes. Basically take the size of an object, round it up to a 
   power-of-two size (256, 512, 1024, whatever) and make sure that you can 
   mask out the low bits with no problem. So for an up to 256-byte thing the 
   low 8 bits are zero, for a thing that's between 257 and 512 the low 9 bits 
   are zero, and so on. 
   
   The reason for this is nasty, and basically speed. If I'm aligned properly, 
   and I have an address in the middle of one of my aligned structures, I can 
   mask the low bits off and find the base of the whole structure without 
   needing embedded pointers or anything. 
   
   Register frames work like this, for example. The first chunk of the 
   register frame is some meta-information (forward and back pointers, frames 
   used, and so forth) while the rest is sets of register arrays. If I have an 
   address of one of the register arrays in the frame (which I do) I can find 
   the base structure by lopping the low bits off. Cheaper in memory terms 
   than having lots of back pointers. (Time, too, since I don't have to fill 
   those back-pointers in) 
   
   It is a hack that might go if it turns out that having the back pointers is 
   cheaper, though. 
*/
void *
mem_allocate_aligned(INTVAL size) {
    ptrcast_t max_to_alloc = 0;
    ptrcast_t mask = 0;
    ptrcast_t i;
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
    if (((ptrcast_t)mem & mask) < (ptrcast_t)mem) {
        mem = (void *)(((ptrcast_t)mem & mask) + ~mask + 1);
    } 
    return mem;
}

/*=for api mem mem_sys_allocate
   uses malloc to allocate system memory
*/
void *
mem_sys_allocate(INTVAL size) {
    return malloc((size_t)size);
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
