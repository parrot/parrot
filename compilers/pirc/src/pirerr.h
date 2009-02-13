/*
 * $Id$
 * Copyright (C) 2008-2009, Parrot Foundation.
 */

#ifndef PARROT_PIR_PIRERR_H_GUARD
#define PARROT_PIR_PIRERR_H_GUARD

#include "piryy.h"

void panic(lexer_state * lexer, char const * const message, ...);

int yypirerror(yyscan_t yyscanner, struct lexer_state * const lexer,
               char const * const message, ...);

#endif /* PARROT_PIR_PIRERR_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

