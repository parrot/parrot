/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */


/* This file defines the data structures for symbol management. A symbol
 * is a declared .local or .param, or a PIR register. Although these
 * two data structures are very similar, and they could potentially be
 * merged, this should not be done. Declared symbols are handled a bit
 * different from PIR registers, as the latter do not need to be
 * declared. Merging them would only result in more complex code.
 *
 */

#ifndef PARROT_PIR_PIRSYMBOL_H_GUARD
#define PARROT_PIR_PIRSYMBOL_H_GUARD

#include "pircompiler.h"
#include "pircompunit.h"

/* structure to represent a declared local variable or parameter */
typedef struct symbol {
    char          *name;  /* name of this symbol */
    pir_type       type;  /* type of this symbol */
    int            color; /* allocated PASM register for this symbol, -1 if not allocated. */
    target_flag    flags;

    struct symbol *next;

} symbol;


/* structure to represent a PIR register. */
typedef struct pir_reg {
    int             regno; /* symbolic (PIR) register number */
    pir_type        type;  /* type of ths register */
    int             color; /* register assigned by register allocator, -1 if not allocated. */

    struct pir_reg *next;

} pir_reg;


/* structure to represent a global label */
typedef struct global_label {
    char                *name;
    int                  const_nr;

} global_label;


typedef struct local_label {
    char               *name;
    unsigned            offset;

} local_label;



/* symbol constructor */
symbol *new_symbol(struct lexer_state * const lexer, char * const name, pir_type type);

/* to enter a symbol in the symbol table */
void declare_local(struct lexer_state * const lexer, pir_type type, symbol * const list);

/* to find a symbol in the symbol table */
symbol *find_symbol(struct lexer_state * const lexer, char * const name);

/* to find declared symbols that are never referenced */
void check_unused_symbols(struct lexer_state * const lexer);

/* find specified register; if it was not used yet, assign a PASM register to it */
int color_reg(struct lexer_state * const lexer, pir_type type, int regno);

/* store a global identifier (label) */
void store_global_label(struct lexer_state * const lexer, char * const name);

/* find a global identifier */
global_label *find_global_label(struct lexer_state * const lexer, char * const name);

/* store a global .const symbol */
void store_global_constant(struct lexer_state * const lexer, constant * const c);

/* find a global .const symbol */
constant *find_global_constant(struct lexer_state * const lexer, char * const name);

/* get a new PASM register of the specified type */
int next_register(struct lexer_state * const lexer, pir_type type);

void store_local_label(struct lexer_state * const lexer, char * const label, unsigned offset);
unsigned find_local_label(struct lexer_state * const lexer, char * const label);

unsigned get_hashcode(char * const str, unsigned num_buckets);

bucket *get_bucket(hashtable * const table, unsigned long hash);


#endif /* PARROT_PIR_PIRSYMBOL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */



