/* mmd.h
 *  Copyright (C) 2003, The Perl Foundation.
 *  SVN Info
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

/* inplace */
PARROT_API void mmd_dispatch_v_pp(Parrot_Interp, PMC *, PMC *, INTVAL);
PARROT_API void mmd_dispatch_v_pi(Parrot_Interp, PMC *, INTVAL, INTVAL);
PARROT_API void mmd_dispatch_v_pn(Parrot_Interp, PMC *, FLOATVAL, INTVAL);
PARROT_API void mmd_dispatch_v_ps(Parrot_Interp, PMC *, STRING *, INTVAL);

/* return result */
PARROT_API PMC* mmd_dispatch_p_ppp(Parrot_Interp, PMC *, PMC *, PMC *, INTVAL);
PARROT_API PMC* mmd_dispatch_p_pip(Parrot_Interp, PMC *, INTVAL, PMC *, INTVAL);
PARROT_API PMC* mmd_dispatch_p_pnp(Parrot_Interp, PMC *, FLOATVAL, PMC *, INTVAL);
PARROT_API PMC* mmd_dispatch_p_psp(Parrot_Interp, PMC *, STRING *, PMC *, INTVAL);

/* compare */
PARROT_API INTVAL mmd_dispatch_i_pp(Parrot_Interp, PMC *, PMC *, INTVAL);

/* function typedefs */
typedef PMC*    (*mmd_f_p_ppp)(Interp *, PMC *, PMC *, PMC *);
typedef PMC*    (*mmd_f_p_pip)(Interp *, PMC *, INTVAL, PMC *);
typedef PMC*    (*mmd_f_p_pnp)(Interp *, PMC *, FLOATVAL, PMC *);
typedef PMC*    (*mmd_f_p_psp)(Interp *, PMC *, STRING *, PMC *);

typedef void    (*mmd_f_v_pp)(Interp *, PMC *, PMC *);
typedef void    (*mmd_f_v_pi)(Interp *, PMC *, INTVAL);
typedef void    (*mmd_f_v_pn)(Interp *, PMC *, FLOATVAL);
typedef void    (*mmd_f_v_ps)(Interp *, PMC *, STRING *);

typedef INTVAL  (*mmd_f_i_pp) (Interp *, PMC *, PMC *);

PARROT_API void mmd_add_by_class(Parrot_Interp, INTVAL, STRING *, STRING *, funcptr_t);
PARROT_API void mmd_register(Parrot_Interp, INTVAL, INTVAL, INTVAL, funcptr_t);
PARROT_API void mmd_register_sub(Parrot_Interp, INTVAL, INTVAL, INTVAL, PMC*);
PARROT_API void mmd_add_function(Parrot_Interp, INTVAL, funcptr_t);
PARROT_API void mmd_add_function_sub(Parrot_Interp, INTVAL, PMC*);
PARROT_API void mmd_destroy(Parrot_Interp);
PARROT_API PMC *mmd_vtfind(Parrot_Interp, INTVAL, INTVAL, INTVAL);

typedef struct _MMD_init {
        INTVAL func_nr;
        INTVAL left, right;
        funcptr_t func_ptr;
} MMD_init;

PARROT_API void Parrot_mmd_register_table(Interp*, INTVAL, const MMD_init *, INTVAL);
PARROT_API void Parrot_mmd_rebuild_table(Interp*, INTVAL class_enum, INTVAL func_nr);

PARROT_API funcptr_t get_mmd_dispatch_type(Interp *interpreter,
        INTVAL function, INTVAL left_type, INTVAL right_type, int *is_pmc);

typedef struct _MMD_table {
    funcptr_t *mmd_funcs;     /* The functions for the MMD table */
    UINTVAL x;               /* The x coord for each table */
    UINTVAL y;               /* The y coord for each table */
} MMD_table;


PARROT_API PMC *Parrot_MMD_search_default_func(Interp *, STRING *meth);
PARROT_API PMC *Parrot_MMD_search_default_inline(Interp *, STRING *meth,
        STRING *signature, ...);

PARROT_API PMC *Parrot_MMD_dispatch_func(Interp *, PMC *multi, STRING *meth);
PARROT_API PMC *Parrot_MMD_search_default_infix(Interp *, STRING *meth,
        INTVAL left_type, INTVAL right_type);

PARROT_API int Parrot_run_maybe_mmd_meth(Interp*, PMC *object, STRING *meth);
PARROT_API int Parrot_run_maybe_mmd_func(Interp*, STRING *meth);
/*
 * in src/objects.c :
 */
PARROT_API const char* Parrot_MMD_method_name(Interp* i, INTVAL idx);
PARROT_API INTVAL Parrot_MMD_method_idx(Interp* interpreter, char *name);

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
