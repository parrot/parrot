/* pmc.h
 *  Copyright: (When this is determined...it will go here)
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

VAR_SCOPE VTABLE Parrot_base_vtables[enum_class_max];
VAR_SCOPE PMC *Parrot_base_classname_hash;

struct PMC {
    VTABLE *vtable;
    INTVAL flags;
    DPOINTER *data;

    /* cache.* is intended to just be *shortcuts* to*/
    /* commonly-accessed data, *not* pointers to */
    /* completely different data.  That's why it's */
    /* referred to as a "cache". */
    UnionVal cache;

    PMC *metadata;

    SYNC *synchronize;
    /* This flag determines the next PMC in the 'used' list during
       dead object detection in the GC. It is a linked list, which is
       only valid in trace_active_PMCs. Also, the linked list is
       guaranteed to have the tail element's next_for_GC point to itself,
       which makes much of the logic and checks simpler. We then have to
       check for PMC->next_for_GC == PMC to find the end of list. */
    PMC *next_for_GC;         /* Yeah, the GC data should be out of
                                 band, but that makes things really
                                 slow when actually marking things for
                                 the GC runs. Unfortunately putting
                                 this here makes marking things clear
                                 for the GC pre-run slow as well, as
                                 we need to touch all the PMC
                                 structs. (Though we will for flag
                                 setting anyway) We can potentially
                                 make this a pointer to the real GC
                                 stuff, which'd merit an extra
                                 dereference when setting, but let us
                                 memset the actual GC data in a big
                                 block */
};


/* XXX add various bit test macros once we have need of them */

/* Prototypes */
PMC *pmc_new(struct Parrot_Interp *interpreter, INTVAL base_type);
PMC *pmc_new_noinit(struct Parrot_Interp *interpreter, INTVAL base_type);
PMC *pmc_new_init(struct Parrot_Interp *interpreter, INTVAL base_type, PMC *p);


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
