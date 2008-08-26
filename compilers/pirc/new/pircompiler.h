/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

#ifndef PARROT_PIR_PIRCOMPILER_H_GUARD
#define PARROT_PIR_PIRCOMPILER_H_GUARD

#include "pirsymbol.h"
#include "pircompunit.h"

#include <stdio.h>

/* store the "globals" of the lexer in a structure which is passed around. */
typedef struct lexer_state {
    int            parse_errors;
    char          *filename;
    FILE          *outfile;

    subroutine    *subs;       /* list of subs; always points to the current sub. */

    key           *current_ns; /* keeps track of namespace */

    target        *curtarget;  /* provides access to the current target node being parsed, if any */
    argument      *curarg;     /* provides access to the current argument node being parsed, if any */

    int            curregister[4]; /* for register allocation */
    global_ident  *globals;
    constant      *constants;  /* global constants */

} lexer_state;


/* constructor for a lexer_state object */
lexer_state *new_lexer(char * const filename);


#endif /* PARROT_PIR_PIRCOMPILER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
