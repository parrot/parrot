/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */
#ifndef PARROT_PIR_PIRSYMBOL_H_GUARD
#define PARROT_PIR_PIRSYMBOL_H_GUARD

#include "pircompiler.h"
#include "pircompunit.h"

/* structure to represent a declared local variable */
typedef struct symbol {
    char          *name;
    pir_type       type;
    int            color;
    struct symbol *next;

} symbol;


/* structure to represent a PIR register. */
typedef struct pir_reg {
    pir_type        type;
    int             regno; /* symbolic register */
    int             color; /* register assigned by register allocator */
    struct pir_reg *next;

} pir_reg;

void declare_local(struct lexer_state *lexer, pir_type type, symbol *list);
symbol *find_symbol(struct lexer_state *lexer, char * const name);


int color_reg(struct lexer_state *lexer, pir_type type, int regno);

#endif /* PARROT_PIR_PIRSYMBOL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */



