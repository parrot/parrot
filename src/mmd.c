/* mmd.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Multimethod dispatch handling for parrot
 *  Data Structure and Algorithms:
 *     
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

PMC *
mmd_dispatch_pmc(struct Parrot_Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function) {
  return NULL;
}

STRING *
mmd_dispatch_string(struct Parrot_Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function) {
  return NULL;
}

INTVAL
mmd_dispatch_intval(struct Parrot_Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function) {
  return 0;
}

FLOATVAL
mmd_dispatch_numval(struct Parrot_Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function) {
  return 0;
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
