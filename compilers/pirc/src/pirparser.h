#ifndef __PIRPARSER_H
#  define __PIRPARSER_H

#  include "pirlexer.h"
#  include "pirvtable.h"

/* hide internals; definition in pirparser.c */
struct parser_state;

/* define output type: what kind of semantic routines
 * should be called in the parser? 
 */
typedef enum outputtypes {
		OUTPUT_NONE,    /* do nothing  */
		OUTPUT_PIR,     /* output PIR  */
		OUTPUT_PAST     /* output PAST */
		
} outputtype; 




/* parser constructor */
extern struct parser_state *new_parser(char const * filename, outputtype type);

/* entry function for the parser */
extern void TOP(struct parser_state *p);

/* destroy parser and exit */
extern void exit_parser(struct parser_state *p);

/* get number of parse errors */
extern int get_parse_errors(struct parser_state *p);

extern struct lexer_state const *get_lexer(struct parser_state *p);

extern token get_token(struct parser_state *p);



#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
