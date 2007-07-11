#ifndef PARROT_IMCC_DEBUG_H_GUARD
#define PARROT_IMCC_DEBUG_H_GUARD


#define DEBUG_PARROT 0x0001
#define DEBUG_LEXER  0x0002
#define DEBUG_PARSER 0x0004
#define DEBUG_IMC    0x0008
#define DEBUG_CFG    0x0010
#define DEBUG_OPT1   0x0020
#define DEBUG_OPT2   0x0040
#define DEBUG_SPILL  0x0080

#define DEBUG_AST    0x0100
#define DEBUG_REG    0x0200
#define DEBUG_REG2   0x0400

#define DEBUG_PBC    0x1000
#define DEBUG_PBC_CONST    0x2000
#define DEBUG_PBC_FIXUP    0x4000

/* HEADERIZER BEGIN: compilers/imcc/debug.c */

PARROT_API
void IMCC_debug( Interp *interp /*NN*/,
    int level,
    const char *fmt /*NN*/,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_API
void IMCC_fatal( Interp *interp /*NN*/,
    int code,
    const char *fmt /*NN*/,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__noreturn__;

PARROT_API
void IMCC_fatal_standalone( Interp *interp /*NN*/,
    int code,
    const char *fmt /*NN*/,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_API
void IMCC_fataly( Interp *interp /*NN*/,
    int code,
    const char *fmt /*NN*/,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__noreturn__;

PARROT_API
void IMCC_fataly_standalone( Interp *interp /*NN*/,
    int code,
    const char *fmt /*NN*/,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_API
void IMCC_info( Interp *interp /*NN*/,
    int level,
    const char *fmt /*NN*/,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_API
void IMCC_warning( Interp *interp /*NN*/, const char *fmt /*NN*/, ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void dump_cfg( const IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1);

void dump_dominance_frontiers( const IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1);

void dump_dominators( const IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1);

void dump_instructions( Interp *interp /*NN*/, const IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void dump_interference_graph( const IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1);

void dump_labels( const IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1);

void dump_liveness_status( const IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1);

void dump_liveness_status_var(
    const IMC_Unit *unit /*NN*/,
    const SymReg* r /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void dump_loops( const IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1);

void dump_symreg( const IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1);

/* HEADERIZER END: compilers/imcc/debug.c */


#endif /* PARROT_IMCC_DEBUG_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
