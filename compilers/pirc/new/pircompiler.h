/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

#ifndef PARROT_PIR_PIRCOMPILER_H_GUARD
#define PARROT_PIR_PIRCOMPILER_H_GUARD

#include "pirsymbol.h"
#include "pircompunit.h"

/* store the "globals" of the lexer in a structure which is passed around. */
typedef struct lexer_state {
    int                     parse_errors;
    char                   *filename;
    int                     is_instr; /* keeps track whether the parser is parsing an instruction */
    subroutine             *subs;

    struct symbol                 *symbols;

    char *temp_flag_arg1;
    char *temp_flag_arg2;


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
