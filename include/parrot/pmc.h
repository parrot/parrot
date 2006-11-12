/* pmc.h
 *  Copyright (C) 2001-2006, The Perl Foundation.
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

/* Internal use */
PMC *pmc_init_null(Interp *interp);

/* Prototypes */
PARROT_API PMC *pmc_new(Interp *interp, INTVAL base_type);
PARROT_API PMC *pmc_reuse(Interp *interp, PMC *pmc, INTVAL new_type, UINTVAL flags);
PARROT_API PMC *pmc_new_noinit(Interp *interp, INTVAL base_type);
PARROT_API PMC *pmc_new_init(Interp *interp, INTVAL base_type, PMC *p);
PARROT_API PMC *constant_pmc_new_noinit(Interp *, INTVAL base_type);
PARROT_API PMC *constant_pmc_new(Interp *, INTVAL base_type);
PARROT_API PMC *constant_pmc_new_init(Interp *, INTVAL base_type, PMC *);

PARROT_API INTVAL pmc_register(Interp *, STRING *);
PARROT_API INTVAL pmc_type(Interp *, STRING *);
PARROT_API INTVAL pmc_type_p(Interp *, PMC *);

/*
 * DOD registry interface
 */
PARROT_API void dod_register_pmc(Interp *, PMC*);
PARROT_API void dod_unregister_pmc(Interp *, PMC*);

/* mro creation */
PARROT_API void Parrot_create_mro(Interp *, INTVAL);

/* pmcinfo parameters */

/* &gen_from_def(pmcinfo.pasm) */

#define PMCINFO_FLAGS    4      /* see also STRINGINFO_FLAGS */

/* &end_gen */

#endif /* PARROT_PMC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
