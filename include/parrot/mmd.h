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

typedef struct _MMD_table {
    funcptr_t *mmd_funcs;     /* The functions for the MMD table */
    UINTVAL x;               /* The x coord for each table */
    UINTVAL y;               /* The y coord for each table */
    funcptr_t default_func;  /* The function we use if we can't find
                                 a function */
    UINTVAL funcs_in_table;  /* How many functions are in the table
                                 in question */
} MMD_table;

typedef struct _MMD_init {
        INTVAL func_nr;
        INTVAL left, right;
        funcptr_t func_ptr;
} MMD_init;

/* Need this for add, subtract, multiply, divide, mod, cmod, bitwise
   (and, or, xor, lshift, rshift), concat, logical (and, or, xor),
   repeat, eq, cmp */

/* &gen_from_enum(mmd.pasm) */

typedef enum {
        MMD_ADD,
        MMD_ADD_INT,
        MMD_ADD_FLOAT,
        MMD_SUBTRACT,
        MMD_SUBTRACT_INT,
        MMD_SUBTRACT_FLOAT,
        MMD_MULTIPLY,
        MMD_MULTIPLY_INT,
        MMD_MULTIPLY_FLOAT,
        MMD_DIVIDE,
        MMD_DIVIDE_INT,
        MMD_DIVIDE_FLOAT,
        MMD_FLOOR_DIVIDE,
        MMD_FLOOR_DIVIDE_INT,
        MMD_FLOOR_DIVIDE_FLOAT,
        MMD_MOD,
        MMD_MOD_INT,
        MMD_MOD_FLOAT,
        MMD_CMOD,
        MMD_CMOD_INT,
        MMD_CMOD_FLOAT,
        MMD_POW,
        MMD_POW_FLOAT,
        MMD_POW_INT,
        MMD_BAND,
        MMD_BAND_INT,
        MMD_BOR,
        MMD_BOR_INT,
        MMD_BXOR,
        MMD_BXOR_INT,
        MMD_BSL,
        MMD_BSL_INT,
        MMD_BSR,
        MMD_BSR_INT,
        MMD_CONCAT,
        MMD_CONCAT_STR,
        MMD_LAND,
        MMD_LOR,
        MMD_LXOR,
        MMD_REPEAT,
        MMD_REPEAT_INT,
        MMD_EQ,
        MMD_NUMEQ,
        MMD_STREQ,
        MMD_CMP,
        MMD_NUMCMP,
        MMD_STRCMP,
        MMD_SOR,
        MMD_SOR_STR,
        MMD_SAND,
        MMD_SAND_STR,
        MMD_SXOR,
        MMD_SXOR_STR,   /* must be last due to init sequence */

        MMD_USER_FIRST
} parrot_mmd_func_enum;

/* &end_gen */
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
