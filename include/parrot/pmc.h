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
PMC *pmc_init_null(struct Parrot_Interp * interpreter);

/* Prototypes */
PMC *pmc_new(struct Parrot_Interp *interpreter, INTVAL base_type);
PMC *pmc_new_noinit(struct Parrot_Interp *interpreter, INTVAL base_type);
PMC *pmc_new_init(struct Parrot_Interp *interpreter, INTVAL base_type, PMC *p);
PMC *constant_pmc_new_noinit(struct Parrot_Interp *, INTVAL base_type);
PMC *constant_pmc_new(struct Parrot_Interp *, INTVAL base_type);
PMC *constant_pmc_new_init(struct Parrot_Interp *, INTVAL base_type, PMC *);

INTVAL pmc_register(struct Parrot_Interp *, STRING *);
INTVAL pmc_type(struct Parrot_Interp *, STRING *);

/*
 * DOD registry interface
 */
void dod_register_pmc(Parrot_Interp, PMC*);
void dod_unregister_pmc(Parrot_Interp, PMC*);

/* multi method fallbacks */
void register_fallback_methods(Parrot_Interp);
void mmd_fallback_add_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_subtract_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_multiply_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_divide_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_cmod_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_mod_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_band_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_bor_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_bxor_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_bsl_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_bsr_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_concat_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_land_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_lor_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_lxor_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_repeat_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
INTVAL mmd_fallback_streq_pmc(Parrot_Interp, PMC *left, PMC *right);
INTVAL mmd_fallback_numeq_pmc(Parrot_Interp, PMC *left, PMC *right);
INTVAL mmd_fallback_strcmp_pmc(Parrot_Interp, PMC *left, PMC *right);
INTVAL mmd_fallback_numcmp_pmc(Parrot_Interp, PMC *left, PMC *right);
void mmd_fallback_stringor_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_stringand_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);
void mmd_fallback_stringxor_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest);

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
