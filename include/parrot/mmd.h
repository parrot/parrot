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

void mmd_register(struct Parrot_Interp *, INTVAL, INTVAL, INTVAL, INTVAL, funcptr_t);

typedef struct MMD_table {
    funcptr_t *mmd_funcs[4];
    UINTVAL funcs_in_table[4];
    UINTVAL x[4];
    UINTVAL y[4];
} MMD_table;

typedef struct MMD_table mmd_table;

#define PMC_OFFSET 0
#define STRING_OFFSET 1
#define INT_OFFSET 2
#define FLOAT_OFFSET 3

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
