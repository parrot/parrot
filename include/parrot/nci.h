/* nci.h
 *  Copyright: 2002 Yet Another Society
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The nci api handles building native call frames
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_NCI_H_GUARD)
#define PARROT_NCI_H_GUARD

#include "parrot/parrot.h"

void *build_call_func(Parrot_Interp *, String *);

#endif
