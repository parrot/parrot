/* pmc.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Allocate and deallocate tracked resources
 *  Data Structure and Algorithms:
 *     
 *  History:
 *     Initial version by Dan on 2001.10.2
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

PMC *new_pmc_header(struct Parrot_Interp *interpreter) {
  return mem_sys_allocate(sizeof(PMC));
}

void free_pmc(PMC *pmc) {
  free(pmc);
}

STRING *new_string_header(struct Parrot_Interp *interpreter) {
  return mem_sys_allocate(sizeof(STRING));
}

void free_string(STRING *string) {
  free(string->bufstart);
  free(string);
}
