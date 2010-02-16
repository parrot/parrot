/*
 * $Id$
 * Copyright (C) 2007-2009, Parrot Foundation.
 */


/* This file defines the data structures for symbol management.
 * A symbol object represents a declared .local/.param, while
 * a pir_reg object represents a PIR symbolic register ($I0, $S1, etc.).
 * For each symbol/pir-reg in a sub, there is only one corresponding
 * symbol/pir_reg object.
 */

#ifndef PARROT_PIR_PIRSYMBOL_H_GUARD
#define PARROT_PIR_PIRSYMBOL_H_GUARD

#include "pircompiler.h"
#include "pircompunit.h"
#include "pirregalloc.h"

#define NO_REG_ALLOCATED    -1

/* core info of all symbols and PIR registers ($I42, etc.). */
typedef struct syminfo {
    int            color;
    pir_type       type;
    live_interval *interval;

    union sym_id {  /* identification of this symbol/reg */
        char const *name;
        int         regno;
    } id;

} syminfo;

/* accessors for easy typing; X must be a pointer to a syminfo struct. */
#define sym_name(X)     (X)->id.name
#define sym_regno(X)    (X)->id.regno


/* structure to represent a declared local variable or parameter */
typedef struct symbol {
    syminfo        info;
    target_flag    flags;
    struct symbol *next;

} symbol;


/* structure to represent a PIR register. */
typedef struct pir_reg {
    syminfo         info;
    struct pir_reg *next;

} pir_reg;




/* structure to represent a global label */
typedef struct global_label {
    char const  *name;              /* name of the global label a.k.a. sub */
    int          const_table_index; /* index in PBC const table where this sub PMC is stored */

} global_label;

/* structure to represent a local label */
typedef struct local_label {
    char const * name;      /* name of the local label */
    unsigned     offset;    /* offset in bytecode where this label points to. */

} local_label;


/* lookup table to convert value_type and pir_type values into one another. */
extern const int valuetype_pirtype_clut[10];

/* HEADERIZER BEGIN: compilers/pirc/src/pirsymbol.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void assign_vanilla_register(
    ARGIN(lexer_state * const lexer),
    ARGIN(symbol * const sym))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void check_unused_symbols(ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

int color_reg(ARGIN(lexer_state * const lexer), pir_type type, int regno)
        __attribute__nonnull__(1);

void declare_local(
    ARGIN(lexer_state * const lexer),
    pir_type type,
    ARGIN(symbol * const list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
constdecl * find_global_constant(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
global_label * find_global_label(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
unsigned find_local_label(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const labelname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
pir_reg * find_register(
    ARGIN(lexer_state * const lexer),
    pir_type type,
    int regno)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
symbol * find_symbol(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
bucket * get_bucket(ARGIN(hashtable * const table), unsigned long hash)
        __attribute__nonnull__(1);

PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
unsigned get_hashcode(ARGIN(char const * const str), unsigned num_buckets)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
symbol * new_symbol(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const name),
    pir_type type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void store_bucket(
    ARGIN(hashtable * const table),
    ARGIN(bucket * const buck),
    unsigned long hash)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void store_global_constant(
    ARGIN(lexer_state * const lexer),
    ARGIN(constdecl * const c))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void store_global_label(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void store_local_label(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const labelname),
    unsigned offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_assign_vanilla_register __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(sym))
#define ASSERT_ARGS_check_unused_symbols __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_color_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_declare_local __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(list))
#define ASSERT_ARGS_find_global_constant __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_find_global_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_find_local_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(labelname))
#define ASSERT_ARGS_find_register __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_find_symbol __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_get_bucket __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(table))
#define ASSERT_ARGS_get_hashcode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_new_symbol __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_store_bucket __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(table) \
    , PARROT_ASSERT_ARG(buck))
#define ASSERT_ARGS_store_global_constant __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(c))
#define ASSERT_ARGS_store_global_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_store_local_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(labelname))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/pirc/src/pirsymbol.c */

#endif /* PARROT_PIR_PIRSYMBOL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */



