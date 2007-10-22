/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

#ifndef PARROT_PIR_PIRCOMPILER_H_GUARD
#define PARROT_PIR_PIRCOMPILER_H_GUARD

/* forward declaration, lexer_state definition must stay in pir.l */
struct lexer_state;

/* constructor for a lexer_state object */
struct lexer_state *new_lexer(char *filename);

/* accessor functions for parse_errors in the specified lexer. */
extern int  get_parse_errors(struct lexer_state const * const lexer);
extern void parse_error(struct lexer_state * const lexer);

extern int get_line_nr(struct lexer_state const * const lexer);
extern char const *get_current_file(struct lexer_state const * const lexer);

#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

