/* mmd.h
 *  Copyright: 2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the mmd subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_MMD_H_GUARD)
#define PARROT_MMD_H_GUARD

PMC *mmd_dispatch_pmc(struct Parrot_Interp *, PMC *, PMC *, INTVAL);
STRING *mmd_dispatch_string(struct Parrot_Interp *, PMC *, PMC *, INTVAL);
INTVAL mmd_dispatch_intval(struct Parrot_Interp *, PMC *, PMC *, INTVAL);
FLOATVAL mmd_dispatch_numval(struct Parrot_Interp *, PMC *, PMC *, INTVAL);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
