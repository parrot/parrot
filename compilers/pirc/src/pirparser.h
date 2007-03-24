#ifndef __PIRPARSER_H
#define __PIRPARSER_H

#include "pirlexer.h"

/* hide internals; definition in pirparser.c */
struct parser_state;

/* parser constructor */
extern struct parser_state *new_parser(char const * filename);

/* entry function for the parser */
extern void TOP(struct parser_state *p);

/* destroy parser and exit */
extern void exit_parser(struct parser_state *p);

/* get number of parse errors */
extern int get_parse_errors(struct parser_state *p);

#endif

