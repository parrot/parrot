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


/* symbol constructor */
symbol *new_symbol(struct lexer_state * const lexer, char const * const name, pir_type type);

/* to enter a symbol in the symbol table */
void declare_local(struct lexer_state * const lexer, pir_type type, symbol * const list);

/* to find a symbol in the symbol table */
symbol *find_symbol(struct lexer_state * const lexer, char const * const name);


pir_reg *find_register(struct lexer_state * const lexer, pir_type type, int regno);


/* to find declared symbols that are never referenced */
void check_unused_symbols(struct lexer_state * const lexer);

/* find specified register; if it was not used yet, assign a PASM register to it */
int color_reg(struct lexer_state * const lexer, pir_type type, int regno);

/* store a global identifier (label) */
void store_global_label(struct lexer_state * const lexer, char const * const name);

/* find a global identifier */
global_label *find_global_label(struct lexer_state * const lexer, char const * const name);

/* store a global .const symbol */
void store_global_constant(struct lexer_state * const lexer, constdecl * const c);

/* find a global .const symbol */
constdecl *find_global_constant(struct lexer_state * const lexer, char const * const name);

void assign_vanilla_register(struct lexer_state * const lexer, symbol * const sym);

void store_local_label(struct lexer_state * const lexer, char const * const label, unsigned offset);

unsigned find_local_label(struct lexer_state * const lexer, char const * const label);

unsigned get_hashcode(char const * const str, unsigned num_buckets);

bucket *get_bucket(hashtable * const table, unsigned long hash);

void store_bucket(hashtable * const table, bucket * const buck, unsigned long hash);

#endif /* PARROT_PIR_PIRSYMBOL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */



