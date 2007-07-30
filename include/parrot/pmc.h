/* pmc.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for the pmc subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_PMC_H_GUARD
#define PARROT_PMC_H_GUARD

#include "parrot/core_pmcs.h"
#include "parrot/pobj.h"
#include "parrot/thread.h"

#define PARROT_MAX_CLASSES 100

/* HEADERIZER BEGIN: src/pmc.c */

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC * constant_pmc_new( PARROT_INTERP, INTVAL base_type )
        __attribute__nonnull__(1);

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC * constant_pmc_new_init( PARROT_INTERP,
    INTVAL base_type,
    NULLOK(PMC *init) )
        __attribute__nonnull__(1);

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC * constant_pmc_new_noinit( PARROT_INTERP, INTVAL base_type )
        __attribute__nonnull__(1);

PARROT_API
void dod_register_pmc( PARROT_INTERP, NOTNULL(PMC* pmc) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void Parrot_create_mro( PARROT_INTERP, INTVAL type )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_create_pmc_proxy( PARROT_INTERP, int type_num )
        __attribute__nonnull__(1);

PARROT_API
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
PMC * pmc_new( PARROT_INTERP, INTVAL base_type )
        __attribute__nonnull__(1);

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC * pmc_new_init( PARROT_INTERP, INTVAL base_type, NULLOK(PMC *init) )
        __attribute__nonnull__(1);

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC * pmc_new_noinit( PARROT_INTERP, INTVAL base_type )
        __attribute__nonnull__(1);

PARROT_API
INTVAL pmc_register( PARROT_INTERP, NOTNULL(STRING *name) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC* pmc_reuse( PARROT_INTERP,
    NOTNULL(PMC *pmc),
    INTVAL new_type,
    NULLOK(UINTVAL flags) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
INTVAL pmc_type( PARROT_INTERP, NOTNULL(STRING *name) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
INTVAL pmc_type_p( PARROT_INTERP, NOTNULL(PMC *name) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void dod_unregister_pmc( PARROT_INTERP, NOTNULL(PMC* pmc) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/pmc.c */

/* pmcinfo parameters */

/* &gen_from_def(pmcinfo.pasm) */

#define PMCINFO_FLAGS    4      /* see also STRINGINFO_FLAGS */

/* &end_gen */

/* This is the underlying structure for a PMC Proxy object; we need to set it
 * up from outside of the PMC. */
typedef struct Parrot_PMCProxy {
    int id;               /* The type number of the PMC. */
    STRING *name;         /* The name of the PMC. */
    PMC *_namespace;      /* The namespace it's linked to, if any. */
    PMC *parents;         /* Proxy PMCs of any immediate parent classes. */
    PMC *all_parents;     /* Cached list of ourself and all parents, in MRO order. */
    PMC *methods;         /* PMC's non-vtable methods. Hash of method names to invokables. */
} Parrot_PMCProxy;

/* Macro to access underlying structure of a PMCProxy PMC. */
#define PARROT_PMCPROXY(o) ((Parrot_PMCProxy *) PMC_data(o))

#endif /* PARROT_PMC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
