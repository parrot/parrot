/* Memory.c
 *
 *  Handle memory allocation
 *
 */

#include "parrot.h"

/* Allocate a chunk of memory aligned on a power-of-2 boundary */
void *Allocate_Aligned(IV size) {
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
    } else {
      break;
    }
  }
    
  mem = malloc(max_to_alloc);
  if (((IV)mem & mask) < (IV)mem) {
    mem = ((IV)mem & mask) + ~mask + 1;
  } 
  return mem;
}

void *Sys_Allocate(IV size) {
  return malloc(size);
}

void Setup_Allocator(struct Perl_Interp *interpreter) {
}

  
