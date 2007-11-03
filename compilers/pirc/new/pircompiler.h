/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

#ifndef PARROT_PIR_PIRCOMPILER_H_GUARD
#define PARROT_PIR_PIRCOMPILER_H_GUARD

/* store the "globals" of the lexer in a structure which is passed around. */
typedef struct lexer_state {
    int                     parse_errors;
    char                   *filename;
    int                     line_nr;
    int                     line_pos;

} lexer_state;


/* constructor for a lexer_state object */
struct lexer_state *new_lexer(char * const filename);


#endif /* PARROT_PIR_PIRCOMPILER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
