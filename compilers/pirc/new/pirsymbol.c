/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */
#include "pircompiler.h"
#include "pirsymbol.h"
#include "pircompunit.h"
#include <stdlib.h>

void
declare_local(struct lexer_state *lexer, pir_type type, target *list) {

}

/*

Return the target node for the symbol or NULL if the symbol
is not defined.

*/
target *
find_symbol(struct lexer_state *lexer, char * const name) {
    return NULL;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
