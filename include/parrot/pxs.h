/* pxs.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *      Parrot Native Interface for Extensions 
 *  Data Structure and Algorithms:
 *  History:
 *      Originally written by Melvin Smith
 *  Notes:
 *  References:
 */

#include "parrot.h"


void PXS_reti(parrot_interp_t, INTVAL);
void PXS_retn(parrot_interp_t, FLOATVAL);
void PXS_rets(parrot_interp_t, STRING *);
void PXS_retp(parrot_interp_t, PMC *);
INTVAL PXS_shifti(parrot_interp_t);
FLOATVAL PXS_shiftn(parrot_interp_t);
STRING *PXS_shifts(parrot_interp_t);
char *PXS_shiftcs(parrot_interp_t);
PMC *PXS_shiftp(parrot_interp_t);
PMC *PXS_pointer(parrot_interp_t, void *);
INTVAL PXS_findop(parrot_interp_t, const char *);

#define PXSCALL(f) void f(parrot_interp_t interp, void * object)


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
