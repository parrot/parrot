/* Memory.c
 *
 *  Handle memory allocation
 *
 */

#include "parrot.h"

/* Allocate a chunk of memory aligned on a power-of-2 boundary */
void *Allocate_Aligned(IV size) {
  IV boundary;
  IV max_to_alloc;
  IV temp;
  void *mem = NULL;

  boundary = 1;
  for (temp = size; temp; temp >>= 1) {
    boundary *= 2;
  }
  max_to_alloc = boundary * 2;
  mem = malloc(max_to_alloc);
  return mem;
}

void *Sys_Allocate(IV size) {
  return malloc(size);
}

void Setup_Allocator(struct Perl_Interp *interpreter) {
}

  
