/* pmc.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for the pmc subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_PMC_H_GUARD)
#define PARROT_PMC_H_GUARD

#include "parrot/core_pmcs.h"
#include "parrot/pobj.h"
#include "parrot/thread.h"

#define PARROT_MAX_CLASSES 100

/*
 * macros used during vtables conversion
 * TODO go through files and use the real thing
 */

#define enum_class_max interpreter->n_vtable_max
#define Parrot_base_vtables interpreter->vtables

/* Internal use */
PMC *pmc_init_null(Interp * interpreter);

/* Prototypes */
PARROT_API PMC *pmc_new(Interp *interpreter, INTVAL base_type);
PARROT_API PMC *pmc_reuse(Interp *interpreter, PMC *pmc, INTVAL new_type, UINTVAL flags);
PARROT_API PMC *pmc_new_noinit(Interp *interpreter, INTVAL base_type);
PARROT_API PMC *pmc_new_init(Interp *interpreter, INTVAL base_type, PMC *p);
PARROT_API PMC *constant_pmc_new_noinit(Interp *, INTVAL base_type);
PARROT_API PMC *constant_pmc_new(Interp *, INTVAL base_type);
PARROT_API PMC *constant_pmc_new_init(Interp *, INTVAL base_type, PMC *);

PARROT_API INTVAL pmc_register(Interp *, STRING *);
PARROT_API INTVAL pmc_type(Interp *, STRING *);

/*
 * DOD registry interface
 */
PARROT_API void dod_register_pmc(Interp *, PMC*);
PARROT_API void dod_unregister_pmc(Interp *, PMC*);

/* mro creation */
PARROT_API void Parrot_create_mro(Interp *, INTVAL);

#endif /* PARROT_PMC_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
