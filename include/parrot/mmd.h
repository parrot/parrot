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

void mmd_dispatch_v_ppp(Parrot_Interp, PMC *, PMC *, PMC *, INTVAL);
void mmd_dispatch_v_pip(Parrot_Interp, PMC *, INTVAL, PMC *, INTVAL);
void mmd_dispatch_v_pnp(Parrot_Interp, PMC *, FLOATVAL, PMC *, INTVAL);
void mmd_dispatch_v_psp(Parrot_Interp, PMC *, STRING *, PMC *, INTVAL);

INTVAL mmd_dispatch_i_pp(Parrot_Interp, PMC *, PMC *, INTVAL);
void mmd_add_by_class(Parrot_Interp, INTVAL, STRING *, STRING *, funcptr_t);
void mmd_register(Parrot_Interp, INTVAL, INTVAL, INTVAL, funcptr_t);
void mmd_register_sub(Parrot_Interp, INTVAL, INTVAL, INTVAL, PMC*);
void mmd_add_function(Parrot_Interp, INTVAL, funcptr_t);
void mmd_add_function_sub(Parrot_Interp, INTVAL, PMC*);
void mmd_destroy(Parrot_Interp);
PMC *mmd_vtfind(Parrot_Interp, INTVAL, INTVAL, INTVAL);

typedef struct _MMD_init {
        INTVAL func_nr;
        INTVAL left, right;
        funcptr_t func_ptr;
} MMD_init;

void Parrot_mmd_register_table(Interp*, INTVAL, const MMD_init *, INTVAL);
void Parrot_mmd_rebuild_table(Interp*, INTVAL class_enum, INTVAL func_nr);

funcptr_t get_mmd_dispatch_type(Interp *interpreter,
        INTVAL function, UINTVAL left_type, UINTVAL right_type, int *is_pmc);

typedef struct _MMD_table {
    funcptr_t *mmd_funcs;     /* The functions for the MMD table */
    UINTVAL x;               /* The x coord for each table */
    UINTVAL y;               /* The y coord for each table */
    funcptr_t default_func;  /* The function we use if we can't find
                                 a function */
    UINTVAL funcs_in_table;  /* How many functions are in the table
                                 in question */
} MMD_table;

/*
 * in src/objects.c :
 */
const char* Parrot_MMD_methode_name(Interp* i, INTVAL idx);

#endif /* PARROT_MMD_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
