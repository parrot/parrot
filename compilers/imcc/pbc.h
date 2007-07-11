#ifndef PARROT_IMCC_PBC_H_GUARD
#define PARROT_IMCC_PBC_H_GUARD

/* HEADERIZER BEGIN: compilers/imcc/pbc.c */

int e_pbc_close( Interp *interp /*NN*/, void *param )
        __attribute__nonnull__(1);

int e_pbc_emit( Interp *interp /*NN*/,
    void *param,
    IMC_Unit *unit /*NN*/,
    const Instruction *ins /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

int e_pbc_end_sub( Interp *interp /*NN*/, void *param, IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

int e_pbc_new_sub( SHIM_INTERP, void *param, IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(3);

int e_pbc_open( Interp *interp, void *param );
INTVAL IMCC_int_from_reg( Interp *interp, const SymReg *r /*NN*/ )
        __attribute__nonnull__(2);

STRING * IMCC_string_from_reg( Interp *interp /*NN*/, const SymReg *r /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

opcode_t * make_jit_info( Interp *interp /*NN*/, IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: compilers/imcc/pbc.c */

#endif /* PARROT_IMCC_PBC_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

