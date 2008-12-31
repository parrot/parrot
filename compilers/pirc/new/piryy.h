/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */

/* This file declared parser/lexer related functions, so that any changes
 * need only be made once.
 */

#ifndef PARROT_PIR_PIRYY_H_GUARD
#define PARROT_PIR_PIRYY_H_GUARD

/* Just to make sure that yscan_t can be used as a type in this file.
 * These directives are taken from pirlexer.h.
 */
#ifndef YY_TYPEDEF_YY_SCANNER_T
#  define YY_TYPEDEF_YY_SCANNER_T

typedef void * yyscan_t;

#endif


int yypirparse(yyscan_t yyscanner, struct lexer_state * const lexer);


int yypirget_lineno(yyscan_t yyscanner);

#endif /* PARROT_PIR_PIRYY_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
