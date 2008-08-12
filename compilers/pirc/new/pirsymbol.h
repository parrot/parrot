/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */
#ifndef PARROT_PIR_PIRSYMBOL_H_GUARD
#define PARROT_PIR_PIRSYMBOL_H_GUARD

#include "pircompiler.h"
#include "pircompunit.h"

typedef struct symbol {
    char          *name;
    struct symbol *next;
    pir_type       type;
    int            color;

} symbol;

void declare_local(struct lexer_state *lexer, pir_type type, symbol *list);

symbol *find_symbol(struct lexer_state *lexer, char * const name);

#endif /* PARROT_PIR_PIRSYMBOL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */



