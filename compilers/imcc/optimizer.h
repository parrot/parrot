#ifndef PARROT_IMCC_OPTIMIZER_H_GUARD
#define PARROT_IMCC_OPTIMIZER_H_GUARD

#include "unit.h"

/* HEADERIZER BEGIN: compilers/imcc/optimizer.c */

int cfg_optimize( Interp *interp /*NN*/, IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

const char * get_neg_op( const char *op /*NN*/, int *n /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

Instruction * IMCC_subst_constants( Interp *interp,
    IMC_Unit * unit,
    const char *name /*NN*/,
    SymReg **r,
    int n,
    int *ok /*NN*/ )
        __attribute__nonnull__(3)
        __attribute__nonnull__(6);

Instruction * IMCC_subst_constants_umix( Interp *interp,
    IMC_Unit * unit,
    const char *name /*NN*/,
    SymReg **r,
    int n )
        __attribute__nonnull__(3);

int optimize( Interp *interp /*NN*/, IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int pre_optimize( Interp *interp /*NN*/, IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: compilers/imcc/optimizer.c */

#endif /* PARROT_IMCC_OPTIMIZER_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

