#ifndef PARROT_IMCC_PBC_H_GUARD
#define PARROT_IMCC_PBC_H_GUARD

/* HEADERIZER BEGIN: compilers/imcc/pbc.c */

int e_pbc_close( PARROT_INTERP, SHIM(void *param) )
        __attribute__nonnull__(1);

int e_pbc_emit( PARROT_INTERP,
    SHIM(void *param),
    NOTNULL(IMC_Unit *unit),
    NOTNULL(const Instruction *ins) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

int e_pbc_end_sub( PARROT_INTERP, SHIM(void *param), NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

int e_pbc_new_sub( SHIM_INTERP, SHIM(void *param), NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(3);

int e_pbc_open( PARROT_INTERP, SHIM(void *param) )
        __attribute__nonnull__(1);

INTVAL IMCC_int_from_reg( PARROT_INTERP, NOTNULL(const SymReg *r) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

STRING * IMCC_string_from_reg( PARROT_INTERP, NOTNULL(const SymReg *r) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

opcode_t * make_jit_info( PARROT_INTERP, NOTNULL(IMC_Unit *unit) )
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

