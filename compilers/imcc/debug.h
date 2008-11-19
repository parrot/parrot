/*
 * Copyright (C) 2002-2007, The Perl Foundation.
 * $Id$
 */

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
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void IMCC_debug(PARROT_INTERP, int level, ARGIN(const char *fmt), ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
void IMCC_fatal(PARROT_INTERP,
    NULLOK(int code),
    ARGIN(const char *fmt),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
void IMCC_fatal_standalone(PARROT_INTERP,
    int code,
    ARGIN(const char *fmt),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
void IMCC_fataly(PARROT_INTERP,
    NULLOK(int code),
    ARGIN(const char *fmt),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
void IMCC_fataly_standalone(PARROT_INTERP,
    int code,
    ARGIN(const char *fmt),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
void IMCC_info(PARROT_INTERP, int level, ARGIN(const char *fmt), ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
void IMCC_warning(PARROT_INTERP, ARGIN(const char *fmt), ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void dump_cfg(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void dump_dominance_frontiers(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void dump_dominators(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void dump_instructions(PARROT_INTERP, ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void dump_interference_graph(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void dump_labels(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void dump_liveness_status(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void dump_liveness_status_var(
    ARGIN(const IMC_Unit *unit),
    ARGIN(const SymReg* r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void dump_loops(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void dump_symreg(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/debug.c */


#endif /* PARROT_IMCC_DEBUG_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
