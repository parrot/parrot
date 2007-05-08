#ifndef PARROT_PIRC_PIRPARSER_H_GUARD
#define PARROT_PIRC_PIRPARSER_H_GUARD

#  include "pirlexer.h"
#  include "pirvtable.h"

/* hide internals; definition in pirparser.c */
struct parser_state;


/* parser constructor */
extern struct parser_state *new_parser(char const * filename, pirvtable *vtable);

/* entry function for the parser */
extern void TOP(struct parser_state *p);

/* destroy parser and exit */
extern void exit_parser(struct parser_state *p);

/* get number of parse errors */
extern int get_parse_errors(struct parser_state *p);

extern struct lexer_state const *get_lexer(struct parser_state *p);

extern token get_token(struct parser_state *p);

#endif /* PARROT_PIRC_PIRPARSER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
