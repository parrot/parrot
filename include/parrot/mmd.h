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

void mmd_dispatch_pmc(struct Parrot_Interp *, PMC *, PMC *, PMC *, INTVAL);
STRING *mmd_dispatch_string(struct Parrot_Interp *, PMC *, PMC *, INTVAL);
INTVAL mmd_dispatch_intval(struct Parrot_Interp *, PMC *, PMC *, INTVAL);
FLOATVAL mmd_dispatch_floatval(struct Parrot_Interp *, PMC *, PMC *, INTVAL);

void mmd_add_by_class(struct Parrot_Interp *, INTVAL, STRING *, STRING *, funcptr_t);
void mmd_register(struct Parrot_Interp *, INTVAL, INTVAL, INTVAL, funcptr_t);
void mmd_add_function(struct Parrot_Interp *, INTVAL, funcptr_t);
void mmd_destroy(Parrot_Interp);
void mmd_vtregister(Parrot_Interp, INTVAL, INTVAL, INTVAL, PMC *);
PMC *mmd_vtfind(Parrot_Interp, INTVAL, INTVAL, INTVAL);

typedef struct MMD_table {
    funcptr_t **mmd_funcs;     /* The functions for the MMD table */
    UINTVAL *funcs_in_table;  /* How many functions are in the table
                                 in question */
    UINTVAL *x;               /* The x coord for each table */
    UINTVAL *y;               /* The y coord for each table */
    funcptr_t *default_func;  /* The function we use if we can't find
                                 a function */
    UINTVAL tables;           /* How many tables we have */
} MMD_table;

typedef struct MMD_table mmd_table;

/* Need this for add, subtract, multiply, divide, mod, cmod, bitwise
   (and, or, xor, lshift, rshift), concat, logical (and, or, xor),
   repeat, eq, cmp */
#define MMD_ADD 0
#define MMD_SUBTRACT 1
#define MMD_MULTIPLY 2
#define MMD_DIVIDE 3
#define MMD_MOD 4
#define MMD_CMOD 5
#define MMD_BAND 6
#define MMD_BOR 7
#define MMD_BXOR 8
#define MMD_BSL 9
#define MMD_BSR 10
#define MMD_CONCAT 11
#define MMD_LAND 12
#define MMD_LOR 13
#define MMD_LXOR 14
#define MMD_REPEAT 15
#define MMD_NUMEQ 16
#define MMD_STREQ 17
#define MMD_NUMCMP 18
#define MMD_STRCMP 19
#define MMD_SOR 20
#define MMD_SAND 21
#define MMD_SXOR 22

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
