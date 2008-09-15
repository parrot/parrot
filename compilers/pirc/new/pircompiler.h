/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

#ifndef PARROT_PIR_PIRCOMPILER_H_GUARD
#define PARROT_PIR_PIRCOMPILER_H_GUARD

#include "pirsymbol.h"
#include "pircompunit.h"


#include "parrot/parrot.h"
#include "parrot/embed.h"


#include <stdio.h> /* for FILE * */

/* store the "globals" of the lexer in a structure which is passed around. */
typedef struct lexer_state {
    int            parse_errors;
    char          *filename;       /* name of input file */
    FILE          *outfile;        /* name of output file */

    subroutine    *subs;           /* list of subs; always points to the current sub. */

    key           *current_ns;     /* keeps track of namespace */

    target        *curtarget;      /* access to current target node being parsed, if any */
    argument      *curarg;         /* access to current argument node being parsed, if any */

    int            curregister[4]; /* for register allocation */
    int            pir_reg_generator; /* for unique PIR register allocator, for temp. PIR regs. */

    global_ident  *globals;        /* global identifiers */
    constant      *constants;      /* global constants */

    Interp        *interp;         /* parrot interpreter */

} lexer_state;


/* constructor for a lexer_state object */
lexer_state *new_lexer(char * const filename);

void pirerror(lexer_state * const lexer, char const * const message, ...);

#endif /* PARROT_PIR_PIRCOMPILER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
