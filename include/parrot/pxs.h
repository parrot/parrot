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


void PXS_reti(Parrot_Interp_t, INTVAL);
void PXS_retn(Parrot_Interp_t, FLOATVAL);
void PXS_rets(Parrot_Interp_t, STRING *);
void PXS_retp(Parrot_Interp_t, PMC *);
INTVAL PXS_shifti(Parrot_Interp_t);
FLOATVAL PXS_shiftn(Parrot_Interp_t);
STRING * PXS_shifts(Parrot_Interp_t);
char * PXS_shiftcs(Parrot_Interp_t);
PMC * PXS_shiftp(Parrot_Interp_t);
PMC * PXS_pointer(Parrot_Interp_t, void *);
INTVAL PXS_findop(Parrot_Interp_t, const char *);

#define PXSCALL(f) void f(Parrot_Interp_t interp, void * object) 




