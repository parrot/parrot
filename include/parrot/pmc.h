/* pmc.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
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
VAR_SCOPE VTABLE **Parrot_base_vtables;/*[PARROT_MAX_CLASSES];*/
VAR_SCOPE INTVAL class_table_size;
VAR_SCOPE INTVAL enum_class_max;
VAR_SCOPE Parrot_mutex class_count_mutex;

/* Internal use */
PMC *pmc_init_null(Interp * interpreter);

/* Prototypes */
PMC *pmc_new(Interp *interpreter, INTVAL base_type);
PMC *pmc_reuse(Interp *interpreter, PMC *pmc, INTVAL new_type, UINTVAL flags);
PMC *pmc_new_noinit(Interp *interpreter, INTVAL base_type);
PMC *pmc_new_init(Interp *interpreter, INTVAL base_type, PMC *p);
PMC *constant_pmc_new_noinit(Interp *, INTVAL base_type);
PMC *constant_pmc_new(Interp *, INTVAL base_type);
PMC *constant_pmc_new_init(Interp *, INTVAL base_type, PMC *);

INTVAL pmc_register(Interp *, STRING *);
INTVAL pmc_type(Interp *, STRING *);
void Parrot_mmd_register_parents(Interp*, INTVAL, const MMD_init *, INTVAL);

/*
 * DOD registry interface
 */
void dod_register_pmc(Parrot_Interp, PMC*);
void dod_unregister_pmc(Parrot_Interp, PMC*);

/* multi method fallbacks */
void register_fallback_methods(Parrot_Interp);

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
