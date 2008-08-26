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
    int            color; /* allocated PASM register for this symbol */
    int            flags;

    struct symbol *next;

} symbol;


/* structure to represent a PIR register. */
typedef struct pir_reg {
    int             regno; /* symbolic (PIR) register number */
    pir_type        type;  /* type of ths register */
    int             color; /* register assigned by register allocator */

    struct pir_reg *next;

} pir_reg;


/* structure to represent a global identifier (XXX only labels?) */
typedef struct global_ident {
    char *name;
    int   const_nr;

    struct global_ident *next;

} global_ident;


/* symbol constructor */
symbol *new_symbol(char * const name, pir_type type);

/* to enter a symbol in the symbol table */
void declare_local(struct lexer_state * const lexer, pir_type type, symbol *list);

/* to find a symbol in the symbol table */
symbol *find_symbol(struct lexer_state * const lexer, char * const name);

/* to find declared symbols that are never referenced */
void check_unused_symbols(struct lexer_state * const lexer);

/* find specified register; if it was not used yet, assign a PASM register to it */
int color_reg(struct lexer_state * const lexer, pir_type type, int regno);

/* store a global identifier (label) */
void store_global_ident(struct lexer_state * const lexer, char * const name);

/* find a global identifier */
global_ident *find_global_ident(struct lexer_state * const lexer, char * const name);

/* store a global .const symbol */
void store_global_const(struct lexer_state * const lexer, constant * const c);

/* find a global .const symbol */
constant *find_constant(struct lexer_state * const lexer, char * const name);

#endif /* PARROT_PIR_PIRSYMBOL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */



